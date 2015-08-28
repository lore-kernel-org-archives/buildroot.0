From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 14:59:51 +0200
Subject: [Buildroot] [git commit] scrypt: commit packaging improvements
Message-ID: <20150901083108.147BB7F95A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0d83de383224c65ec250a005130b1d3cc6fd6d76
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The changes brought by this commit should have been part of the
previous commit, but were not due to a mistake. This commit implements
the following changes to the scrypt package:

   - move from "Libraries -> Crypto" to "System tools", since it only
     installs one binary, scrypt, and no library.
   - bump from 1.1.6 to 1.2.0
   - add comment in the .hash file explaining where the hash is coming
     from.
   - add missing dependency on OpenSSL
   - use BSD-2c as the license code, instead of BSD2
   - use 'main.c' as the license file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |    2 +-
 package/scrypt/Config.in   |    7 ++++---
 package/scrypt/scrypt.hash |    3 ++-
 package/scrypt/scrypt.mk   |    6 ++++--
 4 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 5b8084d..60cda71 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -754,7 +754,6 @@ menu "Crypto"
 	source "package/nettle/Config.in"
 	source "package/openssl/Config.in"
 	source "package/polarssl/Config.in"
-	source "package/scrypt/Config.in"
 endmenu
 
 menu "Database"
@@ -1468,6 +1467,7 @@ endif
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/rsyslog/Config.in"
 endif
+	source "package/scrypt/Config.in"
 	source "package/smack/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/start-stop-daemon/Config.in"
diff --git a/package/scrypt/Config.in b/package/scrypt/Config.in
index 8be7f54..e6d1ac1 100644
--- a/package/scrypt/Config.in
+++ b/package/scrypt/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_SCRYPT
 	bool "scrypt"
+	select BR2_PACKAGE_OPENSSL
 	help
-	  A password-based key derivation function specifically designed
-	  to make it costly to perform large-scale custom hardware attacks
-	  by requiring large amounts of memory.
+	  A password-based key derivation function specifically
+	  designed to make it costly to perform large-scale custom
+	  hardware attacks by requiring large amounts of memory.
 
 	  http://www.tarsnap.com/scrypt.html
diff --git a/package/scrypt/scrypt.hash b/package/scrypt/scrypt.hash
index e6b690e..6694456 100644
--- a/package/scrypt/scrypt.hash
+++ b/package/scrypt/scrypt.hash
@@ -1 +1,2 @@
-sha256 dfd0d1a544439265bbb9b58043ad3c8ce50a3987b44a61b1d39fd7a3ed5b7fb8  scrypt-1.1.6.tgz
+# From http://www.tarsnap.com/scrypt/scrypt-sigs-1.2.0.asc
+sha256 1754bc89405277c8ac14220377a4c240ddc34b1ce70882aa92cd01bfdc8569d4  scrypt-1.2.0.tgz
diff --git a/package/scrypt/scrypt.mk b/package/scrypt/scrypt.mk
index 2db6e2e..7ffa7cc 100644
--- a/package/scrypt/scrypt.mk
+++ b/package/scrypt/scrypt.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-SCRYPT_VERSION = 1.1.6
+SCRYPT_VERSION = 1.2.0
 SCRYPT_SOURCE = scrypt-$(SCRYPT_VERSION).tgz
 SCRYPT_SITE = http://www.tarsnap.com/scrypt
-SCRYPT_LICENSE = BSD2
+SCRYPT_LICENSE = BSD-2c
+SCRYPT_LICENSE_FILES = main.c
+SCRYPT_DEPENDENCIES = openssl
 SCRYPT_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
