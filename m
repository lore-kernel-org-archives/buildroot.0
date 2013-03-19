From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Mar 2013 17:05:36 +0100
Subject: [Buildroot] [git commit] audiofile: bump to version 0.3.6
Message-ID: <20130319160722.E2C1D9B030@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=61aa05cc89d31de083c624185aa8ba1a910a6c7d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now with FLAC support.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/audiofile/audiofile.mk |   18 ++++++++++--------
 1 files changed, 10 insertions(+), 8 deletions(-)

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
