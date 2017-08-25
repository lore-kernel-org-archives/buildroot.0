From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Fri, 25 Aug 2017 09:26:39 +0200
Subject: [Buildroot] [PATCH] bcusdk: fix endless recursion when opening USB
	backends
Message-ID: <1503645999-14791-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The eibd usb backend implements clock_gettime, and calls pth_int_time from there.
pth_int_time will result in a call to clock_gettime, resulting in an endless
recursion.
The problem is that the USB backend shouldn't overrule clock_gettime in the first place.
Since the function does semantically and syntactically the same, the function is
place in comment alltogether.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 package/bcusdk/0002-linux-usbfs-clock-gettime.patch | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 package/bcusdk/0002-linux-usbfs-clock-gettime.patch

diff --git a/package/bcusdk/0002-linux-usbfs-clock-gettime.patch b/package/bcusdk/0002-linux-usbfs-clock-gettime.patch
new file mode 100644
index 0000000..6d024c6
--- /dev/null
+++ b/package/bcusdk/0002-linux-usbfs-clock-gettime.patch
@@ -0,0 +1,16 @@
+--- a/eibd/usb/linux_usbfs.c	2017-07-29 22:24:15.890087674 +0200
++++ b/eibd/usb/linux_usbfs.c	2017-07-29 22:20:11.830085100 +0200
+@@ -52,11 +52,13 @@
+ 	return 0;
+ }
+ 
++/* don't redefine clock_gettime, use the system version
+ int clock_gettime(clockid_t clk_id, struct timespec *tp)
+ {
+ 	pth_int_time (tp);
+ 	return 0;
+ }
++*/
+ 
+ /* sysfs vs usbfs:
+  * opening a usbfs node causes the device to be resumed, so we attempt to
-- 
1.8.5.rc3
