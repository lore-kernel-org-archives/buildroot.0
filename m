Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CC4C71153
	for <buildroot@archiver.kernel.org>; Sun,  3 Sep 2023 19:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9272F4151C;
	Sun,  3 Sep 2023 19:42:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9272F4151C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PBvcJ0To5-QC; Sun,  3 Sep 2023 19:42:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 761C44146F;
	Sun,  3 Sep 2023 19:42:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 761C44146F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 03F3D1BF3CA
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 19:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF50281D5F
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 19:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF50281D5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SssjC2AmhCU9 for <buildroot@lists.busybox.net>;
 Sun,  3 Sep 2023 19:42:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 155A181D5A
 for <buildroot@buildroot.org>; Sun,  3 Sep 2023 19:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 155A181D5A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1FBB86932; Sun,  3 Sep 2023 19:42:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Sep 2023 21:42:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9c74c5b7f4b2fb35ee32c2f1f8fffdd16d4db85
X-Git-Newrev: 19921699b3aaed330343e65418ddca6833bb3cd1
X-Patchwork-Hint: ignore
Message-Id: <20230903194234.F1FBB86932@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pixman: ignore CVE-2023-37769
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

commit: https://git.buildroot.net/buildroot/commit/?id=19921699b3aaed330343e65418ddca6833bb3cd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pixman/pixman.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 6e6d787d27..37eb974c46 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -24,6 +24,13 @@ PIXMAN_CONF_OPTS = \
 	--disable-loongson-mmi \
 	--disable-arm-iwmmxt
 
+# Affects only tests, and we don't build tests (see
+# 0001-Disable-tests.patch). See
+# https://gitlab.freedesktop.org/pixman/pixman/-/issues/76, which says
+# "not sure why NVD keeps assigning CVEs like this. This is just a
+# test executable".
+PIXMAN_IGNORE_CVES += CVE-2023-37769
+
 # The ARM SIMD code from pixman requires a recent enough ARM core, but
 # there is a runtime CPU check that makes sure it doesn't get used if
 # the HW doesn't support it. The only case where the ARM SIMD code
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
