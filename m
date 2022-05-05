Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35324C433F5
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 06:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D40424011A;
	Thu,  5 May 2022 06:44:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uVX2WhuKJXiM; Thu,  5 May 2022 06:44:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCBC6400CB;
	Thu,  5 May 2022 06:44:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 54A6A1BF3C5
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 06:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50DED418E8
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 06:44:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T30eRqOHcRXk for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 06:44:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90C3D418DE
 for <buildroot@buildroot.org>; Thu,  5 May 2022 06:44:12 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id e194so3793480iof.11
 for <buildroot@buildroot.org>; Wed, 04 May 2022 23:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+KNdue3mmNFcNlGB09M9qrjNSLDcIZ4aLaDVDiplyU4=;
 b=mzMi2Hp1Mtg/Gq6TyzMQKE8GRHrfPYgyd2lXA4oI37zl0P8dVaMPUfWVEaLSoU9Q3p
 6jdLMbbRqahDq6rjmvT5Qs1txOKp99FCcafvAsCUXSxEVyfNsQzxkhb5hotbR7gi2BUx
 evPkEgdkE3qQhKyUUTsR5dfaeiz3yoKFf6rOZKrrJKZ0Q5rHBp1R1SXC1savX+L23BuJ
 bwkuln0E2nB1vbg/sf6H/CKdB7iIaCiCOPan8jxVx8y5RDZLFl9bWM1GL4HMUoDvNO1Y
 G4of3Vx93henWWEpvP/vQ6ZKl9yEfcplO7fO2DNkmH5y0d1h1IqKIVy2cuChcJ9yZeKD
 GnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+KNdue3mmNFcNlGB09M9qrjNSLDcIZ4aLaDVDiplyU4=;
 b=3gro6I2mjxv4kCWUMSMFR+k96pLBsK9WizfBzT2Sk5uN9bDTIFxJIJhsGd/mktckoU
 R6iuxb5MU3eUkVkJCXLBTDVytGl39aMh0N8txMxXu/JvbiKj4uP7gtUyGsZrv7YVOYYa
 bUkZoHRNuc7m/diVkuZi2BKOD1V2fhX3w5X8qya6stpK2eWji3w6X9O31ntFY5a3kVl4
 NMmdgqp2P57i4sj8XvWAH82A60KzZ9CC2xoAjHjWVMR6QjtTWQj3CP0DJLnciY7NGcbb
 GF0k9Rpiegy7tY8zrqSN6Mo3dfJw7dWxSvgKCv/XtwFBoYeqFespirvSrTACatGELg5+
 lcrA==
X-Gm-Message-State: AOAM532Jh2ckruP+rK4TuCgwBJsM62EFoWsTyyJuw+Sdz0b+8yiKlUak
 dcnYghiZfCRD+iEhWGjOMRNTY7s61I4=
X-Google-Smtp-Source: ABdhPJwXbPFfxEpevpafXXsN4EywJ94LG3CRH9F/xcudZbg83zr+3r50VvJw4Kbc29Y9fhSrsx+qNA==
X-Received: by 2002:a05:6638:40ac:b0:328:6b81:f9e8 with SMTP id
 m44-20020a05663840ac00b003286b81f9e8mr10080709jam.153.1651733051524; 
 Wed, 04 May 2022 23:44:11 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 y4-20020a927d04000000b002cde6e352e0sm254048ilc.42.2022.05.04.23.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 23:44:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  5 May 2022 00:43:53 -0600
Message-Id: <20220505064353.3051663-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pkg-meson: disable meson wrap
 downloads for host packages
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This was already disabled for target packages in:
12ba3563655e3ebab252e52daa6c710864fa869f

We need to disable wrap downloads for host meson packages as well.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-meson.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index f1390a18d0..465be41567 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -156,6 +156,7 @@ define $(2)_CONFIGURE_CMDS
 		--localstatedir=$$(HOST_DIR)/var \
 		--default-library=shared \
 		--buildtype=release \
+		--wrap-mode=nodownload \
 		-Dstrip=true \
 		$$($$(PKG)_CONF_OPTS) \
 		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
