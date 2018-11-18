From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Nov 2018 22:00:00 +0100
Subject: [Buildroot] [git commit branch/next] msmtp: enable msmtpd if MMU is
 available
Message-ID: <20181118205720.EF476839C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6dbfbb7be2eaed7688dbfc4039ee6b1eaf74f399
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

msmtpd uses fork so enable it if MMU is available

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
