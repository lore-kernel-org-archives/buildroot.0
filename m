Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B71DC433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 17:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA5DC81774;
	Sun,  6 Feb 2022 17:28:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PGtgqO8sqohp; Sun,  6 Feb 2022 17:28:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A391281776;
	Sun,  6 Feb 2022 17:28:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6732A1BF59A
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 17:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 612A58141D
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 17:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tr6wzepKJ7IK for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 17:27:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F20F81422
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 17:27:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4C66A82C6C; Sun,  6 Feb 2022 17:20:23 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 18:27:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7947328de48cbea36cadf2d41b0b401da761ba37
X-Git-Newrev: d020368eeae5f85eb125788d07a7b013e13b34c2
X-Patchwork-Hint: ignore
Message-Id: <20220206172023.4C66A82C6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/checkpackagelib/lib_sysv: check SysV
 init scripts
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

commit: https://git.buildroot.net/buildroot/commit/?id=d020368eeae5f85eb125788d07a7b013e13b34c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable the common checks:
 - consecutive empty lines
 - empty last line
 - missing new line at end of file
 - trailing space
 - warn for executable files, with the hint to instead use
   '$(INSTALL) -D -m 0755' in the .mk file

Check indent with tabs:
 - add a simple check function to warn only when the indent is done
   using spaces or a mix of tabs and spaces. It does not check indenting
   levels, but it already makes the review easier, since it
   diferentiates spaces and tabs.

Check variables:
 - check DAEMON is defined
 - when DAEMON is defined, check the filename is in the form S01daemon
 - when PIDFILE is defined, expect it to be in /var/run and defined
   using $DAEMON.

Also add unit test for this.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[Arnout: avoid 'del NotExecutable_base' by importing the module instead
 of the class; refer to manual in warnings]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/check-package                    |   5 ++
 utils/checkpackagelib/base.py          |   3 +
 utils/checkpackagelib/lib_sysv.py      |  68 +++++++++++++++++
 utils/checkpackagelib/test_lib_sysv.py | 131 +++++++++++++++++++++++++++++++++
 utils/checkpackagelib/test_tool.py     |  25 +++++++
 utils/checkpackagelib/tool.py          |   2 +-
 6 files changed, 233 insertions(+), 1 deletion(-)

diff --git a/utils/check-package b/utils/check-package
index 5fb430902d..f64daed84c 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -13,6 +13,7 @@ import checkpackagelib.lib_config
 import checkpackagelib.lib_hash
 import checkpackagelib.lib_mk
 import checkpackagelib.lib_patch
+import checkpackagelib.lib_sysv
 
 VERBOSE_LEVEL_TO_SHOW_IGNORED_FILES = 3
 flags = None  # Command line arguments.
@@ -66,6 +67,8 @@ DO_NOT_CHECK_INTREE = re.compile(r"|".join([
     r"toolchain/toolchain-external/pkg-toolchain-external\.mk$",
     ]))
 
+SYSV_INIT_SCRIPT_FILENAME = re.compile(r"/S\d\d[^/]+$")
+
 
 def get_lib_from_filename(fname):
     if flags.intree_only:
@@ -85,6 +88,8 @@ def get_lib_from_filename(fname):
         return checkpackagelib.lib_mk
     if fname.endswith(".patch"):
         return checkpackagelib.lib_patch
+    if SYSV_INIT_SCRIPT_FILENAME.search(fname):
+        return checkpackagelib.lib_sysv
     return None
 
 
diff --git a/utils/checkpackagelib/base.py b/utils/checkpackagelib/base.py
index 73da925a03..f666e4110b 100644
--- a/utils/checkpackagelib/base.py
+++ b/utils/checkpackagelib/base.py
@@ -24,3 +24,6 @@ class _Tool(object):
 
     def run(self):
         pass
