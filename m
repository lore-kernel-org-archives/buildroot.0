Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E33C25B7E
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 15:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D299442423;
	Fri, 31 May 2024 15:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9WyLazeRvGLt; Fri, 31 May 2024 15:14:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7479542427
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7479542427;
	Fri, 31 May 2024 15:14:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 89EB21D5418
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 15:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 746F160605
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 15:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yjtl0rJDDIw0 for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 15:13:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B942F61147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B942F61147
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B942F61147
 for <buildroot@buildroot.org>; Fri, 31 May 2024 15:13:45 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52b7ffd9f6eso1550151e87.3
 for <buildroot@buildroot.org>; Fri, 31 May 2024 08:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717168423; x=1717773223;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=21UFWOVnYW8FI4pO+T6CqSbeOWzlIFQSkCQzYFe8WgY=;
 b=H0CChDFwV2CJ3MViYrUQcHepwGyy+5zcXuVd9wKwSvXR5vdrmG6rQ6xWjz4UgWFJtu
 AJVyGtnVraImPvtf7t8D/4CxAqbYNHsxSOwuM2KEfZyPXFuUPcKpAUQ3KVm+GBYAXBSJ
 nO17TgLSmC9uqHFXGK5CUTb3Jysqt6CCbX3Oqy3uPlUWfrpJzj92dEGZTjgffg7tnSeo
 YdoXtbryPEFb9oa9UvSjvyNoqvTDh1hs5pLv7o4hU6zwV9L+IlD10GDA4YsVDg9nfM9o
 NDSnfKkLb2qq+D/Nnf64vBXfQb2X77dwH8CB/je5HN3N7RFGqxekF+4fbrr/lJ5Y+wD9
 Tdhw==
X-Gm-Message-State: AOJu0Yx0IDJwemaw1eSOKNb1yj8fb9vjtn4KuNuIn3TQ5lWEEJ5ul6qv
 aMJzxGCGUoJuvotKcUGYH9h6usLCiCPIEvq9SbS/ju2v4KSOaavB5DatyICT
X-Google-Smtp-Source: AGHT+IFha9H1Ef6CkswgthWAlVbk3kDK9uBlUg7oyXv+lQfRsG8s6hMLR17ghBw2gwQjXf6nqk+LWg==
X-Received: by 2002:a19:5e5d:0:b0:52b:6ccf:e631 with SMTP id
 2adb3069b0e04-52b89596780mr1483991e87.41.1717168423244; 
 Fri, 31 May 2024 08:13:43 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d3f510sm362599e87.90.2024.05.31.08.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 08:13:42 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Fri, 31 May 2024 17:13:08 +0200
Message-ID: <20240531151325.2443323-7-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240531151325.2443323-1-roy.kollen.svendsen@akersolutions.com>
References: <20240513220328.1085629-1-roykollensvendsen@gmail.com>
 <20240531151325.2443323-1-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717168423; x=1717773223; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=21UFWOVnYW8FI4pO+T6CqSbeOWzlIFQSkCQzYFe8WgY=;
 b=mJa47sIdYhzOMptXzAKQQ48C9NhtOU+syFUw8B8x/GR09iacUEhHQbxmzgtnMogxId
 e6IFzk4q/+6vq+MSe5LqXCs3uAERqKElEdHxl2nJqwaO3mUk2RmMQ0baC1n0RZDA16ar
 +OI36NKz/WG/qlzyfEgURGeaqPX9kMtwzQYbPn0Hf9qSxJr7ko2NFnE/GrWDj7MrOksm
 rBj7qiKrVoirLc1PUsZN81anvaqq6j503fn6rPYCNNGn0Ut8Yaj34pin2gF7ohk99Q4m
 v7areAb9oAjaBRBhKDI6KOh4NApL5lMWZ43XyMtEve75W2ULazzzF+w7he4KActGVEPH
 zj0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mJa47sId
Subject: [Buildroot] [PATCH v5 07/14] package/qt6/qt6svg: allow building for
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
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
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
