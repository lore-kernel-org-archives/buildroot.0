From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Wed,  9 Mar 2016 19:22:05 -0500
Subject: [Buildroot] [PATCH v4 1/1] erlang: use erlang's native atomic ops
Message-ID: <1457569325-32477-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we're using Erlang 18, the preferred atomic ops implementation
for Erlang is its own built-in implementation, so use it instead of
libatomic_ops. BR2_PACKAGE_ERLANG_ARCH_SUPPORTS is added now that
BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS can no longer be used for
checking whether the package can be built.

This fixes autobuilder failures on aarch64 and sparc_v8:

http://autobuild.buildroot.net/results/0cd/0cd22eb74fa29e5a85bf897762e16ab3daf33962/
http://autobuild.buildroot.net/results/688278236e6d5bcd63b7d4413303eb115a38f3a7/
http://autobuild.buildroot.net/results/7875a7425bfe1f43d46c9a1db9f96b54f7a99b19/

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
Changes v3->v4:
  - Majorly simplified patch since libatomic_ops is effectively
    not used anymore and providing an option seems unnecessary.
    See comment chain from Arnout Vandecappelle.
  - Fix line wrapping

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

 package/erlang/Config.in | 12 +++++++++---
 package/erlang/erlang.mk |  3 ---
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 5fa2028..56cee54 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -1,14 +1,20 @@
+config BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
+	bool
+	# see HOWTO/INSTALL.md for Erlang's supported platforms
+	# when using its native atomic ops implementation
+	default y if BR2_i386 || BR2_x86_64 || BR2_powerpc || \
+		BR2_sparc_v9 || BR2_arm || BR2_aarch64
+
 comment "erlang needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS
 
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
diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 3732d44..7eec0d9 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -30,9 +30,6 @@ ERLANG_CONF_ENV += erl_xcomp_sysroot=$(STAGING_DIR)
 
 ERLANG_CONF_OPTS = --without-javac
 
-ERLANG_DEPENDENCIES += libatomic_ops
-ERLANG_CONF_OPTS += --with-libatomic_ops=$(STAGING_DIR)/usr LIBS=-latomic_ops
-
 # erlang uses openssl for all things crypto. Since the host tools (such as
 # rebar) uses crypto, we need to build host-erlang with support for openssl.
 HOST_ERLANG_DEPENDENCIES = host-openssl
-- 
2.5.0
