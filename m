From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 1 May 2019 21:53:27 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/imagemagick:
 disable locale with uclibc
Message-ID: <20190501201631.AEB96839E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=014787c420dd3e9dbf812835b24964627e41987c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.org/results/f7be30ffa28b7f367fb5343a7d69dc8bc7c3a170

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e1b691884b79ee753249b42426a89ebce474192f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index b5d0d56284..81e49eb62c 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -40,6 +40,14 @@ IMAGEMAGICK_CONF_OPTS = \
 
 IMAGEMAGICK_DEPENDENCIES = host-pkgconf
 
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+# Like postgreSQL, imagemagick does not build against uClibc with
+# locales enabled, due to an uClibc bug, see
+# http://lists.uclibc.org/pipermail/uclibc/2014-April/048326.html
+# so overwrite automatic detection and disable locale support
+IMAGEMAGICK_CONF_ENV += ac_cv_func_newlocale=no
+endif
+
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
 IMAGEMAGICK_CONF_OPTS += --with-fontconfig
 IMAGEMAGICK_DEPENDENCIES += fontconfig
