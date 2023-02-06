Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06141C64EC4
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B87646FBC2;
	Tue, 21 Feb 2023 01:37:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B87646FBC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vPjYdOUpp4kI; Tue, 21 Feb 2023 01:37:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC55770088;
	Tue, 21 Feb 2023 01:37:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC55770088
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5527E1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CBF5610A4
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CBF5610A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2S9OA-HjOBC8 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 629BB6FC18
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 629BB6FC18
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 522AD828C8; Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 18:54:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3274404b361b8d243fa593391dc6a7c9c47b9961
X-Git-Newrev: ddf4586b00a97c41c4ad4d50da4282c62940c05b
X-Patchwork-Hint: ignore
Message-Id: <20230220205250.522AD828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] utils/check-package: decouple
 adding rules from fixing all intree files
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ddf4586b00a97c41c4ad4d50da4282c62940c05b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When a new check_function is added to check-package, often there are
files in the tree that would generate warnings.

An example is the Sob check_function for patch files:
| $ ./utils/check-package --i Sob $(git ls-files) >/dev/null
| 369301 lines processed
| 46 warnings generated
Currently these warnings are listed when calling check-package directly,
and also at the output of pkg-stats, but the check_function does not run
on 'make check-package' (that is used to catch regressions on GitLab CI
'check-package' job) until all warnings in the tree are fixed.
This (theoretically) allows new .patch files be added without SoB,
without the GitLab CI catching it.

So add a way to check-package itself ignore current warnings, while
still catching new files that do not follow that new check_function.

Add a file named .checkpackageignore to the buildroot topdir.
It contains the list of check_functions that are expected to fail for
each given intree file tested by check-package.
Each entries is in the format:
<filename> <check_function> [<check_function> ...]

These are 2 examples of possible entries:
package/initscripts/init.d/rcK ConsecutiveEmptyLines EmptyLastLine Shellcheck
utils/test-pkg Shellcheck

Keeping such a list allows us to have fine-grained control over which
warning to ignore.

In order to avoid this list to grow indefinitely, containing entries for
files that are already fixed, make each entry an 'expected to fail'
instead of just an 'ignore', and generate a warning if a check_function
that was expect to fail for a given files does not generate that
warning.
Unfortunately one case that do not generate warning is an entry for a
file that is deleted in a later commit.

By default, all checks are applied. The --ignore-list option allows to
specify a file that contains the list of warnings that should be
ignored.

The paths in the ignore file must be relative to the location of the
ignore file itself, which means:

 - in the main Buildroot tree, the paths in the ignore file are
   relative to the root of the main Buildroot tree

 - in a BR2_EXTERNAL tree, if the ignore file is at the root of the
   BR2_EXTERNAL, the paths it contains must be relative to that root
   of the BR2_EXTERNAL

This is one more step towards standardizing the use of just 'make
check-package' before submitting patches to the list.

Cc: Sen Hastings <sen@phobosdpl.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore |  0
 utils/check-package | 78 ++++++++++++++++++++++++++++++++++++++++++-----------
 2 files changed, 62 insertions(+), 16 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/utils/check-package b/utils/check-package
index f64daed84c..f08e76b374 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -19,6 +19,24 @@ VERBOSE_LEVEL_TO_SHOW_IGNORED_FILES = 3
 flags = None  # Command line arguments.
 
 
+def get_ignored_parsers_per_file(intree_only, ignore_filename):
+    ignored = dict()
+    entry_base_dir = ''
+
+    if not ignore_filename:
+        return ignored
+
+    filename = os.path.abspath(ignore_filename)
+    entry_base_dir = os.path.join(os.path.dirname(filename))
+
+    with open(filename, "r") as f:
+        for line in f.readlines():
+            filename, warnings_str = line.split(' ', 1)
+            warnings = warnings_str.split()
+            ignored[os.path.join(entry_base_dir, filename)] = warnings
+    return ignored
+
+
 def parse_args():
     parser = argparse.ArgumentParser()
 
