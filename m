From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 12 Nov 2012 11:47:21 +0000
Subject: [Buildroot] [PATCH] lcdproc: remove patch rejected upstream
Message-ID: <1352720842-5781-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Remove an lcdproc patch which has been rejected upstream. It has been
decided by lcdproc developer Markus Dolze that the behaviour of the
client_add_key command when handling the minus key is "intentional to
some degree."

This patch also takes the opportunity to remove the version number from the
single remaining lcdproc patch.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 ...cdproc-0.5.5-fix-client_add_key-for-minus.patch |   38 --------------------
 ...5.5-LCDd.conf.patch => lcdproc-LCDd.conf.patch} |    0
 2 files changed, 38 deletions(-)
 delete mode 100644 package/lcdproc/lcdproc-0.5.5-fix-client_add_key-for-minus.patch
 rename package/lcdproc/{lcdproc-0.5.5-LCDd.conf.patch => lcdproc-LCDd.conf.patch} (100%)

diff --git a/package/lcdproc/lcdproc-0.5.5-fix-client_add_key-for-minus.patch b/package/lcdproc/lcdproc-0.5.5-fix-client_add_key-for-minus.patch
deleted file mode 100644
index c17ee83..0000000
--- a/package/lcdproc/lcdproc-0.5.5-fix-client_add_key-for-minus.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Calling client_add_key as follows
-
-  client_add_key -
-
-will fail. However using an explicit -shared option, like this:
-
-  client_add_key -shared -
-
-will succeed. This is caused by a failure to parse the - key token, which is
-mistaken for the first character of an option argument.
-
-The client_add_key command also returns a spurious "success" message when a
-malformed option is supplied.
-
-This patch fixes both issues.
-
-Signed-off-by: Simon Dawson <spdawson@gmail.com>
-
-diff -Nurp a/server/commands/client_commands.c b/server/commands/client_commands.c
---- a/server/commands/client_commands.c	2011-08-14 13:29:16.000000000 +0100
-+++ b/server/commands/client_commands.c	2012-10-05 07:50:40.357795535 +0100
-@@ -181,7 +181,7 @@ client_add_key_func(Client *c, int argc,
- 	}
- 
- 	argnr = 1;
--	if (argv[argnr][0] == '-') {
-+	if (argv[argnr][0] == '-' && strcmp(argv[argnr], "-") != 0) {
- 		if (strcmp( argv[argnr], "-shared") == 0) {
- 			exclusively = 0;
- 		}
-@@ -190,6 +190,7 @@ client_add_key_func(Client *c, int argc,
- 		}
- 		else {
- 			sock_printf_error(c->sock, "Invalid option: %s\n", argv[argnr]);
-+			return 0;
- 		}
- 		argnr++;
- 	}
diff --git a/package/lcdproc/lcdproc-0.5.5-LCDd.conf.patch b/package/lcdproc/lcdproc-LCDd.conf.patch
similarity index 100%
rename from package/lcdproc/lcdproc-0.5.5-LCDd.conf.patch
rename to package/lcdproc/lcdproc-LCDd.conf.patch
-- 
1.7.10.4
