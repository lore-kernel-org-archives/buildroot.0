From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  3 Feb 2011 17:45:56 -0300
Subject: [Buildroot] [PATCH 2/3] busybox: add modprobe fix
In-Reply-To: <1296765957-5137-1-git-send-email-gustavo@zacarias.com.ar>
References: <1296765957-5137-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1296765957-5137-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
