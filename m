From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri,  5 Oct 2012 08:30:21 +0100
Subject: [Buildroot] [PATCH] lcdproc: backport upstream patches
Message-ID: <1349422221-22971-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Backport some lcdproc patches from upstream, to fix the following issues.

  * Incorrect parsing of minus key in handler for client_add_key command
  * Segfault in handler for menu_add_item command

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 ...cdproc-0.5.5-fix-client_add_key-for-minus.patch |   38 ++++++++++++++++++++
 .../lcdproc/lcdproc-0.5.5-fix-menu-segfault.patch  |   19 ++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 package/lcdproc/lcdproc-0.5.5-fix-client_add_key-for-minus.patch
 create mode 100644 package/lcdproc/lcdproc-0.5.5-fix-menu-segfault.patch

diff --git a/package/lcdproc/lcdproc-0.5.5-fix-client_add_key-for-minus.patch b/package/lcdproc/lcdproc-0.5.5-fix-client_add_key-for-minus.patch
new file mode 100644
index 0000000..c17ee83
--- /dev/null
+++ b/package/lcdproc/lcdproc-0.5.5-fix-client_add_key-for-minus.patch
@@ -0,0 +1,38 @@
+Calling client_add_key as follows
+
+  client_add_key -
+
+will fail. However using an explicit -shared option, like this:
+
+  client_add_key -shared -
+
+will succeed. This is caused by a failure to parse the - key token, which is
+mistaken for the first character of an option argument.
+
+The client_add_key command also returns a spurious "success" message when a
+malformed option is supplied.
+
+This patch fixes both issues.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
+diff -Nurp a/server/commands/client_commands.c b/server/commands/client_commands.c
+--- a/server/commands/client_commands.c	2011-08-14 13:29:16.000000000 +0100
++++ b/server/commands/client_commands.c	2012-10-05 07:50:40.357795535 +0100
+@@ -181,7 +181,7 @@ client_add_key_func(Client *c, int argc,
+ 	}
+ 
+ 	argnr = 1;
+-	if (argv[argnr][0] == '-') {
++	if (argv[argnr][0] == '-' && strcmp(argv[argnr], "-") != 0) {
+ 		if (strcmp( argv[argnr], "-shared") == 0) {
+ 			exclusively = 0;
+ 		}
+@@ -190,6 +190,7 @@ client_add_key_func(Client *c, int argc,
+ 		}
+ 		else {
+ 			sock_printf_error(c->sock, "Invalid option: %s\n", argv[argnr]);
++			return 0;
+ 		}
+ 		argnr++;
+ 	}
diff --git a/package/lcdproc/lcdproc-0.5.5-fix-menu-segfault.patch b/package/lcdproc/lcdproc-0.5.5-fix-menu-segfault.patch
new file mode 100644
index 0000000..f0ebe2d
--- /dev/null
+++ b/package/lcdproc/lcdproc-0.5.5-fix-menu-segfault.patch
@@ -0,0 +1,19 @@
+Trying to add a menu item using menu_add_item causes a segmentation fault
+in the LCDd server. This is caused by a read beyond the end of an array.
+
+This patch adds a safety check on the size of the argument array.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
+diff -Nurp a/server/commands/menu_commands.c b/server/commands/menu_commands.c
+--- a/server/commands/menu_commands.c	2011-08-14 13:29:16.000000000 +0100
++++ b/server/commands/menu_commands.c	2012-10-04 22:19:07.997409193 +0100
+@@ -198,7 +198,7 @@ menu_add_item_func(Client *c, int argc,
+ 
+ 	/* call menu_set_item() with a temporarily allocated argv
+ 	 * to process the remaining options */
+-	if ((argc > 5) || (argv[4][0] == '-')) {
++	if ((argc > 5) || ((argc == 5) && argv[4][0] == '-')) {
+ 		// menu_add_item <menuid> <newitemid> <type> [<text>]
+ 		// menu_set_item <menuid> <itemid> {<option>}+
+ 		int i, j;
-- 
1.7.9.5
