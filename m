From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  1 Oct 2015 21:30:48 +0300
Subject: [Buildroot] [PATCH] libssh: bump to version 0.7.2
Message-ID: <2490c4cadb0735ae8a6a4cd26accc6071540d9bf.1443724248.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also, require threads support. cmake detects threads support correctly, but
libssh build system uses this information incorrectly.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libssh/Config.in   | 5 +++--
 package/libssh/libssh.hash | 6 +++---
 package/libssh/libssh.mk   | 4 ++--
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/libssh/Config.in b/package/libssh/Config.in
index 30aabd621fb6..3357fb9e9252 100644
--- a/package/libssh/Config.in
+++ b/package/libssh/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBSSH
 	bool "libssh"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# Either OpenSSL or libgcrypt are mandatory
 	select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
 	help
@@ -12,6 +13,6 @@ config BR2_PACKAGE_LIBSSH
 
 	  http://www.libssh.org/
 
-comment "libssh needs a toolchain w/ dynamic library"
+comment "libssh needs a toolchain w/ dynamic library, threads"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index 473ced36c73b..49bf6c959fe2 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,4 +1,4 @@
 # from https://red.libssh.org/projects/libssh/files/
-md5	bffc9dc548c3bae3a3afc5ac1654b272	libssh-0.7.1.tar.xz
-# Locally calculated
-sha256	2fc7ccf96d3263cbd8ab520118cb94d9a2e11714c61e22b3f761fc5352fd046d  libssh-0.7.1.tar.xz
+md5	5d7d468937649a6dfc6186edfff083db	libssh-0.7.2.tar.xz
+# Locally calculated after checking signature on uncompressed libssh-0.7.2.tar
+sha256	a32c45b9674141cab4bde84ded7d53e931076c6b0f10b8fd627f3584faebae62  libssh-0.7.2.tar.xz
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index cd537b04fc99..d425ff0b74bc 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBSSH_VERSION = 0.7.1
+LIBSSH_VERSION = 0.7.2
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
-LIBSSH_SITE = https://red.libssh.org/attachments/download/154
+LIBSSH_SITE = https://red.libssh.org/attachments/download/177
 LIBSSH_LICENSE = LGPLv2.1
 LIBSSH_LICENSE_FILES = COPYING
 LIBSSH_INSTALL_STAGING = YES
-- 
2.5.3
