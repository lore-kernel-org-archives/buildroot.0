From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 1 Aug 2018 14:17:11 +0200
Subject: [Buildroot] [git commit] package/cutelyst: fix build dependencies
Message-ID: <20180801121359.75EDE8B3B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36514a415d39e9876b93b5efa015382755ccd039
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds missing optional dependencies on libpwquality and
jemalloc.

The optional dependency on grantlee is removed, because it fails to
build, so we explicitly disable grantlee support.

  http://autobuild.buildroot.net/results/ecbe25728a81f13e35a4315b64aacb8e592f5867/ (jemalloc)
  http://autobuild.buildroot.net/results/84c29fc0d6212f33ff1efdf8495cbb84e4eeed65/ (grantlee)

Signed-off-by: Daniel Nicoletti <dantti12@gmail.com>
[Thomas: explicitly disable grantlee support.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cutelyst/cutelyst.mk | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/cutelyst/cutelyst.mk b/package/cutelyst/cutelyst.mk
index 438ac091c6..498d2d5545 100644
--- a/package/cutelyst/cutelyst.mk
+++ b/package/cutelyst/cutelyst.mk
@@ -13,22 +13,19 @@ CUTELYST_LICENSE_FILES = COPYING
 CUTELYST_DEPENDENCIES = qt5base
 
 CUTELYST_CONF_OPTS += \
-	-DPLUGIN_CSRFPROTECTION=ON
-
-ifeq ($(BR2_PACKAGE_GRANTLEE),y)
-CUTELYST_CONF_OPTS += -DPLUGIN_VIEW_GRANTLEE=ON
-else
-CUTELYST_CONF_OPTS += -DPLUGIN_VIEW_GRANTLEE=OFF
-endif
+	-DPLUGIN_CSRFPROTECTION=ON \
+	-DPLUGIN_VIEW_GRANTLEE=OFF
 
 ifeq ($(BR2_PACKAGE_LIBPWQUALITY),y)
 CUTELYST_CONF_OPTS += -DPLUGIN_VALIDATOR_PWQUALITY=ON
+CUTELYST_DEPENDENCIES += libpwquality
 else
 CUTELYST_CONF_OPTS += -DPLUGIN_VALIDATOR_PWQUALITY=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_JEMALLOC),y)
 CUTELYST_CONF_OPTS += -DUSE_JEMALLOC=ON
+CUTELYST_DEPENDENCIES += jemalloc
 else
 CUTELYST_CONF_OPTS += -DUSE_JEMALLOC=OFF
 endif
