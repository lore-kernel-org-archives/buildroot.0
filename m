From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 21:40:13 +0200
Subject: [Buildroot] [git commit] package/stellarium: bump version to 0.19.2
Message-ID: <20191002194115.5718F882DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64ead81e5f9865ca86d95a555a1c0d9e93544109
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
http://stellarium.org/release/2019/09/29/stellarium-0.19.2.html

Removed all patches applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-compiling-with-GPSD-3.19-API-8.0-fix-733.patch | 36 --------------------
 .../0002-A-tiny-fix-for-previous-commit.patch      | 29 ----------------
 ...e-for-get-Spherical-Position-Error-issue-.patch | 39 ----------------------
 package/stellarium/stellarium.hash                 |  6 ++--
 package/stellarium/stellarium.mk                   |  2 +-
 5 files changed, 4 insertions(+), 108 deletions(-)

diff --git a/package/stellarium/0001-Fixed-compiling-with-GPSD-3.19-API-8.0-fix-733.patch b/package/stellarium/0001-Fixed-compiling-with-GPSD-3.19-API-8.0-fix-733.patch
deleted file mode 100644
index 55c40ea2f4..0000000000
--- a/package/stellarium/0001-Fixed-compiling-with-GPSD-3.19-API-8.0-fix-733.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From ce26d740db94a2ee4e88595cba0ea9c4cbde2dcb Mon Sep 17 00:00:00 2001
-From: Alexander Wolf <alex.v.wolf@gmail.com>
-Date: Sun, 4 Aug 2019 22:33:46 +0700
-Subject: [PATCH] Fixed compiling with GPSD 3.19 (API 8.0; fix #733)
-
-Downloaded from upstream commit
-https://github.com/Stellarium/stellarium/commit/ce26d740db94a2ee4e88595cba0ea9c4cbde2dcb
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/core/StelLocationMgr.cpp | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/src/core/StelLocationMgr.cpp b/src/core/StelLocationMgr.cpp
-index c62bd868cd..20eddc8a61 100644
---- a/src/core/StelLocationMgr.cpp
-+++ b/src/core/StelLocationMgr.cpp
-@@ -163,7 +163,15 @@ void LibGPSLookupHelper::query()
- 				qDebug() << " - xdop:" << dop.xdop << "ydop:" << dop.ydop;
- 				qDebug() << " - pdop:" << dop.pdop << "hdop:" << dop.hdop;
- 				qDebug() << " - vdop:" << dop.vdop << "tdop:" << dop.tdop << "gdop:" << dop.gdop;
-+				// GPSD API 8.0:
-+				// * Remove epe from gps_data_t, it duplicates gps_fix_t eph
-+				// * Added sep (estimated spherical error, 3D)
-+				// Details: https://github.com/Stellarium/stellarium/issues/733
-+				#if GPSD_API_MAJOR_VERSION >= 8
-+				qDebug() << "Spherical Position Error (sep):" << newdata->sep;
-+				#else
- 				qDebug() << "Spherical Position Error (epe):" << newdata->epe;
-+				#endif
- 			}
- 			loc.longitude=newdata->fix.longitude;
- 			loc.latitude=newdata->fix.latitude;
--- 
-2.20.1
-
diff --git a/package/stellarium/0002-A-tiny-fix-for-previous-commit.patch b/package/stellarium/0002-A-tiny-fix-for-previous-commit.patch
deleted file mode 100644
index c4ed7785a9..0000000000
--- a/package/stellarium/0002-A-tiny-fix-for-previous-commit.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 29336f899dec12d7583efb513e1477d4cfc9a621 Mon Sep 17 00:00:00 2001
-From: Alexander Wolf <alex.v.wolf@gmail.com>
-Date: Sun, 4 Aug 2019 22:51:52 +0700
-Subject: [PATCH] A tiny fix for previous commit
-
-Downloaded from upstream commit
-https://github.com/Stellarium/stellarium/commit/29336f899dec12d7583efb513e1477d4cfc9a621
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/core/StelLocationMgr.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/core/StelLocationMgr.cpp b/src/core/StelLocationMgr.cpp
-index 20eddc8a61..3c1b5fe4e4 100644
---- a/src/core/StelLocationMgr.cpp
-+++ b/src/core/StelLocationMgr.cpp
-@@ -168,7 +168,7 @@ void LibGPSLookupHelper::query()
- 				// * Added sep (estimated spherical error, 3D)
- 				// Details: https://github.com/Stellarium/stellarium/issues/733
- 				#if GPSD_API_MAJOR_VERSION >= 8
--				qDebug() << "Spherical Position Error (sep):" << newdata->sep;
-+				qDebug() << "Spherical Position Error (sep):" << newdata->fix.sep;
- 				#else
- 				qDebug() << "Spherical Position Error (epe):" << newdata->epe;
- 				#endif
--- 
-2.20.1
-
diff --git a/package/stellarium/0003-Comment-code-for-get-Spherical-Position-Error-issue-.patch b/package/stellarium/0003-Comment-code-for-get-Spherical-Position-Error-issue-.patch
deleted file mode 100644
index 10e57cd836..0000000000
--- a/package/stellarium/0003-Comment-code-for-get-Spherical-Position-Error-issue-.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 4b6c37bc4631244ecf4126d256d3c33e81bde656 Mon Sep 17 00:00:00 2001
-From: Alexander Wolf <alex.v.wolf@gmail.com>
-Date: Sun, 4 Aug 2019 23:19:54 +0700
-Subject: [PATCH] Comment code for get Spherical Position Error (issue
- #733)
-
-Downloaded from upstream commit
-https://github.com/Stellarium/stellarium/commit/4b6c37bc4631244ecf4126d256d3c33e81bde656
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/core/StelLocationMgr.cpp | 11 ++++++-----
- 1 file changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/src/core/StelLocationMgr.cpp b/src/core/StelLocationMgr.cpp
-index 3c1b5fe4e4..72d27b897f 100644
---- a/src/core/StelLocationMgr.cpp
-+++ b/src/core/StelLocationMgr.cpp
-@@ -167,11 +167,12 @@ void LibGPSLookupHelper::query()
- 				// * Remove epe from gps_data_t, it duplicates gps_fix_t eph
- 				// * Added sep (estimated spherical error, 3D)
- 				// Details: https://github.com/Stellarium/stellarium/issues/733
--				#if GPSD_API_MAJOR_VERSION >= 8
--				qDebug() << "Spherical Position Error (sep):" << newdata->fix.sep;
--				#else
--				qDebug() << "Spherical Position Error (epe):" << newdata->epe;
--				#endif
-+				// #if GPSD_API_MAJOR_VERSION >= 8
-+				// qDebug() << "Spherical Position Error (sep):" << newdata->fix.sep;
-+				// #else
-+				// qDebug() << "Spherical Position Error (epe):" << newdata->epe;
-+				// #endif
-+
- 			}
- 			loc.longitude=newdata->fix.longitude;
- 			loc.latitude=newdata->fix.latitude;
--- 
-2.20.1
-
diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index f016463d1a..b1dc380f77 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,6 +1,6 @@
 # From https://github.com/Stellarium/stellarium/releases
-md5 a1a81b600822c5d85661b4dbe9d9bbcb  stellarium-0.19.1.tar.gz
-sha1 ff344208d71e9f66bb3b893acf7d92358bed1760  stellarium-0.19.1.tar.gz
+md5 5839f542f100b75031802b7ea6930854   stellarium-0.19.2.tar.gz
+sha1 49dd7405e5be98e003829f5c220f780b68a1dc31  stellarium-0.19.2.tar.gz
 # Locally computed
-sha256 0f25ad2acb59b75a49568c82123219aed5a14252c2ef39d0444540057d2cfb68  stellarium-0.19.1.tar.gz
+sha256 e4d005c5473e3be15b3101585e8959f422437147a602b1649e4aba22a92e6081  stellarium-0.19.2.tar.gz
 sha256 3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 33fb65c18d..d54f3572ca 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 0.19.1
+STELLARIUM_VERSION = 0.19.2
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
 STELLARIUM_LICENSE_FILES = COPYING
