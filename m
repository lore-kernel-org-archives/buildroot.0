Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4002C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 18:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 471C340911;
	Tue, 21 Jun 2022 18:39:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 471C340911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7j8BzG9zTF1x; Tue, 21 Jun 2022 18:39:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 602BE404DA;
	Tue, 21 Jun 2022 18:39:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 602BE404DA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C27781BF3E9
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 18:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB14783FE1
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 18:39:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB14783FE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yc_PnduKFn1g for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 18:39:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A376A82871
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A376A82871
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 18:39:18 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id z9so7964835wmf.3
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 11:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JzMoYojFNUobg1F+V4EO49cHDNk1xWyvEpdy7N3HBHw=;
 b=3prpPf5MeDcFsT2AlRZ6zzZiPFJPruC4y/imU2wrPlcVviZmyZi9UkeZp0w3UP0Pze
 /b/xAExsyZSvEQZWNNJI4PLHXCCkOkqZUqaV8ASPTpV1MC/CEFLank+zpKMnONbZUQjk
 068jYOKxadzvGdWa33QflmfAl++Co0fpEHe4LKed38VV94FlUtgkCFUREPWAEGLdUs2W
 ekD1ESfbKM5oHctzHkxXJoZUJkkV500BenbgCDikuj/LwYfwZNsrw1SHMCiPbJL4H1Kq
 zzBWl2ms8FIY/wSbjJMfKe6UR1DL3D1kq2ZZSs/Ewu1qBBN6qrWuc4v1vFbUFVM4P8QZ
 kGHQ==
X-Gm-Message-State: AJIora8V6ddpkWrRsp84ce9NXsE1auMfKq/epMMqpHnVf0BgheIw+SU3
 w5P5Yv2+xHx6NsIINMEFl6+NbxaSduE=
X-Google-Smtp-Source: AGRyM1vNif29GQsIoguF+SNLwMKsck6eGNcFgv9bg28xV6BLVKINCqXxOFtJAFAuB13SQocdzEhy4A==
X-Received: by 2002:a05:600c:a03:b0:39e:4f0c:938c with SMTP id
 z3-20020a05600c0a0300b0039e4f0c938cmr31390307wmp.145.1655836756568; 
 Tue, 21 Jun 2022 11:39:16 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a05600c19cc00b0039c4e2ff7cfsm23524010wmq.43.2022.06.21.11.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 11:39:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Jun 2022 20:36:25 +0200
Message-Id: <20220621183625.1395189-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JzMoYojFNUobg1F+V4EO49cHDNk1xWyvEpdy7N3HBHw=;
 b=Nrw2utOVcmQ0QyU80IhFstKlyt99X2M4ikdKxHezmkPN+2UYTGEzLjr30W5SZmPtQg
 ilBiI3Qj/ZVuD0aCsqj+TIZQWAJzAddIaXF6GuEKxSv1KqoqBG1WrQQtg52YjLgtJ6FC
 xZ3Jr7AuDgEcR7NLfv6qrB9Qa8ZQfyUmVwt20CM1RMSxii4McLHtDsnu23cC196cXCL0
 OBITTKp617tby/fEtPbNHs6uutvU7/OaGV2Uobws5wbawaL1LEx+OXb80xJy6L6fH7VD
 y5R7pO61PNaPftTmNjyd5TjxZIcz6JxuMFIpNCU89U3q0ey88OtDfteVS6sK8FRm2Cnt
 RNxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Nrw2utOV
Subject: [Buildroot] [PATCH 1/1] package/paxtest: disable on microblaze
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable paxtest on microblaze to avoid the following build failure:

shlibtest.c:9:1: error: requested alignment '65536' exceeds object file maximum 32768
    9 | char shbss[PAGE_SIZE_MAX] __pagealigned;
      | ^~~~

Updating second patch to set PAGE_SIZE_MAX to 32768 will raise another
build failure:

/tmp/cccMSYDr.s: Assembler messages:
/tmp/cccMSYDr.s: Error: PC relative branch to label buf which is not in the instruction space

Fixes:
 - http://autobuild.buildroot.org/results/aba489143b4017617f67c1012bba1f4687708380

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/paxtest/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/paxtest/Config.in b/package/paxtest/Config.in
index 1e09820ba3..565c45cc19 100644
--- a/package/paxtest/Config.in
+++ b/package/paxtest/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PAXTEST
 	bool "paxtest"
+	depends on !BR2_microblaze
 	# No UCLIBC or MUSL because __NO_A_OUT_SUPPORT
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
@@ -8,4 +9,5 @@ config BR2_PACKAGE_PAXTEST
 	  http://pax.grsecurity.net/docs
 
 comment "paxtest needs a glibc toolchain"
+	depends on !BR2_microblaze
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
