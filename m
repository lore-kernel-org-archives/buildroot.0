Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CFAC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 14:13:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7106860BD3
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 14:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7106860BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48FBD60BEF;
	Sun, 12 Sep 2021 14:13:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Acn4PFUNdQ2N; Sun, 12 Sep 2021 14:13:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD68F60C11;
	Sun, 12 Sep 2021 14:13:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB9551BF471
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 14:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA8F260BE1
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 14:11:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z7dH_2UZAmps for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 14:11:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 120FF608B8
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 14:11:53 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id u15so4347335wru.6
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 07:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x6OXT43AEZhax/uSPGoqj0cQBDrOexNQFcKs6b1mkbs=;
 b=H6SJ86seAqA7ilj8dhhJKt0XIebjfEbQ62q+jeZq6mTpKK1wjTJKLCN9HGPlO3XAbc
 IEEwUulToiNTGMIncYJkV/IvhuXVGIeHq2UDDMa0/mUUsXXH8wqCnFG6UofPsakNSaLO
 t46LI3syU26PlC/nbIjioKulhEzPdKOFGKev5Ks2iRbFwaNjpNR7fYmMxs3p5KjdpcNb
 /9cvav8U3UPevIp/kYGwmVAzgWW7m73/8E1m3dRFw/yP2pzhxZc93DTQi8aZBWE03sVt
 p2WjyGdM4HLHXfnxgKCCpIaLQnN3v768CiLjIrDaQH4xE83UL0zEKwrWoLf+ByuGw1mh
 yAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x6OXT43AEZhax/uSPGoqj0cQBDrOexNQFcKs6b1mkbs=;
 b=TXfx5HZBbQZ/4XQcbubeBEHfWsyuYc6ZdtFNq8IddJJKwDtlti+GaGO1owAra9KYGv
 z9uub89HzKv1nnJLry0+JEyA85xyJaPaqMsQB1aS2tL1GqXo9nGsXlmxTo0+ErJ+VahW
 15bSod7BW4mv1zcga0ny/lpgcuGoo/s4etYNi8z6yoOxaTd9wLfLEUxgr1OSnQDXgNgd
 1pTid9YePrwbRwp1Q046YCWsDqkt7Wmq1wSPVeJQ1y6mCjagfDj5lKQCsahP++QilE5j
 cSfrhEuCa2nFQYHaQCl5azB/i8aNZ3o8DbooDE5r3RBDoSVcsr2myBQc7yL1mX1S5dvj
 uvEA==
X-Gm-Message-State: AOAM533LXDhklYbwUZB3OOAuvN6L1rjsLXgo9X1Jomx3SFdk3FirPGiM
 +HHOaa38y1u/9QzxGDMBuQRWOKZRsDs=
X-Google-Smtp-Source: ABdhPJzUZJMP3GVGjslGjv24onfDKEOmAwnb9BQ4OJOz7clg6t0v0f39UIDwrs9i0kkHJ7J75PBaTg==
X-Received: by 2002:a5d:4b50:: with SMTP id w16mr7707561wrs.71.1631455911457; 
 Sun, 12 Sep 2021 07:11:51 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180022164e4eb697b4ce.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce])
 by smtp.gmail.com with ESMTPSA id i5sm4570062wrc.86.2021.09.12.07.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 07:11:51 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 16:11:34 +0200
Message-Id: <20210912141140.253778-8-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912141140.253778-1-romain.naour@gmail.com>
References: <20210912141140.253778-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 10/16] support/testing: switch to prebuilt
 toolchain, core2duo to Nehalem
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

To avoid spending some time to build the x86_64 toolchain (~20min),
switch to corei7 cpu (Nahalem) and use the prebuilt Bootlin toolchain.

We have to use the "stable" Bootlin toolchain to use the same kernel version
for the toolchain kernel headers and the running kernel.

With the "bleeding-edge" toolchain we have the "kernel too old" issue
(running kernel 4.19 vs kernel headers 5.4)

Runtime tested locally.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_docker_compose.py | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/support/testing/tests/package/test_docker_compose.py b/support/testing/tests/package/test_docker_compose.py
index 35e659a74d..1ce132c242 100644
--- a/support/testing/tests/package/test_docker_compose.py
+++ b/support/testing/tests/package/test_docker_compose.py
@@ -7,10 +7,9 @@ class TestDockerCompose(infra.basetest.BRTest):
     config = \
         """
         BR2_x86_64=y
-        BR2_x86_core2=y
-        BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
-        BR2_KERNEL_HEADERS_4_19=y
-        BR2_TOOLCHAIN_BUILDROOT_CXX=y
+        BR2_x86_corei7=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE=y
         BR2_SYSTEM_DHCP="eth0"
         BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
         BR2_ROOTFS_POST_SCRIPT_ARGS="{}"
@@ -53,7 +52,7 @@ class TestDockerCompose(infra.basetest.BRTest):
         self.emulator.boot(arch="x86_64",
                            kernel=kernel,
                            kernel_cmdline=["root=/dev/vda", "console=ttyS0"],
-                           options=["-cpu", "core2duo",
+                           options=["-cpu", "Nehalem",
                                     "-m", "512M",
                                     "-device", "virtio-rng-pci",
                                     "-drive", "file={},format=raw,if=virtio".format(rootfs),
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
