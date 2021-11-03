Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1262C433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:22:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E1D860F39
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E1D860F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6046560B01;
	Wed,  3 Nov 2021 21:22:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OXQCnFxg7Rex; Wed,  3 Nov 2021 21:21:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3A1B60AED;
	Wed,  3 Nov 2021 21:21:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E1821BF9C8
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DC5C4039F
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:21:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xbZkqA4RN4Nt for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 21:21:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B0B640398
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 21:21:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7FCF98A4A1; Wed,  3 Nov 2021 21:17:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 22:14:39 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 00762d524a99c5586967594280006f20e847c841
X-Git-Newrev: 1830075c47b974848c150c91d705523bec183367
X-Patchwork-Hint: ignore
Message-Id: <20211103211743.7FCF98A4A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] utils/getdeveloperlib.py:
 call Developer.hasfile() with relative path
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

commit: https://git.buildroot.net/buildroot/commit/?id=1830075c47b974848c150c91d705523bec183367
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

In commit
40bb37bd70d46822e803aaa5169dee8ff8b51093 ("utils/getdeveloperlib.py:
use relative paths for files"), the Developer class was changed to use
relative paths, including for its .hasfile() method.

However the check_developers() function of getdeveloperlib.py was not
updated accordingly, and continued to pass absolute paths. This caused
"get-developers -c" to return the entire list of files in Buildroot as
being unmaintained, as none of them were matching the file listed in
the DEVELOPERS file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 79cba4056b0d7c81490262f354bab1cc1ce33267)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/getdeveloperlib.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index 971d69fef5..e686bc793f 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -283,7 +283,7 @@ def check_developers(developers, basepath=None):
     for f in files:
         handled = False
         for d in developers:
-            if d.hasfile(os.path.join(basepath, f)):
+            if d.hasfile(f):
                 handled = True
                 break
         if not handled:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
