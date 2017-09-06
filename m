From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Sep 2017 13:17:24 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] bcusdk: eibd: drop local
	clock_gettime in USB backends
Message-ID: <20170906112608.5F9128211D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=290b6cfdf688afd14e0c2597d9b6bd23dc67fc87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

clock_gettime is defined locally, and calls pth_int_time, which
in turn calls clock_gettime.
The USB backend shouldn't overrule clock_gettime in the first place.
This patch fixes this endless recursion by removing the local defition.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit bc4f5598dccc191a1e2c6268fdcef1935e2fa212)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...endless-recursion-when-using-USB-backends.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/bcusdk/0002-eibd-fix-endless-recursion-when-using-USB-backends.patch b/package/bcusdk/0002-eibd-fix-endless-recursion-when-using-USB-backends.patch
new file mode 100644
index 0000000..3b90289
--- /dev/null
+++ b/package/bcusdk/0002-eibd-fix-endless-recursion-when-using-USB-backends.patch
@@ -0,0 +1,35 @@
+From 6bd1b4958e949d83468e053c34bf6c89d14d687a Mon Sep 17 00:00:00 2001
+From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
+Date: Fri, 25 Aug 2017 23:01:14 +0200
+Subject: [PATCH] eibd: drop local clock_gettime in USB backends
+
+clock_gettime is defined locally, and calls pth_int_time, which
+in turn calls clock_gettime.
+The USB backend shouldn't overrule clock_gettime in the first place.
+This patch fixes this endless recursion by removing the local defition.
+
+Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
+---
+ eibd/usb/linux_usbfs.c | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/eibd/usb/linux_usbfs.c b/eibd/usb/linux_usbfs.c
+index c3ec410..957b908 100644
+--- a/eibd/usb/linux_usbfs.c
++++ b/eibd/usb/linux_usbfs.c
+@@ -52,12 +52,6 @@ int pthread_mutex_trylock(pthread_mutex_t *mutex)
+ 	return 0;
+ }
+ 
+-int clock_gettime(clockid_t clk_id, struct timespec *tp)
+-{
+-	pth_int_time (tp);
+-	return 0;
+-}
+-
+ /* sysfs vs usbfs:
+  * opening a usbfs node causes the device to be resumed, so we attempt to
+  * avoid this during enumeration.
+-- 
+1.8.5.rc3
+
