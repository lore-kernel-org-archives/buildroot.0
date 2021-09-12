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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B30C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 14:07:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E48C3610CE
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 14:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E48C3610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 874CC826C8;
	Sun, 12 Sep 2021 14:07:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zpTiursPfsDm; Sun, 12 Sep 2021 14:07:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB713825BF;
	Sun, 12 Sep 2021 14:07:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF7F01BF471
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 14:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 981D56075B
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 14:07:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gd2BQ0OfU8NM for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 14:07:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E51260705
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 14:07:10 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 b21-20020a1c8015000000b003049690d882so2162178wmd.5
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 07:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JpUD5OvSk8/+hjUSsl6FXe7qC/ntROAuha1eKj490Ko=;
 b=UO9TNt7dIyd9ERGROTz3XuSoYaHCVV1BKTCUSGI/f15qxPhY+PZQ/r4k9nPcnfTKqw
 iMZULZeCc72U22YgAnKwjhKjnWc2tWqsia5Y7j2ZpNwK/EGq2Vwxbf+feFXHXqH1WLFc
 vd8JZMMANjRi5wZTVO3XwJjYpN2C6LX+BsV4uEmUDjOGSuAX9D5FYXbacpHeRmGLR2cA
 WBMPbSRb+5E5DuQChB5n3vaD7avk4yBXyXn3tM9Fefw0UBfKNm0Uklx2aU24dnd3DhjB
 h7x/LcLW6DbmmfSKtlBo0zQ+PUbl1Pu4QEORCYfN58lfuiyBNKcb7LVP+gDdm9WvjT7D
 /rnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JpUD5OvSk8/+hjUSsl6FXe7qC/ntROAuha1eKj490Ko=;
 b=5MuHsYaJGUlX7YF2Xvkcz2VzhCJY+KEXSQFex9SQz3Z/MAnt9vpipEpJp6NBtj12zF
 enV4GI3bvwsc+Y0x0NpVfpm2EBGb6C1AGaDxdt5oSjeRjfEdFuyL9C+/R9Ro4hNR+kwh
 rPZg3cd93ga+GJp3AEWWdHkXu+CLg2Q4mg27Qnw6yVv1w46PfddYfrsjx505+gm+IgV+
 +R+W9Y8A4MWFWt5YGGmX2mi360islQ+kxxHTyh/cz7iETeQkLYSCs4fRPCtgRLlHaSvx
 gjdMkk8tL41gjL1SSh2w09Cf1MdA52t/bx3wn8bliEjrWfRc2RZr0Jw2QL+RV6TwazIu
 MrVw==
X-Gm-Message-State: AOAM5338nwMBmK7fIiRnzB9I6BEgCFbytHmqlPawoWCk8NYWxKS8hVD0
 JVoz5QYCocwn0ob45hIpfIrKwGTXsCQ=
X-Google-Smtp-Source: ABdhPJwOI//tmZs+Lp6z21dS0D8rchdz0htaj7RnByWQQKMRl49lJTERHnbBp+BZanX/t7rVpNNH3w==
X-Received: by 2002:a1c:4a:: with SMTP id 71mr6907301wma.87.1631455628993;
 Sun, 12 Sep 2021 07:07:08 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180022164e4eb697b4ce.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce])
 by smtp.gmail.com with ESMTPSA id u23sm4183826wmc.24.2021.09.12.07.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 07:07:08 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 16:06:43 +0200
Message-Id: <20210912140658.253602-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 01/16] support/testing: test_file_capabilities:
 bump to kernel 4.19.204
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

The kernel 4.11.3 curently used by the test doesn't build with host
gcc >= 10 due the gcc default -fno-common. See GCC 10 porting guide [1].

/usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x20): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here

Bump to the next LTS release.

[1] https://gcc.gnu.org/gcc-10/porting_to.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/core/test_file_capabilities.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/core/test_file_capabilities.py b/support/testing/tests/core/test_file_capabilities.py
index d797769ddd..fe21d76c94 100644
--- a/support/testing/tests/core/test_file_capabilities.py
+++ b/support/testing/tests/core/test_file_capabilities.py
@@ -13,7 +13,7 @@ class TestFileCapabilities(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
         BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
         BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
