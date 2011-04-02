From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  2 Apr 2011 18:52:52 +0200
Subject: [Buildroot] [PATCH 2/2] qt: speed up qmake build
In-Reply-To: <cover.1301763163.git.thomas.petazzoni@free-electrons.com>
References: <cover.1301763163.git.thomas.petazzoni@free-electrons.com>
Message-ID: <66242e9ff64f81f9c0c3b11fc7c1fc7933eb4efc.1301763163.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qmake is built during the execution of Qt ./configure script, so it is
built just with a normal make, not taking advantage of parallel
compilation. Passing MAKEFLAGS=-j$(BR2_JLEVEL) allows to speed up the
qmake compilation process quite a bit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/qt.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 62ba869..c1f11ed 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -468,7 +468,7 @@ define QT_CONFIGURE_CMDS
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
-		./configure \
+		MAKEFLAGS=-j$(BR2_JLEVEL) ./configure \
 		$(if $(VERBOSE),-verbose,-silent) \
 		-force-pkg-config \
 		$(QT_CONFIGURE_OPTS) \
-- 
1.7.1
