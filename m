Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A90C4345F
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 18:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14833608A9;
	Sat, 27 Apr 2024 18:38:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id syhV6n7oi0r5; Sat, 27 Apr 2024 18:38:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 960BE608A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 960BE608A2;
	Sat, 27 Apr 2024 18:38:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 863E51BF3C1
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 18:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72048606E5
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 18:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ythz4DnT8XKk for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 18:38:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6FF81606DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FF81606DC
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6FF81606DC
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 18:38:08 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-347c197a464so2289083f8f.2
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 11:38:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714243086; x=1714847886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aAZS4wzNtGOLvZA64ISgBeSfeb/6l7kKO3TkXngi620=;
 b=bp+BPHcnR+Z+YB6f0z6IfVXRWN+yS8YWF+dOskun4dTNArKHJuf969r59tFzWFXenW
 z+gtkXOFTkxHBC5OgMrrRQTmXj6PdqS3l35NdPSAswj8CmSDIfgWgrE9hOcn6uAEz6oA
 epLpn70j00mEiQPjfiLntE0z6S9VKLeEWr9rDevJAKI3iZHFv/2cSgyrLk/P18JJR2sY
 uotaPpAzKPrvFrrVX8O9FmOR9Je6YQFB9uILHzv+SC92RBO3mWvUriVaT0/j/40GIgLN
 SfXCOLfRFG0y8ObjtcAErJXpKkLrwLEprL8WzormaQQTbGhatyHsEPgEYK0vvDYuix2+
 k5aw==
X-Gm-Message-State: AOJu0YzWigX2lfq972fpbswk5ZIPLG66HrKLSFxdK/Hkjo6HrsiTfWx4
 LiYfj19vcaquJJ67+Hd/hM3tu2UeflLs6tpRAYaNAeZALO4UwIiWk35F0A==
X-Google-Smtp-Source: AGHT+IEfe3u5Tl62FTQ3t2lBgQWg1g8jy/NhtUGw4vGMOAjVwegIkGBAXajxn8rFzwsSGiFbABb8IQ==
X-Received: by 2002:adf:f804:0:b0:34c:cfd7:52da with SMTP id
 s4-20020adff804000000b0034ccfd752damr355752wrp.10.1714243086578; 
 Sat, 27 Apr 2024 11:38:06 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 k21-20020adfb355000000b0034c6b368aecsm4136589wrd.26.2024.04.27.11.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Apr 2024 11:38:06 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 20:37:55 +0200
Message-ID: <923548069376f566a08b1f5853aafae3596e2797.1714243078.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1714243078.git.yann.morin.1998@free.fr>
References: <cover.1714243078.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714243086; x=1714847886; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aAZS4wzNtGOLvZA64ISgBeSfeb/6l7kKO3TkXngi620=;
 b=JtOg4Pob8qLMwDvfIKrMWOcnS8SOVFK9R5GhbiiMk/H2AMSOmbIT/h86MNBDrIwSM5
 3MdlY7htFZI51blAaVh1fzh5lotov+h/iO9SlUDXJowUpwCHao9tp073AzVwp6ECExbK
 Q3igfRbhsLezinXr+E2hjSE5pQZBTxa0h6V9Z3ATbIPYBHKNFrhtNB7Rf5oJf+m6TAP2
 Q9JWD9vUpRnjmMOx/+9PU1L/1CuWVLXZHzSUXZOftzXQa/WtoBxGRqO0yv3cT/htUQ48
 ZUwuUl+ts7iL+3zqTEfAbQXY5DQyS6HlK5RE0v8cmCaHyIp9uHolT3c0LvJ75ohAJq1A
 S2Eg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JtOg4Pob
Subject: [Buildroot] [PATCH 08/15 v2] docs/manual: document git backend
 handling of export-subst attribute
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

Add the changes about export-subst in the git backend, to the migrating
section of the manual.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/migrating.adoc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index c0f89cbf07..ed9b61257a 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -123,3 +123,11 @@ LIBFOO_PRE_PATCH_HOOKS += LIBFOO_ARCH_PATCHES
 
 Note that no package in Buildroot has architecture-specific patches, and
 that such patches will most probably not be accepted.
+
+[[migrating-git-attributes]]
+=== Migrating to 2024.05
+
+The git download backend now properly expands the `export-subst`
+https://git-scm.com/docs/gitattributes[git attribute] when generating
+archives; the archive version suffix has been updated, to +-br2+, so the
+hash files must be updated accordingly.
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
