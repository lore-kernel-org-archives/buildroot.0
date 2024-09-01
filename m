Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50D3C54FC6
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 21:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C1E9810AE;
	Sun,  1 Sep 2024 21:21:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rsZTbeUAQExL; Sun,  1 Sep 2024 21:21:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3F48810B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3F48810B4;
	Sun,  1 Sep 2024 21:21:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A324A1BF584
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 21:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B6F96079D
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 21:20:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3IAQphcs25Y for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 21:20:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BBFC460794
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBFC460794
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBFC460794
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 21:20:42 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-374c2b0707fso629735f8f.2
 for <buildroot@buildroot.org>; Sun, 01 Sep 2024 14:20:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725225641; x=1725830441;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FjdlXeQpzt1PpLT0hHcJGlQudrsUFhjBNqhpuLkTq38=;
 b=gCkUL1Zi9i666nW+IABNZ5q6oB7RJqYaHVnUQVDOGwY2L5V/IjM0cRMpXb8SVpg1ds
 HfyvX5+8Urw6bOfOfLc9aIpQmE18hvNwPJD1+9eG6djmX/rL14GKxowGMEop1R3JkJ/t
 MbgQaG2AyDx6SRfOWode8RdU5xw5jpa6b806dkdxOdqdxR0LVLIbFl2SiaRykgbyI4EG
 hu2soG8u+2HdvKQKGSj1xFh9McuQiJY3567RuOZuMAmilD0Py1C457L4Dz5Sdsh2Xru3
 jOaLltBmCT6XIne13lI0KtMwbYGTVMTDqt69sRPBWGT62nuITl+KHkcGbG1HHeK5a7fn
 IGHw==
X-Gm-Message-State: AOJu0YwMN1KXcgL0VX9Ck3PGdE2b2DyTjsoIcbYy3r2KeSoln/K8yTlW
 E/YuJ4IxatMs3EVgB7nrBzBne7z9WVmEvx2Cifxi9NialJEk3PBbbiX9Ug==
X-Google-Smtp-Source: AGHT+IHaJ0C+3qMMYyb13QcVUeLfdO/23fQ8qda8xWV9t2FeYmcjKA7aoY4KAn5zcFwTVoU30BaWKQ==
X-Received: by 2002:a5d:4533:0:b0:371:9121:5642 with SMTP id
 ffacd0b85a97d-374c9460cb7mr1083003f8f.30.1725225640463; 
 Sun, 01 Sep 2024 14:20:40 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee4a5edsm9742102f8f.1.2024.09.01.14.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2024 14:20:40 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  1 Sep 2024 23:20:37 +0200
Message-ID: <fe1f45a8887be5b500474826dd97d42917dbaa20.1725225634.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1725225634.git.yann.morin.1998@free.fr>
References: <cover.1725225634.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725225641; x=1725830441; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FjdlXeQpzt1PpLT0hHcJGlQudrsUFhjBNqhpuLkTq38=;
 b=ddqLStRjw7s7UiAe0X8FjTrttXskJSiYR7+5vm6Wzg9Xsht+XplyGo5Wn54ZTefj7S
 ziolDRmm+Nzxmn13UzNVoXjetzzgbwUgYT+LQ1s+Vym2eSI64zkH+Cc2YbOGPJil6Sq0
 c0vzyr9Wr+JW81gpmBJZUQq2VcAegiWN1b6Zgng7JrpK5jHT6RGS7TH4H1GB0IBmvIJT
 SaMbnPmvPcIiH9g3P4vjbOSzZOk98RlqChu5/cHI4B5sEMAzM15Nr9w3ClQs2dCpiX2E
 07IGLjXobI0Cp4TMPzU1tQqA+dTgf6Jl+7ZVAhzB4ShibFKXcWxtwL9dRtUGbXE4qYkV
 fHWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ddqLStRj
Subject: [Buildroot] [PATCH 6/6 v3] package/network-manager: optional
 gobject-introspection
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
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Introspection gets enabled if gobject-introspection is.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/network-manager/network-manager.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 3937982c5f..a464abcf94 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -26,7 +26,6 @@ NETWORK_MANAGER_DEPENDENCIES = \
 	util-linux
 
 NETWORK_MANAGER_CONF_OPTS = \
-	-Dintrospection=false \
 	-Ddocs=false \
 	-Dtests=no \
 	-Dqt=false \
@@ -50,6 +49,12 @@ ifeq ($(BR2_PACKAGE_DHCPCD),y)
 NETWORK_MANAGER_CONF_OPTS += -Ddhcpcd=/sbin/dhcpcd
 endif
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+NETWORK_MANAGER_CONF_OPTS += -Dintrospection=true
+else
+NETWORK_MANAGER_CONF_OPTS += -Dintrospection=false
+endif
+
 ifeq ($(BR2_PACKAGE_IWD),y)
 NETWORK_MANAGER_DEPENDENCIES += iwd
 NETWORK_MANAGER_CONF_OPTS += -Diwd=true
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
