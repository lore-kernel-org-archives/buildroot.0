From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 21:37:32 +0200
Subject: [Buildroot] [git commit] gpsd: fix greis driver build with
 reconfigure disabled
Message-ID: <20181009193629.AE69F8177C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae2a91322aeaa72d6f5354312056d16dc275470d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch fixing undefined function build failure when reconfigure
support is disabled.

Fixes:
http://autobuild.buildroot.net/results/a13/a13a5d852c83cd1fc9f2d1fc2b7302db515278b8/
http://autobuild.buildroot.net/results/185/18599ea12a35b9715a67c1f4e5c4e56906235c94/
http://autobuild.buildroot.net/results/c00/c00d22a6dcadb82a19afab6eacea654d3c41b4c5/

Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...greis-fix-build-with-reconfigure-disabled.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/gpsd/0002-driver_greis-fix-build-with-reconfigure-disabled.patch b/package/gpsd/0002-driver_greis-fix-build-with-reconfigure-disabled.patch
new file mode 100644
index 0000000000..77badb31cf
--- /dev/null
+++ b/package/gpsd/0002-driver_greis-fix-build-with-reconfigure-disabled.patch
@@ -0,0 +1,49 @@
+From 21a752e827bc9e14de4b4c26aef4d0db7403a5b7 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 9 Oct 2018 15:22:46 +0300
+Subject: [PATCH] driver_greis: fix build with reconfigure disabled
+
+Unhide the definition of greis_parse_input and greis_event_hook since
+they are used unconditionally.
+
+Fixes the following build failure:
+
+driver_greis.c:969:25: error: 'greis_parse_input' undeclared here (not in a function); did you mean 'generic_parse_input'?
+     .parse_packet     = greis_parse_input,
+                         ^~~~~~~~~~~~~~~~~
+                         generic_parse_input
+driver_greis.c:973:25: error: 'greis_event_hook' undeclared here (not in a function)
+     .event_hook       = greis_event_hook,
+                         ^~~~~~~~~~~~~~~~
+
+Cc: Gregory Fong <gregory.fong@virginorbit.com>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: http://lists.nongnu.org/archive/html/gpsd-dev/2018-10/msg00012.html
+
+ driver_greis.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/driver_greis.c b/driver_greis.c
+index 9eb148fc76cd..222bd9daf020 100644
+--- a/driver_greis.c
++++ b/driver_greis.c
+@@ -797,7 +797,6 @@ static ssize_t greis_control_send(struct gps_device_t *session,
+ }
+ #endif /* CONTROLSEND_ENABLE */
+ 
+-#ifdef RECONFIGURE_ENABLE
+ static void greis_event_hook(struct gps_device_t *session, event_t event)
+ {
+     if (session->context->readonly)
+@@ -870,6 +869,7 @@ static gps_mask_t greis_parse_input(struct gps_device_t *session)
+ 	return 0;
+ }
+ 
++#ifdef RECONFIGURE_ENABLE
+ /**
+  * Set port operating mode, speed, parity, stopbits etc. here.
+  * Note: parity is passed as 'N'/'E'/'O', but you should program
+-- 
+2.19.1
+
