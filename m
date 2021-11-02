Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33340C433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:44:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8691460EE9
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8691460EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5333660ABD;
	Wed,  3 Nov 2021 17:44:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EZVNwXIRcDZQ; Wed,  3 Nov 2021 17:44:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE59260634;
	Wed,  3 Nov 2021 17:44:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 659F51BF85D
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 548D26063E
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:44:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OqhqZak9x3UC for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 17:44:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9034760630
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 17:44:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 485408A267; Wed,  3 Nov 2021 17:40:22 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 2 Nov 2021 23:20:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53da6a7c05f75af925d235f22db2142b5067806e
X-Git-Newrev: 79cba4056b0d7c81490262f354bab1cc1ce33267
X-Patchwork-Hint: ignore
Message-Id: <20211103174022.485408A267@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/getdeveloperlib.py: call
 Developer.hasfile() with relative path
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

commit: https://git.buildroot.net/buildroot/commit/?id=79cba4056b0d7c81490262f354bab1cc1ce33267
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 utils/getdeveloperlib.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index f351f05a1f..f2b36862e3 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -282,7 +282,7 @@ def check_developers(developers, basepath=None):
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
