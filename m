Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86313C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 17:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23FA081751;
	Sun,  6 Feb 2022 17:27:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XTc5_9ufYm6F; Sun,  6 Feb 2022 17:27:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4861881422;
	Sun,  6 Feb 2022 17:27:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3FB811BF59A
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 17:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A59481443
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 17:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x7bY7oN3aF9i for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 17:27:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15B5F8141D
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 17:27:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 42B7482BDD; Sun,  6 Feb 2022 17:20:23 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 18:26:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1734127e5998f6874beee5430081f15cfcb33ce6
X-Git-Newrev: 7947328de48cbea36cadf2d41b0b401da761ba37
X-Patchwork-Hint: ignore
Message-Id: <20220206172023.42B7482BDD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/checkpackagelib: warn about
 executable files
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

commit: https://git.buildroot.net/buildroot/commit/?id=7947328de48cbea36cadf2d41b0b401da761ba37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently there are no .mk, Config.in, .patch or .hash files with
executable permissions in the tree.
But we don't want to have that.

So warn when a file checked by check-package has executable permission.

This check will be reused when testing SysV init scripts in the tree.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[Arnout: use context manager for temp dir so it gets deleted]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/checkpackagelib/lib_config.py |  1 +
 utils/checkpackagelib/lib_hash.py   |  1 +
 utils/checkpackagelib/lib_mk.py     |  1 +
 utils/checkpackagelib/lib_patch.py  |  1 +
 utils/checkpackagelib/test_tool.py  | 41 +++++++++++++++++++++++++++++++++++++
 utils/checkpackagelib/tool.py       |  8 ++++++++
 6 files changed, 53 insertions(+)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index c348eec399..b05831f2c3 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -10,6 +10,7 @@ from checkpackagelib.lib import ConsecutiveEmptyLines  # noqa: F401
 from checkpackagelib.lib import EmptyLastLine          # noqa: F401
 from checkpackagelib.lib import NewlineAtEof           # noqa: F401
 from checkpackagelib.lib import TrailingSpace          # noqa: F401
+from checkpackagelib.tool import NotExecutable         # noqa: F401
 
 
 def _empty_or_comment(text):
diff --git a/utils/checkpackagelib/lib_hash.py b/utils/checkpackagelib/lib_hash.py
index 1c595e84b8..5968c809bf 100644
--- a/utils/checkpackagelib/lib_hash.py
+++ b/utils/checkpackagelib/lib_hash.py
@@ -10,6 +10,7 @@ from checkpackagelib.lib import ConsecutiveEmptyLines  # noqa: F401
 from checkpackagelib.lib import EmptyLastLine          # noqa: F401
 from checkpackagelib.lib import NewlineAtEof           # noqa: F401
 from checkpackagelib.lib import TrailingSpace          # noqa: F401
+from checkpackagelib.tool import NotExecutable         # noqa: F401
 
 
 def _empty_line_or_comment(text):
diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 88e4b15c7c..153754b6f1 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -13,6 +13,7 @@ from checkpackagelib.lib import EmptyLastLine          # noqa: F401
 from checkpackagelib.lib import NewlineAtEof           # noqa: F401
 from checkpackagelib.lib import TrailingSpace          # noqa: F401
 from checkpackagelib.lib import Utf8Characters         # noqa: F401
+from checkpackagelib.tool import NotExecutable         # noqa: F401
 
 # used in more than one check
 start_conditional = ["ifdef", "ifeq", "ifndef", "ifneq"]
diff --git a/utils/checkpackagelib/lib_patch.py b/utils/checkpackagelib/lib_patch.py
index e4e914b7f0..caee36158f 100644
--- a/utils/checkpackagelib/lib_patch.py
+++ b/utils/checkpackagelib/lib_patch.py
@@ -8,6 +8,7 @@ import re
 
 from checkpackagelib.base import _CheckFunction
 from checkpackagelib.lib import NewlineAtEof           # noqa: F401
+from checkpackagelib.tool import NotExecutable         # noqa: F401
 
 
 class ApplyOrder(_CheckFunction):
diff --git a/utils/checkpackagelib/test_tool.py b/utils/checkpackagelib/test_tool.py
new file mode 100644
index 0000000000..51c8e0cb27
--- /dev/null
+++ b/utils/checkpackagelib/test_tool.py
@@ -0,0 +1,41 @@
+import os
+import pytest
+import re
+import tempfile
+import checkpackagelib.tool as m
+
+workdir_regex = re.compile(r'/tmp/tmp[^/]*-checkpackagelib-test-tool')
+
+
+def check_file(tool, filename, string, permissions=None):
+    with tempfile.TemporaryDirectory(suffix='-checkpackagelib-test-tool') as workdir:
+        script = os.path.join(workdir, filename)
+        with open(script, 'wb') as f:
+            f.write(string.encode())
+        if permissions:
+            os.chmod(script, permissions)
+        obj = tool(script)
+        result = obj.run()
+        if result is None:
+            return []
+        return [workdir_regex.sub('dir', r) for r in result]
+
+
+NotExecutable = [
+    ('664',
+     'package.mk',
+     0o664,
+     '',
+     []),
+    ('775',
+     'package.mk',
+     0o775,
+     '',
+     ["dir/package.mk:0: This file does not need to be executable"]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,permissions,string,expected', NotExecutable)
+def test_NotExecutable(testname, filename, permissions, string, expected):
+    warnings = check_file(m.NotExecutable, filename, string, permissions)
+    assert warnings == expected
diff --git a/utils/checkpackagelib/tool.py b/utils/checkpackagelib/tool.py
new file mode 100644
index 0000000000..f2007be1ff
--- /dev/null
+++ b/utils/checkpackagelib/tool.py
@@ -0,0 +1,8 @@
+import os
+from checkpackagelib.base import _Tool
+
+
+class NotExecutable(_Tool):
+    def run(self):
+        if os.access(self.filename, os.X_OK):
+            return ["{}:0: This file does not need to be executable".format(self.filename)]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
