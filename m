From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 23 Jan 2014 08:48:14 -0300
Subject: [Buildroot] [PATCH] busybox 1.22.1: update to updated ash patch
Message-ID: <1390477694-28655-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../busybox/1.22.1/0002-busybox-1.22.1-ash.patch   | 31 ++++++++--------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/package/busybox/1.22.1/0002-busybox-1.22.1-ash.patch b/package/busybox/1.22.1/0002-busybox-1.22.1-ash.patch
index 767c3a8..301e942 100644
--- a/package/busybox/1.22.1/0002-busybox-1.22.1-ash.patch
+++ b/package/busybox/1.22.1/0002-busybox-1.22.1-ash.patch
@@ -1,20 +1,11 @@
---- busybox-1.22.1/procps/top.c
-+++ busybox-1.22.1-ash/procps/top.c
-@@ -917,17 +917,12 @@ enum {
- #if ENABLE_FEATURE_USE_TERMIOS
- static unsigned handle_input(unsigned scan_mask, unsigned interval)
- {
--	struct pollfd pfd[1];
--
- 	if (option_mask32 & OPT_EOF) {
- 		/* EOF on stdin ("top </dev/null") */
- 		sleep(interval);
- 		return scan_mask;
- 	}
- 
--	pfd[0].fd = 0;
--	pfd[0].events = POLLIN;
--
- 	while (1) {
- 		int32_t c;
- 
+--- busybox-1.22.1/shell/ash.c
++++ busybox-1.22.1-ash/shell/ash.c
+@@ -13014,7 +13014,7 @@ init(void)
+ 		setvar2("PPID", utoa(getppid()));
+ #if ENABLE_ASH_BASH_COMPAT
+ 		p = lookupvar("SHLVL");
+-		setvar2("SHLVL", utoa(p ? atoi(p) + 1 : 1));
++		setvar("SHLVL", utoa((p ? atoi(p) : 0) + 1), VEXPORT);
+ #endif
+ 		p = lookupvar("PWD");
+ 		if (p) {
-- 
1.8.3.2
