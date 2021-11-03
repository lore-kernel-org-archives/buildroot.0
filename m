Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BEDAC433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:22:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 271E460F58
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 271E460F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA2C5403A7;
	Wed,  3 Nov 2021 21:22:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h6H3UUZMq1kL; Wed,  3 Nov 2021 21:22:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 156AF4039F;
	Wed,  3 Nov 2021 21:22:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2A5E81BF38A
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B16414039F
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:22:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dV2lGeXYfuZQ for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 21:22:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AB05403A2
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 21:22:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7178F8A4AD; Wed,  3 Nov 2021 21:18:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 22:13:51 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: ea1d65f9da3c1dfb9e2104c31c459e8a96d2c944
X-Git-Newrev: a7d33fb53d537180bd65e381c290dc0ac751346f
X-Patchwork-Hint: ignore
Message-Id: <20211103211829.7178F8A4AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] utils/getdeveloperlib.py:
 fix check_output() return value decoding
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7d33fb53d537180bd65e381c290dc0ac751346f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

In Python 3.x, check_output() returns a "bytes" array, and not a
string. Its result needs to be decoded to be turned into a
string. Without this fix, "get-developers -c" bails out with:

Traceback (most recent call last):
  File "/home/thomas/projets/buildroot/./utils/get-developers", line 105, in <module>
    __main__()
  File "/home/thomas/projets/buildroot/./utils/get-developers", line 53, in __main__
    files = getdeveloperlib.check_developers(devs)
  File "/home/thomas/projets/buildroot/utils/getdeveloperlib.py", line 280, in check_developers
    files = subprocess.check_output(cmd).strip().split("\n")
TypeError: a bytes-like object is required, not 'str'

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 53da6a7c05f75af925d235f22db2142b5067806e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/getdeveloperlib.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index ce822320f8..971d69fef5 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -278,7 +278,7 @@ def check_developers(developers, basepath=None):
     if basepath is None:
         basepath = os.getcwd()
     cmd = ["git", "--git-dir", os.path.join(basepath, ".git"), "ls-files"]
-    files = subprocess.check_output(cmd).strip().split("\n")
+    files = subprocess.check_output(cmd).decode(sys.stdout.encoding).strip().split("\n")
     unhandled_files = []
     for f in files:
         handled = False
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
