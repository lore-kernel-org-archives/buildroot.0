Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D583C433FE
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 14:12:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9966160FED
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 14:12:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9966160FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79AD98283D;
	Sun, 12 Sep 2021 14:12:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2p2kuKY1F9Dl; Sun, 12 Sep 2021 14:12:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C50A6827E0;
	Sun, 12 Sep 2021 14:12:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A881E1BF471
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 14:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FBDB4050C
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 14:11:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5W-QixS8PPAB for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 14:11:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A86B7404C2
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 14:11:50 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id y132so4716924wmc.1
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 07:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LbF/0GNTSj9vNDp8H4HFW2CrhYIzYocKO1H/RHeSg2c=;
 b=Jf6+1zrQqqteZ2mUr5BCruHyh8cxr/DItGsQh7cwlhpZ6QbLkMPopx7g9Al1RGpR8g
 uhyqGaY8eB/ccx0t9CElikBFd5NJ4r7qFYC+ahbMZAfLa1kiZ96fyLUbEflcrT0x0ZXs
 RhfqIrS7wV8ylo6x2Er+6+bS2MJyS9V2zKn0bK0oaP+xRQ93UCx0ok4dq81N9LMIMRTF
 KYw7rv3kPuG4Hn/WWQpcqUtqaxq+OYk0I3DAJC0KSHYQ1Vt/pQzhPZdaSdO3ssLJzYRb
 NL9xwV2ddetGBOn9F15a26wTwCmWuzLv56FH0GtoJirZuAWf0bcnPkN9J8P3QPSMnXoF
 PR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LbF/0GNTSj9vNDp8H4HFW2CrhYIzYocKO1H/RHeSg2c=;
 b=L9jkBHaOvrAqaLQTWivmb/ctS8E6bYOStZNoUGV67V1QKUBb+ScmDAeGfgZz60MQs6
 v5QP4xVmajmYbMwRihBPQaf2JXOzQEwFwbxoLTBgWG+EN47CDV/in4rNZhSOYh+OBVsU
 Ixfgul+BIMOQ8uUiDmgQGl9AvT/EL+5VeBvKtLOX1ihe8qUnxxNqVP43WGsQSiyipAvX
 k+DX+H1KOPBc3cGmkv5ZzoZOy+CF+SigBu1KGBT3qJcKl0qXTCAbcGCKP4L7H6UoYYdf
 MhJHsPHkUWupNofBDmtLYRnn32z7y9704C7U3sebD0xs5i2aytyBGs4tELaLlAw1Dh1S
 rLnQ==
X-Gm-Message-State: AOAM531QpiZ0ZuZt4jFKK4zUYHEDgoutSsORC2EGlTekpBDaT6LETo3b
 b07I4BQr9QhVy+jBn2t+GROWqK5ccuk=
X-Google-Smtp-Source: ABdhPJwMJIuzOxGVHGMll3F3qh124rDk9ZClxRD5uMT2hA5TwL+Q+j3/h8H2HUe+8CYKfvoANf7lUA==
X-Received: by 2002:a1c:7d4d:: with SMTP id y74mr6848119wmc.181.1631455908940; 
 Sun, 12 Sep 2021 07:11:48 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180022164e4eb697b4ce.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce])
 by smtp.gmail.com with ESMTPSA id i5sm4570062wrc.86.2021.09.12.07.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 07:11:48 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 16:11:31 +0200
Message-Id: <20210912141140.253778-5-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912141140.253778-1-romain.naour@gmail.com>
References: <20210912141140.253778-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 07/16] support/testing: test_lxc bump to kernel
 4.19.204
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

The kernel 4.19.79 curently used by the test doesn't build with host
gcc >= 10 due the gcc default -fno-common. See GCC 10 porting guide [1].

/usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x20): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here

The issue was fixed in 4.19.114 [2]
Bump to the latest 4.19.x version.

[1] https://gcc.gnu.org/gcc-10/porting_to.html
[2] http://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/commit/?id=621f2ded601546119fabccd1651b1ae29d26cd38

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/package/test_lxc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_lxc.py b/support/testing/tests/package/test_lxc.py
index b32b7a20c4..d98bed8761 100644
--- a/support/testing/tests/package/test_lxc.py
+++ b/support/testing/tests/package/test_lxc.py
@@ -12,7 +12,7 @@ class TestLxc(infra.basetest.BRTest):
             BR2_TOOLCHAIN_EXTERNAL=y
             BR2_LINUX_KERNEL=y
             BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-            BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.79"
+            BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
             BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
             BR2_LINUX_KERNEL_DTS_SUPPORT=y
             BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
