From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 18 Nov 2018 12:58:41 +0100
Subject: [Buildroot] [PATCH/next 2/2] msmtp: enable msmtpd if MMU is
 available
In-Reply-To: <20181118115841.25688-1-fontaine.fabrice@gmail.com>
References: <20181118115841.25688-1-fontaine.fabrice@gmail.com>
Message-ID: <20181118115841.25688-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

msmtpd uses fork so enable it if MMU is available

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/msmtp/msmtp.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index 2370591614..a495072abf 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -8,10 +8,17 @@ MSMTP_VERSION = 1.8.0
 MSMTP_SITE = https://marlam.de/msmtp/releases
 MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
 MSMTP_DEPENDENCIES = host-pkgconf
-MSMTP_CONF_OPTS = --disable-gai-idn --without-msmtpd
+MSMTP_CONF_OPTS = --disable-gai-idn
 MSMTP_LICENSE = GPL-3.0+
 MSMTP_LICENSE_FILES = COPYING
 
+# msmtpd needs fork
+ifeq ($(BR2_USE_MMU),y)
+MSMTP_CONF_OPTS += --with-msmtpd
+else
+MSMTP_CONF_OPTS += --without-msmtpd
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGSASL),y)
 MSMTP_CONF_OPTS += --with-libgsasl
 MSMTP_DEPENDENCIES += libgsasl
-- 
2.17.1
