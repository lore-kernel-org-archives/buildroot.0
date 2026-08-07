Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C346C5AC81
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 12:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C494840A96;
	Fri,  7 Aug 2026 12:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3dBO7hrOTLKD; Fri,  7 Aug 2026 12:55:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C36A840A98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786107323;
	bh=Uf4/XyTRu7CmNiSji246RNmGYHhTbVasBwClTa3/p2Y=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d7Gvkc16ejlaLMPNFxX3VCr3iwP1tkVzvrrOdr8Q1J2cMgTw31HOafnP7aM01nG57
	 U0vu/BmvjWxcXlandcRC9J6Y5uIBQnoIcmb/1J8wuT6utL0nT6bDR5K28GSljRm34q
	 85JprKLaDp4A6rnBD56kHUo1v3bgssrYt04gzg5mJh9n5JjOcccBqvWEiIkhnAsxN9
	 fu2iOdj+WVScud//eAWE3ub3HNQOTJdO/I6jKxULrJOx9EzVUOjr2Se6mgLtw9NIel
	 cMt6ID61O+2sCWD1MqBQL+BKL1wkvRotCTSaIFdHveFw+dDVPJt1bNKmQFLCZ7+RJj
	 1t+VKF/EuzEqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C36A840A98;
	Fri,  7 Aug 2026 12:55:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F247D3
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5538240A8F
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pf80pAWWTvj7 for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 12:55:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5551940A96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5551940A96
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5551940A96
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:18 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-c16111a9b8dso35402466b.1
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 05:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786107316; x=1786712116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=8jtjNKeGwXeX0CnSNj8akFtyzKfG1XN4P5Z+E9tHVIE=;
 b=VFZ9EAPmq40BhwsBsgFQVsW3jOgnUXqN6OBXLCvYDENGIFBoDzQUplpBaCq/jMQB7Q
 Zm4w7lBsSecsqluch8u/tDO94k8wJfpIbkyv2ltC9Or3CLm65AuPBoVTdJ6zQbpuYMjy
 6GnuoK2hiUvMpQnMratbxV92OvDKBvkD9tLMc1r0zfJ4fcKiEPrIT0YbpnSrt9upnwKl
 /TifRpDIUrCcPieGnz1mgxBosT3xiCdRWSrBtPjz09YTApzuVh+FuN0xMsKU0b3s1vj2
 5rjxmAePT7aO41Qdbec6W4cEcPv6fEnEw3gAcejel46Lt3MMDyBmY5FAMUHuVdkJQjxi
 m1cA==
X-Gm-Message-State: AOJu0YyyN4qLBLepBQ19zBha60di1mbb2dz+9pMo1D5shnSGXE5s7/0k
 S/TsIb0U6wY00LNzdW7RCmf2vESKaEavRXkx1g3FclQ67aFXOX4FKL70tu82LQEdRhPfdoRobgS
 jvXFA4No=
X-Gm-Gg: AR+sD11+4spsz7JzsoaV8jvZeFmqcvrr1c9pZYb2ZVs2asp6eNFHRFUblueCSvoi5mx
 0DlpA+l/uXFqP9npHtQtS4Hb5oMsqtSCdkbuhO9CXxiRVcyuHRLuwhQlG8z5QGo30fyKil83uzv
 43yusUv554dQ3hr92EmXmWIhzHm8xrpr3ewEaXOmIkomwzy2gzifHEu5N45ZSk90DBBX2dcESGp
 M8uy76W8xQpgbl+n5aPQK5qGPF4ZzBi60z44oCgcduaD0Fbz+V1HsRr9Vkgm343E9RJLl/9oNwG
 nWrb3nMFs7OOwV508/Btjehtex6N22eIlYFR5HB9+wL5++BfeoW23Yz/1nhDnEjFDWK0odaPvC6
 auPUGR5YKdtPkWiMSaWfnWksYeiqV1X3UxWcXFduFHX+gpAyIwldZ9ofy32Z7JgIPQNfLOwTNew
 J2weeW0fu9IJUwSUngQs4bsEQLPhpKK7XQ5HNih4PyNNyhPYLstODITszB9X2RkQD3C/mu8kEMu
 EEhr9+3p/rP0LrMGDOOVVR1ZA/kmZtpliiDyPgPC+Q2CD8+Sa6uqYmY4lTrxjtvKfuv3A7s6i3k
 TcOAqJdpeNWW1D82dqIGS9xDEzlNZMK+zudy+gya9k1PdaM0tNtQyVRp4QU2q0wZ
X-Received: by 2002:a17:907:3d11:b0:c12:927d:a288 with SMTP id
 a640c23a62f3a-c2039af66cemr591495666b.1.1786107316228; 
 Fri, 07 Aug 2026 05:55:16 -0700 (PDT)
Received: from adam.amarulasolutions.com
 (2001-1c00-8183-9900-f185-b195-5f14-b7f0.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8183:9900:f185:b195:5f14:b7f0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2080a29a8fsm49539866b.4.2026.08.07.05.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2026 05:55:15 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Fri,  7 Aug 2026 14:55:04 +0200
Message-ID: <20260807125510.1285300-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807125510.1285300-1-adam.duskett@amarulasolutions.com>
References: <20260807125510.1285300-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1786107316; x=1786712116;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8jtjNKeGwXeX0CnSNj8akFtyzKfG1XN4P5Z+E9tHVIE=;
 b=rutSytE2C4YpFeC7CRXf6fv66aVOIo20WMl1UMg/2JWigSdrWAkq4stxid2xGzDRAX
 HVeqNLD7qNSOlNw7pJwm1fc/uoODy10QplF1my0zlYLC001uw3Y1qLYUtG4tCqEHi4Xw
 dEi437FTu4yJPd4FuS4sH23ZyqYH8HAKtGoQo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=rutSytE2
Subject: [Buildroot] [PATCH 05/11] package/mender-update-modules: add
 persistent-app module
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

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/mender-update-modules/Config.in        | 18 ++++++++++++++++++
 .../mender-update-modules.mk                   |  4 ++++
 2 files changed, 22 insertions(+)

diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index 6ba6f82615..b94a8c76e7 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -137,6 +137,24 @@ comment "ipk support needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
 
+config BR2_PACKAGE_MENDER_UPDATE_MODULES_PERSISTENT_APP
+	bool "persistent-app"
+	help
+	  The Persistent App Update Module installs files to a
+	  user-defined directory on the persistent data partition,
+	  ensuring deployments survive rootfs A/B updates.
+
+	  This module uses the data-partition software filesystem
+	  namespace, which means version tracking in mender
+	  show-provides persists across system updates. When a
+	  rootfs update clears rootfs-image.* provides, the
+	  data-partition.* provides remain intact.
+
+	  The module supports rollback by maintaining backups on
+	  the same persistent partition.
+
+	  https://github.com/mendersoftware/mender-update-modules/tree/master/persistent-app
+
 config BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN
 	bool "podman"
 	depends on BR2_USE_MMU  # podman
diff --git a/package/mender-update-modules/mender-update-modules.mk b/package/mender-update-modules/mender-update-modules.mk
index 1db47cbd15..e33e934590 100644
--- a/package/mender-update-modules/mender-update-modules.mk
+++ b/package/mender-update-modules/mender-update-modules.mk
@@ -36,6 +36,10 @@ ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_IPK),y)
 MENDER_UPDATE_MODULES_MODULES += ipk
 endif
 
+ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_PERSISTENT_APP),y)
+MENDER_UPDATE_MODULES_MODULES += persistent-app
+endif
+
 ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN),y)
 MENDER_UPDATE_MODULES_MODULES += podman
 endif
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
