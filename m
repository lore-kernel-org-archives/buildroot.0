From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 27 Jan 2015 19:51:39 +0200
Subject: [Buildroot] [PATCH] alsa-utils: remove -ldl in static builds
Message-ID: <fde55ad7b3840dad27b2669844c36d52a55ed79a.1422381099.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit ffd7a00aef723 (alsa-lib: add patch to remove hardcoded -ldl) we
patch alsa.m4 from alsa-lib to remove -ldl on static builds. autoreconf
alsa-utils to regenerate aclocal.m4 using our alsa.m4.

We also need to gettextize alsa-utils because we use a more recent gettext
version.

Fixes:
http://autobuild.buildroot.net/results/314/314dac9f5e62ae9beb598eb1b4cb35c0a7bfe792/
http://autobuild.buildroot.net/results/964/964e44f0c1653370600c7e8c647abda3f6380e34/
http://autobuild.buildroot.net/results/d72/d72f31bab907c7485d03db4597d01fd759277db4/
...

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/alsa-utils/alsa-utils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index a599af8f5e76..f95e7a8e3a65 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -12,6 +12,10 @@ ALSA_UTILS_LICENSE_FILES = COPYING
 ALSA_UTILS_INSTALL_STAGING = YES
 ALSA_UTILS_DEPENDENCIES = host-gettext host-pkgconf alsa-lib \
 	$(if $(BR2_PACKAGE_NCURSES),ncurses)
+# Regenerate aclocal.m4 to pick the patched
+# version of alsa.m4 from alsa-lib
+ALSA_UTILS_AUTORECONF = YES
+ALSA_UTILS_GETTEXTIZE = YES
 
 ALSA_UTILS_CONF_ENV = \
 	ac_cv_prog_ncurses5_config=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
-- 
2.1.4
