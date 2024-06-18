Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365CAC2BA1A
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 21:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6838842B19;
	Tue, 18 Jun 2024 21:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rhH5osCIDNom; Tue, 18 Jun 2024 21:28:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7CE542AE8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7CE542AE8;
	Tue, 18 Jun 2024 21:28:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C4901BF2EA
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 21:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A5EE6081E
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 21:27:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o9sri1VR1iL5 for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 21:27:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A3302605EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3302605EF
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3302605EF
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 21:27:18 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52bc035a7ccso6196637e87.2
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 14:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718746036; x=1719350836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h7zZ0J+fXlAqaJ9lANjXTHcNystjMaptQaRzNJSan0Q=;
 b=WhT8yDDQcBw333rVxF5dGaFgOS0iBWoQakBUdcY5px7RWKwsUlK3hMesscqCWLlMFr
 kEczqlzWqHCWeeigLf5zNaNUS80sUOFUrwCz5VJ4vOIcxuxZ7M6p9Mw84PD+YvaMNYlB
 wFvWolzj5TpBwGw1/qH5YLEI3D4SvadHYnrRlDmOLwKE+7sf4bkdCy5JZDnU76c+vk6X
 EnV2UFKmrgfu8xf9MPTArS2mA6iU/khk2DJpUBgouujLuQphuOQtErxXmctYR7Q45lQt
 sp2XtqnyA08FKhKbcjPEjLOgzJnRqpHXF9PWfEQ3cBkFp3T0LbKcTnn5or9ft2Oh7NHV
 +3Bg==
X-Gm-Message-State: AOJu0YzAtyeez3W6lz2Apz+E/vTLDN+13Q2w+EDDu2hUqSL4reDTd/m7
 riohQxF3fN3vwWvatabzOx87+p58w4OoN0DrYW1eN1m6bqVaz3vw/VmgzQ==
X-Google-Smtp-Source: AGHT+IERffMAlbwuZO3M3J5AHtPap+b4iDmCzUHwYi0Q0u7AQCnc0ZmOIz0DRdrJTuh0Kw1ImqZdYg==
X-Received: by 2002:a2e:a311:0:b0:2e9:6e43:c897 with SMTP id
 38308e7fff4ca-2ec3cff55famr5527501fa.48.1718746036429; 
 Tue, 18 Jun 2024 14:27:16 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c7838fsm17240521fa.100.2024.06.18.14.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 14:27:15 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jun 2024 23:26:30 +0200
Message-ID: <20240618212646.4154474-7-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
References: <20240618131902.2912459-9-roykollensvendsen@gmail.com>
 <20240618212646.4154474-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718746036; x=1719350836; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h7zZ0J+fXlAqaJ9lANjXTHcNystjMaptQaRzNJSan0Q=;
 b=WJwxfeJtC5i2RMBqfBCdpPs73RiX9hyq2aNB37ljKOaV5A1dVlhHbrdoGNMI+dAqCH
 CQqKyn+QBHyyKEAvyVVMCDYVr94tjBEnk0kXkdhP6H38b+AGlkF7a0HY4BwVVkf1i7ZV
 Kfglo7XSTXlx4qeNpenDagQQUW9bhPlSiMg0WpAJBR1Zy4u5bzISMRpRY1+rrH6OyWxV
 wpSR8lnd2BYaW/7HR9IVaNr+5HeyQQ9sFTIhQDLlz9YIVPEwwc5nCzArFn9zZV8ZcViS
 Si63DVB/kneoanoqLw8b2A4/KRu+MaQ6aBTxIyH23jy4uOCMM3pfHBRrTX6BIxmD6ia8
 52dQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WJwxfeJt
Subject: [Buildroot] [PATCH v8 07/14] package/qt6/qt6svg: allow building for
 host
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6svg/qt6svg.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt6/qt6svg/qt6svg.mk b/package/qt6/qt6svg/qt6svg.mk
index 25e87dd208..a9d7eaef51 100644
--- a/package/qt6/qt6svg/qt6svg.mk
+++ b/package/qt6/qt6svg/qt6svg.mk
@@ -37,3 +37,4 @@ QT6SVG_DEPENDENCIES = \
 	qt6base
 
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
