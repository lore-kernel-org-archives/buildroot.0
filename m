From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 Mar 2015 19:54:15 +0100
Subject: [Buildroot] [PATCH 1/2 v4] system: remove DES password encoding
In-Reply-To: <cover.1427223149.git.yann.morin.1998@free.fr>
References: <cover.1427223149.git.yann.morin.1998@free.fr>
Message-ID: <840cc743b5a06c6b600d067bfb11d2eafe373b45.1427223149.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

DES is long dead, it is insecure as hell, and virtually all known
crypt(3) implementations now all support at least md5.

Besides, the character-space of DES-encoded passwords are a sub-set
of the character-space for a clear-text password, so we can't easily
differentiate between the two. Since we're going to change the root
password prompt to support settign encoded passwords (as well as
clear-text passwords), we can't keep DES or we'd be unable to decide
whether we'd need to encode the password or not.

Remove DES encoding altogether (and add a legacy entry). The default is
still md5, and thus there's no backward-compatibility 'select' to add.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Lorenzo Catucci <lorenzo@sancho.ccd.uniroma2.it>
---
 Config.in.legacy | 7 +++++++
 system/Config.in | 9 ---------
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 1f57671..2fad28f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.05"
 
+config BR2_TARGET_GENERIC_PASSWD_DES
+	bool "Encoding passwords with DES has been removed"
+	select BR2_LEGACY
+	help
+	  Paswords can now only be encoded with either of md5, sha256 or sha512.
+	  The default is md5, which is stronger that DES (but still pretty weak).
+
 config BR2_PACKAGE_VALGRIND_PTRCHECK
 	bool "valgrind's PTRCheck was renamed to SGCheck"
 	select BR2_LEGACY
diff --git a/system/Config.in b/system/Config.in
index 9973cc2..8621def 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -27,14 +27,6 @@ choice
 
 	  Note: this is used at build-time, and *not* at runtime.
 
-config BR2_TARGET_GENERIC_PASSWD_DES
-	bool "des"
-	help
-	  Use standard 56-bit DES-based crypt(3) to encode passwords.
-
-	  Old, wildly available, but also the weakest, very susceptible to
-	  brute-force attacks.
-
 config BR2_TARGET_GENERIC_PASSWD_MD5
 	bool "md5"
 	help
@@ -67,7 +59,6 @@ endchoice # Passwd encoding
 
 config BR2_TARGET_GENERIC_PASSWD_METHOD
 	string
-	default "des"       if BR2_TARGET_GENERIC_PASSWD_DES
 	default "md5"       if BR2_TARGET_GENERIC_PASSWD_MD5
 	default "sha-256"   if BR2_TARGET_GENERIC_PASSWD_SHA256
 	default "sha-512"   if BR2_TARGET_GENERIC_PASSWD_SHA512
-- 
1.9.1
