Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77883C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 18:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3265C60E0B;
	Sun, 26 Dec 2021 18:50:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4amqTRKZCUgc; Sun, 26 Dec 2021 18:50:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AA5360E11;
	Sun, 26 Dec 2021 18:50:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A765B1BF391
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 18:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F87D4034A
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 18:50:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 23PP-YR52f3G for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 18:50:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D28940235
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 18:50:17 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id fo11so12240153qvb.4
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 10:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HgdfkuWY39wv/P0yeJfcLFVXpzcUQK8N3ZiS9WU0iEI=;
 b=R4QAxHHt/feG01Z6AGvetCs65hDnU2srL2ch1mMu60rCP9FgTQNgvq4Xm5SVBKMfLF
 WzAi3T8mpQS3fjBg27Pdd42XL3QQflfcid/a7zBH+ZvI5qSnahS+FTRfP97J6zTbmvts
 c/abrlQ1Xbiuf0VGLLjcv5eKsAfTxTOuqwg5hayiwM+OLRS/QBvD9KiWWjdyQWYstFBs
 9lHDhQdkcExBrdE9o3zbFKc+EO5Aa2HAFgbkcdR/94aVd9zdRN/GN6iiRFMcyiu4bWbY
 dewvRCbg/unOWPa4uoSkYP3Cnl6bAm295o3fFdaPrfrXA+DmlMDwfG4vxYp7TDiRnVtW
 1WWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HgdfkuWY39wv/P0yeJfcLFVXpzcUQK8N3ZiS9WU0iEI=;
 b=jBZqYoEuTtt7Xm+yreRGkO1FiYpETwMYuh09KORCbkvONoWSVO23R4iSKo+xcsqA5z
 m0TFyOd2ViSewuWjBcfuQfRTiRhnSZfGglcc6KaOeJrlMBGBIlb68lQNPJfwg4iatmH/
 Ni2mAo/+c9ZEj9attbFsnmmGcEZj1KB9Xhe6zIpb/B7rrnOQeTz8UoMgwYD0/+stHL7E
 qLr7wnkk2dUG2V2IY2rt/Xpav6FUdRQGlLl9/t3k217bzwwYjLGkGAvWsswnP6EKR7PV
 I4NvqU+WZcuq47Bvud6Kld4AaTDxMo9KRyO/ryjkedsgG6zs3mNZFb/NZVh2eERJqzSI
 /BVQ==
X-Gm-Message-State: AOAM532KAu0nriA7mgXOGWff8KUkP2lnxHNU0d2WsbiAhjyAyncEuGrl
 TnEd1ZuHZnsXQsKqiiG16WycWN+WSKQ=
X-Google-Smtp-Source: ABdhPJzML6Ewoyg0oYOAHBOELd4MdkIv4T1f1ZuIYygmnTYFPc9PAjPNjDau+WsN0WvBHubip17EnQ==
X-Received: by 2002:a05:6214:2aab:: with SMTP id
 js11mr12518671qvb.54.1640544615923; 
 Sun, 26 Dec 2021 10:50:15 -0800 (PST)
