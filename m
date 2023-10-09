Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E684AE95A91
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 14:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7148061263;
	Mon,  9 Oct 2023 14:29:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7148061263
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lhu_Rk-cgj13; Mon,  9 Oct 2023 14:29:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B79A76125C;
	Mon,  9 Oct 2023 14:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B79A76125C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D56AB1BF314
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 14:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAFA7418EB
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 14:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAFA7418EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0AgIT3qU5KxS for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 14:29:30 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4DE5E41796
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 14:29:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DE5E41796
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-533df112914so7705297a12.0
 for <buildroot@buildroot.org>; Mon, 09 Oct 2023 07:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696861768; x=1697466568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YOUevQpiswff/ubS5CxgnwLxX53fC/h5scuh+kLwuvs=;
 b=CmFTdlj/0D7wPTSxKoRiEgv6m3uWZonHVUUwqmRl8jzL8B3RhtT5NfId8+qg6jb1fo
 awD7CtSU4eRmXsv9oqKqcUaqRouGuclZZimQrobT5o56Fx86HfkHAkduEntz7otZseiQ
 q6gzhThnmq8DRDSnTpDq9otaDJ1GY/7smzesvHmxSJ562HEW4+AQzqxcDQ2D0FdlCEQl
 Ar9cojtE61Jx9dZPpNw2D94fMiDL5/rI0i5tqUnhFATIgmNV3mcmkuiqzrml151Yip8p
 E40Q9EgnNx2AwkDo29Mueuw7mDhqBDgN7Fge8bytn8bz1l9l+LVqhdric1iNiH8h+ZFr
 G7zQ==
X-Gm-Message-State: AOJu0Yx0ZNW9YJR9uSa9SNnHSqGmSPogP2uUT9d3lOgs/NxRoLgMuy4u
 us8li1G5ojkeykNatxr09sB8Rfm+D98b2JFruVeUaA==
X-Google-Smtp-Source: AGHT+IHXBgp1pAFKPWFIld+vVpfXVBQUErlQOCzDrIZuwD602OaKH7KgpBq4qzeok8RaScDHq0jP/w==
X-Received: by 2002:a17:906:209a:b0:9ae:69b8:322b with SMTP id
 26-20020a170906209a00b009ae69b8322bmr12905213ejq.60.1696861767457; 
 Mon, 09 Oct 2023 07:29:27 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 kt13-20020a170906aacd00b009a5f1d15644sm6701412ejb.119.2023.10.09.07.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 07:29:27 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  9 Oct 2023 16:29:14 +0200
Message-ID: <20231009142915.1775087-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009142915.1775087-1-adam.duskett@amarulasolutions.com>
References: <20231009142915.1775087-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696861768; x=1697466568;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YOUevQpiswff/ubS5CxgnwLxX53fC/h5scuh+kLwuvs=;
 b=NKJfN+zNUUoI+KeZxaWuFhJGhNQlV90UPN4fuvFPPJ7LZ1V/hTSebf5yDtxRxgZZfb
 0OmzItkK+RP5ZpPG0/HUF1qoHP6/SGD/eExNtpvRKzNBUmmy22DM35cBJmE5upOmj9t5
 IYwPwyGM36RE5u/XKOJYQG/G+r+NVToeG4uy8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=NKJfN+zN
Subject: [Buildroot] [PATCH 3/4] package/openrc: add bash-completion support
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
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/openrc/openrc.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 5e667de7f8..80a9dec778 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -17,6 +17,12 @@ OPENRC_CONF_OPTS = \
 	-Dpkgconfig=false \
 	-Dsysvinit=true
 
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+OPENRC_CONF_OPTS += -Dbash-completions=true
+else
+OPENRC_CONF_OPTS += -Dbash-completions=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 OPENRC_CONF_OPTS += -Dselinux=enabled
 OPENRC_DEPENDENCIES += libselinux
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
