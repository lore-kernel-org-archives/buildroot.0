Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9C4C433F5
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 19:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94CBD41603;
	Sun, 15 May 2022 19:36:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v4TVpYCT4S8i; Sun, 15 May 2022 19:36:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FA8C41505;
	Sun, 15 May 2022 19:36:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A4D241BF3A0
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 19:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93A8781298
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 19:36:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6m21CBNaNZrZ for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 19:36:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 428C981293
 for <buildroot@buildroot.org>; Sun, 15 May 2022 19:36:38 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id k30so5236494wrd.5
 for <buildroot@buildroot.org>; Sun, 15 May 2022 12:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HziJE5MC6emJJbJtY9g0gDsyw+qrFb+E3mAbPOOtF0g=;
 b=L7sKEDO8XFWFNjT1ArwyYShCOxTAMNNjNult7GklVsupviM9FBaVHP7xfEQz3LXcWU
 ovHw4WdQoa9x612LpoCrjOptCcsqgbhCLFrL6/55SJe6n+urL7huSVxLgB5kl0X8EXmv
 pYPdXi2Gih1abjPQrCqrxllzDgZSueBPjIOn95BhXxAsH37sCK4cksVPANm1unjOUiLz
 kPJVeay2vCRsEoWCBK9urO+Jv5fAqB94TmPfp8awmJSTTvz1920T9pkwlMq7GGjJVMYs
 2nFWLO/uJcMpjcCmPLf5ZQf4DgYaTTCvpjInVlcAR6JSSxHlAIdzy2rYH2ZoWQR6iqsJ
 g0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HziJE5MC6emJJbJtY9g0gDsyw+qrFb+E3mAbPOOtF0g=;
 b=GSBFBLAbj8DpQy1DRZuLLfyuHGPclaS8RqyACOtTJNEU89DhNHgDgDDH9QS4uu2bA2
 myd/fq9Wh5iPBJmfQLSPMNoVn+NNlCVsVNKQmo87SwHUrtM1HwUWqW2GGhxSh24KfzGJ
 B3EqeaWAQiqNr4helF4UYiLjH+60u5Fu5QbKL44/5DnUqDloTpI6Gj8A9fGCP+a6iEnu
 3U5bGnH6aky62UtcLAIUtDf5GBaPBwd879NLMB4qh/06fIJv8qflUJ/lb7W0dYK4ZET9
 uoHNhPq9pUp43MB0SENHLp0itNYacAV3+kKDHvdEiwC5g0lYlNVnXJ7sGrzKBYB5cqtX
 tNaQ==
X-Gm-Message-State: AOAM530Of8w6uyfXmjALJz4SXWzAwkoYJGUGRdupyBT3yHtjKLWSdmF3
 R1+DVi2PGDuNfQ9BkX6MjF0FWlQHpSg=
X-Google-Smtp-Source: ABdhPJzNxHaAsP7e4/IlKNAkMRAZXjzOmu9x8KdAHGwLQj/Xx0/sb0DxvDTYbDjNVijMKqkr3ioDAQ==
X-Received: by 2002:a05:6000:2a2:b0:20c:999d:bdec with SMTP id
 l2-20020a05600002a200b0020c999dbdecmr11872260wry.36.1652643396397; 
 Sun, 15 May 2022 12:36:36 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a05600c3b9200b0039702ca236csm2011165wms.29.2022.05.15.12.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 May 2022 12:36:35 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 May 2022 21:36:33 +0200
Message-Id: <20220515193633.180221-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/gcc: restrict hs4x_rel31 to arc gcc fork
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
Cc: Romain Naour <romain.naour@gmail.com>,
 ARC Maintainers <arc-buildroot@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ARC hs4x_rel31 cpu is not supported by upstream gcc version.
Only the generic HS48 processor (BR2_archs4x) is supported
by upstream gcc.

Fixes:
http://autobuild.buildroot.net/results/357a74d53af96d4b868a9d5b9f9ce9432e0c53b5
http://autobuild.buildroot.net/results/bcdf160a3d5ffcccd4402f65aca153faca4b32c2

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: ARC Maintainers <arc-buildroot@synopsys.com>
---
 package/gcc/Config.in.host | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index f6b9b4fa9d..2b12035c4b 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -31,6 +31,8 @@ config BR2_GCC_VERSION_9_X
 	# upstream gcc. C-SKY gcc upstream support not tested
 	# with upstream binutils and glibc.
 	depends on !BR2_csky
+	# ARC HS48 rel 31 only supported by gcc arc fork.
+	depends on !BR2_archs4x_rel31
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 
 config BR2_GCC_VERSION_10_X
@@ -43,6 +45,8 @@ config BR2_GCC_VERSION_10_X
 	# upstream gcc. C-SKY gcc upstream support not tested
 	# with upstream binutils and glibc.
 	depends on !BR2_csky
+	# ARC HS48 rel 31 only supported by gcc arc fork.
+	depends on !BR2_archs4x_rel31
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 
 config BR2_GCC_VERSION_11_X
@@ -54,6 +58,8 @@ config BR2_GCC_VERSION_11_X
 	# that need to be reverted since gcc 8.4, 9.3 and 10.1.
 	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
 	depends on !BR2_sparc
+	# ARC HS48 rel 31 only supported by gcc arc fork.
+	depends on !BR2_archs4x_rel31
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 
 endchoice
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
