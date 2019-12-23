From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Dec 2019 21:04:09 +0100
Subject: [Buildroot] [git commit] package/twolame: libsndfile is optional
Message-ID: <20191223195503.4BA428E068@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9d10e5b59fbb711b07517f41c68c74a36256141
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libsndfile is optional not mandatory since version 0.4.0 and
https://github.com/njh/twolame/commit/fe2770bffb9da10b7a26c82a340c81299ff82c76

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/twolame/Config.in  | 1 -
 package/twolame/twolame.mk | 8 +++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/twolame/Config.in b/package/twolame/Config.in
index 95b148b815..588afa4826 100644
--- a/package/twolame/Config.in
+++ b/package/twolame/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_TWOLAME
 	bool "twolame"
-	select BR2_PACKAGE_LIBSNDFILE
 	help
 	  TwoLAME is an optimised MPEG Audio Layer 2 (MP2) encoder
 	  based on tooLAME by Mike Cheng, which in turn is based upon
diff --git a/package/twolame/twolame.mk b/package/twolame/twolame.mk
index 5837b80a56..b1abf077b5 100644
--- a/package/twolame/twolame.mk
+++ b/package/twolame/twolame.mk
@@ -6,9 +6,15 @@
 
 TWOLAME_VERSION = 0.4.0
 TWOLAME_SITE = http://downloads.sourceforge.net/project/twolame/twolame/$(TWOLAME_VERSION)
-TWOLAME_DEPENDENCIES = host-pkgconf libsndfile
 TWOLAME_INSTALL_STAGING = YES
 TWOLAME_LICENSE = LGPL-2.1+
 TWOLAME_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
+TWOLAME_DEPENDENCIES += host-pkgconf libsndfile
+TWOLAME_CONF_OPTS += --enable-sndfile
+else
+TWOLAME_CONF_OPTS += --disable-sndfile
+endif
+
 $(eval $(autotools-package))
