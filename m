From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Jan 2019 14:45:31 +0100
Subject: [Buildroot] [git commit] package/wavemon: add upstream patch to fix
 musl/uclibc build issue
Message-ID: <20190122134726.864BB7FE20@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=679b41ffb80962e85d64868d87ac8f5d5d903b49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In version 0.9.0 wavemon uses the GLIBC-specific extension `on_exit()`
which is not available in musl and uClibc.

According to the Linux kernel man page [1]: "Portable application should
avoid this function, and use the standard atexit(3) instead."

Add patch from upstream which is fixing this issue by dropping
`on_exit()` and using the standard `atexit()` instead. Note, that the commit
message of the upstream patch was changed to add some useful information.

[1] http://man7.org/linux/man-pages/man3/on_exit.3.html

Backported from: f6e20c9c6e9b50963caaf5483248d329473a6815

Fixes:
http://autobuild.buildroot.net/results/ae54441c65fe9a1bdcf743aa7f6a208e5545ca29
http://autobuild.buildroot.net/results/40fd66e6a351a1acd537ade715ab3e993eddb1c1

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Drop-on_exit-use-standard-atexit-instead.patch | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/package/wavemon/0001-Drop-on_exit-use-standard-atexit-instead.patch b/package/wavemon/0001-Drop-on_exit-use-standard-atexit-instead.patch
new file mode 100644
index 0000000000..67292539ca
--- /dev/null
+++ b/package/wavemon/0001-Drop-on_exit-use-standard-atexit-instead.patch
@@ -0,0 +1,73 @@
+From f6e20c9c6e9b50963caaf5483248d329473a6815 Mon Sep 17 00:00:00 2001
+From: Gerrit Renker <Gerrit.Renker@ctl.io>
+Date: Mon, 21 Jan 2019 09:23:43 -0700
+Subject: [PATCH] Drop on_exit(), use standard atexit() instead
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+`on_exit()` is a GLIBC specific extension and not available in musl and uClibc.
+
+Portable applications should avoid this function, and use the standard
+`atexit()` instead.
+
+Backported from:f6e20c9c6e9b50963caaf5483248d329473a6815
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ iw_if.c   | 10 ++++++----
+ iw_if.h   |  2 +-
+ iw_scan.c |  2 +-
+ 3 files changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/iw_if.c b/iw_if.c
+index c0b0128..d8bacbc 100644
+--- a/iw_if.c
++++ b/iw_if.c
+@@ -87,11 +87,13 @@ int if_set_down(const char *ifname)
+ 	return if_set_up_or_down(ifname, false);
+ }
+ 
+-/** Exit handler to restore interface 'down' state on exit via on_exit(3). */
+-void if_set_down_on_exit(int rc, void *arg)
++/** Exit handler to restore interface 'down' state on exit via atexit(3). */
++void if_set_down_on_exit(void)
+ {
+-	if (if_set_down(arg) < 0) {
+-		err_msg("unable to restore %s interface state - set down manually", arg);
++	const char *ifname = conf_ifname();
++
++	if (ifname && if_set_down(ifname) < 0) {
++		err_msg("unable to restore %s interface state - set down manually", ifname);
+ 	}
+ }
+ 
+diff --git a/iw_if.h b/iw_if.h
+index 50f5a47..e2199d3 100644
+--- a/iw_if.h
++++ b/iw_if.h
+@@ -76,7 +76,7 @@ struct if_info {
+ };
+ extern bool if_is_up(const char *ifname);
+ extern int  if_set_up(const char *ifname);
+-extern void if_set_down_on_exit(int rc, void *arg);
++extern void if_set_down_on_exit(void);
+ extern void if_getinf(const char *ifname, struct if_info *info);
+ 
+ /**
+diff --git a/iw_scan.c b/iw_scan.c
+index 18e9e06..e2b3067 100644
+--- a/iw_scan.c
++++ b/iw_scan.c
+@@ -430,7 +430,7 @@ void *do_scan(void *sr_ptr)
+ 
+ 				if (if_set_up(conf_ifname()) < 0)
+ 					err_sys("Can not bring up interface '%s'", conf_ifname());
+-				if (on_exit(if_set_down_on_exit, (void *)conf_ifname()) < 0)
++				if (atexit(if_set_down_on_exit) < 0)
+ 					snprintf(sr->msg, sizeof(sr->msg), "Warning: unable to restore %s down state on exit", conf_ifname());
+ 				break;
+ 			}
+-- 
+2.20.1
+
