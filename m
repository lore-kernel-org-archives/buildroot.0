From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Jan 2015 23:09:25 +0100
Subject: [Buildroot] [git commit] alsa-utils: remove -ldl in static builds
Message-ID: <20150127221916.80A3C80E25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e10cf295c900790d96d777cc7ff0aea287afd056
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit ffd7a00aef723 (alsa-lib: add patch to remove hardcoded -ldl) we
patch alsa.m4 from alsa-lib to remove -ldl on static builds.  Autoreconf
alsa-utils to regenerate aclocal.m4 using our alsa.m4 so we don't end up
linking the utilities against -ldl if not needed/available.

We also need to gettextize alsa-utils because we use a more recent gettext
version.

Fixes:
http://autobuild.buildroot.net/results/314/314dac9f5e62ae9beb598eb1b4cb35c0a7bfe792/
http://autobuild.buildroot.net/results/964/964e44f0c1653370600c7e8c647abda3f6380e34/
http://autobuild.buildroot.net/results/d72/d72f31bab907c7485d03db4597d01fd759277db4/
...

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-utils/alsa-utils.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index a599af8..f95e7a8 100644
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
