From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 19 Mar 2013 10:05:11 -0300
Subject: [Buildroot] [PATCH] audiofile: bump to version 0.3.6
Message-ID: <1363698311-16371-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now with FLAC support.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/audiofile/audiofile.mk | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/audiofile/audiofile.mk b/package/audiofile/audiofile.mk
index 9886c4d..51173e6 100644
--- a/package/audiofile/audiofile.mk
+++ b/package/audiofile/audiofile.mk
@@ -4,18 +4,20 @@
 #
 #############################################################
 
-AUDIOFILE_VERSION = 0.3.4
+AUDIOFILE_VERSION = 0.3.6
 AUDIOFILE_SITE = http://audiofile.68k.org
 AUDIOFILE_INSTALL_STAGING = YES
 AUDIOFILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-AUDIOFILE_LICENSE = GPLv2+ LGPLv2+
+AUDIOFILE_CONF_OPT = --disable-examples --disable-docs
+AUDIOFILE_DEPENDENCIES = host-pkgconf
+AUDIOFILE_LICENSE = GPLv2+ LGPLv2.1+
 AUDIOFILE_LICENSE_FILES = COPYING COPYING.GPL
 
-# Useless and needs alsa-lib
-define AUDIOFILE_DISABLE_EXAMPLES
-	$(SED) 's/examples//' $(@D)/Makefile.in
-endef
-
-AUDIOFILE_POST_PATCH_HOOKS += AUDIOFILE_DISABLE_EXAMPLES
+ifeq ($(BR2_PACKAGE_FLAC),y)
+AUDIOFILE_DEPENDENCIES += flac
+AUDIOFILE_CONF_OPT += --enable-flac
+else
+AUDIOFILE_CONF_OPT += --disable-flac
+endif
 
 $(eval $(autotools-package))
-- 
1.8.1.5
