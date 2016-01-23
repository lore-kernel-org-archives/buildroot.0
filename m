From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri, 22 Jan 2016 20:11:11 -0500
Subject: [Buildroot] [PATCH 18/18] erlang: make libatomic_ops optional
In-Reply-To: <1453511471-28519-1-git-send-email-fhunleth@troodon-software.com>
References: <1453511471-28519-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <1453511471-28519-19-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Erlang developers prefer the use of Erlang's native atomics in
Erlang 18. In the previous Erlang release, the native atomics
implementation was not complete and so libatomic_ops was necessary. Now
libatomic_ops is used as a fallback, but based on tests of every
qemu_*_defconfig and several other configs it appears to not be
necessary. In fact, it causes build failures on aarch64. Since it is
conceivable that a platform exists that may still require libatomic_ops,
this change makes the use of the library optional.

Fixes:
http://autobuild.buildroot.net/results/0cd/0cd22eb74fa29e5a85bf897762e16ab3daf33962/

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/erlang/Config.in | 10 ++++++++--
 package/erlang/erlang.mk |  2 ++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 0ec01bb..9bd64ac 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -7,8 +7,7 @@ config BR2_PACKAGE_ERLANG
 	bool "erlang"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
-	select BR2_PACKAGE_LIBATOMIC_OPS
+	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS # erlang native atomics and libatomic_ops
 	help
 	  Erlang is a programming language used to build massively scalable
 	  soft real-time systems with requirements on high availability.
@@ -20,6 +19,13 @@ config BR2_PACKAGE_ERLANG
 
 if BR2_PACKAGE_ERLANG
 
+config BR2_PACKAGE_ERLANG_USE_LIBATOMIC_OPS
+	bool "use libatomic_ops"
+	select BR2_PACKAGE_LIBATOMIC_OPS
+	help
+	  Erlang's native atomic ops implementation is preferred. If this is
+	  insufficient, enabling this option forces Erlang to use libatomic_ops.
+
 config BR2_PACKAGE_ERLANG_SMP
 	bool "enable SMP support"
 	help
diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index dfab30d..a2f75e7 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -30,8 +30,10 @@ ERLANG_CONF_ENV += erl_xcomp_sysroot=$(STAGING_DIR)
 
 ERLANG_CONF_OPTS = --without-javac
 
+ifeq ($(BR2_PACKAGE_ERLANG_USE_LIBATOMIC_OPS),y)
 ERLANG_DEPENDENCIES += libatomic_ops
 ERLANG_CONF_OPTS += --with-libatomic_ops=$(STAGING_DIR)/usr LIBS=-latomic_ops
+endif
 
 # erlang uses openssl for all things crypto. Since the host tools (such as
 # rebar) uses crypto, we need to build host-erlang with support for openssl.
-- 
2.5.0
