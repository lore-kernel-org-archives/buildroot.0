From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 3 Apr 2011 20:12:28 +0200
Subject: [Buildroot] [git commit /heads/master] qt: speed up qmake build
Message-ID: <20110403185531.B2FDC81E9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a219ed3f7b81b93b4ed394451e7dbf862f678ec1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qmake is built during the execution of Qt ./configure script, so it is
built just with a normal make, not taking advantage of parallel
compilation. Passing MAKEFLAGS=-j$(BR2_JLEVEL) allows to speed up the
qmake compilation process quite a bit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 32dc574..8d7238e 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -468,7 +468,7 @@ define QT_CONFIGURE_CMDS
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
-		./configure \
+		MAKEFLAGS="$(MAKEFLAGS) -j$(BR2_JLEVEL)" ./configure \
 		$(if $(VERBOSE),-verbose,-silent) \
 		-force-pkg-config \
 		$(QT_CONFIGURE_OPTS) \
-- 
1.7.3.4
