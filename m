Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8901C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 10:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83665403D3;
	Mon, 15 Jul 2024 10:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1MbM_TWarD3; Mon, 15 Jul 2024 10:14:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FC90404C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FC90404C0;
	Mon, 15 Jul 2024 10:14:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DE9381BF969
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7BBB403A2
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qU8s1Te1EQNX for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 10:14:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D25B40327
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D25B40327
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 10:14:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5459A86C42; Mon, 15 Jul 2024 10:14:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 12:13:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8dc7445056d1c21e4e4205cfcd92c0b539597e12
X-Git-Newrev: 34857f644b594b1c6f9abc1c24d3045446afd46c
X-Patchwork-Hint: ignore
Message-Id: <20240715101423.5459A86C42@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webengine-chromium:
 backport upstream patch to fix Python 3.12 issue
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

commit: https://git.buildroot.net/buildroot/commit/?id=34857f644b594b1c6f9abc1c24d3045446afd46c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Two Python scripts from the upstream Chromium code base uselessly
imported the "imp" module, causing the build to fail with Python
3.12. This commit backports an upstream patch that fixes this issue.

Traceback (most recent call last):
File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/core/release/../../3rdparty/chromium/mojo/public/tools/mojom/mojom_parser.py", line 23, in <module>
  from mojom.generate import translate
File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/mojo/public/tools/mojom/mojom/generate/translate.py", line 17, in <module>
  from mojom.generate import generator
File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/mojo/public/tools/mojom/mojom/generate/generator.py", line 12, in <module>
  from mojom import fileutil
File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/mojo/public/tools/mojom/mojom/fileutil.py", line 6, in <module>
  import imp
ModuleNotFoundError: No module named 'imp'

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0003-Remove-unused-python-import.patch         | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/qt5/qt5webengine-chromium/0003-Remove-unused-python-import.patch b/package/qt5/qt5webengine-chromium/0003-Remove-unused-python-import.patch
new file mode 100644
index 0000000000..df9e9cfe24
--- /dev/null
+++ b/package/qt5/qt5webengine-chromium/0003-Remove-unused-python-import.patch
@@ -0,0 +1,47 @@
+From f684c6fb3532138e3408fa17d4b6610162647365 Mon Sep 17 00:00:00 2001
+From: Bruno Pitrus <brunopitrus@hotmail.com>
+Date: Tue, 25 Jul 2023 18:34:09 +0000
+Subject: [PATCH] Remove unused python import
+
+The `imp` module has been removed in Python 3.12 causing these scripts to error out.
+
+Change-Id: Ic7c038d21b86052bdda13015f80934db52a2143e
+Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/4714859
+Auto-Submit: Bruno Pitrus <brunopitrus@hotmail.com>
+Reviewed-by: Ken Rockot <rockot@google.com>
+Commit-Queue: Ken Rockot <rockot@google.com>
+Cr-Commit-Position: refs/heads/main@{#1174966}
+Upstream: https://github.com/chromium/chromium/commit/f5f6e361d037c31630661186e7bd7b31d2784cb8
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ chromium/mojo/public/tools/mojom/mojom/fileutil.py    | 1 -
+ chromium/mojo/public/tools/mojom/mojom/parse/lexer.py | 1 -
+ 2 files changed, 2 deletions(-)
+
+diff --git a/chromium/mojo/public/tools/mojom/mojom/fileutil.py b/chromium/mojo/public/tools/mojom/mojom/fileutil.py
+index bf626f54798..e1c823daa3c 100644
+--- a/chromium/mojo/public/tools/mojom/mojom/fileutil.py
++++ b/chromium/mojo/public/tools/mojom/mojom/fileutil.py
+@@ -3,7 +3,6 @@
+ # found in the LICENSE file.
+ 
+ import errno
+-import imp
+ import os.path
+ import sys
+ 
+diff --git a/chromium/mojo/public/tools/mojom/mojom/parse/lexer.py b/chromium/mojo/public/tools/mojom/mojom/parse/lexer.py
+index 3e084bbf22b..1e8b49f245f 100644
+--- a/chromium/mojo/public/tools/mojom/mojom/parse/lexer.py
++++ b/chromium/mojo/public/tools/mojom/mojom/parse/lexer.py
+@@ -2,7 +2,6 @@
+ # Use of this source code is governed by a BSD-style license that can be
+ # found in the LICENSE file.
+ 
+-import imp
+ import os.path
+ import sys
+ 
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