+
+    def hint(self):
+        return ""
diff --git a/utils/checkpackagelib/lib_sysv.py b/utils/checkpackagelib/lib_sysv.py
new file mode 100644
index 0000000000..2ee5f74af7
--- /dev/null
+++ b/utils/checkpackagelib/lib_sysv.py
@@ -0,0 +1,68 @@
+import os
+import re
+
+from checkpackagelib.base import _CheckFunction
+from checkpackagelib.lib import ConsecutiveEmptyLines  # noqa: F401
+from checkpackagelib.lib import EmptyLastLine          # noqa: F401
+from checkpackagelib.lib import NewlineAtEof           # noqa: F401
+from checkpackagelib.lib import TrailingSpace          # noqa: F401
+import checkpackagelib.tool
+
+
+class Indent(_CheckFunction):
+    INDENTED_WITH_SPACES = re.compile(r"^[\t]* ")
+
+    def check_line(self, lineno, text):
+        if self.INDENTED_WITH_SPACES.search(text.rstrip()):
+            return ["{}:{}: should be indented with tabs ({}#adding-packages-start-script)"
+                    .format(self.filename, lineno, self.url_to_manual),
+                    text]
+
+
+class NotExecutable(checkpackagelib.tool.NotExecutable):
+    def hint(self):
+        return ", just make sure you use '$(INSTALL) -D -m 0755' in the .mk file"
+
+
+class Variables(_CheckFunction):
+    DAEMON_VAR = re.compile(r"^DAEMON=[\"']{0,1}([^\"']*)[\"']{0,1}")
+    PIDFILE_PATTERN = re.compile(r"/var/run/(\$DAEMON|\$\{DAEMON\}).pid")
+    PIDFILE_VAR = re.compile(r"^PIDFILE=[\"']{0,1}([^\"']*)[\"']{0,1}")
+
+    def before(self):
+        self.name = None
+
+    def check_line(self, lineno, text):
+        name_found = self.DAEMON_VAR.search(text.rstrip())
+        if name_found:
+            if self.name:
+                return ["{}:{}: DAEMON variable redefined ({}#adding-packages-start-script)"
+                        .format(self.filename, lineno, self.url_to_manual),
+                        text]
+            self.name = name_found.group(1)
+            if '/' in self.name:
+                self.name = os.path.basename(self.name)  # to be used in after() to check the expected filename
+                return ["{}:{}: Do not include path in DAEMON ({}#adding-packages-start-script)"
+                        .format(self.filename, lineno, self.url_to_manual),
+                        text,
+                        'DAEMON="{}"'.format(self.name)]
+            return
+
+        pidfile_found = self.PIDFILE_VAR.search(text.rstrip())
+        if pidfile_found:
+            pidfile = pidfile_found.group(1)
+            if not self.PIDFILE_PATTERN.match(pidfile):
+                return ["{}:{}: Incorrect PIDFILE value  ({}#adding-packages-start-script)"
+                        .format(self.filename, lineno, self.url_to_manual),
+                        text,
+                        'PIDFILE="/var/run/$DAEMON.pid"']
+
+    def after(self):
+        if self.name is None:
+            return ["{}:0: DAEMON variable not defined ({}#adding-packages-start-script)"
+                    .format(self.filename, self.url_to_manual)]
+        expected_filename = re.compile(r"S\d\d{}$".format(self.name))
+        if not expected_filename.match(os.path.basename(self.filename)):
+            return ["{}:0: filename should be S<number><number><daemon name> ({}#adding-packages-start-script)"
+                    .format(self.filename, self.url_to_manual),
+                    "expecting S<number><number>{}".format(self.name)]
diff --git a/utils/checkpackagelib/test_lib_sysv.py b/utils/checkpackagelib/test_lib_sysv.py
new file mode 100644
index 0000000000..9ae840594f
--- /dev/null
+++ b/utils/checkpackagelib/test_lib_sysv.py
@@ -0,0 +1,131 @@
+import os
+import pytest
+import re
+import tempfile
+import checkpackagelib.test_util as util
+import checkpackagelib.lib_sysv as m
+from checkpackagelib.test_tool import check_file as tool_check_file
+
+workdir = os.path.join(tempfile.mkdtemp(suffix='-checkpackagelib-test-sysv'))
+workdir_regex = re.compile(r'/tmp/tmp[^/]*-checkpackagelib-test-sysv')
+
+
+Indent = [
+    ('empty file',
+     'any',
+     '',
+     []),
+    ('empty line',
+     'any',
+     '\n',
+     []),
+    ('ignore whitespace',
+     'any',
+     ' \n',
+     []),
+    ('spaces',
+     'any',
+     'case "$1" in\n'
+     '  start)',
+     [['any:2: should be indented with tabs (url#adding-packages-start-script)',
+       '  start)']]),
+    ('tab',
+     'any',
+     'case "$1" in\n'
+     '\tstart)',
+     []),
+    ('tabs and spaces',
+     'any',
+     'case "$1" in\n'
+     '\t  start)',
+     [['any:2: should be indented with tabs (url#adding-packages-start-script)',
+       '\t  start)']]),
+    ('spaces and tabs',
+     'any',
+     'case "$1" in\n'
+     '  \tstart)',
+     [['any:2: should be indented with tabs (url#adding-packages-start-script)',
+       '  \tstart)']]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', Indent)
+def test_Indent(testname, filename, string, expected):
+    warnings = util.check_file(m.Indent, filename, string)
+    assert warnings == expected
+
+
+NotExecutable = [
+    ('SysV',
+     'sh-shebang.sh',
+     0o775,
+     '#!/bin/sh',
+     ["dir/sh-shebang.sh:0: This file does not need to be executable,"
+      " just make sure you use '$(INSTALL) -D -m 0755' in the .mk file"]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,permissions,string,expected', NotExecutable)
+def test_NotExecutable(testname, filename, permissions, string, expected):
+    warnings = tool_check_file(m.NotExecutable, filename, string, permissions)
+    assert warnings == expected
+
+
+Variables = [
+    ('empty file',
+     'any',
+     '',
+     [['any:0: DAEMON variable not defined (url#adding-packages-start-script)']]),
+    ('daemon and pidfile ok',
+     'package/busybox/S01syslogd',
+     'DAEMON="syslogd"\n'
+     'PIDFILE="/var/run/$DAEMON.pid"\n',
+     []),
+    ('wrong filename',
+     'package/busybox/S01syslog',
+     'DAEMON="syslogd"\n'
+     'PIDFILE="/var/run/${DAEMON}.pid"\n',
+     [['package/busybox/S01syslog:0: filename should be S<number><number><daemon name> (url#adding-packages-start-script)',
+       'expecting S<number><number>syslogd']]),
+    ('no pidfile ok',
+     'S99something',
+     'DAEMON="something"\n',
+     []),
+    ('hardcoded pidfile',
+     'S99something',
+     'DAEMON="something"\n'
+     'PIDFILE="/var/run/something.pid"\n',
+     [['S99something:2: Incorrect PIDFILE value  (url#adding-packages-start-script)',
+       'PIDFILE="/var/run/something.pid"\n',
+       'PIDFILE="/var/run/$DAEMON.pid"']]),
+    ('redefined daemon',
+     'S50any',
+     'DAEMON="any"\n'
+     'DAEMON="other"\n',
+     [['S50any:2: DAEMON variable redefined (url#adding-packages-start-script)',
+       'DAEMON="other"\n']]),
+    ('daemon name with dash',
+     'S82cups-browsed',
+     'DAEMON="cups-browsed"',
+     []),
+    ('daemon with path',
+     'S50avahi-daemon',
+     'DAEMON=/usr/sbin/avahi-daemon',
+     [['S50avahi-daemon:1: Do not include path in DAEMON (url#adding-packages-start-script)',
+       'DAEMON=/usr/sbin/avahi-daemon',
+       'DAEMON="avahi-daemon"']]),
+    ('daemon with path and wrong filename',
+     'S50avahi',
+     'DAEMON=/usr/sbin/avahi-daemon',
+     [['S50avahi:1: Do not include path in DAEMON (url#adding-packages-start-script)',
+       'DAEMON=/usr/sbin/avahi-daemon',
+       'DAEMON="avahi-daemon"'],
+      ['S50avahi:0: filename should be S<number><number><daemon name> (url#adding-packages-start-script)',
+       'expecting S<number><number>avahi-daemon']]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', Variables)
+def test_Variables(testname, filename, string, expected):
+    warnings = util.check_file(m.Variables, filename, string)
+    assert warnings == expected
diff --git a/utils/checkpackagelib/test_tool.py b/utils/checkpackagelib/test_tool.py
index 51c8e0cb27..9e1abbfc23 100644
--- a/utils/checkpackagelib/test_tool.py
+++ b/utils/checkpackagelib/test_tool.py
@@ -39,3 +39,28 @@ NotExecutable = [
 def test_NotExecutable(testname, filename, permissions, string, expected):
     warnings = check_file(m.NotExecutable, filename, string, permissions)
     assert warnings == expected
+
+
+NotExecutable_hint = [
+    ('no hint',
+     "",
+     'sh-shebang.sh',
+     0o775,
+     '#!/bin/sh',
+     ["dir/sh-shebang.sh:0: This file does not need to be executable"]),
+    ('hint',
+     ", very special hint",
+     'sh-shebang.sh',
+     0o775,
+     '#!/bin/sh',
+     ["dir/sh-shebang.sh:0: This file does not need to be executable, very special hint"]),
+    ]
+
+
+@pytest.mark.parametrize('testname,hint,filename,permissions,string,expected', NotExecutable_hint)
+def test_NotExecutable_hint(testname, hint, filename, permissions, string, expected):
+    class NotExecutable(m.NotExecutable):
+        def hint(self):
+            return hint
+    warnings = check_file(NotExecutable, filename, string, permissions)
+    assert warnings == expected
diff --git a/utils/checkpackagelib/tool.py b/utils/checkpackagelib/tool.py
index f2007be1ff..e931272554 100644
--- a/utils/checkpackagelib/tool.py
+++ b/utils/checkpackagelib/tool.py
@@ -5,4 +5,4 @@ from checkpackagelib.base import _Tool
 class NotExecutable(_Tool):
     def run(self):
         if os.access(self.filename, os.X_OK):
-            return ["{}:0: This file does not need to be executable".format(self.filename)]
+            return ["{}:0: This file does not need to be executable{}".format(self.filename, self.hint())]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
