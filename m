Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B8EC00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 11:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F8A94098B;
	Mon,  8 Aug 2022 11:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F8A94098B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YUCx4UDmSUoB; Mon,  8 Aug 2022 11:05:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62B4B40609;
	Mon,  8 Aug 2022 11:05:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62B4B40609
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E23DB1BF34F
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 11:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCFEB81970
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 11:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCFEB81970
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S0CTWv4lWW8z for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 11:05:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A61F481948
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A61F481948
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 11:05:16 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id n4so8701521wrp.10
 for <buildroot@buildroot.org>; Mon, 08 Aug 2022 04:05:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=8sbwPrTKfxOp4anK4B29tY5Y5Wwk/4xn/GN4Cgy7mN0=;
 b=HcLbnkpdQlk2238CY/oSuGPX55spEoE6vHGOrKH5H0+ZEdOeB0WsDMmjqed+pl4GHB
 TdQYXl17ahr6xwhPiBCLY8cq0xhB+GJnJpqW/PzTxlSuA51YOTLTjBbE/xwHXrlnO3ao
 eqn/XsVYRHnoNOzrV+CPDQRSjsBovSbm3cE/wb4YxTKsLn4Tlg3rLgT7UCSximZKbWEu
 B4AmZALjSd3rBIOSo7VKKIegH87XWLmsGU7OG6cNP7drM3gCwz9DKLQhkPpcM6TrzhSI
 8VqTjFq7NRb117lSpzZo0QVQbNdoUdlqlxKVDc6y5bmrhUC1SFVjX2kXNsPt3825Mh/i
 G4CA==
X-Gm-Message-State: ACgBeo0nvJbxrBvonFxwW1xpnNYApHFKrnAIorj0ZK22U4bQdVbKWrk7
 LzUkJf/Z471oBOMkjAmh6Ypv8qLAXk0=
X-Google-Smtp-Source: AA6agR5TI2PoljtOAzMsKjHyE/BV2JxLelfMrp1Y850IBM1/aTY/rwIORpPrVq9txXRDGR/7Afrymg==
X-Received: by 2002:a5d:4f86:0:b0:21e:f78b:33f1 with SMTP id
 d6-20020a5d4f86000000b0021ef78b33f1mr11749188wru.38.1659956714568; 
 Mon, 08 Aug 2022 04:05:14 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a7bce08000000b003a4f29d6f69sm20678962wmc.36.2022.08.08.04.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 04:05:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Aug 2022 13:04:14 +0200
Message-Id: <20220808110414.714381-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=8sbwPrTKfxOp4anK4B29tY5Y5Wwk/4xn/GN4Cgy7mN0=;
 b=iiFn5rheLFStwrhl0Esho+WBL7GUGNmZXlo+Rk+di0ewpyq5s/lZ7SKOECjqGyjWJp
 VVpZUxtMJtwa7EVwTxnkT/B9w4zyEXPVJWdOeEQWGt0u7Wog3v8uhS8U8cplWXNm8Vy9
 Aku6s5GJ1UbhCECtoy/uku6wQ0QpNcODPvCQsEozqCNg3rwUoJjPDGMFF6ZR0gO0xLRc
 bkqWDF8gaGnIvwMOYlp8OHzjMERRRlBx06ZkqnKFy2dKFA99frkRS6DAUmLZd4z6MH81
 foJpCDjFKbp3ugWWLX/dlv4xMac0XgRPVBuYp0TxNwoUmBI1hu27W3bhGPT606EjCNfA
 kmeQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iiFn5rhe
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: add refpolicy custom
 git handling
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a custom case to make sure that a random configuration with an empty
git location for refpolicy doesn't fail. It reverts to
BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION in that case.

Fixes:
 - http://autobuild.buildroot.org/results/98da07a1f9b88e2e8a028a55c8cf76c6ebc28304

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 utils/genrandconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 75757917c2..a56f03681a 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -535,6 +535,13 @@ def fixup_config(sysinfo, configfile):
         if 'BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT=y\n' in configlines:
             return False
 
+   if 'BR2_PACKAGE_REFPOLICY=y\n' in configlines and \
+       'BR2_PACKAGE_REFPOLICY_CUSTOM_GIT=y\n' in configlines and \
+       'BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL=""\n' in configlines:
+        configlines.remove('BR2_PACKAGE_REFPOLICY_CUSTOM_GIT=y\n')
+        configlines.append('BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION=y\n')
+        configlines.remove('BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL=""\n')
+
     if 'BR2_PACKAGE_XVISOR=y\n' in configlines and \
        'BR2_PACKAGE_XVISOR_USE_CUSTOM_CONFIG=y\n' in configlines and \
        'BR2_PACKAGE_XVISOR_CUSTOM_CONFIG_FILE=""\n' in configlines:
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
