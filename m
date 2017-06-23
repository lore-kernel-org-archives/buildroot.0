From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 23 Jun 2017 07:29:22 +0300
Subject: [Buildroot] [PATCH] lirc-tools: bump to version 0.9.4d
Message-ID: <190922362f7ee894f85b971407a1012b0661294f.1498192162.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop 0001-tools-make_rel_symlink.py-can-also-use-python2.patch. Build requires
host-python3 since the previous version bump.

Drop upstream 0002-lircd-Remove-use-of-functions-killed-in-kernel-4.8.0.patch.

Set HAVE_WORKING_POLL to skip poll(2) run test that is not compatible with
cross compilation.

Add optional dependency on libftdi1.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...-make_rel_symlink.py-can-also-use-python2.patch |  28 ------
 ...e-use-of-functions-killed-in-kernel-4.8.0.patch | 105 ---------------------
 package/lirc-tools/lirc-tools.hash                 |   8 +-
 package/lirc-tools/lirc-tools.mk                   |   8 +-
 4 files changed, 11 insertions(+), 138 deletions(-)
 delete mode 100644 package/lirc-tools/0001-tools-make_rel_symlink.py-can-also-use-python2.patch
 delete mode 100644 package/lirc-tools/0002-lircd-Remove-use-of-functions-killed-in-kernel-4.8.0.patch

