From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Apr 2017 09:58:49 +0200
Subject: [Buildroot] [git commit] xorriso: disable libcdio
Message-ID: <20170426075859.815188280C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a0524876b2872d345a9517c169f29ddb72851e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xorriso and libcdio define identically named symbols. This breaks static
linking.

Besides, upstream suggested that on Linux the built-in libburn adapter is much
better tested than libcdio.

Disable libcdio.

Fixes:
http://autobuild.buildroot.net/results/430/430a6b548fcc311f20ea71cecaa11fafac1d5a19/
http://autobuild.buildroot.net/results/a5d/a5d0f8bec0d39e48f6dfe4ecc07fe0ca3c6bd70a/

Cc: Steve Kenton <skenton@ou.edu>
Suggested-by: Thomas Schmitt <scdbackup@gmx.net>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Steve Kenton <skenton@ou.edu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xorriso/xorriso.mk | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/package/xorriso/xorriso.mk b/package/xorriso/xorriso.mk
index b205580..1f09591 100644
--- a/package/xorriso/xorriso.mk
+++ b/package/xorriso/xorriso.mk
@@ -18,19 +18,14 @@ HOST_XORRISO_CONF_OPTS = \
 	--disable-libedit \
 	--disable-libacl
 
+# libcdio doesn't make sense for Linux
+# http://lists.gnu.org/archive/html/bug-xorriso/2017-04/msg00004.html
+XORRISO_CONF_OPTS = --disable-libcdio
+
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 XORRISO_DEPENDENCIES += libiconv
 endif
 
-ifeq ($(BR2_PACKAGE_LIBCDIO),y)
-XORRISO_DEPENDENCIES += host-pkgconf libcdio
-XORRISO_CONF_OPTS += \
-	--enable-pkg-check-modules \
-	--enable-libcdio
-else
-XORRISO_CONF_OPTS += --disable-libcdio
-endif
-
 ifeq ($(BR2_PACKAGE_READLINE),y)
 XORRISO_DEPENDENCIES += readline
 XORRISO_CONF_OPTS += --enable-libreadline
