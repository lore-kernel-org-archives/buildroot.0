From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun,  6 Dec 2015 22:26:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/libgpg-error: bump to version 1.20
Message-ID: <1449437176-30596-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch:
 * bumps libgpg-error to version 1.20
 * removes patch merged upstream
 * remove AUTORECONF = YES (not patching Makefile anymore)
 * override the --host value

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 .../0001-avoid-breakage-with-gcc-5.patch           | 56 ----------------------
 package/libgpg-error/libgpg-error.hash             |  2 +-
 package/libgpg-error/libgpg-error.mk               | 13 +++--
 3 files changed, 11 insertions(+), 60 deletions(-)
 delete mode 100644 package/libgpg-error/0001-avoid-breakage-with-gcc-5.patch

diff --git a/package/libgpg-error/0001-avoid-breakage-with-gcc-5.patch b/package/libgpg-error/0001-avoid-breakage-with-gcc-5.patch
deleted file mode 100644
index 96dc569..0000000
--- a/package/libgpg-error/0001-avoid-breakage-with-gcc-5.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-Patch ported from Debian
-http://anonscm.debian.org/cgit/pkg-gnupg/libgpg-error.git/diff/?id=c3d7571
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-
-From 91da4f5dbbc9d93975ef9753652a4e71719f9f27 Mon Sep 17 00:00:00 2001
-From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
-Date: Mon, 16 Mar 2015 13:26:00 -0400
-Subject: [LIBGPG-ERROR PATCH] avoid breakage with gcc 5
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
- * src/Makefile.am: add -P to the C preprocessor when building
-   mkerrcodes.h, to avoid a noisy intermediate pipeline.
-
---
-
-With gcc 5 without this patch, we see many errors like the following:
-
-gcc -I. -I. -o mkerrcodes ./mkerrcodes.c
-In file included from ./mkerrcodes.c:26:0:
-./mkerrcodes.h:9:5: error: expected expression before ?,? token
-   { , "GPG_ERR_E2BIG" },
-     ^
-./mkerrcodes.h:10:5: error: expected expression before ?,? token
-   { , "GPG_ERR_EACCES" },
-     ^
-
-This patch cleans up the generated mkerrcodes.h by making the
-intermediate stage clean for all the versions of gcc i tested (4.x and
-5).
-
-Debian-Bug-Id: 777374
-Signed-Off-By: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
----
- src/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 99c2c53..f847a80 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -213,7 +213,7 @@ code-to-errno.h: Makefile mkerrnos.awk errnos.in
- # It is correct to use $(CPP).  We want the host's idea of the error codes.
- mkerrcodes.h: Makefile mkerrcodes.awk $(gpg_extra_headers)
- 	$(AWK) -f $(srcdir)/mkerrcodes1.awk $(srcdir)/errnos.in >_$@
--	$(CPP) $(CPPFLAGS) $(extra_cppflags) _$@ | grep GPG_ERR_ | \
-+	$(CPP) $(CPPFLAGS) $(extra_cppflags) -P _$@ | grep GPG_ERR_ | \
-                $(AWK) -f $(srcdir)/mkerrcodes.awk >$@
- 	-rm _$@
- 
--- 
-2.1.4
-
diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index 76aff5d..39ee29f 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	fa6fbf315efa33a943751e3c4d04ea3d41ddf4bdee5727de3c0978277d52923b	libgpg-error-1.12.tar.gz
+sha256	ccd00b4b115de3d2cd7f789f86d668b99bb2fe505d7a7edcff851ddd904ecd05	libgpg-error-1.20.tar.gz
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 52b7058..cf2a15b 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,14 +4,21 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.12
+LIBGPG_ERROR_VERSION = 1.20
 LIBGPG_ERROR_SITE = ftp://ftp.gnupg.org/gcrypt/libgpg-error
 LIBGPG_ERROR_LICENSE = LGPLv2.1+
 LIBGPG_ERROR_LICENSE_FILES = COPYING.LIB
 LIBGPG_ERROR_INSTALL_STAGING = YES
 LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
-# we patch src/Makefile.am
-LIBGPG_ERROR_AUTORECONF = YES
 LIBGPG_ERROR_GETTEXTIZE = YES
 
+# libgpg-error needs to figure out some platform specific properties. The
+# detection is done during build time, by setting the proper --host value.
+# To match any of the platform specific syscfg files we must replace the
+# toolchain's vendor name to 'unknown'.
+# Note we are overriding the host value set by the autotools package
+# infrastructure.
+LIBGPG_ERROR_CONF_OPTS += \
+	--host=$(subst $(TARGET_VENDOR),unknown,$(GNU_TARGET_NAME))
+
 $(eval $(autotools-package))
-- 
2.6.3
