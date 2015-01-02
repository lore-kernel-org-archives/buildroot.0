From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 Jan 2015 19:45:07 -0300
Subject: [Buildroot] [PATCH 2/2] msmtp: bump to version 1.6.0
In-Reply-To: <1420238707-5456-1-git-send-email-gustavo@zacarias.com.ar>
References: <1420238707-5456-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1420238707-5456-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also drop license comment from help, we have PKG_LICENSE* for that.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/msmtp/Config.in  |  2 --
 package/msmtp/msmtp.hash |  5 +++--
 package/msmtp/msmtp.mk   | 20 ++++++++++++--------
 3 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/package/msmtp/Config.in b/package/msmtp/Config.in
index 385ad90..46bb198 100644
--- a/package/msmtp/Config.in
+++ b/package/msmtp/Config.in
@@ -5,6 +5,4 @@ config BR2_PACKAGE_MSMTP
 	  mail to an SMTP server (for example at a free mail provider)
 	  which takes care of further delivery.
 
-	  Note that msmtp is licensed under GPLv3.
-
 	  http://msmtp.sourceforge.net/
diff --git a/package/msmtp/msmtp.hash b/package/msmtp/msmtp.hash
index 41c6caa..2196afb 100644
--- a/package/msmtp/msmtp.hash
+++ b/package/msmtp/msmtp.hash
@@ -1,2 +1,3 @@
-# Locally computed:
-sha256  2bf0c5c7e78f9905f48de235a75111a1a88238793043bbeae00360b22f1a5f88  msmtp-1.4.32.tar.bz2
+# From http://sourceforge.net/projects/msmtp/files/msmtp/1.6.0/
+md5	1c166853b63c02ae2ab56b50f1aae57b	msmtp-1.6.0.tar.xz
+sha1	39e597619f797ec3550c0146cd3d9e55e85947eb	msmtp-1.6.0.tar.xz
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index 2d8e630..1c6de16 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -4,13 +4,22 @@
 #
 ################################################################################
 
-MSMTP_VERSION = 1.4.32
+MSMTP_VERSION = 1.6.0
 MSMTP_SITE = http://downloads.sourceforge.net/project/msmtp/msmtp/$(MSMTP_VERSION)
-MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.bz2
+MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
+MSMTP_DEPENDENCIES = host-pkgconf
+MSMTP_CONF_OPTS = \
+	--without-libidn \
+	--without-libgsasl
 MSMTP_LICENSE = GPLv3+
 MSMTP_LICENSE_FILES = COPYING
 
-MSMTP_DEPENDENCIES += host-pkgconf
+ifeq ($(BR2_PACKAGE_LIBSECRET),y)
+MSMTP_CONF_OPTS += --with-libsecret
+MSMTP_DEPENDENCIES += libsecret
+else
+MSMTP_CONF_OPTS += --without-libsecret
+endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MSMTP_CONF_OPTS += --with-ssl=openssl
@@ -26,9 +35,4 @@ else
 MSMTP_CONF_OPTS += --with-ssl=no
 endif
 
-MSMTP_CONF_OPTS += \
-	--without-libidn \
-	--without-libgsasl \
-	--without-gnome-keyring
-
 $(eval $(autotools-package))
-- 
2.0.5
