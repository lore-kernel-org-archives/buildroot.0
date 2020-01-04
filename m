From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Jan 2020 16:21:22 +0100
Subject: [Buildroot] [git commit] package/exim: bump version to 4.93.0.3
Message-ID: <20200104151813.5A7988EBB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6038c3232acfdb55bd764df721b34d8a78d8cef9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed 0004-Fix-uClibc-build.patch, committed upstream
https://git.exim.org/exim.git/commitdiff/ec5bf0b83235d01ad0b2865d1819a603441f50f2

Renumbered remaining patches.

Added hashes provided by upstream.

Explicitly disabled DANE after upstream enabled it:
https://git.exim.org/exim.git/commitdiff/59c0959a36649c4554bd0f18f2c2e74571ed41eb#patch3

Use new TLS options:
https://git.exim.org/exim.git/commitdiff/01603eec64d42431f182b33008206facfc7f800e#patch1

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ibc-build.patch => 0004-Fix-uClibc-build.patch} |  0
 package/exim/0004-remove-libnsl.patch              | 37 ----------------------
 package/exim/exim.hash                             |  7 ++--
 package/exim/exim.mk                               | 11 +++++--
 4 files changed, 13 insertions(+), 42 deletions(-)

diff --git a/package/exim/0005-Fix-uClibc-build.patch b/package/exim/0004-Fix-uClibc-build.patch
similarity index 100%
rename from package/exim/0005-Fix-uClibc-build.patch
rename to package/exim/0004-Fix-uClibc-build.patch
diff --git a/package/exim/0004-remove-libnsl.patch b/package/exim/0004-remove-libnsl.patch
deleted file mode 100644
index 8ca53c9acb..0000000000
--- a/package/exim/0004-remove-libnsl.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From b722f8fc01f6b1d71c98c0c66f759935b0dac136 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sat, 19 May 2018 20:36:41 +0200
-Subject: [PATCH] remove libnsl
-
-glibc now considers its built-in libnsl as being obsolete, and requires
-passing --enable-obsolete-libnsl to have it built and installed. libnsl
-is now provided as a separate project [1], but it isn't packaged yet in
-Buildroot.
-
-Exim's nis.so and nisplus.so lookup modules require libnsl,
-but they are not build by default. So we can safely remove -lnsl
-from the Makefile-Linux.
-
-[1] https://github.com/thkukuk/libnsl.git
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- OS/Makefile-Linux | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/OS/Makefile-Linux b/OS/Makefile-Linux
-index 990f884..ea5644b 100644
---- a/OS/Makefile-Linux
-+++ b/OS/Makefile-Linux
-@@ -19,7 +19,7 @@ CFLAGS_DYNAMIC ?= -shared -rdynamic
- DBMLIB = -ldb
- USE_DB = yes
- 
--LIBS = -lnsl -lcrypt -lm
-+LIBS = -lcrypt -lm
- LIBRESOLV = -lresolv
- 
- X11=/usr/X11R6
--- 
-2.14.3
-
diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index 1c54e182f0..8c10adc05c 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,3 +1,6 @@
-# Locally calculated after checking pgp signature
-sha256 c4453bb5ec8e16c4c3353769700466eb9aa48c1b2fcf7f3b0e08954dd727d2fd  exim-4.92.3.tar.xz
+# From https://ftp.exim.org/pub/exim/exim4/fixes/00-sha256sums.txt
+sha256 8156bbe67fa72c0a297207ca0c3bb99f230df08d38d95df91f1c284b0a12983f  exim-4.93.0.3.tar.xz
+# From https://ftp.exim.org/pub/exim/exim4/fixes/00-sha512sums.txt
+sha512 8afece1059e4ada85f6ecef8197cf2ac5b56274f8c2e1bdd785e0470d37bb1e8b4fe225650ac03302824e3a7fe0a6db1641c6218edc8394a70adcc48af46a1d5  exim-4.93.0.3.tar.xz
+# Locally calculated
 sha256 49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 040b292a87..118ee4a1a4 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.92.3
+EXIM_VERSION = 4.93.0.3
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
-EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
+EXIM_SITE = https://ftp.exim.org/pub/exim/exim4/fixes
 EXIM_LICENSE = GPL-2.0+
 EXIM_LICENSE_FILES = LICENCE
 EXIM_DEPENDENCIES = host-berkeleydb host-pcre pcre berkeleydb host-pkgconf
@@ -48,6 +48,7 @@ define EXIM_USE_DEFAULT_CONFIG_FILE
 	$(call exim-config-unset,EXIM_MONITOR)
 	$(call exim-config-change,AUTH_PLAINTEXT,yes)
 	$(call exim-config-change,AUTH_CRAM_MD5,yes)
+	$(call exim-config-unset,SUPPORT_DANE)
 endef
 
 ifeq ($(BR2_PACKAGE_DOVECOT),y)
@@ -67,9 +68,13 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 EXIM_DEPENDENCIES += host-openssl openssl
 define EXIM_USE_DEFAULT_CONFIG_FILE_OPENSSL
-	$(call exim-config-change,SUPPORT_TLS,yes)
+	$(call exim-config-change,USE_OPENSSL,yes)
 	$(call exim-config-change,USE_OPENSSL_PC,openssl)
 endef
+else
+define EXIM_USE_DEFAULT_CONFIG_FILE_OPENSSL
+	$(call exim-config-change,DISABLE_TLS,yes)
+endef
 endif
 
 # musl does not provide struct ip_options nor struct ip_opts (but it is
