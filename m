Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4D1CD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 20:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B53C61B23;
	Wed,  3 Jun 2026 20:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 595bC8I5VmEy; Wed,  3 Jun 2026 20:08:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E835A616AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780517309;
	bh=GHAOhABusiQf/AmHLE03+uCgVIBb2qsZ8FC602JMeh4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dmh+THrzvQLAhwJqXYzXNW3FViSGIjpsbQjuX9Gnngv1M0w4LHduwDXOLCMZDM2Je
	 hi+A2D17fEbCRTrySOO9dD800k1EAohwt7xsbPy/yNGEo1dljBHSv+nLLcoP2yyZbm
	 NlFAmPNI6qUyOrlo0Pc7UJFDBtNbRM9ugULUMIPm/PPcT7/Xo3DWsKO00fNuoU6WtY
	 +/zM4TjmPIzJo2s0xihX8kvdeAusQGv+5fJu3evR4inTcQz9At2MRPaVX+ZCkgyaoJ
	 OIA7cAw0Qt1p5z2GJa2r55G7PrnSHvAg/Hxg6uRXkkLAh3mmjUXFeSlofD/hHjvo6S
	 vsZUWn7ILJrzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E835A616AC;
	Wed,  3 Jun 2026 20:08:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 16A51DE
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F050D42870
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nnen1ETGPOjm for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 20:08:27 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com;
 envelope-from=ben.wolsieffer@hefring.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9B2C24280E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B2C24280E
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B2C24280E
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:08:26 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-516d0db9372so114059181cf.2
 for <buildroot@buildroot.org>; Wed, 03 Jun 2026 13:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780517305; x=1781122105;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tjwX2eMcLWX5vzlzCWnHEdxe/SOD85k6rmHFg/2hgzg=;
 b=SWtUVw0/eC7WBoXgfKkhZpLjtytshUa10sJ6OsHiLd5FxoTP3yqSy05ilKKcYGvqp/
 Dfe4dXNaAfHV+AC6pXhibeosDGiXytvMj3WFRcQ7DdN2nJan8KmIQox0Ea2IYNEcHL4I
 AhCMKlZ9iTPklc5oA0sXA6B4gJBzfQKsI0Ma9agPEaeE16Pp80cw8mMiNkGsvJEmYa97
 9hRdELKitN6S/VRgLTDKZSaiRxuoxXltneDftMjh8UFngfLt21ajnJHzur4Kjuj3+WM4
 AthOI8jFfitg11gRuJ5+0A8VEp1IqiLteA6czOT4MeQ0YUbCKI+GkRrTorJ/VgYOi6cB
 r1Qw==
X-Gm-Message-State: AOJu0YzxNoO+Cyw9s9Sfag++P03UDeBuUgzhaM+6cAoFLckNVfkrqxwb
 KqzqbOpKOSDcTUppF5kHVoZPICLXtWva4FzrvB5PAl2Nely+SXdh+Qfgu5DaGuFGMN9aH8qq6Ts
 je5av
X-Gm-Gg: Acq92OHnY4f8Qp2NgGaK02l1GmGVgj3BNzXXyyeg/LqzKGUIEY4WIOzTrYX600+jjG1
 Prjb/ylSXmuZBYHUIZD/aO3j7TuEEQei1zOwZU5iU4JQr8fHmguNxRJtqBmnf31hxOJcrYWz+Jc
 MRr72CNPgwF3IkjEzEZMeCL6uaUOO2ClPLeRP0DkLyxmwHf1IB/p6+J2SsYdQItDPBZWfwYN/FQ
 NS0J7BARy+RjUrzcXh0MFPGKfITNfPaJncHsLXzZrLShjnPgNgyuXBwJQLi7doZ0vsZ6AVjtqFi
 5RWqC7JwFZNvExmsW3oeZcmMDAdmt/EB8jcPbhbecqPvL5Zej6x+0In7LbrRlevq3bXtprg54CD
 PTHcXIsl/V8Pb/pCe+jaKLmoVuMlLvdINtnXnI/5Wj4k/WR2cgYBVglOAvlqgM1ls8taSDoQXT1
 km19Ak76IWxTegX/90zvC/Caub2ueO
X-Received: by 2002:a05:622a:19a2:b0:516:d95f:bf33 with SMTP id
 d75a77b69052e-517787473damr71753551cf.50.1780517305227; 
 Wed, 03 Jun 2026 13:08:25 -0700 (PDT)
Received: from dell-xps-15-9500 ([2601:18c:8002:3d41::5])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51775c60dedsm32024341cf.13.2026.06.03.13.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 13:08:24 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>
Date: Wed,  3 Jun 2026 16:08:13 -0400
Message-ID: <20260603200812.3890816-2-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20251104.gappssmtp.com; s=20251104; t=1780517305; x=1781122105;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tjwX2eMcLWX5vzlzCWnHEdxe/SOD85k6rmHFg/2hgzg=;
 b=Alc/PVZuCMgWDLaCo8p2jmy8T7Vrb/+0LoU+bx/U2vrajlC3g8ALTgBWIye2/4KaGf
 +0ZkxV/GDpN+GJdgrhDs9vc+PfsAdE/r6x355eE7mzqEIEd4y2ZyditKmDGrkhB0g9NB
 OZICahV87zoeSMvYakRi8zfQGZF21qOEELMNOkwktNOlKfc/Bp5pYSHLkdjOmbqH+sOc
 nGeDIkIpHTwX/YEQMPDYA5zleS5GeiD3vVPXhcHIuHaB2CPDIxSd4GpA7z+GNI5OGwEK
 oTroT5k7va4V7nzV1pINv3yZL7p+5Lb/HCfWXa9G+lvd6ZealDMcYmuC/UoFNGHgsAVq
 iSig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=hefring.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=hefring-com.20251104.gappssmtp.com
 header.i=@hefring-com.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=Alc/PVZu
Subject: [Buildroot] [PATCH] package/go: disable on ARM Thumb targets
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Go does not support ARM Thumb/Thumb2, so fails to build when targeting
ARMv7-M. Disable target support for Thumb-only architectures, allowing
host Go programs to be built.

Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
 package/go/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 79950983c1..daa457a718 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -5,8 +5,8 @@ config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE5_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
 	# See https://go.dev/doc/install/source#environment
 	# See src/go/build/syslist.go for the list of supported architectures
-	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
-		|| BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
+	depends on (BR2_arm && BR2_ARM_CPU_HAS_ARM && BR2_TOOLCHAIN_SUPPORTS_PIE) \
+		|| BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
 		|| BR2_mips64 || BR2_mips64el || BR2_riscv || BR2_s390x
 	depends on !BR2_ARM_CPU_ARMV4
 	# MIPS R6 support in Go has not yet been developed.
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
