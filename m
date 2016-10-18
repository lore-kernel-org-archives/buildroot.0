From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 18 Oct 2016 22:35:25 +0300
Subject: [Buildroot] [PATCH] lirc-tools: fix build with kernel headers v4.8+
Message-ID: <7ccf454919745520121768791455dc138ccdf6db.1476819325.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport upstream path that removes reverence to macros that are no longer in
the kernel lirc.h headers.

Fixes:
http://autobuild.buildroot.net/results/f01/f015d52faa214f7786dd3169628ce74b738a8b46/
http://autobuild.buildroot.net/results/55f/55f1ac19736499ef536561bd65c011d2649f43da/
http://autobuild.buildroot.net/results/c68/c689786b6b0867cea2e45df1c5556cccdd377b33/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...e-use-of-functions-killed-in-kernel-4.8.0.patch | 105 +++++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 package/lirc-tools/0005-lircd-Remove-use-of-functions-killed-in-kernel-4.8.0.patch

diff --git a/package/lirc-tools/0005-lircd-Remove-use-of-functions-killed-in-kernel-4.8.0.patch b/package/lirc-tools/0005-lircd-Remove-use-of-functions-killed-in-kernel-4.8.0.patch
new file mode 100644
index 000000000000..9fe5256cebcf
--- /dev/null
+++ b/package/lirc-tools/0005-lircd-Remove-use-of-functions-killed-in-kernel-4.8.0.patch
@@ -0,0 +1,105 @@
+From 45c590f64dd79e8e1704d5c94ce3456a5cdbfa5f Mon Sep 17 00:00:00 2001
+From: Alec Leamas <leamas.alec@gmail.com>
+Date: Fri, 19 Aug 2016 04:48:02 +0200
+Subject: [PATCH] lircd: Remove use of functions killed in kernel 4.8.0
+
+From 4.8.0 the kernel no longer supports LIRC_NOTIFY_DECODE,
+LIRC_SETUP_START/LIRC_SETUP_END and several constants related
+to initiating filters. Remove corresponding calls from lircd.
+
+[baruch: move DRVCTL_NOTIFY_DECODE into lircd.cpp]
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: backported from upstream 31fcc8aa39f62c5c
+---
+ daemons/lircd.cpp | 53 ++++-------------------------------------------------
+ 1 file changed, 4 insertions(+), 49 deletions(-)
+
+diff --git a/daemons/lircd.cpp b/daemons/lircd.cpp
+index 782b6d3f8342..d778aa19308b 100644
+--- a/daemons/lircd.cpp
++++ b/daemons/lircd.cpp
+@@ -78,6 +78,8 @@
+ #define lirc_gid gid_t
+ #endif
+ 
++#define DRVCTL_NOTIFY_DECODE		7
++
+ #ifdef DARWIN
+ #include <mach/mach_time.h>
+ #define CLOCK_REALTIME 0
+@@ -462,50 +464,6 @@ static int setup_timeout(void)
+ }
+ 
+ 
+-static int setup_filter(void)
+-{
+-	int ret1, ret2;
+-	lirc_t min_pulse_supported = 0, max_pulse_supported = 0;
+-	lirc_t min_space_supported = 0, max_space_supported = 0;
+-
+-	if (!(curr_driver->features & LIRC_CAN_SET_REC_FILTER))
+-		return 1;
+-	if (curr_driver->drvctl_func(LIRC_GET_MIN_FILTER_PULSE,
+-				     &min_pulse_supported) == -1 ||
+-	    curr_driver->drvctl_func(LIRC_GET_MAX_FILTER_PULSE, &max_pulse_supported) == -1
+-	    || curr_driver->drvctl_func(LIRC_GET_MIN_FILTER_SPACE, &min_space_supported) == -1
+-	    || curr_driver->drvctl_func(LIRC_GET_MAX_FILTER_SPACE, &max_space_supported) == -1) {
+-		log_error("could not get filter range");
+-		log_perror_err(__func__);
+-	}
+-
+-	if (setup_min_pulse > max_pulse_supported)
+-		setup_min_pulse = max_pulse_supported;
+-	else if (setup_min_pulse < min_pulse_supported)
+-		setup_min_pulse = 0;    /* disable filtering */
+-
+-	if (setup_min_space > max_space_supported)
+-		setup_min_space = max_space_supported;
+-	else if (setup_min_space < min_space_supported)
+-		setup_min_space = 0;    /* disable filtering */
+-
+-	ret1 = curr_driver->drvctl_func(LIRC_SET_REC_FILTER_PULSE, &setup_min_pulse);
+-	ret2 = curr_driver->drvctl_func(LIRC_SET_REC_FILTER_SPACE, &setup_min_space);
+-	if (ret1 == -1 || ret2 == -1) {
+-		if (curr_driver->
+-		    drvctl_func(LIRC_SET_REC_FILTER,
+-				setup_min_pulse < setup_min_space ? &setup_min_pulse : &setup_min_space) == -1) {
+-			log_error("could not set filter");
+-			log_perror_err(__func__);
+-			return 0;
+-		}
+-	}
+-	return 1;
+-}
+-
+-
+-
+-
+ static int setup_hardware(void)
+ {
+ 	int ret = 1;
+@@ -514,10 +472,7 @@ static int setup_hardware(void)
+ 		if ((curr_driver->features & LIRC_CAN_SET_REC_CARRIER)
+ 		    || (curr_driver->features & LIRC_CAN_SET_REC_TIMEOUT)
+ 		    || (curr_driver->features & LIRC_CAN_SET_REC_FILTER)) {
+-			(void)curr_driver->drvctl_func(LIRC_SETUP_START, NULL);
+-			ret = setup_frequency() && setup_timeout()
+-			      && setup_filter();
+-			(void)curr_driver->drvctl_func(LIRC_SETUP_END, NULL);
++				ret = setup_frequency() && setup_timeout();
+ 		}
+ 	}
+ 	return ret;
+@@ -2162,7 +2117,7 @@ void loop(void)
+ 			int reps;
+ 
+ 			if (curr_driver->drvctl_func && (curr_driver->features & LIRC_CAN_NOTIFY_DECODE))
+-				curr_driver->drvctl_func(LIRC_NOTIFY_DECODE, NULL);
++				curr_driver->drvctl_func(DRVCTL_NOTIFY_DECODE, NULL);
+ 
+ 			get_release_data(&remote_name, &button_name, &reps);
+ 
+-- 
+2.9.3
+
-- 
2.9.3
