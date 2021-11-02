Return-Path: <SRS0=drHZ=PV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C36C433F5
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 22:20:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B9776103C
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 22:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B9776103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17D8D80E56;
	Tue,  2 Nov 2021 22:20:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f4orUbO9x8eo; Tue,  2 Nov 2021 22:20:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E3B080E4C;
	Tue,  2 Nov 2021 22:20:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E2DE51BF215
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 22:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF95580E4C
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 22:20:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bXJEm8_xFKHY for <buildroot@lists.busybox.net>;
 Tue,  2 Nov 2021 22:20:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06D7B80E30
 for <buildroot@buildroot.org>; Tue,  2 Nov 2021 22:20:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 1C12A200005;
 Tue,  2 Nov 2021 22:20:37 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue,  2 Nov 2021 23:20:33 +0100
Message-Id: <20211102222035.719508-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] utils/getdeveloperlib.py: fix
 check_output() return value decoding
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 utils/getdeveloperlib.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index 438d26d68d..f351f05a1f 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -277,7 +277,7 @@ def check_developers(developers, basepath=None):
     if basepath is None:
         basepath = os.getcwd()
     cmd = ["git", "--git-dir", os.path.join(basepath, ".git"), "ls-files"]
-    files = subprocess.check_output(cmd).strip().split("\n")
+    files = subprocess.check_output(cmd).decode(sys.stdout.encoding).strip().split("\n")
     unhandled_files = []
     for f in files:
         handled = False
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
