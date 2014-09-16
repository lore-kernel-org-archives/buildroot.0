From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Sep 2014 21:04:02 +0200
Subject: [Buildroot] [git commit] qt5: bump to 5.3.2
Message-ID: <20140916201651.7BFBC9D6B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e91713126fa790ad3088a739ef1029fad07752f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only use ccache prefix in QMAKE_CC and QMAKE_CXX since the build system is
broken when QMAKE_AR contains a space character.

Remove the upstreamed uClibc patch.

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5.mk                                 |    2 +-
 .../qt5/qt5base/qt5base-0002-mkspecs-files.patch   |    6 +++-
 ...ase-0004-QDnsLookup-Fix-build-with-uClibc.patch |   35 --------------------
 package/qt5/qt5base/qt5base.mk                     |    3 +-
 4 files changed, 8 insertions(+), 38 deletions(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 8dbb355..e9c59db 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -1,5 +1,5 @@
 QT5_VERSION_MAJOR = 5.3
-QT5_VERSION = $(QT5_VERSION_MAJOR).1
+QT5_VERSION = $(QT5_VERSION_MAJOR).2
 QT5_SITE = http://download.qt-project.org/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 include $(sort $(wildcard package/qt5/*/*.mk))
 
diff --git a/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch b/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch
index 6283bbe..09c1b67 100644
--- a/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch
+++ b/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch
@@ -14,9 +14,13 @@ Index: b/mkspecs/devices/linux-buildroot-g++/qmake.conf
 ===================================================================
 --- /dev/null
 +++ b/mkspecs/devices/linux-buildroot-g++/qmake.conf
-@@ -0,0 +1,12 @@
+@@ -0,0 +1,16 @@
 +include(../common/linux_device_pre.conf)
 +
++# modifications to g++-unix.conf
++QMAKE_CC                = $${BR_CCACHE} $${CROSS_COMPILE}gcc
++QMAKE_CXX               = $${BR_CCACHE} $${CROSS_COMPILE}g++
++
 +#modifications to gcc-base.conf
 +QMAKE_CFLAGS           += $${BR_COMPILER_CFLAGS}
 +QMAKE_CXXFLAGS         += $${BR_COMPILER_CXXFLAGS}
diff --git a/package/qt5/qt5base/qt5base-0004-QDnsLookup-Fix-build-with-uClibc.patch b/package/qt5/qt5base/qt5base-0004-QDnsLookup-Fix-build-with-uClibc.patch
deleted file mode 100644
index 90aa2be..0000000
--- a/package/qt5/qt5base/qt5base-0004-QDnsLookup-Fix-build-with-uClibc.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From af2241c678bcd9af58d38f98f5caec96a498733e Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
-Date: Fri, 23 May 2014 17:02:01 +0300
-Subject: [PATCH] QDnsLookup: Fix build with uClibc
-
-uClibc doesn't have a nsmap member in __res_state. Since it also doesn't have
-res_nquery() which is mandatory for QDnsLookup, we can simply disable the code
-to fix the build.
-
-Sent-Upstream: https://codereview.qt-project.org/86159
-Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
-Change-Id: Ia872f535519aca3a2de763548c6dd0e3e0ee20d4
----
- src/network/kernel/qdnslookup_unix.cpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/network/kernel/qdnslookup_unix.cpp b/src/network/kernel/qdnslookup_unix.cpp
-index 26834df..2a482a6 100644
---- a/src/network/kernel/qdnslookup_unix.cpp
-+++ b/src/network/kernel/qdnslookup_unix.cpp
-@@ -160,9 +160,11 @@ void QDnsLookupRunnable::query(const int requestType, const QByteArray &requestN
-                 Q_CHECK_PTR(ns);
-                 state._u._ext.nsaddrs[0] = ns;
-             }
-+#ifndef __UCLIBC__
-             // Set nsmap[] to indicate that nsaddrs[0] is an IPv6 address
-             // See: https://sourceware.org/ml/libc-hacker/2002-05/msg00035.html
-             state._u._ext.nsmap[0] = MAXNS + 1;
-+#endif
-             state._u._ext.nscount6 = 1;
-             ns->sin6_family = AF_INET6;
-             ns->sin6_port = htons(53);
--- 
-1.9.1
-
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 88e86c4..57ea1c8 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -190,7 +190,8 @@ define QT5BASE_CONFIGURE_CMDS
 		-no-rpath \
 		-nomake tests \
 		-device buildroot \
-		-device-option CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
+		-device-option CROSS_COMPILE="$(TARGET_CROSS)" \
+		-device-option BR_CCACHE="$(CCACHE)" \
 		-device-option BR_COMPILER_CFLAGS="$(TARGET_CFLAGS)" \
 		-device-option BR_COMPILER_CXXFLAGS="$(TARGET_CXXFLAGS)" \
 		-device-option EGLFS_PLATFORM_HOOKS_SOURCES="$(QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES)" \
