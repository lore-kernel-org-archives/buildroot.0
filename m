Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C314FC433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 17:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6357981499;
	Sun,  6 Feb 2022 17:28:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D5_7Sgoob1A9; Sun,  6 Feb 2022 17:28:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B93281754;
	Sun,  6 Feb 2022 17:28:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 456251BF97D
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 17:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40CAA4023D
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 17:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZCz_6EZuIz8S for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 17:27:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 309B84023B
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 17:27:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5E1EE82BA3; Sun,  6 Feb 2022 17:20:23 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 18:27:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 236e2343f39b0aeb6aa18be26c92a0dee7fd656e
X-Git-Newrev: d409fe085663194cbe23fbbfef38f566c4910bb8
X-Patchwork-Hint: ignore
Message-Id: <20220206172023.5E1EE82BA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/checkpackagelib/lib_sysv: run
 shellcheck
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

commit: https://git.buildroot.net/buildroot/commit/?id=d409fe085663194cbe23fbbfef38f566c4910bb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For simplicity, when shellcheck returns one or more warnings, count it
as a single check-package warning.
The developer can get the full output either by running shellcheck
directly or by calling check-package with -v.

Examples:

|$ ./utils/docker-run utils/check-package --include Shellcheck package/polkit/S50polkit
|package/polkit/S50polkit:0: run 'shellcheck' and fix the warnings
|51 lines processed
|1 warnings generated

|$ ./utils/docker-run utils/check-package --include Shellcheck -v package/polkit/S50polkit
|package/polkit/S50polkit:0: run 'shellcheck' and fix the warnings
|In package/polkit/S50polkit line 43:
|< tab  >start|stop|restart|reload)
|                           ^----^ SC2221: This pattern always overrides a later one on line 45.
|In package/polkit/S50polkit line 45:
|< tab  >reload)
|        ^----^ SC2222: This pattern never matches because of a previous pattern on line 43.
|For more information:
|  https://www.shellcheck.net/wiki/SC2221 -- This pattern always overrides a l...
|  https://www.shellcheck.net/wiki/SC2222 -- This pattern never matches becaus...
|51 lines processed
|1 warnings generated

NOTICE: shellcheck results depends on the version of the tool.
This is why the examples above run inside the docker image.

Also update .gitlab-ci.yml with the docker image after the change of
the previous commit. We don't actually use shellcheck in CI, but the
image from .gitlab-ci.yml is used by the docker-run script and we use
that to run shellcheck.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[Arnout: make sure a single -v is enough to get shellcheck output;
 update docker image tag in .gitlab-ci.yml]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml                     |  2 +-
 utils/checkpackagelib/lib_sysv.py  |  1 +
 utils/checkpackagelib/test_tool.py | 46 ++++++++++++++++++++++++++++++++++++++
 utils/checkpackagelib/tool.py      | 16 +++++++++++++
 4 files changed, 64 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d54f46c409..cad35c96bc 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,7 +1,7 @@
 # Configuration for Gitlab-CI.
 # Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
 
-image: $CI_REGISTRY/buildroot.org/buildroot/base:20220206.1324
+image: $CI_REGISTRY/buildroot.org/buildroot/base:20220206.1756
 
 stages:
   - generate-gitlab-ci
diff --git a/utils/checkpackagelib/lib_sysv.py b/utils/checkpackagelib/lib_sysv.py
index 2ee5f74af7..386d085afc 100644
--- a/utils/checkpackagelib/lib_sysv.py
+++ b/utils/checkpackagelib/lib_sysv.py
@@ -7,6 +7,7 @@ from checkpackagelib.lib import EmptyLastLine          # noqa: F401
 from checkpackagelib.lib import NewlineAtEof           # noqa: F401
 from checkpackagelib.lib import TrailingSpace          # noqa: F401
 import checkpackagelib.tool
+from checkpackagelib.tool import Shellcheck            # noqa: F401
 
 
 class Indent(_CheckFunction):
diff --git a/utils/checkpackagelib/test_tool.py b/utils/checkpackagelib/test_tool.py
index 9e1abbfc23..38029297a5 100644
--- a/utils/checkpackagelib/test_tool.py
+++ b/utils/checkpackagelib/test_tool.py
@@ -64,3 +64,49 @@ def test_NotExecutable_hint(testname, hint, filename, permissions, string, expec
             return hint
     warnings = check_file(NotExecutable, filename, string, permissions)
     assert warnings == expected
+
+
+Shellcheck = [
+    ('missing shebang',
+     'empty.sh',
+     '',
+     ["dir/empty.sh:0: run 'shellcheck' and fix the warnings",
+      "In dir/empty.sh line 1:",
+      "^-- SC2148: Tips depend on target shell and yours is unknown. Add a shebang or a 'shell' directive.",
+      "For more information:",
+      "  https://www.shellcheck.net/wiki/SC2148 -- Tips depend on target shell and y..."]),
+    ('sh shebang',
+     'sh-shebang.sh',
+     '#!/bin/sh',
+     []),
+    ('bash shebang',
+     'bash-shebang.sh',
+     '#!/bin/bash',
+     []),
+    ('2 warnings',
+     'unused.sh',
+     'unused=""',
+     ["dir/unused.sh:0: run 'shellcheck' and fix the warnings",
+      "In dir/unused.sh line 1:",
+      'unused=""',
+      "^-- SC2148: Tips depend on target shell and yours is unknown. Add a shebang or a 'shell' directive.",
+      "^----^ SC2034: unused appears unused. Verify use (or export if used externally).",
+      "For more information:",
+      "  https://www.shellcheck.net/wiki/SC2148 -- Tips depend on target shell and y...",
+      "  https://www.shellcheck.net/wiki/SC2034 -- unused appears unused. Verify use..."]),
+    ('tab',
+     'tab.sh',
+     '\t#!/bin/sh',
+     ["dir/tab.sh:0: run 'shellcheck' and fix the warnings",
+      "In dir/tab.sh line 1:",
+      '\t#!/bin/sh',
+      "^-- SC1114: Remove leading spaces before the shebang.",
+      "For more information:",
+      "  https://www.shellcheck.net/wiki/SC1114 -- Remove leading spaces before the ..."]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', Shellcheck)
+def test_Shellcheck(testname, filename, string, expected):
+    warnings = check_file(m.Shellcheck, filename, string)
+    assert warnings == expected
diff --git a/utils/checkpackagelib/tool.py b/utils/checkpackagelib/tool.py
index e931272554..e719fdd407 100644
--- a/utils/checkpackagelib/tool.py
+++ b/utils/checkpackagelib/tool.py
@@ -1,4 +1,5 @@
 import os
+import subprocess
 from checkpackagelib.base import _Tool
 
 
@@ -6,3 +7,18 @@ class NotExecutable(_Tool):
     def run(self):
         if os.access(self.filename, os.X_OK):
             return ["{}:0: This file does not need to be executable{}".format(self.filename, self.hint())]
+
+
+class Shellcheck(_Tool):
+    def run(self):
+        cmd = ['shellcheck', self.filename]
+        try:
+            p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+            stdout = p.communicate()[0]
+            processed_output = [str(line.decode().rstrip()) for line in stdout.splitlines() if line]
+            if p.returncode == 0:
+                return
+            return ["{}:0: run 'shellcheck' and fix the warnings".format(self.filename),
+                    '\n'.join(processed_output)]
+        except FileNotFoundError:
+            return ["{}:0: failed to call 'shellcheck'".format(self.filename)]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
