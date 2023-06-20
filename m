Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CA3EB64D7
	for <buildroot@archiver.kernel.org>; Tue, 20 Jun 2023 09:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0514860E4A;
	Tue, 20 Jun 2023 09:01:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0514860E4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qvF31vF5GTZX; Tue, 20 Jun 2023 09:01:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 437D160C14;
	Tue, 20 Jun 2023 09:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 437D160C14
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D06541BF3C3
 for <buildroot@lists.busybox.net>; Tue, 20 Jun 2023 09:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9DA28211F
 for <buildroot@lists.busybox.net>; Tue, 20 Jun 2023 09:01:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9DA28211F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 57hmbkb_vPSn for <buildroot@lists.busybox.net>;
 Tue, 20 Jun 2023 09:01:45 +0000 (UTC)
X-Greylist: delayed 00:07:39 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99C788211E
Received: from mail (kmf.trabucayre.com [91.121.117.161])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99C788211E
 for <buildroot@buildroot.org>; Tue, 20 Jun 2023 09:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost [127.0.0.1])
 by mail (Postfix) with ESMTP id 962E339856;
 Tue, 20 Jun 2023 10:15:19 +0200 (CEST)
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jun 2023 10:15:17 +0200
Message-Id: <1687248918-42301-1-git-send-email-gwenj@trabucayre.com>
X-Mailer: git-send-email 1.6.4.2
Subject: [Buildroot] [PATCH 1/2] package/gnuradio: fix build with
 python-pybind > 2.10.0
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Since commit 0e82c360942907f5a2f379e64e0d211aaff80774 (and since release
2.10.1), a new variable called PYBIND11_PYTHONLIBS_OVERWRITE was introduced
and set to ON by default.

According to comment before this option:
"Overwrite cached values read from Python library (classic search). Turn off if
cross-compiling and manually setting these values."

In buildroot's context this option must be disabled to keep variables
provided by buildroot and lib/app.

This issue affect branches: master, next and tags 2023.02.x, 2023.05.

Fix:
- http://autobuild.buildroot.net/results/7423df5db5237d94bb49e32698828d4fe470e39b/

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/gnuradio/gnuradio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index d9218b533d..a6ac5c929e 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -25,6 +25,7 @@ GNURADIO_CONF_OPTS = \
 	-DENABLE_EXAMPLES=OFF \
 	-DENABLE_GNURADIO_RUNTIME=ON \
 	-DENABLE_TESTING=OFF \
+	-DPYBIND11_PYTHONLIBS_OVERWRITE=OFF \
 	-DXMLTO_EXECUTABLE=NOTFOUND
 
 # For third-party blocks, the gnuradio libraries are mandatory at
-- 
2.39.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
