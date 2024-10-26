Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997A8D10BF6
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 11:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 399F9407AA;
	Sat, 26 Oct 2024 11:37:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4w7hp9Krcj8g; Sat, 26 Oct 2024 11:37:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE6A5408D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE6A5408D1;
	Sat, 26 Oct 2024 11:37:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D7F9D5C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B894781F7E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VTi3iczveMFi for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 11:37:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED71081EA5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED71081EA5
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:37:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E77A083988; Sat, 26 Oct 2024 11:37:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 13:37:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 68de69c4d7f61ab5da4dd9cad221fb82e9e1abce
X-Git-Newrev: 6ffcdb52e80b63e68c890aed52ff7f4d00e079b8
X-Patchwork-Hint: ignore
Message-Id: <20241026113753.E77A083988@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/check-package: add inline script
 requirements
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6ffcdb52e80b63e68c890aed52ff7f4d00e079b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 utils/check-package | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/utils/check-package b/utils/check-package
index 872e66c126..6a5e89daa3 100755
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
