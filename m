From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Wed, 22 Mar 2017 05:26:44 +0530
Subject: [Buildroot] [PATCH] git: fix build with with no threads
Message-ID: <1490140604-28596-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building git with toolchain that don't have thread support, we
get following build errors:

      CC builtin/hash-object.o
  builtin/grep.c: In function 'grep_submodule_launch':
  builtin/grep.c:596:34: error: dereferencing pointer to incomplete type 'struct work_item'
    status = capture_command(&cp, &w->out, 0);
                                    ^
  builtin/grep.c: In function 'grep_submodule':
  builtin/grep.c:644:20: error: storage size of 'w' isn't known
     struct work_item w;
                      ^
  make[2]: *** [builtin/grep.o] Error 1
  make[2]: *** Waiting for unfinished jobs....

Add two upstream patches to fix this issue.

Fixes:
  http://autobuild.buildroot.net/results/94b/94bce9a99a5ce9894a6918774ab75e23d12c1394/

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 .../git/0001-grep-set-default-output-method.patch  | 59 +++++++++++++++
 ...ep-fix-builds-with-with-no-thread-support.patch | 87 ++++++++++++++++++++++
 2 files changed, 146 insertions(+)
 create mode 100644 package/git/0001-grep-set-default-output-method.patch
 create mode 100644 package/git/0002-grep-fix-builds-with-with-no-thread-support.patch

