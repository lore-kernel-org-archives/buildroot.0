From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 21 May 2010 08:53:34 +0200
Subject: [Buildroot] [git commit master] qt: update x86x86fix for 32bit pc
	hosts
Message-ID: <20100521065617.A60929C008@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bb81787ae1f8b1d8c513f42766c2155b66feaf84
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The recent change to use config.guess to figure out GNU_HOST_NAME
broken the x86x86fix detection for 32bit hosts, as config.guess
returns something like i686-pc-linux-gnu rather than something with
*-unknown-linux-* like we used to use.

Fix it by simply looking for "linux" instead.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES          |    2 +-
 package/qt/qt.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 8c6d645..7a3fe09 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,7 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: aumix, avahi, busybox, mtd-utils, ntp
+	Updated/fixed packages: aumix, avahi, busybox, mtd-utils, ntp, qt
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 4f42e59..aaf965e 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -372,7 +372,7 @@ BR2_PACKAGE_QT_EMB_PLATFORM:=$(call qstrip,$(BR2_PACKAGE_QT_EMB_PLATFORM))
 # x86x86fix
 # Workaround Qt Embedded bug when crosscompiling for x86 under x86 with linux
 # host. It's unclear if this would happen on other hosts.
-ifneq ($(findstring unknown-linux,$(GNU_HOST_NAME)),)
+ifneq ($(findstring linux,$(GNU_HOST_NAME)),)
 ifneq ($(findstring x86,$(BR2_PACKAGE_QT_EMB_PLATFORM)),)
 QT_CONFIGURE+= -platform linux-g++
 endif
-- 
1.6.3.3
