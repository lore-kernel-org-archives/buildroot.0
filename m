From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 22 Dec 2019 23:37:21 +0100
Subject: [Buildroot] [PATCH 2/2] package/twolame: libsndfile is optional
In-Reply-To: <20191222223721.3982310-1-fontaine.fabrice@gmail.com>
References: <20191222223721.3982310-1-fontaine.fabrice@gmail.com>
Message-ID: <20191222223721.3982310-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libsndfile is optional not mandatory since version 0.4.0 and
https://github.com/njh/twolame/commit/fe2770bffb9da10b7a26c82a340c81299ff82c76

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.24.0
