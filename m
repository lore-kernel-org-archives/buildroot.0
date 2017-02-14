From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 14 Feb 2017 21:34:50 +0100
Subject: [Buildroot] [PATCH v1] libv4l/ir-ctl: fix musl compile
Message-ID: <20170214203450.7449-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- add copy of TEMP_FAILURE_RETRY macro
- use strdup instead of strdupa

Fixes [1]:

  ir-ctl.c:(.text+0xb06): undefined reference to `strndupa'
  ir-ctl.c:(.text+0xe01): undefined reference to `TEMP_FAILURE_RETRY'

[1] http://autobuild.buildroot.net/results/b8b96c7bbf2147dacac62485cbfdbcfd758271a5

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../0002-ir-ctl-fixes-for-musl-compile.patch       | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 package/libv4l/0002-ir-ctl-fixes-for-musl-compile.patch

diff --git a/package/libv4l/0002-ir-ctl-fixes-for-musl-compile.patch b/package/libv4l/0002-ir-ctl-fixes-for-musl-compile.patch
new file mode 100644
index 000000000..5bce2d916
--- /dev/null
+++ b/package/libv4l/0002-ir-ctl-fixes-for-musl-compile.patch
@@ -0,0 +1,59 @@
+From 9908872aaa614a6c4bba80d7a5f1adea7ca7117e Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Tue, 14 Feb 2017 21:27:59 +0100
+Subject: [PATCH] ir-ctl: fixes for musl compile
+
+- add copy of TEMP_FAILURE_RETRY macro
+- use strdup instead of strdupa
+
+Fixes [1]:
+
+  ir-ctl.c:(.text+0xb06): undefined reference to `strndupa'
+  ir-ctl.c:(.text+0xe01): undefined reference to `TEMP_FAILURE_RETRY'
+
+[1] http://autobuild.buildroot.net/results/b8b96c7bbf2147dacac62485cbfdbcfd758271a5
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ utils/ir-ctl/ir-ctl.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
+index bc58cee..e9da777 100644
+--- a/utils/ir-ctl/ir-ctl.c
++++ b/utils/ir-ctl/ir-ctl.c
+@@ -44,6 +44,15 @@
+ 
+ # define N_(string) string
+ 
++/* taken from glibc unistd.h */
++#ifndef TEMP_FAILURE_RETRY
++#define TEMP_FAILURE_RETRY(expression) \
++  (__extension__                                                              \
++    ({ long int __result;                                                     \
++       do __result = (long int) (expression);                                 \
++       while (__result == -1L && errno == EINTR);                             \
++       __result; }))
++#endif
+ 
+ /* See drivers/media/rc/ir-lirc-codec.c line 23 */
+ #define LIRCBUF_SIZE	512
+@@ -344,12 +353,14 @@ static struct file *read_scancode(const char *name)
+ 		return NULL;
+ 	}
+ 
+-	pstr = strndupa(name, p - name);
++	pstr = strndup(name, p - name);
+ 
+ 	if (!protocol_match(pstr, &proto)) {
+ 		fprintf(stderr, _("error: protocol '%s' not found\n"), pstr);
++		free(pstr);
+ 		return NULL;
+ 	}
++	free(pstr);
+ 
+ 	if (!strtoscancode(p + 1, &scancode)) {
+ 		fprintf(stderr, _("error: invalid scancode '%s'\n"), p + 1);
+-- 
+2.11.0
+
-- 
2.11.0
