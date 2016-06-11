From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 15:58:38 +0200
Subject: [Buildroot] [git commit] erlang: use erlang's native atomic ops
Message-ID: <20160611140244.59D8681D5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3135c6374a8f0b5308bb0d1de90d28879cd528a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
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
index ff4452f..6efffde 100644
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
