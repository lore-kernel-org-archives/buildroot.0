Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7109ECAAD5
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 20:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5350F60D89;
	Sat, 27 Aug 2022 20:42:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5350F60D89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w8tZ9_5s6dLd; Sat, 27 Aug 2022 20:42:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9012B60BF9;
	Sat, 27 Aug 2022 20:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9012B60BF9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6DCD61BF95D
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 20:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54DDA40475
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 20:42:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54DDA40475
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hSr3ZBzUO8aF for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 20:42:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BDE640140
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4BDE640140
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 20:42:38 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id k9so5666190wri.0
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 13:42:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Kzb3Ui5AQ+a75ID/9ggM50YYY7jXk58vmbQCvLx0Smw=;
 b=0WOAFWgWg1aiKWkHEo3f7QedYWv27Eirhn2S3HS2/M/oYPYeBr1fffXjF+ZGkrf1JQ
 Zvs8M4a5YynR+VDRpVAmC5J6cCR3rqJiyYIl3nSGZIiHOnDclb9WnErFdhUtR2RfXruC
 q8OYnL8GdLFqygEdGwxEXNNPRje5m/YnQGATwHFzbcPbwn5fsADzjfxnznArIv9RG4ts
 U13OEvNmOCVNgGTioW0jNd8Cn6lVYuqoqcArLj64nuReUNG1gOloKj3hK27Y/E6HwWyh
 +3rgOSP89TS7gJOwz2Lpe0rYyohE6PAX8ZzKIRPTQ4QK58Yo5wuqGqQjUOkZ6Aeodyh1
 Y8lA==
X-Gm-Message-State: ACgBeo0jnRG1MxtZx0ZQGiEHkziNpuYx1v01i7pabW/uW20L/rr4JDeQ
 qks6b7xe5B0A6THVxSZ99gmFdnSgLGE=
X-Google-Smtp-Source: AA6agR7HpntwGpL0j31HLK5d+9elKPMJlmrh9Dl8diLbNZCSA29eXWL8tAjSB4tL+jaYARuGErtJIw==
X-Received: by 2002:a5d:6d0b:0:b0:222:955a:8774 with SMTP id
 e11-20020a5d6d0b000000b00222955a8774mr2621103wrq.129.1661632956104; 
 Sat, 27 Aug 2022 13:42:36 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 h4-20020a05600c350400b003a54f49c1c8sm4573830wmq.12.2022.08.27.13.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Aug 2022 13:42:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Aug 2022 22:42:33 +0200
Message-Id: <20220827204233.274008-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Kzb3Ui5AQ+a75ID/9ggM50YYY7jXk58vmbQCvLx0Smw=;
 b=bCXyotZehX0xi249I7zsJmbGWIM/WVAMjioH/ggTDgrDWOnexNW6x2cWEKX61HxGSu
 KoAaFrbNTujVFAich9xXDYtowbGDpFfgcrARVtpI5LwjCeOX0cMtr8GzAXipGEAMa6AF
 Gj3SlepV5kbzrBRM12qvEU+x8A6isIEDRgmNQYpieB9QZPJvtO1XnDGdVYcbPMuE0aPp
 nCg7acK15R5NQ18nd8FQuvOgE9cXZ5vn+QzpwDgXAH8tcf7aiwSTOUnCKeZKS6/NUIkj
 kY+00LNMf00oJ/nuz3mij1lm4WlpCPo+68zg7/l3gZA3Re65u/ZEoJip56SCSIgSUw96
 T2Tg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bCXyotZe
Subject: [Buildroot] [PATCH 1/1] arch/Config.in.powerpc: VSX implies altivec
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
Cc: Cyril Bur <cyrilbur@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As spotted by Yann E. Morin in
https://patchwork.ozlabs.org/project/buildroot/patch/20220823212219.5066-1-fontaine.fabrice@gmail.com,
VSX is an extension to AltiVec:
https://en.wikipedia.org/wiki/AltiVec#VSX_(Vector_Scalar_Extension)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 arch/Config.in.powerpc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index c48edd3bb4..9fa0be0d73 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -3,6 +3,7 @@ config BR2_POWERPC_CPU_HAS_ALTIVEC
 
 config BR2_POWERPC_CPU_HAS_VSX
 	bool
+	select BR2_POWERPC_CPU_HAS_ALTIVEC
 
 config BR2_POWERPC_CPU_HAS_SPE
 	bool
@@ -135,11 +136,9 @@ config BR2_powerpc_power6
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_power7
 	bool "power7"
-	select BR2_POWERPC_CPU_HAS_ALTIVEC
 	select BR2_POWERPC_CPU_HAS_VSX
 config BR2_powerpc_power8
 	bool "power8"
-	select BR2_POWERPC_CPU_HAS_ALTIVEC
 	select BR2_POWERPC_CPU_HAS_VSX
 endchoice
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
