From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  4 Jan 2020 22:56:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/wavemon: bump to version 0.9.1
Message-ID: <20200104215648.2462791-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-on_exit-use-standard-atexit-instead.patch | 73 -------------------
 package/wavemon/wavemon.hash                  |  2 +-
 package/wavemon/wavemon.mk                    |  2 +-
 3 files changed, 2 insertions(+), 75 deletions(-)
 delete mode 100644 package/wavemon/0001-Drop-on_exit-use-standard-atexit-instead.patch

diff --git a/package/wavemon/0001-Drop-on_exit-use-standard-atexit-instead.patch b/package/wavemon/0001-Drop-on_exit-use-standard-atexit-instead.patch
deleted file mode 100644
index 67292539ca..0000000000
--- a/package/wavemon/0001-Drop-on_exit-use-standard-atexit-instead.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From f6e20c9c6e9b50963caaf5483248d329473a6815 Mon Sep 17 00:00:00 2001
-From: Gerrit Renker <Gerrit.Renker@ctl.io>
-Date: Mon, 21 Jan 2019 09:23:43 -0700
-Subject: [PATCH] Drop on_exit(), use standard atexit() instead
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-`on_exit()` is a GLIBC specific extension and not available in musl and uClibc.
-
-Portable applications should avoid this function, and use the standard
-`atexit()` instead.
-
-Backported from:f6e20c9c6e9b50963caaf5483248d329473a6815
-
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- iw_if.c   | 10 ++++++----
- iw_if.h   |  2 +-
- iw_scan.c |  2 +-
- 3 files changed, 8 insertions(+), 6 deletions(-)
-
-diff --git a/iw_if.c b/iw_if.c
-index c0b0128..d8bacbc 100644
---- a/iw_if.c
-+++ b/iw_if.c
-@@ -87,11 +87,13 @@ int if_set_down(const char *ifname)
- 	return if_set_up_or_down(ifname, false);
- }
- 
--/** Exit handler to restore interface 'down' state on exit via on_exit(3). */
--void if_set_down_on_exit(int rc, void *arg)
-+/** Exit handler to restore interface 'down' state on exit via atexit(3). */
-+void if_set_down_on_exit(void)
- {
--	if (if_set_down(arg) < 0) {
--		err_msg("unable to restore %s interface state - set down manually", arg);
-+	const char *ifname = conf_ifname();
-+
-+	if (ifname && if_set_down(ifname) < 0) {
-+		err_msg("unable to restore %s interface state - set down manually", ifname);
- 	}
- }
- 
-diff --git a/iw_if.h b/iw_if.h
-index 50f5a47..e2199d3 100644
---- a/iw_if.h
-+++ b/iw_if.h
-@@ -76,7 +76,7 @@ struct if_info {
- };
- extern bool if_is_up(const char *ifname);
- extern int  if_set_up(const char *ifname);
--extern void if_set_down_on_exit(int rc, void *arg);
-+extern void if_set_down_on_exit(void);
- extern void if_getinf(const char *ifname, struct if_info *info);
- 
- /**
-diff --git a/iw_scan.c b/iw_scan.c
-index 18e9e06..e2b3067 100644
---- a/iw_scan.c
-+++ b/iw_scan.c
-@@ -430,7 +430,7 @@ void *do_scan(void *sr_ptr)
- 
- 				if (if_set_up(conf_ifname()) < 0)
- 					err_sys("Can not bring up interface '%s'", conf_ifname());
--				if (on_exit(if_set_down_on_exit, (void *)conf_ifname()) < 0)
-+				if (atexit(if_set_down_on_exit) < 0)
- 					snprintf(sr->msg, sizeof(sr->msg), "Warning: unable to restore %s down state on exit", conf_ifname());
- 				break;
- 			}
--- 
-2.20.1
-
diff --git a/package/wavemon/wavemon.hash b/package/wavemon/wavemon.hash
index 6509376784..455e64cba8 100644
--- a/package/wavemon/wavemon.hash
+++ b/package/wavemon/wavemon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5823ef9459d6147a457b390b6744a77465584e93d37c2809fa7a0be557070166  wavemon-0.9.0.tar.gz
+sha256  5ebd5b79d3b7c546bc16b95161872c699a75e9acdfc6e3f02ec48dad10802067  wavemon-0.9.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/wavemon/wavemon.mk b/package/wavemon/wavemon.mk
index 9f5fce55b1..3ae1141ec4 100644
--- a/package/wavemon/wavemon.mk
+++ b/package/wavemon/wavemon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAVEMON_VERSION = 0.9.0
+WAVEMON_VERSION = 0.9.1
 WAVEMON_SITE = $(call github,uoaerg,wavemon,v$(WAVEMON_VERSION))
 WAVEMON_LICENSE = GPL-3.0+
 WAVEMON_LICENSE_FILES = COPYING
-- 
2.24.1
