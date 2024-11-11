Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E955FD2E9F2
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 13:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A99B6400FE;
	Mon, 11 Nov 2024 13:37:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQdECSetPH7V; Mon, 11 Nov 2024 13:37:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 808EE401C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 808EE401C9;
	Mon, 11 Nov 2024 13:37:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 89517DB1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7706840370
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:37:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4n1QZOelB3Pj for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 13:37:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63C74400F8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63C74400F8
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:37:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5159086070; Mon, 11 Nov 2024 13:37:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Nov 2024 11:14:54 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: a21e4b50077e4a428b6805eaf23afbc22153a067
X-Git-Newrev: eafb370e52e2d022987523c7f286cb6f47e90e45
X-Patchwork-Hint: ignore
Message-Id: <20241111133734.5159086070@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] utils/check-package: add
 inline script requirements
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eafb370e52e2d022987523c7f286cb6f47e90e45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The check-package tool requires some PyPi package to be installed before
it can run. This is typically done by manually installing them into the
user's global Python environment or setting up a virtual environment,
then manually installing each dependency.

Python recently defined a format for managing script dependencies as
inline metadata[1]. This can be used with the `uv` tool to run a Python
script and automatically install the minimum required version of Python
and PyPi dependencies.

With this change, it's now possible to run check-package with

  uv run -s ./utils/check-package

Note that, because check-package does not have the '.py' file extension
we must specify the `-s` or `--script` argument. That argument was added
very recently in release 0.4.19[2].

I set the minimum python to 3.9 as that is the oldest version still
supported[3]. I verified 3.9 works by running

  uv run -p 3.9 -s ./utils/check-package `git ls-tree -r --name-only HEAD` --ignore-list=.checkpackageignore

[1] https://packaging.python.org/en/latest/specifications/inline-script-metadata/#script-type
[2] https://github.com/astral-sh/uv/releases/tag/0.4.19
[3] https://devguide.python.org/versions/

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6ffcdb52e80b63e68c890aed52ff7f4d00e079b8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/check-package | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/utils/check-package b/utils/check-package
index 11d1f2896f..8b46a3dc16 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -1,5 +1,12 @@
 #!/usr/bin/env python3
 # See utils/checkpackagelib/readme.txt before editing this file.
+# /// script
+# requires-python = ">=3.9"
+# dependencies = [
+#     "flake8",
+#     "python-magic",
+# ]
+# ///
 
 import argparse
 import inspect
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
