From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 May 2014 14:46:09 +0200
Subject: [Buildroot] [git commit] rdesktop: security bump to version 1.8.2
Message-ID: <20140523200519.1F3559CBF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b19399cc1de0d27543ed97efad5dd9adfd04f7c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Long overdue, fixes CVE-2008-1801, CVE-2008-1802, CVE-2008-1803 and
CVE-2011-1595.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-colors.patch => rdesktop-01-8bit-colors.patch} |    0
 package/rdesktop/rdesktop.mk                       |   17 +++++++++++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/package/rdesktop/rdesktop-8bit-colors.patch b/package/rdesktop/rdesktop-01-8bit-colors.patch
similarity index 100%
rename from package/rdesktop/rdesktop-8bit-colors.patch
rename to package/rdesktop/rdesktop-01-8bit-colors.patch
diff --git a/package/rdesktop/rdesktop.mk b/package/rdesktop/rdesktop.mk
index 94e0282..6829709 100644
--- a/package/rdesktop/rdesktop.mk
+++ b/package/rdesktop/rdesktop.mk
@@ -4,11 +4,20 @@
 #
 ################################################################################
 
-RDESKTOP_VERSION = 1.5.0
+RDESKTOP_VERSION = 1.8.2
 RDESKTOP_SITE = http://downloads.sourceforge.net/project/rdesktop/rdesktop/$(RDESKTOP_VERSION)
-RDESKTOP_DEPENDENCIES = openssl xlib_libX11 xlib_libXt
-RDESKTOP_CONF_OPT = --with-openssl=$(STAGING_DIR)/usr
-RDESKTOP_LICENSE = GPLv2+ with exceptions
+RDESKTOP_DEPENDENCIES = host-pkgconf openssl xlib_libX11 xlib_libXt \
+	$(if $(BR2_PACKAGE_ALSA_LIB_PCM),alsa-lib) \
+	$(if $(BR2_PACKAGE_LIBAO),libao) \
+	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate)
+RDESKTOP_CONF_OPT = --with-openssl=$(STAGING_DIR)/usr --disable-credssp
+RDESKTOP_LICENSE = GPLv3+
 RDESKTOP_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_PCSC_LITE),y)
+RDESKTOP_DEPENDENCIES += pcsc-lite
+else
+RDESKTOP_CONF_OPT += --disable-smartcard
+endif
+
 $(eval $(autotools-package))
