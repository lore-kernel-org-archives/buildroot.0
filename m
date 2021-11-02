Return-Path: <SRS0=drHZ=PV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B3ABC433EF
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 22:20:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E280B61050
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 22:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E280B61050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 899A0608B0;
	Tue,  2 Nov 2021 22:20:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w3Jke1akT0aw; Tue,  2 Nov 2021 22:20:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04DB2608A2;
	Tue,  2 Nov 2021 22:20:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B630E1BF215
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 22:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1C934031F
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 22:20:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MmsODwXv6Ht1 for <buildroot@lists.busybox.net>;
 Tue,  2 Nov 2021 22:20:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6849402A1
 for <buildroot@buildroot.org>; Tue,  2 Nov 2021 22:20:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 8A4711C0002;
 Tue,  2 Nov 2021 22:20:40 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue,  2 Nov 2021 23:20:34 +0100
Message-Id: <20211102222035.719508-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102222035.719508-1-thomas.petazzoni@bootlin.com>
References: <20211102222035.719508-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] utils/getdeveloperlib.py: call
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
