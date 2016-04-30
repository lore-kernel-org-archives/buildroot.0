From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sat, 30 Apr 2016 09:49:03 +0200
Subject: [Buildroot] [PATCH 07/34] reproducibility/libgcrypt: override
	timestamps
In-Reply-To: <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1462002570-14706-7-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

with SOURCE_DATE_EPOCH
---
 package/libgcrypt/0003-honor-source-date-epoch.patch | 15 +++++++++++++++
 package/libgcrypt/libgcrypt.mk                       |  1 +
 2 files changed, 16 insertions(+)
 create mode 100644 package/libgcrypt/0003-honor-source-date-epoch.patch

diff --git a/package/libgcrypt/0003-honor-source-date-epoch.patch b/package/libgcrypt/0003-honor-source-date-epoch.patch
new file mode 100644
index 0000000..0f41c1b
--- /dev/null
+++ b/package/libgcrypt/0003-honor-source-date-epoch.patch
@@ -0,0 +1,15 @@
+--- libgcrypt-1.6.4/configure.ac.orig	2015-09-08 08:27:26.000000000 +0200
++++ libgcrypt-1.6.4/configure.ac	2016-02-23 21:31:19.290079195 +0100
+@@ -1993,7 +1993,11 @@ changequote([,])dnl
+ BUILD_FILEVERSION="${BUILD_FILEVERSION}mym4_revision_dec"
+ AC_SUBST(BUILD_FILEVERSION)
+ 
+-BUILD_TIMESTAMP=`date -u +%Y-%m-%dT%H:%M+0000 2>/dev/null || date`
++if test x"${SOURCE_DATE_EPOCH}" = x; then
++   	BUILD_TIMESTAMP=`date -u +%Y-%m-%dT%H:%M+0000 2>/dev/null || date`
++else
++	BUILD_TIMESTAMP=`date -u -d @${SOURCE_DATE_EPOCH} +%Y-%m-%dT%H:%M+0000 2>/dev/null || date -d @${SOURCE_DATE_EPOCH}`
++fi
+ AC_SUBST(BUILD_TIMESTAMP)
+ AC_DEFINE_UNQUOTED(BUILD_TIMESTAMP, "$BUILD_TIMESTAMP",
+                    [The time this package was configured for a build])
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 53d1d6c..768e42f 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -12,6 +12,7 @@ LIBGCRYPT_SITE = ftp://ftp.gnupg.org/gcrypt/libgcrypt
 LIBGCRYPT_INSTALL_STAGING = YES
 LIBGCRYPT_DEPENDENCIES = libgpg-error
 LIBGCRYPT_CONFIG_SCRIPTS = libgcrypt-config
+LIBGCRYPT_AUTORECONF = YES
 
 LIBGCRYPT_CONF_ENV = \
 	ac_cv_sys_symbol_underscore=no
-- 
2.7.4
