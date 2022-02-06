Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFB6C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 17:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F87A400C1;
	Sun,  6 Feb 2022 17:28:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L_AQd28KWi98; Sun,  6 Feb 2022 17:28:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0084F4014E;
	Sun,  6 Feb 2022 17:28:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D2191BF976
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 17:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67F004014E
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 17:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dZV03eXMOfRF for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 17:27:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17C2B400C1
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 17:27:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 39B8A82BA3; Sun,  6 Feb 2022 17:20:23 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 16:38:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4fe33a1b47ba9c1e90c2c794cefb13962ea89b99
X-Git-Newrev: 1734127e5998f6874beee5430081f15cfcb33ce6
X-Patchwork-Hint: ignore
Message-Id: <20220206172023.39B8A82BA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/check-package: prepare to run
 external tools
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1734127e5998f6874beee5430081f15cfcb33ce6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some file formats have well-established syntax checkers.
One example of this is the tool 'shellcheck' that can analyse shell
scripts for common mistakes.

There is no reason to reimplement such tools in check-package, when we
can just call them.

Add the ability to check-package to call external tools that will run
once for each file to be analysed.
For simplicity, when the tool generated one or more warnings, count it
as a single warning from check-package, that can display something like
this:

|$ ./utils/check-package  package/unscd/S46unscd
|package/unscd/S46unscd:0: run 'shellcheck' and fix the warnings
|25 lines processed
|1 warnings generated

|$ ./utils/check-package -vvvvvvvvvvvvvvvv package/unscd/S46unscd
|package/unscd/S46unscd:0: run 'shellcheck' and fix the warnings
|In package/unscd/S46unscd line 9:
|        printf "Starting ${NAME}: "
|               ^------------------^ SC2059: Don't use variables in the printf format string. Use printf "..%s.." "$foo".
|In package/unscd/S46unscd line 11:
|        [ $? -eq 0 ] && echo "OK" || echo "FAIL"
|          ^-- SC2181: Check exit code directly with e.g. 'if mycmd;', not indirectly with $?.
|In package/unscd/S46unscd line 14:
|        printf "Stopping ${NAME}: "
|               ^------------------^ SC2059: Don't use variables in the printf format string. Use printf "..%s.." "$foo".
|In package/unscd/S46unscd line 16:
|        [ $? -eq 0 ] && echo "OK" || echo "FAIL"
|          ^-- SC2181: Check exit code directly with e.g. 'if mycmd;', not indirectly with $?.
|For more information:
|  https://www.shellcheck.net/wiki/SC2059 -- Don't use variables in the printf...
|  https://www.shellcheck.net/wiki/SC2181 -- Check exit code directly with e.g...
|25 lines processed
|1 warnings generated

In this first commit, add only the ability for check-package to call
external tools and not an example of such tool, as adding each tool to
call may need update to the docker image and can lead to it's own
discussion on how to implement.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/check-package           | 34 ++++++++++++++++++++++++++++------
 utils/checkpackagelib/base.py |  8 ++++++++
 2 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/utils/check-package b/utils/check-package
index a959fef079..5fb430902d 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -8,6 +8,7 @@ import re
 import six
 import sys
 
+import checkpackagelib.base
 import checkpackagelib.lib_config
 import checkpackagelib.lib_hash
 import checkpackagelib.lib_mk
@@ -87,9 +88,7 @@ def get_lib_from_filename(fname):
     return None
 
 
-def is_a_check_function(m):
-    if not inspect.isclass(m):
-        return False
+def common_inspect_rules(m):
     # do not call the base class
     if m.__name__.startswith("_"):
         return False
@@ -100,6 +99,22 @@ def is_a_check_function(m):
     return True
 
 
+def is_a_check_function(m):
+    if not inspect.isclass(m):
+        return False
+    if not issubclass(m, checkpackagelib.base._CheckFunction):
+        return False
+    return common_inspect_rules(m)
+
+
+def is_external_tool(m):
+    if not inspect.isclass(m):
+        return False
+    if not issubclass(m, checkpackagelib.base._Tool):
+        return False
+    return common_inspect_rules(m)
+
+
 def print_warnings(warnings):
     # Avoid the need to use 'return []' at the end of every check function.
     if warnings is None:
@@ -121,14 +136,16 @@ def check_file_using_lib(fname):
         if flags.verbose >= VERBOSE_LEVEL_TO_SHOW_IGNORED_FILES:
             print("{}: ignored".format(fname))
         return nwarnings, nlines
-    classes = inspect.getmembers(lib, is_a_check_function)
+    internal_functions = inspect.getmembers(lib, is_a_check_function)
+    external_tools = inspect.getmembers(lib, is_external_tool)
+    all_checks = internal_functions + external_tools
 
     if flags.dry_run:
-        functions_to_run = [c[0] for c in classes]
+        functions_to_run = [c[0] for c in all_checks]
         print("{}: would run: {}".format(fname, functions_to_run))
         return nwarnings, nlines
 
-    objects = [c[1](fname, flags.manual_url) for c in classes]
+    objects = [c[1](fname, flags.manual_url) for c in internal_functions]
 
     for cf in objects:
         nwarnings += print_warnings(cf.before())
@@ -148,6 +165,11 @@ def check_file_using_lib(fname):
     for cf in objects:
         nwarnings += print_warnings(cf.after())
 
+    tools = [c[1](fname) for c in external_tools]
+
+    for tool in tools:
+        nwarnings += print_warnings(tool.run())
+
     return nwarnings, nlines
 
 
diff --git a/utils/checkpackagelib/base.py b/utils/checkpackagelib/base.py
index 9544a64e5a..73da925a03 100644
--- a/utils/checkpackagelib/base.py
+++ b/utils/checkpackagelib/base.py
@@ -16,3 +16,11 @@ class _CheckFunction(object):
 
     def after(self):
         pass
+
+
+class _Tool(object):
+    def __init__(self, filename):
+        self.filename = filename
+
+    def run(self):
+        pass
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
