Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECFFC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 10:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77E8D403AA;
	Mon, 15 Jul 2024 10:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KgFosnOiBYWD; Mon, 15 Jul 2024 10:14:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE2994039B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE2994039B;
	Mon, 15 Jul 2024 10:14:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C77061BF3FF
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A768A80DC8
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BEJYSMZOrZcb for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 10:14:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B49D180D45
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B49D180D45
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 10:14:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FFFF86B29; Mon, 15 Jul 2024 10:14:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 12:13:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98dc9a933e28e2a83990b67cacd4ce88f5f4e9b6
X-Git-Newrev: 245dab795ef9ad92be73ccdb5e717c644c4d8190
X-Patchwork-Hint: ignore
Message-Id: <20240715101423.9FFFF86B29@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webengine-chromium: fix
 another Python 3.12 issue
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

commit: https://git.buildroot.net/buildroot/commit/?id=245dab795ef9ad92be73ccdb5e717c644c4d8190
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Further down into the build, another issue pops up:

/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/host-bin/python ../../3rdparty/chromium/tools/grit/grit.py update_resource_ids -o gen/tools/gritsettings/default_resource_ids --add-header --depfile gen/tools/gritsettings/default_resource_ids.d ../../3rdparty/chromium/tools/gritsettings/resource_ids.spec
Traceback (most recent call last):
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/core/release/../../3rdparty/chromium/tools/grit/grit.py", line 14, in <module>
    import grit.grit_runner
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/tools/grit/grit/grit_runner.py", line 19, in <module>
    from grit import util
  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/tools/grit/grit/util.py", line 21, in <module>
    from six.moves import html_entities as entities
ModuleNotFoundError: No module named 'six.moves'

Let's fix it with the partial backport of a much bigger upstream
commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-grit-util.py-fix-Python-3.12-build-issue.patch | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/package/qt5/qt5webengine-chromium/0005-tools-grit-grit-util.py-fix-Python-3.12-build-issue.patch b/package/qt5/qt5webengine-chromium/0005-tools-grit-grit-util.py-fix-Python-3.12-build-issue.patch
new file mode 100644
index 0000000000..f08f6467e2
--- /dev/null
+++ b/package/qt5/qt5webengine-chromium/0005-tools-grit-grit-util.py-fix-Python-3.12-build-issue.patch
@@ -0,0 +1,70 @@
+From 5201c34a4c0f2fed56f6cff3acada3da2405a363 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 13 Jul 2024 16:02:38 +0200
+Subject: [PATCH] tools/grit/grit/util.py: fix Python 3.12 build issue
+
+This commit is an extract from upstream commit
+https://github.com/chromium/chromium/commit/b3abd7e4c9467415da3a5e13d9500d2ab3abc2ec
+which is too large to be backported.
+
+It fixes:
+
+Traceback (most recent call last):
+  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/core/release/../../3rdparty/chromium/tools/grit/grit.py", line 14, in <module>
+    import grit.grit_runner
+  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/tools/grit/grit/grit_runner.py", line 19, in <module>
+    from grit import util
+  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/tools/grit/grit/util.py", line 21, in <module>
+    from six.moves import html_entities as entities
+ModuleNotFoundError: No module named 'six.moves'
+
+Upstream: https://github.com/chromium/chromium/commit/b3abd7e4c9467415da3a5e13d9500d2ab3abc2ec (part of)
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ chromium/tools/grit/grit/util.py | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/chromium/tools/grit/grit/util.py b/chromium/tools/grit/grit/util.py
+index 528d766ad6b..77db06adffb 100644
+--- a/chromium/tools/grit/grit/util.py
++++ b/chromium/tools/grit/grit/util.py
+@@ -8,6 +8,7 @@
+ from __future__ import print_function
+ 
+ import codecs
++import html.entities
+ import io
+ import os
+ import re
+@@ -17,8 +18,6 @@ import tempfile
+ from xml.sax import saxutils
+ 
+ import six
+-from six import StringIO
+-from six.moves import html_entities as entities
+ 
+ from grit import lazy_re
+ 
+@@ -226,7 +225,7 @@ def WrapOutputStream(stream, encoding = 'utf-8'):
+ def ChangeStdoutEncoding(encoding = 'utf-8'):
+   '''Changes STDOUT to print characters using the specified encoding.'''
+   # If we're unittesting, don't reconfigure.
+-  if isinstance(sys.stdout, StringIO):
++  if isinstance(sys.stdout, io.StringIO):
+     return
+ 
+   if sys.version_info.major < 3:
+@@ -280,8 +279,8 @@ def UnescapeHtml(text, replace_nbsp=True):
+       if name == 'nbsp' and not replace_nbsp:
+         return match.group()  # Don't replace &nbsp;
+       assert name != None
+-      if name in entities.name2codepoint:
+-        return six.unichr(entities.name2codepoint[name])
++      if name in html.entities.name2codepoint:
++        return six.unichr(html.entities.name2codepoint[name])
+       else:
+         return match.group()  # Unknown HTML character entity - don't replace
+ 
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