Received: from localhost.localdomain ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id j22sm12349717qko.68.2021.12.26.10.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 10:50:15 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 15:49:17 -0300
Message-Id: <20211226184919.2753591-4-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211226184919.2753591-1-ricardo.martincoski@gmail.com>
References: <20211226184919.2753591-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/5] utils/checkpackagelib/lib_sysv: check SysV
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Please read the cover letter before applying.
---
 utils/check-package                    |   5 +
 utils/checkpackagelib/base.py          |   3 +
 utils/checkpackagelib/lib_sysv.py      |  66 +++++++++++++
 utils/checkpackagelib/test_lib_sysv.py | 131 +++++++++++++++++++++++++
 utils/checkpackagelib/test_tool.py     |  25 +++++
 utils/checkpackagelib/tool.py          |   2 +-
 6 files changed, 231 insertions(+), 1 deletion(-)
 create mode 100644 utils/checkpackagelib/lib_sysv.py
 create mode 100644 utils/checkpackagelib/test_lib_sysv.py

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
index 0000000000..77e6283b25
--- /dev/null
+++ b/utils/checkpackagelib/lib_sysv.py
@@ -0,0 +1,66 @@
+import os
+import re
+
+from checkpackagelib.base import _CheckFunction
+from checkpackagelib.lib import ConsecutiveEmptyLines  # noqa: F401
+from checkpackagelib.lib import EmptyLastLine          # noqa: F401
+from checkpackagelib.lib import NewlineAtEof           # noqa: F401
+from checkpackagelib.lib import TrailingSpace          # noqa: F401
+from checkpackagelib.tool import NotExecutable as NotExecutable_base
+
+
+class Indent(_CheckFunction):
+    INDENTED_WITH_SPACES = re.compile(r"^[\t]* ")
+
+    def check_line(self, lineno, text):
+        if self.INDENTED_WITH_SPACES.search(text.rstrip()):
+            return ["{}:{}: should be indented with tabs, see package/busybox/S01syslogd".format(self.filename, lineno),
+                    text]
+
+
+class NotExecutable(NotExecutable_base):
+    def hint(self):
+        return ", just make sure you use '$(INSTALL) -D -m 0755' in the .mk file"
+
+
+# avoid check-package running both the parent and child classes. NOTE: NotExecutable_base.__name__ returns 'NotExecutable'
+del NotExecutable_base
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
+                return ["{}:{}: DAEMON variable redefined, see package/busybox/S01syslogd".format(self.filename, lineno),
+                        text]
+            self.name = name_found.group(1)
+            if '/' in self.name:
+                self.name = os.path.basename(self.name)  # to be used in after() to check the expected filename
+                return ["{}:{}: Do not include path in DAEMON, see package/busybox/S01syslogd".format(self.filename, lineno),
+                        text,
+                        'DAEMON="{}"'.format(self.name)]
+            return
+
+        pidfile_found = self.PIDFILE_VAR.search(text.rstrip())
+        if pidfile_found:
+            pidfile = pidfile_found.group(1)
+            if not self.PIDFILE_PATTERN.match(pidfile):
+                return ["{}:{}: For PIDFILE use the same pattern found in package/busybox/S01syslogd".format(self.filename, lineno),
+                        text,
+                        'PIDFILE="/var/run/$DAEMON.pid"']
+
+    def after(self):
+        if self.name is None:
+            return ["{}:0: DAEMON variable not defined, see package/busybox/S01syslogd".format(self.filename)]
+        expected_filename = re.compile(r"S\d\d{}$".format(self.name))
+        if not expected_filename.match(os.path.basename(self.filename)):
+            return ["{}:0: filename should be S<number><number><deamon name>, see package/busybox/S01syslogd".format(self.filename),
+                    "expecting S<number><number>{}".format(self.name)]
diff --git a/utils/checkpackagelib/test_lib_sysv.py b/utils/checkpackagelib/test_lib_sysv.py
new file mode 100644
index 0000000000..290539c0e4
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
+     [['any:2: should be indented with tabs, see package/busybox/S01syslogd',
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
+     [['any:2: should be indented with tabs, see package/busybox/S01syslogd',
+       '\t  start)']]),
+    ('spaces and tabs',
+     'any',
+     'case "$1" in\n'
+     '  \tstart)',
+     [['any:2: should be indented with tabs, see package/busybox/S01syslogd',
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
+     [['any:0: DAEMON variable not defined, see package/busybox/S01syslogd']]),
+    ('daemon and pidfile ok',
+     'package/busybox/S01syslogd',
+     'DAEMON="syslogd"\n'
+     'PIDFILE="/var/run/$DAEMON.pid"\n',
+     []),
+    ('wrong filename',
+     'package/busybox/S01syslog',
+     'DAEMON="syslogd"\n'
+     'PIDFILE="/var/run/${DAEMON}.pid"\n',
+     [['package/busybox/S01syslog:0: filename should be S<number><number><deamon name>, see package/busybox/S01syslogd',
+       'expecting S<number><number>syslogd']]),
+    ('no pidfile ok',
+     'S99something',
+     'DAEMON="something"\n',
+     []),
+    ('hardcoded pidfile',
+     'S99something',
+     'DAEMON="something"\n'
+     'PIDFILE="/var/run/something.pid"\n',
+     [['S99something:2: For PIDFILE use the same pattern found in package/busybox/S01syslogd',
+       'PIDFILE="/var/run/something.pid"\n',
+       'PIDFILE="/var/run/$DAEMON.pid"']]),
+    ('redefined daemon',
+     'S50any',
+     'DAEMON="any"\n'
+     'DAEMON="other"\n',
+     [['S50any:2: DAEMON variable redefined, see package/busybox/S01syslogd',
+       'DAEMON="other"\n']]),
+    ('daemon name with dash',
+     'S82cups-browsed',
+     'DAEMON="cups-browsed"',
+     []),
+    ('daemon with path',
+     'S50avahi-daemon',
+     'DAEMON=/usr/sbin/avahi-daemon',
+     [['S50avahi-daemon:1: Do not include path in DAEMON, see package/busybox/S01syslogd',
+       'DAEMON=/usr/sbin/avahi-daemon',
+       'DAEMON="avahi-daemon"']]),
+    ('daemon with path and wrong filename',
+     'S50avahi',
+     'DAEMON=/usr/sbin/avahi-daemon',
+     [['S50avahi:1: Do not include path in DAEMON, see package/busybox/S01syslogd',
+       'DAEMON=/usr/sbin/avahi-daemon',
+       'DAEMON="avahi-daemon"'],
+      ['S50avahi:0: filename should be S<number><number><deamon name>, see package/busybox/S01syslogd',
+       'expecting S<number><number>avahi-daemon']]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', Variables)
+def test_Variables(testname, filename, string, expected):
+    warnings = util.check_file(m.Variables, filename, string)
+    assert warnings == expected
diff --git a/utils/checkpackagelib/test_tool.py b/utils/checkpackagelib/test_tool.py
index e9e0838103..aab7cb51c9 100644
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
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
