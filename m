Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8804EC369CF
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 20:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08DD681440;
	Sat, 19 Apr 2025 20:06:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bOkMdw2AV9hx; Sat, 19 Apr 2025 20:06:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F34A381450
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F34A381450;
	Sat, 19 Apr 2025 20:06:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CCEC228
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6E2E40026
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iSv90Wcwvbds for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 20:06:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2FA240162
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2FA240162
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:06:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CEB1381EA0; Sat, 19 Apr 2025 20:06:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 18:39:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4f7e3f0bdd9200303f5dfc717d9dc45e8c1875d3
X-Git-Newrev: 9e627c1628438818ec3bd8638bd1e3400541a85e
X-Patchwork-Hint: ignore
Message-Id: <20250419200606.CEB1381EA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webengine-chromium: fix
 python 3.13 issue
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: multipart/mixed; boundary="===============3840603969214005951=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3840603969214005951==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9e627c1628438818ec3bd8638bd1e3400541a85e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python was bumped from 3.12.x to 3.13.x since the commit
d63e207eb869063f82c867658676c2903beb08cb.

The module pipes is no longer part of the Python standard library. It
was removed in Python 3.13 after being deprecated in Python 3.11. The
last version of Python that provided the pipes module was Python 3.12.

See[1].

The chromium project in qt5webengine-chromium is very old (87-based[2]).

This backports a change removing the use of pipes that was first
introduced in 114.0.5696.0[3] to fix the error below:

	[174/23445] ACTION //components/resources:about_credits(/builds/buildroot.org/buildroot/output/build/qt5webengine-5.15.14/src/toolchain:target)
	FAILED: gen/components/resources/about_credits.html
	/builds/buildroot.org/buildroot/output/build/qt5webengine-5.15.14/host-bin/python ../../3rdparty/chromium/tools/licenses.py --target-os=linux --depfile gen/components/resources/about_credits.d credits gen/components/resources/about_credits.html
	/builds/buildroot.org/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/build/android/gyp/util/build_utils.py:628: SyntaxWarning: invalid escape sequence '\('
	  r = re.compile('@FileArg\((.*?)\)')
	Traceback (most recent call last):
	  File "/builds/buildroot.org/buildroot/output/build/qt5webengine-5.15.14/src/core/release/../../3rdparty/chromium/tools/licenses.py", line 37, in <module>
	    from util import build_utils
	  File "/builds/buildroot.org/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/build/android/gyp/util/build_utils.py", line 15, in <module>
	    import pipes
	ModuleNotFoundError: No module named 'pipes'

[1]: https://docs.python.org/3/library/pipes.html
[2]: https://github.com/qt/qtwebengine/blob/v5.15.14-lts-lgpl/CHROMIUM_VERSION
[3]: https://github.com/chromium/chromium/commit/4c6fc1984970af4b2b1765014c9ddcd957ad7dda

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/9677167367

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...orted-printed-cmd-when-long-commands-fail.patch | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/package/qt5/qt5webengine-chromium/0011-Shorted-printed-cmd-when-long-commands-fail.patch b/package/qt5/qt5webengine-chromium/0011-Shorted-printed-cmd-when-long-commands-fail.patch
new file mode 100644
index 0000000000..46349abc50
--- /dev/null
+++ b/package/qt5/qt5webengine-chromium/0011-Shorted-printed-cmd-when-long-commands-fail.patch
@@ -0,0 +1,57 @@
+From 1a713c6e4861f0672252425a1ccbfa9f45834d5d Mon Sep 17 00:00:00 2001
+From: Mohamed Heikal <mheikal@chromium.org>
+Date: Tue, 4 Apr 2023 17:04:04 +0000
+Subject: [PATCH] Shorted printed cmd when long commands fail
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Some commands (eg: javac) are very long and when they fail most of the
+screen/log is filled with the actual cmd vs the error message output.
+Shorten printed CMDs to 200 chars unless an environment variable is set.
+
+Bug: None
+Change-Id: I92809a7e4a2b1204931a74fd6239803feddd430e
+Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/4395905
+Reviewed-by: Andrew Grieve <agrieve@chromium.org>
+Commit-Queue: Mohamed Heikal <mheikal@chromium.org>
+Cr-Commit-Position: refs/heads/main@{#1126065}
+Upstream: Backport [https://github.com/chromium/chromium/commit/4c6fc1984970af4b2b1765014c9ddcd957ad7dda]
+Signed-off-by: Gaël PORTAY <gael.portay@rtone.fr>
+[gportay: remove import pipes]
+---
+ chromium/build/android/gyp/util/build_utils.py | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/chromium/build/android/gyp/util/build_utils.py b/chromium/build/android/gyp/util/build_utils.py
+index 02298051702..5fa753af459 100644
+--- a/chromium/build/android/gyp/util/build_utils.py
++++ b/chromium/build/android/gyp/util/build_utils.py
+@@ -12,7 +12,6 @@ import fnmatch
+ import json
+ import logging
+ import os
+-import pipes
+ import re
+ import shutil
+ import stat
+@@ -196,9 +195,14 @@ class CalledProcessError(Exception):
+ 
+   def __str__(self):
+     # A user should be able to simply copy and paste the command that failed
+-    # into their shell.
++    # into their shell (unless it is more than 200 chars).
++    # User can set PRINT_FULL_COMMAND=1 to always print the full command.
++    print_full = os.environ.get('PRINT_FULL_COMMAND', '0') != '0'
++    full_cmd = shlex.join(self.args)
++    short_cmd = textwrap.shorten(full_cmd, width=200)
++    printed_cmd = full_cmd if print_full else short_cmd
+     copyable_command = '( cd {}; {} )'.format(os.path.abspath(self.cwd),
+-        ' '.join(map(pipes.quote, self.args)))
++                                              printed_cmd)
+     return 'Command failed: {}\n{}'.format(copyable_command, self.output)
+ 
+ 
+-- 
+2.39.5
+

--===============3840603969214005951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3840603969214005951==--
