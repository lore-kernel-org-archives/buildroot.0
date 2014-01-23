From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Jan 2014 12:47:19 +0100
Subject: [Buildroot] [git commit] busybox: 1.22.1: correct ash patch
Message-ID: <20140123114929.C519B8E277@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=99fa554bd64561e36b8f337821d2fb387f506ef6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream initially put the wrong patch online:

http://lists.busybox.net/pipermail/busybox/2014-January/080364.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../busybox/1.22.1/0002-busybox-1.22.1-ash.patch   |   31 +++++++-------------
 1 files changed, 11 insertions(+), 20 deletions(-)

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