diff --git a/package/lirc-tools/0001-tools-make_rel_symlink.py-can-also-use-python2.patch b/package/lirc-tools/0001-tools-make_rel_symlink.py-can-also-use-python2.patch
deleted file mode 100644
index 070aab941cdf..000000000000
--- a/package/lirc-tools/0001-tools-make_rel_symlink.py-can-also-use-python2.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From c861eae83bae3116d330efb3c6061e2de4fdcbce Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Sun, 5 Apr 2015 22:26:12 +0300
-Subject: [PATCH] tools: make_rel_symlink.py can also use python2
-
-The make_rel_symlink.py script is compatible with both python2 and python3.
-Don't hard code a requirement for python3.
-
-Patch status: sent upstream
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
- tools/make_rel_symlink.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/make_rel_symlink.py b/tools/make_rel_symlink.py
-index 896637ff93e0..ff0403a0397a 100755
---- a/tools/make_rel_symlink.py
-+++ b/tools/make_rel_symlink.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python3
-+#!/usr/bin/env python
- 
- import os
- import os.path
--- 
-2.1.4
-
diff --git a/package/lirc-tools/0002-lircd-Remove-use-of-functions-killed-in-kernel-4.8.0.patch b/package/lirc-tools/0002-lircd-Remove-use-of-functions-killed-in-kernel-4.8.0.patch
deleted file mode 100644
index 9fe5256cebcf..000000000000
--- a/package/lirc-tools/0002-lircd-Remove-use-of-functions-killed-in-kernel-4.8.0.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From 45c590f64dd79e8e1704d5c94ce3456a5cdbfa5f Mon Sep 17 00:00:00 2001
-From: Alec Leamas <leamas.alec@gmail.com>
-Date: Fri, 19 Aug 2016 04:48:02 +0200
-Subject: [PATCH] lircd: Remove use of functions killed in kernel 4.8.0
-
-From 4.8.0 the kernel no longer supports LIRC_NOTIFY_DECODE,
-LIRC_SETUP_START/LIRC_SETUP_END and several constants related
-to initiating filters. Remove corresponding calls from lircd.
-
-[baruch: move DRVCTL_NOTIFY_DECODE into lircd.cpp]
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Patch status: backported from upstream 31fcc8aa39f62c5c
----
- daemons/lircd.cpp | 53 ++++-------------------------------------------------
- 1 file changed, 4 insertions(+), 49 deletions(-)
-
-diff --git a/daemons/lircd.cpp b/daemons/lircd.cpp
-index 782b6d3f8342..d778aa19308b 100644
---- a/daemons/lircd.cpp
-+++ b/daemons/lircd.cpp
-@@ -78,6 +78,8 @@
- #define lirc_gid gid_t
- #endif
- 
-+#define DRVCTL_NOTIFY_DECODE		7
-+
- #ifdef DARWIN
- #include <mach/mach_time.h>
- #define CLOCK_REALTIME 0
-@@ -462,50 +464,6 @@ static int setup_timeout(void)
- }
- 
- 
--static int setup_filter(void)
--{
--	int ret1, ret2;
--	lirc_t min_pulse_supported = 0, max_pulse_supported = 0;
--	lirc_t min_space_supported = 0, max_space_supported = 0;
--
--	if (!(curr_driver->features & LIRC_CAN_SET_REC_FILTER))
--		return 1;
--	if (curr_driver->drvctl_func(LIRC_GET_MIN_FILTER_PULSE,
--				     &min_pulse_supported) == -1 ||
--	    curr_driver->drvctl_func(LIRC_GET_MAX_FILTER_PULSE, &max_pulse_supported) == -1
--	    || curr_driver->drvctl_func(LIRC_GET_MIN_FILTER_SPACE, &min_space_supported) == -1
--	    || curr_driver->drvctl_func(LIRC_GET_MAX_FILTER_SPACE, &max_space_supported) == -1) {
--		log_error("could not get filter range");
--		log_perror_err(__func__);
--	}
--
--	if (setup_min_pulse > max_pulse_supported)
--		setup_min_pulse = max_pulse_supported;
--	else if (setup_min_pulse < min_pulse_supported)
--		setup_min_pulse = 0;    /* disable filtering */
--
--	if (setup_min_space > max_space_supported)
--		setup_min_space = max_space_supported;
--	else if (setup_min_space < min_space_supported)
--		setup_min_space = 0;    /* disable filtering */
--
--	ret1 = curr_driver->drvctl_func(LIRC_SET_REC_FILTER_PULSE, &setup_min_pulse);
--	ret2 = curr_driver->drvctl_func(LIRC_SET_REC_FILTER_SPACE, &setup_min_space);
--	if (ret1 == -1 || ret2 == -1) {
--		if (curr_driver->
--		    drvctl_func(LIRC_SET_REC_FILTER,
--				setup_min_pulse < setup_min_space ? &setup_min_pulse : &setup_min_space) == -1) {
--			log_error("could not set filter");
--			log_perror_err(__func__);
--			return 0;
--		}
--	}
--	return 1;
--}
--
--
--
--
- static int setup_hardware(void)
- {
- 	int ret = 1;
-@@ -514,10 +472,7 @@ static int setup_hardware(void)
- 		if ((curr_driver->features & LIRC_CAN_SET_REC_CARRIER)
- 		    || (curr_driver->features & LIRC_CAN_SET_REC_TIMEOUT)
- 		    || (curr_driver->features & LIRC_CAN_SET_REC_FILTER)) {
--			(void)curr_driver->drvctl_func(LIRC_SETUP_START, NULL);
--			ret = setup_frequency() && setup_timeout()
--			      && setup_filter();
--			(void)curr_driver->drvctl_func(LIRC_SETUP_END, NULL);
-+				ret = setup_frequency() && setup_timeout();
- 		}
- 	}
- 	return ret;
-@@ -2162,7 +2117,7 @@ void loop(void)
- 			int reps;
- 
- 			if (curr_driver->drvctl_func && (curr_driver->features & LIRC_CAN_NOTIFY_DECODE))
--				curr_driver->drvctl_func(LIRC_NOTIFY_DECODE, NULL);
-+				curr_driver->drvctl_func(DRVCTL_NOTIFY_DECODE, NULL);
- 
- 			get_release_data(&remote_name, &button_name, &reps);
- 
--- 
-2.9.3
-
diff --git a/package/lirc-tools/lirc-tools.hash b/package/lirc-tools/lirc-tools.hash
index 239c7664d358..13d3f02758bf 100644
--- a/package/lirc-tools/lirc-tools.hash
+++ b/package/lirc-tools/lirc-tools.hash
@@ -1,3 +1,5 @@
-# hash from http://sourceforge.net/projects/lirc/files/LIRC/0.9.4b/
-sha1 7cb2867de1b486708781413aa33568e0612fb912 lirc-0.9.4b.tar.bz2
-md5 9e3f2869a47bbd7c973dd63f30c13fc2 lirc-0.9.4b.tar.bz2
+# hash from http://sourceforge.net/projects/lirc/files/LIRC/0.9.4d/
+sha1 5dbfd95a9e290260e6b5febadf685227df9c0529 lirc-0.9.4d.tar.bz2
+md5 0d11679cbdd94a5a6da00a8e7231b4bf lirc-0.9.4d.tar.bz2
+# Locally computed
+sha256 c68f18c35b489b865c0a741d119b136e8702191538cd3551b977a7af6c4e41ab lirc-0.9.4d.tar.bz2
diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index f0eff91f5f4f..9d46c1b1b042 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIRC_TOOLS_VERSION = 0.9.4b
+LIRC_TOOLS_VERSION = 0.9.4d
 LIRC_TOOLS_SOURCE = lirc-$(LIRC_TOOLS_VERSION).tar.bz2
 LIRC_TOOLS_SITE = http://downloads.sourceforge.net/project/lirc/LIRC/$(LIRC_TOOLS_VERSION)
 LIRC_TOOLS_LICENSE = GPL-2.0+
@@ -12,7 +12,7 @@ LIRC_TOOLS_LICENSE_FILES = COPYING
 LIRC_TOOLS_DEPENDENCIES = host-libxslt host-pkgconf host-python3
 LIRC_TOOLS_INSTALL_STAGING = YES
 
-LIRC_TOOLS_CONF_ENV = XSLTPROC=yes
+LIRC_TOOLS_CONF_ENV = XSLTPROC=yes HAVE_WORKING_POLL=yes
 LIRC_TOOLS_CONF_OPTS = --without-x
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
@@ -31,6 +31,10 @@ ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
 LIRC_TOOLS_DEPENDENCIES += portaudio
 endif
 
+ifeq ($(BR2_PACKAGE_LIBFTDI1),y)
+LIRC_TOOLS_DEPENDENCIES += libftdi1
+endif
+
 define LIRC_TOOLS_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/lirc-tools/S25lircd \
 		$(TARGET_DIR)/etc/init.d/S25lircd
-- 
2.11.0
