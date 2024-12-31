Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2108E77188
	for <buildroot@archiver.kernel.org>; Tue, 31 Dec 2024 15:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A72CA810BA;
	Tue, 31 Dec 2024 15:10:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mi44nh0HRsIn; Tue, 31 Dec 2024 15:10:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B158F810BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B158F810BB;
	Tue, 31 Dec 2024 15:10:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CE367E0F
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 15:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD6C940C22
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 15:10:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B5il6ADC5K9h for <buildroot@buildroot.org>;
 Tue, 31 Dec 2024 15:10:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5500A40DD6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5500A40DD6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5500A40DD6
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 15:10:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 52480C0002;
 Tue, 31 Dec 2024 15:10:05 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Joris Lijssens <joris.lijssens@gmail.com>
Date: Tue, 31 Dec 2024 16:10:03 +0100
Message-ID: <20241231151003.1765652-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735657805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=hD1z/90kzZDh/z+N1jiv0csWdtjElVjuxs8pr0vxZuc=;
 b=Ou4hb6Z9KeblIK1a8RY5iwWzK7+zl7Yxg/R6JJ5spn9BwLdfE2farbG1e05t15Dnunxlks
 SZh1n7X7jr6rw4P13APSIUWIBFkw39RQ+86LCRv/2Bc6tYxCYdQSpO9bpASp3qCuIWAss4
 ZVgdkO373xFOzD7ymL1X2sEKFTwVxPtvqXQWKCtqNnoyJjZcuwiOhIcCcalbfh5USp/cNa
 qQ04I1Al31sg5exLKgbCoxVmdUZfuxCUIcy1BJQNMHQKD/qwgb/WILHpLfbzzfJZb4IJOo
 YRVFQBhzlWUiAlw63BDcJDrbtjqmM+UYA4oiqWCTWBHqZfWhdF9fHlL9IchtvQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ou4hb6Z9
Subject: [Buildroot] [PATCH] package/emlog: backport patch fixing the build
 with Linux 6.12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The emlog kernel module code uses a function that no longer exists in
Linux 6.12. Backport a patch from upstream that fixes this issue.

Fixes:

  https://autobuild.buildroot.org/results/9233db6ca0e70d8e90a3ef59e521d1398724502d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...not-use-no_llseek-with-kernel-6.12.0.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/emlog/0002-emlog-Do-not-use-no_llseek-with-kernel-6.12.0.patch

diff --git a/package/emlog/0002-emlog-Do-not-use-no_llseek-with-kernel-6.12.0.patch b/package/emlog/0002-emlog-Do-not-use-no_llseek-with-kernel-6.12.0.patch
new file mode 100644
index 0000000000..20cacc97be
--- /dev/null
+++ b/package/emlog/0002-emlog-Do-not-use-no_llseek-with-kernel-6.12.0.patch
@@ -0,0 +1,35 @@
+From 35a0e8d33c5a520df458483237966fa1b1024a3f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 14 Dec 2024 09:55:10 -0800
+Subject: [PATCH] emlog: Do not use no_llseek with kernel 6.12.0+
+
+no_llseek is finally gone with 6.12-rc1 [1]
+
+[1] https://github.com/torvalds/linux/commit/cb787f4ac0c2e439ea8d7e6387b925f74576bdf8
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://github.com/nicupavel/emlog/commit/dca01ea62833249d78ac3bdf277b73424bf93e89
+---
+ emlog.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/emlog.c b/emlog.c
+index 2ead738..b45c72d 100644
+--- a/emlog.c
++++ b/emlog.c
+@@ -464,7 +464,12 @@ static const struct file_operations emlog_fops = {
+     .open = emlog_open,
+     .release = emlog_release,
+     .poll = emlog_poll,
+-    .llseek = no_llseek,        /* no_llseek by default introduced at v2.6.37-rc1 */
++#if LINUX_VERSION_CODE < KERNEL_VERSION(6, 12, 0)
++    /* no_llseek by default introduced at v2.6.37-rc1 and
++     * removed in 6.12.0
++     */
++    .llseek = no_llseek,
++#endif
+     .owner = THIS_MODULE,
+ };
+ 
+-- 
+2.47.1
+
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
