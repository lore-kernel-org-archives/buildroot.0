From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sun, 21 Feb 2016 14:17:25 -0500
Subject: [Buildroot] [PATCH v3 1/2] erlang: use erlang's native atomic ops
Message-ID: <1456082246-28181-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we're using Erlang 18, the preferred atomic ops implementation
for Erlang is its own built-in implementation, so use it.  It is still
possible to use libatomic_ops if the native implementation does not
work. BR2_PACKAGE_ERLANG_ARCH_SUPPORTS is added now that
BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS is no longer appropriate for
checking whether Erlang can be built for a platform.

This fixes an autobuilder failure when using libatomic_ops on aarch64.
Erlang's native atomic ops implementation works on this platform.

Fixes:
http://autobuild.buildroot.net/results/0cd/0cd22eb74fa29e5a85bf897762e16ab3daf33962/

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
Changes v2->v3:
  - Move LIBS=-latomic_ops change to a separate commit
  - Rebased to pull in BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS to
    BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS change
  - Note that the BR2_PACKAGE_ERLANG_ARCH_SUPPORTS caused me to
    move the missing dependencies comment from the beginning of
    the file down to the end.
  - Made libatomic_ops a selection for now per comment from
    Romain Naour. While Erlang supports a lot of options,
    libatomic_ops was the only alternative in the choices.
    Even then, it may not be used that often since the Erlang
    native support covers most platforms.

Changes v1->v2:
  - Add BR2_PACKAGE_ERLANG_ARCH_SUPPORTS and related changes
    (Thanks to Thomas)
  - Atomic ops selection is a choice now due to the potential for
    more than two options based on the Erlang documentation.
  - Line wrapping updates
  - Added note on Erlang choosing native atomic ops even if
    libatomic_ops is present.
  - Removed LIBS=-latomic_ops. The ./configure test for it still
    worked, and Erlang linked to it without errors. 

 package/erlang/Config.in | 41 +++++++++++++++++++++++++++++++++++------
 package/erlang/erlang.mk |  4 ++++
 2 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 5fa2028..d17fb7a 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -1,14 +1,30 @@
-comment "erlang needs a toolchain w/ dynamic library"
-	depends on BR2_USE_MMU # fork()
-	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
-	depends on BR2_STATIC_LIBS
+# Erlang requires platform support for atomic operations. See the
+# HOWTO/INSTALL.md file for the full description. A summary of the
+# options is as follows:
+#
+#   1. Erlang's atomic operations on 32/64-bit x86, 32/64-bit
+#      SPARC V9, 32-bit PowerPC, or 32-bit Tile. The INSTALL.md
+#      omits 32/64-bit ARM support, but those are supported as well.
+#   2. The API provided by Windows (N/A for Buildroot)
+#   3. Native atomic operations provided by the '__atomic_*' builtins
+#      with gcc 4.7 or later.
+#   4. libatomic_ops
+#   5. The availability of __sync_*() operations. Based on
+#      http://autobuild.buildroot.org/results/209/2090874eee165af3349cf2d597657fc1b4ca1012/build-end.log,
+#      it needs the 4-byte and 8-byte versions.
+#
+# Cases 3 and 5 do not appear to work on configurations that are not
+# included in 1 and 4 due to compiler errors.
+config BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
+	bool
+	default y if BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_sparc_v9 || BR2_arm || BR2_aarch64 # case (1)
+	default y if BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS # case (4)
 
 config BR2_PACKAGE_ERLANG
 	bool "erlang"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
-	select BR2_PACKAGE_LIBATOMIC_OPS
+	depends on BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
 	help
 	  Erlang is a programming language used to build massively scalable
 	  soft real-time systems with requirements on high availability.
@@ -20,6 +36,14 @@ config BR2_PACKAGE_ERLANG
 
 if BR2_PACKAGE_ERLANG
 
+config BR2_PACKAGE_ERLANG_LIBATOMIC_OPS
+	bool "libatomic_ops"
+	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
+	depends on !BR2_aarch64 # causes build failures
+	select BR2_PACKAGE_LIBATOMIC_OPS
+	help
+	  Use libatomic_ops instead of Erlang's native atomic ops support.
+
 config BR2_PACKAGE_ERLANG_SMP
 	bool "enable SMP support"
 	help
@@ -38,3 +62,8 @@ config BR2_PACKAGE_ERLANG_MEGACO
 	  enable it.
 
 endif # BR2_PACKAGE_ERLANG
+
+comment "erlang needs a toolchain w/ dynamic library, atomic_ops"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_STATIC_LIBS || !BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
+
diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 638d2c2..8257ab4 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -30,8 +30,12 @@ ERLANG_CONF_ENV += erl_xcomp_sysroot=$(STAGING_DIR)
 
 ERLANG_CONF_OPTS = --without-javac
 
+# Erlang uses its own native atomic ops implementation if support is
+# available. Override this if the user wants libatomic_ops.
+ifeq ($(BR2_PACKAGE_ERLANG_LIBATOMIC_OPS),y)
 ERLANG_DEPENDENCIES += libatomic_ops
 ERLANG_CONF_OPTS += --with-libatomic_ops=$(STAGING_DIR)/usr LIBS=-latomic_ops
+endif
 
 # erlang uses openssl for all things crypto. Since the host tools (such as
 # rebar) uses crypto, we need to build host-erlang with support for openssl.
-- 
2.5.0