diff --git a/package/git/0001-grep-set-default-output-method.patch b/package/git/0001-grep-set-default-output-method.patch
new file mode 100644
index 0000000..ade35eb
--- /dev/null
+++ b/package/git/0001-grep-set-default-output-method.patch
@@ -0,0 +1,59 @@
+From 379642bcd8d89db52feba88a651e4e56d6ac5767 Mon Sep 17 00:00:00 2001
+From: Brandon Williams <bmwill@google.com>
+Date: Fri, 17 Mar 2017 11:41:54 -0700
+Subject: [PATCH] grep: set default output method
+
+Signed-off-by: Brandon Williams <bmwill@google.com>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
+---
+ grep.c | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/grep.c b/grep.c
+index 0dbdc1d..56ef0ec 100644
+--- a/grep.c
++++ b/grep.c
+@@ -12,6 +12,11 @@ static int grep_source_is_binary(struct grep_source *gs);
+ 
+ static struct grep_opt grep_defaults;
+ 
++static void std_output(struct grep_opt *opt, const void *buf, size_t size)
++{
++	fwrite(buf, size, 1, stdout);
++}
++
+ /*
+  * Initialize the grep_defaults template with hardcoded defaults.
+  * We could let the compiler do this, but without C99 initializers
+@@ -42,6 +47,7 @@ void init_grep_defaults(void)
+ 	color_set(opt->color_selected, "");
+ 	color_set(opt->color_sep, GIT_COLOR_CYAN);
+ 	opt->color = -1;
++	opt->output = std_output;
+ }
+ 
+ static int parse_pattern_type_arg(const char *opt, const char *arg)
+@@ -152,6 +158,7 @@ void grep_init(struct grep_opt *opt, const char *prefix)
+ 	opt->pathname = def->pathname;
+ 	opt->regflags = def->regflags;
+ 	opt->relative = def->relative;
++	opt->output = def->output;
+ 
+ 	color_set(opt->color_context, def->color_context);
+ 	color_set(opt->color_filename, def->color_filename);
+@@ -1379,11 +1386,6 @@ static int look_ahead(struct grep_opt *opt,
+ 	return 0;
+ }
+ 
+-static void std_output(struct grep_opt *opt, const void *buf, size_t size)
+-{
+-	fwrite(buf, size, 1, stdout);
+-}
+-
+ static int fill_textconv_grep(struct userdiff_driver *driver,
+ 			      struct grep_source *gs)
+ {
+-- 
+2.6.2
+
diff --git a/package/git/0002-grep-fix-builds-with-with-no-thread-support.patch b/package/git/0002-grep-fix-builds-with-with-no-thread-support.patch
new file mode 100644
index 0000000..077b554
--- /dev/null
+++ b/package/git/0002-grep-fix-builds-with-with-no-thread-support.patch
@@ -0,0 +1,87 @@
+From 2225e1ea20481a7c0da526891470abf9ece623e7 Mon Sep 17 00:00:00 2001
+From: Brandon Williams <bmwill@google.com>
+Date: Fri, 17 Mar 2017 11:41:55 -0700
+Subject: [PATCH] grep: fix builds with with no thread support
+
+Commit 0281e487fd91 ("grep: optionally recurse into submodules")
+added functions grep_submodule() and grep_submodule_launch() which
+use "struct work_item" which is defined only when thread support
+is available.
+
+The original implementation of grep_submodule() used the "struct
+work_item" in order to gain access to a strbuf to store its output which
+was to be printed at a later point in time.  This differs from how both
+grep_file() and grep_sha1() handle their output.  This patch eliminates
+the reliance on the "struct work_item" and instead opts to use the
+output function stored in the output field of the "struct grep_opt"
+object directly, making it behave similarly to both grep_file() and
+grep_sha1().
+
+Reported-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
+Signed-off-by: Brandon Williams <bmwill@google.com>
+Reviewed-by: Jonathan Nieder <jrnieder@gmail.com>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
+---
+ builtin/grep.c | 21 +++++++++------------
+ 1 file changed, 9 insertions(+), 12 deletions(-)
+
+diff --git a/builtin/grep.c b/builtin/grep.c
+index 2c727ef..33561f2 100644
+--- a/builtin/grep.c
++++ b/builtin/grep.c
+@@ -538,7 +538,7 @@ static int grep_submodule_launch(struct grep_opt *opt,
+ 	int status, i;
+ 	const char *end_of_base;
+ 	const char *name;
+-	struct work_item *w = opt->output_priv;
++	struct strbuf child_output = STRBUF_INIT;
+ 
+ 	end_of_base = strchr(gs->name, ':');
+ 	if (gs->identifier && end_of_base)
+@@ -593,14 +593,16 @@ static int grep_submodule_launch(struct grep_opt *opt,
+ 	 * child process.  A '0' indicates a hit, a '1' indicates no hit and
+ 	 * anything else is an error.
+ 	 */
+-	status = capture_command(&cp, &w->out, 0);
++	status = capture_command(&cp, &child_output, 0);
+ 	if (status && (status != 1)) {
+ 		/* flush the buffer */
+-		write_or_die(1, w->out.buf, w->out.len);
++		write_or_die(1, child_output.buf, child_output.len);
+ 		die("process for submodule '%s' failed with exit code: %d",
+ 		    gs->name, status);
+ 	}
+ 
++	opt->output(opt, child_output.buf, child_output.len);
++	strbuf_release(&child_output);
+ 	/* invert the return code to make a hit equal to 1 */
+ 	return !status;
+ }
+@@ -641,19 +643,14 @@ static int grep_submodule(struct grep_opt *opt, const unsigned char *sha1,
+ 	} else
+ #endif
+ 	{
+-		struct work_item w;
++		struct grep_source gs;
+ 		int hit;
+ 
+-		grep_source_init(&w.source, GREP_SOURCE_SUBMODULE,
++		grep_source_init(&gs, GREP_SOURCE_SUBMODULE,
+ 				 filename, path, sha1);
+-		strbuf_init(&w.out, 0);
+-		opt->output_priv = &w;
+-		hit = grep_submodule_launch(opt, &w.source);
++		hit = grep_submodule_launch(opt, &gs);
+ 
+-		write_or_die(1, w.out.buf, w.out.len);
+-
+-		grep_source_clear(&w.source);
+-		strbuf_release(&w.out);
++		grep_source_clear(&gs);
+ 		return hit;
+ 	}
+ }
+-- 
+2.6.2
+
-- 
2.6.2
