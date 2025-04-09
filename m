Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79887C36002
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 20:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42ED383F94;
	Wed,  9 Apr 2025 20:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eGYyuW7QqkF1; Wed,  9 Apr 2025 20:04:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C06083F60
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C06083F60;
	Wed,  9 Apr 2025 20:04:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 960AF201
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8795C40A05
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bPXm46HBORdX for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 20:03:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B9759402CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9759402CE
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9759402CE
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:51 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so1069315e9.2
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 13:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744229029; x=1744833829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cjS4d4FQdmt1u4jdWAF0NEG68lfkNcvdBwXQsL+KhRs=;
 b=n3NUwC2IlMTA1s1LXn2C8sX48cs1FzztuqELd7lbT6YgqJU90yq8fY8igH6X/ZwMeK
 TsIrWmfBdb94LriUMHNuFGGjIrBFfyIKKdsYZDArPgPFKg58K7c49N7P7osKbo7Bpw06
 Wcnd1TvNLcROgzjjdJMWZdzWqy8HTNtihwXzfquOkgjlur6GFWCa6t1VHGy0yZxFsljx
 E2V1crZeb+YAm+wTqThzHZ/eXGbNTYuNFpc5CWltExW9KpX8r454jgvJoVDTV6EAuUlE
 tvOfpzFgPQBqSFqEApOZRXD0+hdD8ozYwuyjE8e02OfIvqUckOOVcQM2DrSFfDt3Eu84
 imGw==
X-Gm-Message-State: AOJu0YwezNhpz13a5YIMmIKeOVpVCBzOPwPNQC1Y3qBcRCJk27u3L3Hr
 MFPCuR3riQhexe8vsxALSqi2EFOh4cxEZd4xlV/WTx7tXePldtDuKwSJwQ==
X-Gm-Gg: ASbGncvbWOThd0Ek+hyF+BXJwnSo9Wpf36Dj9eh4Q8yylgG+5J2ujCFl6KPwaZOMPqv
 EVNBv+hgbIcgEIzLemRhxyKiYZtyEGOTKYuDUfESmzqoDXqpT/4GFitAcKsvZScTW7G0lxktOWZ
 A3XCqa34PZGF5Vzg9PPDGEpwaW1gXV2aXA2DOuetj/dBObGbyZ85f0QzuOmZQBwUO+CIzbkG8Uf
 mZ5fBF1U1Ix1BgSE5qtKWsifufSI/L6pLfmMFXF134Zw3K78+51B60aWmAib27I5Dmqq/BJtYtF
 52lXol+Co96jHjqcFELGWTbw/7P6a+4hzsJD0PPDGuTD8LkfH5w=
X-Google-Smtp-Source: AGHT+IG30VJy9ezYyS5ValgBujjU2tRgUO4LwNZZOwBG0mAWu5RGMerfQmfzML0md5wavqpApjyAKA==
X-Received: by 2002:a05:600c:b93:b0:43d:22d9:4b8e with SMTP id
 5b1f17b1804b1-43f2d7bbe1cmr3360175e9.10.1744229029561; 
 Wed, 09 Apr 2025 13:03:49 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8937734esm2526113f8f.32.2025.04.09.13.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 13:03:49 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  9 Apr 2025 22:03:26 +0200
Message-ID: <24d240039a7346fbfe0655628b6b373fdee2b999.1744229017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1744229017.git.yann.morin.1998@free.fr>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744229029; x=1744833829; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cjS4d4FQdmt1u4jdWAF0NEG68lfkNcvdBwXQsL+KhRs=;
 b=kjAuz4RK5y0oaGKcR1DgluyUtMkLb5L6nxrr+AI/kh/DtF1NFB0MLtQqxXrz4As5lU
 TH8ifyiuCN7uYWGf9bcjLzTG+7E9sbvLD+IyASJTOb4tn9tQ1aUTfYzq76K0KBBf6tkq
 vT9DO3eyyrdFwyoHZVZSGhWM9rgQAbaCLupwJar9c89CJqUgKFCkuc6XsBMIyi0HQR4S
 iTVvq9uHFwleaJVpPA3XCExwkea6y63byRJ7FiX3DTZdwb2kESkWBZRIVEVtiw1aPnc0
 lUQSbAXREXCGtURQrubztu93Y8AcApl6xj6pTrM0hdjFJCMqn/IHT8BnjginKLT7bJzw
 uIUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kjAuz4RK
Subject: [Buildroot] [PATCH 11/29 v2] package/boost: add host symbol
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

That will be necessary when we eventually add sub-options to drive the
features of the host variant. But first, we need to convert existing
host packages using host-boost, so let's got step by step and have them
select host-boost; this will be done in following commits, one package
at a time.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in.host       | 1 +
 package/boost/Config.in.host | 2 ++
 2 files changed, 3 insertions(+)
 create mode 100644 package/boost/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index bf04f5fa97..3e6fef9e50 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -11,6 +11,7 @@ menu "Host utilities"
 	source "package/babeltrace2/Config.in.host"
 	source "package/bmap-tools/Config.in.host"
 	source "package/bmap-writer/Config.in.host"
+	source "package/boost/Config.in.host"
 	source "package/bootgen/Config.in.host"
 	source "package/btrfs-progs/Config.in.host"
 	source "package/cbootimage/Config.in.host"
diff --git a/package/boost/Config.in.host b/package/boost/Config.in.host
new file mode 100644
index 0000000000..5ffcbe6932
--- /dev/null
+++ b/package/boost/Config.in.host
@@ -0,0 +1,2 @@
+config BR2_PACKAGE_HOST_BOOST
+	bool
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
