Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A04CA1002
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 09:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59EC6413BE;
	Mon,  1 Sep 2025 09:01:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fsOGnrjhTCpb; Mon,  1 Sep 2025 09:01:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8C4340BC5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8C4340BC5;
	Mon,  1 Sep 2025 09:01:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60D30169
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C91E40480;
 Mon,  1 Sep 2025 09:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J5SQlgOCpty5; Mon,  1 Sep 2025 09:01:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 869EB4044B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 869EB4044B
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 869EB4044B
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:31 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45b627ea685so34736365e9.1
 for <buildroot@buildroot.org>; Mon, 01 Sep 2025 02:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756717289; x=1757322089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ysqFFDBkK8AIDe+IQ98MUKdllFEGr2qXWmEhgm8QqmQ=;
 b=RT00BhUsnh9xXX3ohvKMvNChyLynehn/go8ntkAzmu5ayiEIQ3l47LkR9fWWLheWx6
 hBNSlLRjLbcu4jyDKVTYo8Vlxncb0FRaBemix+/HTJL/8LinJXfOB22qJ2osMkbcrLMT
 nnszLOzG24qOEMMTdFkBjMyIzZQLgLcTBTylb9cLtcAbCG8qAOzXEyIL+q04AyOc+08j
 AycuXBGL5qnGIO3B7uqD5VgyYQvMvH3QH/bGC+Wipvkr/bwYt2XoZQvFJfLFDO6SCnRh
 Z78zn9tNP0SSYEkiY8/Bt7g6lSHQ7G9ww7t3MUI9Is1IEYvvN3m2la02/MP6GqNMHGyl
 NDnQ==
X-Gm-Message-State: AOJu0YybSUnoaPx1b2J4l+JYX0+uRzJbhC/WqwfqlYGnvp3nl7isI3i0
 c3OD4h4mJ8cNDHgFoMZeYaXW+psbTpEKbzxYMUqEUFpRLG9Vhh23b04qwD6Q5A==
X-Gm-Gg: ASbGnctbdODdk3oF9W7y/7SZ3Mn08qpJS1icX7u57i+HJJRhS/8Qs5Dt+BHA/tqAZZo
 OA087YPGf9kTHkvnp/yfDNJSlQK8s79eHoh13KBKclCXUA9M+OKc3PAEpBwpUSD4b5AfGkTCwpc
 uH/2AFa5T9eN+iLOWEnYDTewCCnPnw88tEEXF3RiZRtO9ZxY2rZ8JEcYGk6dPmM1gaOhFbO6h+Z
 2f+p3kSn8jIikS3OQb3hSsEcfDIYuNTkp2Ujg7As+YTx77uxp8hlw0pfczkBIYlPpaknHouUmak
 IHTdht+pTI95aHKBTFIiO7jjMdYKa38otpmsCLdb4kOEgDqRKGqYVxrt08SGrZJRuySIjtJ7fsz
 11wAznFkS8kD4iU/45FkPLeVwdgmrib/Z/Uw7E0LKSp4=
X-Google-Smtp-Source: AGHT+IFYQ5yM4Hr7IVjPraJ+xTk66cJsKhChevWzjxBdjCqJOTOmrWt5C8ljCk/oMYM12dma1ejikg==
X-Received: by 2002:a05:600c:3b28:b0:459:d46a:ee3d with SMTP id
 5b1f17b1804b1-45b872e711emr48821465e9.2.1756717288994; 
 Mon, 01 Sep 2025 02:01:28 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b8525a94bsm98171055e9.15.2025.09.01.02.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 02:01:28 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Arnout Vandecappelle <arnout@mind.be>
Date: Mon,  1 Sep 2025 11:01:11 +0200
Message-ID: <39a966f8050c96e5e3da5a4965e4982c32ed7e5e.1756717276.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756717276.git.yann.morin.1998@free.fr>
References: <cover.1756717276.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756717289; x=1757322089; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ysqFFDBkK8AIDe+IQ98MUKdllFEGr2qXWmEhgm8QqmQ=;
 b=V4Ucwss5fZz3Z/su7Osufkwwe21znm+VdO39VANs5P+7Hf7tWK1ul46VPj0FKxjQ45
 6Yuxj7isUCxzHDn3Pv/86+PuLCyJ/2mJMeHUHWlbszNU2qegBNtjy0xwSHp91VHOu5wV
 F3U41gWcYf6wEr4Vmu19uu+EQuKtfZJO95CPwFQ6XAYiVwq/tOCkvYDVRTUWZ0oRT7Nn
 1QKTM+rKUO7iWdCavAytQimgDG0sLsLG8GBN9j2KjjN0k7iYxAOhUcBbpzHGOvxA7KmQ
 qxC9HXB1IyEhuoiHkaJIiEIKKkOY3HCWFzCE76kqblZRA5IYbNEsHd0nBFaMd/5ocvix
 se/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=V4Ucwss5
Subject: [Buildroot] [PATCH 02/18 v3] system: drop superfluous negative
 condition for default PATH
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Kconfig applies the default values in the order they are defined, and
stops at the first which condition is met. In this case, the two
conditions are mutually exclusive, so we can drop the second one. This
also makes it obvious there actually is a default value.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle <arnout@mind.be>
---
 system/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/Config.in b/system/Config.in
index 1bc8b61f11..b24004c533 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -535,7 +535,7 @@ endif # BR2_ROOTFS_SKELETON_DEFAULT
 config BR2_SYSTEM_DEFAULT_PATH
 	string "Set the system's default PATH"
 	default "/usr/bin:/usr/sbin" if BR2_ROOTFS_MERGED_USR
-	default "/bin:/sbin:/usr/bin:/usr/sbin" if !BR2_ROOTFS_MERGED_USR
+	default "/bin:/sbin:/usr/bin:/usr/sbin"
 	help
 	  Sets the system's default PATH. It is being used in
 	  /etc/profile in the skeleton-init-common package and by some
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
