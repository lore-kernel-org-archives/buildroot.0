From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jul 2012 22:18:18 +0200
Subject: [Buildroot] [git commit] gpsd: remove option to enable latency
	measurement capabilities
Message-ID: <20120724202026.14AAB96DEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c4cb627010545343e425396c90dd62639516274d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It currently fails to build with:

libgpsd_core.c: In function 'gpsd_poll':
libgpsd_core.c:881: error: 'const struct gps_type_t' has no member named 'min_cycle'
libgpsd_core.c:884: error: 'const struct gps_type_t' has no member named 'min_cycle'

and is probably not a very important feature for normal users of gpsd.

The build problem has been reported to the gpsd-users mailing list.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gpsd/Config.in |    3 ---
 package/gpsd/gpsd.mk   |    3 ---
 2 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index db6bec2..8643492 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -20,9 +20,6 @@ config BR2_PACKAGE_GPSD_DEVICES
 menu "Features"
 	depends on BR2_PACKAGE_GPSD
 
-config BR2_PACKAGE_GPSD_TIMING
-	bool "latency timing support"
-
 config BR2_PACKAGE_GPSD_CLIENT_DEBUG
 	bool "client debugging support"
 
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 7d1dbcd..c5270bd 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -176,9 +176,6 @@ endif
 ifeq ($(BR2_PACKAGE_GPSD_PROFILING),y)
 	GPSD_SCONS_OPTS += profiling=yes
 endif
-ifeq ($(BR2_PACKAGE_GPSD_TIMING),y)
-	GPSD_SCONS_OPTS += timing=yes
-endif
 ifneq ($(BR2_PACKAGE_GPSD_CLIENT_DEBUG),y)
 	GPSD_SCONS_OPTS += clientdebug=no
 endif
