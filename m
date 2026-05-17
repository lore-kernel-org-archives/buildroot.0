Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D53CD4F48
	for <buildroot@archiver.kernel.org>; Sun, 17 May 2026 21:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0CB585878;
	Sun, 17 May 2026 21:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uxjjGW1lmxSm; Sun, 17 May 2026 21:36:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4885B85879
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779053799;
	bh=fNEcZb37dON1R0KyX0ztxzHI1AqlKVtqiFwu6YRr100=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mHDU5c27jkN/7Se2btOSUuQbCW70ajmq8R/TYBWABoH1gZ2JWb2Po2T8ret8CQz34
	 9//AYhIRGWQIY8UsKIoMWlC/NlItLiCtB94VU/XgIrGf2CxahDHC+MZ1+t6YhKzMfy
	 pwm8NMXV/WUCXDYZh7pqYiUdR1VYhEJVZ5bEHdVl9RYaP831sbXMrL0A0p5W9RUOZ+
	 4ISScTqCaNyEeXlZqS1fIdEGwejqZoeI/qgB0+n99kjgUWZmq3DyJ++QNfbwJBVEir
	 yP1iMIbwtvnyTOVuxSjzUUHNCcQB+wOYqXWnsZ5zK85BoXy0ogIS6uCOitRtXjnk6L
	 FFlOnxPXXq4hQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4885B85879;
	Sun, 17 May 2026 21:36:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D73F3265
 for <buildroot@buildroot.org>; Sun, 17 May 2026 21:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4DB74208B
 for <buildroot@buildroot.org>; Sun, 17 May 2026 21:36:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9GGJcz3CVqqR for <buildroot@buildroot.org>;
 Sun, 17 May 2026 21:36:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 039D34208A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 039D34208A
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 039D34208A
 for <buildroot@buildroot.org>; Sun, 17 May 2026 21:36:34 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-48fde648a71so9720015e9.0
 for <buildroot@buildroot.org>; Sun, 17 May 2026 14:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779053793; x=1779658593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=O1veuITypdugGOdpYzaucrjHksbUNnmCYuRcTh8Uq4s=;
 b=FDTxIHcI1Lngyy5eOtR8Ky5sIAtlG5Y6vJQceozgHg2+4Nf0QCGURWtH1yxX58eTiH
 oz6LzTuP23uQaHjEySYTRCguYKQgw91aga/31SDZvNBgJhqoHFTnJKRZKrxA6ESp3W0/
 OI3XGcu+tce4lh6qZt+SqcZUpn4SSuu0ieR8pvSW1eVE+FA/y/VXMHKlX6vY4g9in1OK
 Bifd5XqttqIOnuRaWXVZMYDniSqSseUkEZSutt7nwim89q+Oosh2M+3c/GO2SpGfVUXH
 bbQMuigy+16YJdEkTwa+6MuHW5qPy7evoBGCu9CMkARvrc/3lKqqmTDXwtwaheFRX1aE
 cdcg==
X-Gm-Message-State: AOJu0YzoYcuHflJqESuck1F54d/1ZtJZoYC/YF++VySiphv25h2beInH
 xPf5+R8QwWSWHO2dQcXcqravUIvfs7jEXG+fzOHqWLKCeG2DOaadjgd8ShHtI7LKfEWlb6rgB7E
 eP10BBNE=
X-Gm-Gg: Acq92OGUGgqpCwidZbLqEBA3jdPZu4LuOMhlA7ta8qt3WK31HUu+1j1yChXixwqfDqS
 8vcVudFBwW09BZvKytm0i7SPN6jJNeXvQh1NMi3i1kk0kmpOjiF4XlcM7RJU+Skf5A8MCEnjVR0
 WyaVAj/RTLWsm/K7r59x3PkxmW9Ap8W0Z9+m7yx4OdiehuxFWvu4xV8oPtyomA+hHulOPKCsE/W
 oBr5dRyyfxdryomqC+hqVjHb423zgl0ClXrWJEg+G6L5+47mBOs1Q/rCY3h3XB71rrngZrNyooB
 FRi4D2tdH1uPlsmTnEtZJP5D+necKs0+f6TmLN/VvuNHOsZMIgWV3AMebqG3bn7z5lL2Cj/wFlh
 yTlJgpn/qN/kniT6HLErd8gdJ+chBByQS4XgW6EP90LZf7ctM+JZkDix6XYMW56ZSegK23m6HfK
 m2Jt7T/vT0/dGwj1mjw87XxW1csDjJjlGzgtiK97xYoXiR8vHOptNov9uelzhLPsFoT1l2lMijg
 VeAy0CHHn00nr3j/HfHDqghOw==
X-Received: by 2002:a05:600d:8497:20b0:48f:fed7:d5f7 with SMTP id
 5b1f17b1804b1-48ffed7d7dbmr56546155e9.17.1779053792821; 
 Sun, 17 May 2026 14:36:32 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e767d0bsm30811870f8f.3.2026.05.17.14.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2026 14:36:32 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun, 17 May 2026 23:36:26 +0200
Message-ID: <20260517213626.3730308-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517213626.3730308-1-romain.naour@smile.fr>
References: <20260517213626.3730308-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1779053793; x=1779658593; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O1veuITypdugGOdpYzaucrjHksbUNnmCYuRcTh8Uq4s=;
 b=J9GUAYcx8bika0OPx9IcBvwOrmEBkJ+V2DtPMiiPtAFdwkC6MIdiSIRzcSmF2aEcv+
 QhgijrHFiCKdEHIbNajK0Qr7aPPj3kdOUnSQutKtbHxeHKBzv+K6vOaJODwlSFOzU+Ch
 K2uOX0BOOpTnnH85L+3n28dbzOpO1C78pmKbg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=J9GUAYcx
Subject: [Buildroot] [PATCH 3/3] support/scripts/generate-gitlab-ci-yml:
 generate defconfig jobs with runner tier2 tags
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tier1 runners (saas-linux-small-amd64) are too slow to build a
Buildroot defconfig, especially if a toolchain and a kernel is built.

Use Tier2 runners (saas-linux-medium-amd64) to not waste shared
ressources.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/scripts/generate-gitlab-ci-yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 37b927f142..3a0666798e 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -126,7 +126,7 @@ gen_tests() {
 
     if [ -n "${do_defconfigs}" ]; then
         for cfg in "${defconfigs[@]}"; do
-            printf '%s%s: { extends: .defconfig_%s }\n' \
+            printf '%s%s: { extends: [ .defconfig_%s, .runner-tier2 ]}\n' \
                    "${cfg}" "${defconfigs_ext}" "${do_defconfigs}"
         done
     fi
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
