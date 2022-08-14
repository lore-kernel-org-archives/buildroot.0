Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D12C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33B84404F6;
	Sun, 14 Aug 2022 23:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33B84404F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZnC8Rz5TCwm7; Sun, 14 Aug 2022 23:46:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A81940993;
	Sun, 14 Aug 2022 23:46:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A81940993
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC8741BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70682605AE
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70682605AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XjK7TwDI_1ZP for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:40:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB91D60C09
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB91D60C09
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:40:36 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id s129so5833331vsb.11
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=VEQ9wFAgOFbrGU8pB3DZ6DxSvmDoV/HdPFcJn8pGp9s=;
 b=32MC1goWCiDR7PnuvNbb2GuESIq8g8nvDP2IwH6jRxKP30xtlN4/G93NIDn8b5l2p9
 trDYJeYbUF3/eyQtmPOUpxmvk1PGvRN4rI07JqF3KS8FlU+Q3nSC1jAL3Maqca3wLskD
 xr2jxAZwXXRYQiZeXkv0wSNSNYRXgIpqjnguR24GXG6R/Lwx1shHZcZBgNIT04vXNlkG
 fBCOzNVkk8kgRYkvfFuFrfIEmEJzMCRC+n+LIRqDCqaLoKQlz8EN57Jv40DS6aseUEUl
 d/GpC41UfMWgP5TyDcuxTHWdaP2YD6vgcKc1+XePvhiF/DHJS20pIq5fAy7RofkK6Xe3
 zDqw==
X-Gm-Message-State: ACgBeo2xvyX1AIcHrTExYLv0SASVPhdhuTkVJZ99yiRbLVmKDipglqqT
 mQO3i4ZqADKnRptp0Yckr0v7AGnihC0=
X-Google-Smtp-Source: AA6agR5SeiLrpBe2RAnRTmDT65bJysflTBmZnDtW8WLmQWMI7yGz/CaTCLSRP58qWE7/Y7/RvC8Ecw==
X-Received: by 2002:a67:d71d:0:b0:387:d4bf:1578 with SMTP id
 p29-20020a67d71d000000b00387d4bf1578mr5271950vsj.13.1660520436404; 
 Sun, 14 Aug 2022 16:40:36 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:40:35 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:43 -0300
Message-Id: <20220814233845.2247022-32-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=VEQ9wFAgOFbrGU8pB3DZ6DxSvmDoV/HdPFcJn8pGp9s=;
 b=liaJ1Tqvs0RYqQ064s/LFpxF8sDL0EfiI/gWebNKlmaPprnGggeFtBzxu9XkmgWGxO
 4oLnSTLCQATAgmRtY04VfCJ1aF0eAOBuajx/7/cV74BFrRURKiE8ydqxl9zHNUJ3GJlr
 2a+uMkfzIoYFv0SBMCarO5wZc5DyhdUs9cmzYjc15WAj8mH9KlEycOscWBSM3vdggU+3
 cvIh/vt6QNRrPmnJaxg0wzOJNWprqNThA6aQtqqX7wDumApCkdF8GoCZTqDKF+CpvX42
 V1vq6T12/nt2crLrfaj8AS3m9MXYJcddvq2c3/lKpqCmRTm1dJJ3QAONBWa1VgSzJcLU
 1RGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=liaJ1Tqv
Subject: [Buildroot] [PATCH 31/33] package/libsepol: drop bogus
 BR2_TOOLCHAIN_HEADERS_AT_LEAST_2_6
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The inexistent symbol is reference since this commit from 2020:
'55784bcbfa package/libsepol: set default policy version'

Cc: Clayton Shotwell <clayton.shotwell@collins.com>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/libsepol/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libsepol/Config.in b/package/libsepol/Config.in
index 7516076cd5..5dfd1a41d3 100644
--- a/package/libsepol/Config.in
+++ b/package/libsepol/Config.in
@@ -18,7 +18,6 @@ config BR2_PACKAGE_LIBSEPOL_POLICY_VERSION
 	default 30 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
 	default 29 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 	default 28 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
-	default 26 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_2_6
 	default 25
 	help
 	  The maximum SELinux policy version your kernel supports.
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
