From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Oct 2015 12:02:00 +0200
Subject: [Buildroot] [git commit] qt: fix build for arm with BR2_STATIC_LIBS
Message-ID: <20151010100211.B63EF818D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=217ca447d60042e8f90e35494f90ae4313f70b28
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some Buildroot-generated static toolchains for ARM do not have
dlfcn.h header, which breaks builds of qt-4.8.7 because its
QtCore's plugin loader expects this header to be present (and
dynamic libraries to be supported). For certain platforms without
dynamic libraries, there is a QT_NO_DYNAMIC_LIBRARY constant
defined in plugin loader's source. This patch puts that constant
into Qt's build environment if Buildroot is configured without
shared library support.

Fixes:
- http://autobuild.buildroot.net/results/11a4c19638ca211bd2a424fd92602166235c9433
- http://autobuild.buildroot.net/results/c056e8781558267f6971a5f017f47e90dcf24e07
- http://autobuild.buildroot.net/results/b8f34afa8686e890a1a3882a52081bb6a3b9c13b
and several others.

Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/qt.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index e0e5d22..a64d32f 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -203,6 +203,10 @@ else
 QT_CONFIGURE_OPTS += -static
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+QT_CONFIGURE_OPTS += -D QT_NO_DYNAMIC_LIBRARY
+endif
+
 ifeq ($(BR2_ENDIAN),"LITTLE")
 QT_CONFIGURE_OPTS += -little-endian
 else
