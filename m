From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 22 Jul 2012 15:28:29 +0200
Subject: [Buildroot] [PATCH 01/11] libgpg-error: add optional nls support
In-Reply-To: <1342963719-1810-1-git-send-email-s.martin49@gmail.com>
References: <1342963719-1810-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1342963719-1810-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>

diff --git a/package/libgpg-error/Config.in b/package/libgpg-error/Config.in
index 8287f98..bb7dc0b 100644
--- a/package/libgpg-error/Config.in
+++ b/package/libgpg-error/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LIBGPG_ERROR
 	bool "libgpg-error"
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Libgpg-error is a small library with error codes and
 	  descriptions shared by most GnuPG related software.
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 96cbbd6..0968def 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -8,4 +8,11 @@ LIBGPG_ERROR_VERSION = 1.10
 LIBGPG_ERROR_SITE = ftp://ftp.gnupg.org/gcrypt/libgpg-error
 LIBGPG_ERROR_INSTALL_STAGING = YES
 
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+LIBGPG_ERROR_DEPENDENCIES += gettext libintl
+LIBGPG_ERROR_CONF_OPT += --enable-nls
+else
+LIBGPG_ERROR_CONF_OPT += --disable-nls
+endif
+
 $(eval $(autotools-package))
-- 
1.7.11.2
