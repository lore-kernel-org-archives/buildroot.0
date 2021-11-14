Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D61C433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 17:39:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B56161027
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 17:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B56161027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 513DB4026B;
	Sun, 14 Nov 2021 17:39:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bgzI1oZvBZhq; Sun, 14 Nov 2021 17:39:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA2C640259;
	Sun, 14 Nov 2021 17:39:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 56E9E1BF2BA
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 17:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4568C605FD
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 17:39:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TYg14FRZZkqr for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 17:39:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5154360692
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 17:39:52 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id t30so25860015wra.10
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 09:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/BtjX5tGG32+7BI+QnvIxoFJww62ciM5i94pjtNNwNA=;
 b=TfJCjDoFK72rqGOS7Ae1OrtJxTK36L5sOdeSuj25Bc1jVw0lUH7N3DW9sApNif06FR
 Hwz4NNdzuTsVpK8rf/mlFG9TKoIp/TO+Go8IBrLaiHUrv5NtekYf3rsrPmHf9ott+4bK
 I5rU/kWcyXCYR78L1YoeM/WFC+RfOXzIZhlxSHTQGT2n2Zmvnd5YGx1rWaveevRnaQt2
 IfMTF1AFfiABWg7iVXF8Um+irDjK6VsoXcKV6IDSk73SaHvbkidVGd8/+QXKxJwnr0MO
 0sp9WauYF6KygJsGnOE+yU+CMbaclMS5DcH2HHI4bfx4l4plI98ZV+RLwcBS+Dw3zk5U
 Qzjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/BtjX5tGG32+7BI+QnvIxoFJww62ciM5i94pjtNNwNA=;
 b=WsNtnwNDNfwKBYO6MDz71/3gp/AIwEjRHRNUImj4LXff6y34IhKvu4x85OI08LZFTN
 SV3RoEr0NkIRA7Xd6iT4e3gadxMlT6HSxXGt9NBXGXa4JzAu5C+JKHeV7Oi7pKUfX3XD
 OaLUz6O6uJNV6Ib+VB0R4jnsC433q7LRHX042C2EzY3royTSs4rB4yrhyC+TnFM+tTJA
 ryfLONzJP6NFGULKqsEbqJDZ2yWw4vs7KAEgx6vMMzOZgDl9UvXw9viJ7PlYA0rvo4S5
 UzwAy2OzR0RW0K2uowYDE5roXjzzKzvLmrIzccQFTwTme/dkPwa7FVv26nPoh8Wrfu6b
 Q8qw==
X-Gm-Message-State: AOAM5316m/mA+athKw3s+ObOoLYE07V9IRStm19PVRY6+JcOW2I+Coxf
 F0FUGG8aNrjC6uH8gYlupndM8EOPqUc=
X-Google-Smtp-Source: ABdhPJxlSHV5AfA8l6Xi9HOHY3nqbj6ira432T2LQlxOIq/thtExbRhANVYf+wXTg9Njpwbfp9SeiA==
X-Received: by 2002:a5d:6152:: with SMTP id y18mr39263113wrt.271.1636911590320; 
 Sun, 14 Nov 2021 09:39:50 -0800 (PST)
Received: from atlas.home (arennes-651-1-314-16.w2-12.abo.wanadoo.fr.
 [2.12.73.16])
 by smtp.gmail.com with ESMTPSA id 4sm15354990wrz.90.2021.11.14.09.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 09:39:49 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 18:39:45 +0100
Message-Id: <20211114173945.193852-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2021.02.x] support/testing: test_openssh:
 use Bootlin stable toolchain
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The commit backported by [1] enabled the Bootlin bleeding-edge
toolchain providing 5.4 kernel headers but the openssh test
still use a 4.19 prebuilt kernel. Indeed the prebuilt kernel
has been updated to 5.10 in Buildroot 2021.08 [2].

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/1780867274

[1] 8d4939c9e0342d8b99d863fbdcaf935d42038469
[2] https://git.buildroot.net/buildroot/commit/?id=3cf2782906d5cc05a3966c25518d2ce01f11afc8

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_openssh.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/package/test_openssh.py b/support/testing/tests/package/test_openssh.py
index fe517e8da1..79e07e66d7 100644
--- a/support/testing/tests/package/test_openssh.py
+++ b/support/testing/tests/package/test_openssh.py
@@ -51,6 +51,7 @@ class TestOpenSshGlibc(TestOpensshBase):
         BR2_arm=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
         BR2_PACKAGE_RNG_TOOLS=y
         BR2_TARGET_ROOTFS_CPIO=y
         """
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
