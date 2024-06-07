Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE25C27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 17:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6821A42820;
	Fri,  7 Jun 2024 17:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uXOadBXWoflX; Fri,  7 Jun 2024 17:06:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0E5342817
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0E5342817;
	Fri,  7 Jun 2024 17:06:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2DD7A1BF479
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 195064277B
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v0QMuVCtRp2n for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 17:06:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0F1924277D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F1924277D
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F1924277D
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 17:06:08 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-35dcff36522so2199667f8f.1
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 10:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717779967; x=1718384767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FE6CaGhI8bz9Ka2zxRHI4oBVPdmniC9tYmmMatqguXA=;
 b=m352AusgpBOdyAhIZH6HjGCRS01Puem0rUeb+KX0xDkkjOiN38d5ml5pdTPL/n4ZOD
 0/NhNcTj9kOvZYtxON+jDIskSckq80LaTdr6RpszIf8TEIP9l2ofRKV+e17tQbd7TjPs
 UcwRVGEmY/dXRLIVgBX1gN8BY3p4wTE3oahTvw29nW76NipZhFYQvzXUGR1SLDD/JSuc
 BIvBbKMNEPNQ+vjGObFGinluV74GsJWTFLrsiqcs1i47GFKs90hORdR3OaJFmoIpakNX
 Qx3e0KkZ+oEHljDpib93ei3lM/8uU7ALPDAXx4v+ZMxGK2DCRzFOmCRmLYFPo98atyMR
 39Jg==
X-Gm-Message-State: AOJu0Yw4gwlML8rIRXcd9HcqG9/hEHOE5mUieorOraRsUNPrgOTm7ERY
 Bx5fhnSNEJcWuusbGmUvRwf7O1Vt89vKD1+9phk0aTYzDOkmNTwheoWp7g==
X-Google-Smtp-Source: AGHT+IEWAInEbQmUlhzccb+iv4fkmwBPooNHDA7gfzxrP1VhHeWlC5iOLuntBZn12dZ60Ho2xnQWTA==
X-Received: by 2002:a5d:4b05:0:b0:354:f190:9eb8 with SMTP id
 ffacd0b85a97d-35efed4d373mr2425466f8f.29.1717779967008; 
 Fri, 07 Jun 2024 10:06:07 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e989c9sm4355379f8f.73.2024.06.07.10.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 10:06:06 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri,  7 Jun 2024 19:05:51 +0200
Message-ID: <39b3ed498086259b4e0ef8c48f0de724df05224e.1717779951.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717779951.git.yann.morin.1998@free.fr>
References: <cover.1717779951.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717779967; x=1718384767; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FE6CaGhI8bz9Ka2zxRHI4oBVPdmniC9tYmmMatqguXA=;
 b=k3f8LbsHMhXe6REWG2jK8Ob+J/oAs/CPknFUrEyLQQFpKjJz6dPVOxtl+i+z58uoLE
 Yw77SlCvgQg+xIB0GeBVOel1rOJS+xb/t9itzaNp6PfGh0iGEKpffdg2EzEMf/xHOhQs
 JoLC2SPvYIsLwtfNc8vEpc7gkXFkP1ThmUlkSJe3RZVRKIaDx2kLq29RttxZ0UGpm+qj
 4skIRdakiW2X/ZdNrZ2pYtefIvPrUHm6NwrssElBV+MnawgEfcx05utMQcDmhkU/puWI
 3T6XhwufyHEQcs1f1Z3BYlTBGZKvZX/F7R7vB3JD6HMLioIgFvZ5MCsDkfrp9DxdVqU9
 zPIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=k3f8LbsH
Subject: [Buildroot] [PATCH 10/20 v2] pakcage/pkg-cargo: use post-process
 opts to pass manifest path
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-cargo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 47ce68bf02..41dfcbd096 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -192,7 +192,7 @@ $(2)_DL_ENV += CARGO_HOME=$$(BR_CARGO_HOME)
 
 # If building in a sub directory, use that to find the Cargo.toml
 ifneq ($$($(2)_SUBDIR),)
-$(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(2)_SUBDIR)/Cargo.toml
+$(2)_DOWNLOAD_POST_PROCESS_OPTS += -m$$($(2)_SUBDIR)/Cargo.toml
 endif
 
 # Because we append vendored info, we can't rely on the values being empty
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
