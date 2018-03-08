From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  8 Mar 2018 19:43:33 +0200
Subject: [Buildroot] [RFC] lm-sensors: fix static build
Message-ID: <4c4c3f8770727f91fb173fbc077dd8b7c15cc216.1520531013.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add -static to the link command line to have libgcc resolve libc
symbols. This overrides the default -Wl,-rpath,/usr/lib, which is
useless for static build anyway.

Fixes:
http://autobuild.buildroot.net/results/25d/25d580bee6f609f6b28ebd6cc96d180179901b0e/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---

I'm not sure this is the right fix. Adding -lc to the failed link
command also fixes the issue. But libc is always a dependency of libgcc.

It is also not clear why this issue appeared now. This is the only
lm-sensors failure in the current autobuilder database. The only recent
change that might be related is the musl bump to 1.1.19.
---
 package/lm-sensors/lm-sensors.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index f581b5cd8f21..6fc7ce4981c9 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -26,7 +26,7 @@ LM_SENSORS_MAKE_OPTS = \
 	PREFIX=/usr
 
 ifeq ($(BR2_STATIC_LIBS),y)
-LM_SENSORS_MAKE_OPTS += BUILD_SHARED_LIB=0
+LM_SENSORS_MAKE_OPTS += BUILD_SHARED_LIB=0 EXLDFLAGS=-static
 else
 LM_SENSORS_MAKE_OPTS += BUILD_SHARED_LIB=1
 endif
-- 
2.16.1
