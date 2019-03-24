From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 24 Mar 2019 21:21:13 +0200
Subject: [Buildroot] [PATCH] putty: security bump to version 0.71
Message-ID: <d3ffe9037b75e0b286b21564dd939f2d5fa1b4e9.1553455273.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CVE-2019-9894: A remotely triggerable memory overwrite in RSA key
exchange can occur before host key verification.

CVE-2019-9895: A remotely triggerable buffer overflow exists in any kind
of server-to-client forwarding.

CVE-2019-9897: Multiple denial-of-service attacks that can be triggered
by writing to the terminal.

CVE-2019-9898: Potential recycling of random numbers used in
cryptography.

Disable static build for now. When building statically configure defines
NO_GSSAPI. Build with NO_GSSAPI is currently broken. The issue has been
reported upstream.

Cc: Alexander Dahl <post@lespocky.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/putty/Config.in  | 5 +++--
 package/putty/putty.hash | 9 ++++++---
 package/putty/putty.mk   | 2 +-
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/putty/Config.in b/package/putty/Config.in
index cd8b3bb2132d..f901c71da297 100644
--- a/package/putty/Config.in
+++ b/package/putty/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PUTTY
 	bool "putty"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
+	depends on !BR2_STATIC_LIBS
 	help
 	  PuTTY is a free SSH and Telnet client. Without GTK2
 	  activated, only the commandline tools plink, pscp, psftp,
@@ -10,6 +11,6 @@ config BR2_PACKAGE_PUTTY
 
 	  http://www.chiark.greenend.org.uk/~sgtatham/putty/
 
-comment "putty needs a toolchain w/ wchar"
+comment "putty needs a toolchain w/ wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
diff --git a/package/putty/putty.hash b/package/putty/putty.hash
index e0527105c1d4..30f51848f80c 100644
--- a/package/putty/putty.hash
+++ b/package/putty/putty.hash
@@ -1,3 +1,6 @@
-# Hashes from: http://the.earth.li/~sgtatham/putty/0.70/{sha256,sha512}sums
-sha256 bb8aa49d6e96c5a8e18a057f3150a1695ed99a24eef699e783651d1f24e7b0be                                                                 putty-0.70.tar.gz
-sha512 2aaf4fa2b4ad2d82eb5cdc4419ade79e0c5d8bd3c093db92b3c048e6107f85a5f1647f9d8203cda0906ce2b926725a75319f981cb32e6f1ebf50b1f738564fed putty-0.70.tar.gz
+# Hashes from: http://the.earth.li/~sgtatham/putty/0.71/{sha256,sha512}sums
+sha256 2f931ce2f89780cc8ca7bbed90fcd22c44515d2773f5fa954069e209b48ec6b8                                                                 putty-0.71.tar.gz
+sha512 f8791210bd5925b26d51b13f0558eea15dbac40808051165b236d6436226f5c2b0aa7d69288ed9e2bddc1066455678cfd0af73ef6b715a136c42f3b6f754ac07 putty-0.71.tar.gz
+
+# Locally calculated
+sha256 b517b4a9504ba0f651d5e590245197b88d9a81d073905cc798cc9464c5ca7ba8  LICENCE
diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index 52f2d4c3dd36..c72c05320d39 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PUTTY_VERSION = 0.70
+PUTTY_VERSION = 0.71
 PUTTY_SITE = http://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
 PUTTY_SUBDIR = unix
 PUTTY_LICENSE = MIT
-- 
2.20.1