@@ -29,6 +47,8 @@ def parse_args():
 
     parser.add_argument("--br2-external", "-b", dest='intree_only', action="store_false",
                         help="do not apply the pathname filters used for intree files")
+    parser.add_argument("--ignore-list", dest='ignore_filename', action="store",
+                        help='override the default list of ignored warnings')
 
     parser.add_argument("--manual-url", action="store",
                         default="http://nightly.buildroot.org/",
@@ -44,7 +64,11 @@ def parse_args():
     parser.add_argument("--dry-run", action="store_true", help="print the "
                         "functions that would be called for each file (debug)")
 
-    return parser.parse_args()
+    flags = parser.parse_args()
+
+    flags.ignore_list = get_ignored_parsers_per_file(flags.intree_only, flags.ignore_filename)
+
+    return flags
 
 
 CONFIG_IN_FILENAME = re.compile(r"Config\.\S*$")
@@ -120,21 +144,25 @@ def is_external_tool(m):
     return common_inspect_rules(m)
 
 
-def print_warnings(warnings):
+def print_warnings(warnings, xfail):
     # Avoid the need to use 'return []' at the end of every check function.
     if warnings is None:
-        return 0  # No warning generated.
+        return 0, 0  # No warning generated.
 
+    if xfail:
+        return 0, 1  # Warning not generated, fail expected for this file.
     for level, message in enumerate(warnings):
         if flags.verbose >= level:
             print(message.replace("\t", "< tab  >").rstrip())
-    return 1  # One more warning to count.
+    return 1, 1  # One more warning to count.
 
 
 def check_file_using_lib(fname):
     # Count number of warnings generated and lines processed.
     nwarnings = 0
     nlines = 0
+    xfail = flags.ignore_list.get(os.path.abspath(fname), [])
+    failed = set()
 
     lib = get_lib_from_filename(fname)
     if not lib:
@@ -150,10 +178,13 @@ def check_file_using_lib(fname):
         print("{}: would run: {}".format(fname, functions_to_run))
         return nwarnings, nlines
 
-    objects = [c[1](fname, flags.manual_url) for c in internal_functions]
+    objects = [[c[0], c[1](fname, flags.manual_url)] for c in internal_functions]
 
-    for cf in objects:
-        nwarnings += print_warnings(cf.before())
+    for name, cf in objects:
+        warn, fail = print_warnings(cf.before(), name in xfail)
+        if fail > 0:
+            failed.add(name)
+        nwarnings += warn
     if six.PY3:
         f = open(fname, "r", errors="surrogateescape")
     else:
@@ -161,19 +192,34 @@ def check_file_using_lib(fname):
     lastline = ""
     for lineno, text in enumerate(f.readlines()):
         nlines += 1
-        for cf in objects:
+        for name, cf in objects:
             if cf.disable.search(lastline):
                 continue
-            nwarnings += print_warnings(cf.check_line(lineno + 1, text))
+            warn, fail = print_warnings(cf.check_line(lineno + 1, text), name in xfail)
+            if fail > 0:
+                failed.add(name)
+            nwarnings += warn
         lastline = text
     f.close()
-    for cf in objects:
-        nwarnings += print_warnings(cf.after())
-
-    tools = [c[1](fname) for c in external_tools]
-
-    for tool in tools:
-        nwarnings += print_warnings(tool.run())
+    for name, cf in objects:
+        warn, fail = print_warnings(cf.after(), name in xfail)
+        if fail > 0:
+            failed.add(name)
+        nwarnings += warn
+
+    tools = [[c[0], c[1](fname)] for c in external_tools]
+
+    for name, tool in tools:
+        warn, fail = print_warnings(tool.run(), name in xfail)
+        if fail > 0:
+            failed.add(name)
+        nwarnings += warn
+
+    for should_fail in xfail:
+        if should_fail not in failed:
+            print("{}:0: {} was expected to fail, did you fixed the file and forgot to update {}?"
+                  .format(fname, should_fail, flags.ignore_filename))
+            nwarnings += 1
 
     return nwarnings, nlines
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
