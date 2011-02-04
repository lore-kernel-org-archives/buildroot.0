From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 4 Feb 2011 19:49:50 +0100
Subject: [Buildroot] [git commit master 1/1] busybox: add 1.18.2 modprobe fix
Message-ID: <20110204185010.DED7E8F3BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9384f00cce18077bb32494489f5b9e37ff5564e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox-1.18.2/busybox-1.18.2-modprobe.patch   |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.18.2/busybox-1.18.2-modprobe.patch

diff --git a/package/busybox/busybox-1.18.2/busybox-1.18.2-modprobe.patch b/package/busybox/busybox-1.18.2/busybox-1.18.2-modprobe.patch
new file mode 100644
index 0000000..cad887e
--- /dev/null
+++ b/package/busybox/busybox-1.18.2/busybox-1.18.2-modprobe.patch
@@ -0,0 +1,20 @@
+--- busybox-1.18.2/modutils/modutils.c
++++ busybox-1.18.2-modprobe/modutils/modutils.c
+@@ -71,12 +71,11 @@ char* FAST_FUNC parse_cmdline_module_opt
+ 	optlen = 0;
+ 	while (*++argv) {
+ 		options = xrealloc(options, optlen + 2 + strlen(*argv) + 2);
+-		/* Older versions were enclosing space-containing *argv in "",
+-		 * but both modprobe and insmod from module-init-tools 3.11.1
+-		 * don't do this anymore. (As to extra trailing space,
+-		 * insmod adds it but modprobe does not. We do in both cases)
+-		 */
+-		optlen += sprintf(options + optlen, "%s ", *argv);
++		/* Spaces handled by "" pairs, but no way of escaping quotes */
++//TODO: module-init-tools version 3.11.1 quotes only value:
++//it generates var="val with spaces", not "var=val with spaces"
++//(and it won't quote var *name* even if it has spaces)
++		optlen += sprintf(options + optlen, (strchr(*argv, ' ') ? "\"%s\" " : "%s "), *argv);
+ 	}
+ 	return options;
+ }
-- 
1.7.3.4
