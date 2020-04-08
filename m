From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Apr 2020 14:38:31 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/libopenssl: move
 options
Message-ID: <20200408122825.884C38DE6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7b596724623468e215521bd33fac7144495452b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Since e3159cad71 (package/libopenssl: move target arch selection
to Config.in), we have a Config.in that contains a few options to
configure libopenssl (openSSL, the original).

As such, it makes sense to move the remaining options there too.

We also move the condition there, mimicking what is done for the
external toolchains' options too.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 27a2073a2d3beb32af199ad0e2f1efb36f431cce)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/Config.in | 16 ++++++++++++++++
 package/openssl/Config.in    | 16 ----------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index 5ca19b38f8..881518d1cb 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -1,3 +1,5 @@
+if BR2_PACKAGE_LIBOPENSSL
+
 # 4xx PowerPC cores seem to have trouble with openssl's ASM
 # optimizations
 config BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH_LINUX_PPC
@@ -29,3 +31,17 @@ config BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH
 	# https://github.com/openssl/openssl/issues/9839
 	default "linux-generic64 no-asm"	if BR2_ARCH_IS_64
 	default "linux-generic32 no-asm"
+
+config BR2_PACKAGE_LIBOPENSSL_BIN
+	bool "openssl binary"
+	help
+	  Install the openssl binary and the associated helper scripts
+	  to the target file system. This is a command line tool for
+	  doing various cryptographic stuff.
+
+config BR2_PACKAGE_LIBOPENSSL_ENGINES
+	bool "openssl additional engines"
+	help
+	  Install additional encryption engine libraries.
+
+endif # BR2_PACKAGE_LIBOPENSSL
diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index b0837ba303..791f96280c 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -29,24 +29,8 @@ config BR2_PACKAGE_LIBOPENSSL
 
 	  Note: Some helper scripts need perl.
 
-if BR2_PACKAGE_LIBOPENSSL
-
-config BR2_PACKAGE_LIBOPENSSL_BIN
-	bool "openssl binary"
-	help
-	  Install the openssl binary and the associated helper scripts
-	  to the target file system. This is a command line tool for
-	  doing various cryptographic stuff.
-
-config BR2_PACKAGE_LIBOPENSSL_ENGINES
-	bool "openssl additional engines"
-	help
-	  Install additional encryption engine libraries.
-
 source "package/libopenssl/Config.in"
 
-endif
-
 config BR2_PACKAGE_LIBRESSL
 	bool "libressl"
 	depends on !BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
