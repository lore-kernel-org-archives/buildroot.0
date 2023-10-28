Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5555AC4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 21:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09E37417E0;
	Sat, 28 Oct 2023 21:09:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09E37417E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zj9ftiAerIEE; Sat, 28 Oct 2023 21:09:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B82440911;
	Sat, 28 Oct 2023 21:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B82440911
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C4F951BF20B
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DB9B83D46
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DB9B83D46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bemYaxh-MFKu for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 21:09:10 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E068483D37
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 21:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E068483D37
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-32da9ef390fso2031626f8f.2
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 14:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698527348; x=1699132148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hzaagrZMHLzO8L1h8kLY3Ck/aFoJVm6FBvwVmQfTk2E=;
 b=sKE5haOe0y0AqNafpWO5rKTaxVRue2tnTrC4u7Zug5YhypOatvxUrqHwNZjGx29E1q
 c8YbNLL3F5WZN8ue+zmCAUJkPvjfg79mYwfkQpF1QBgEDnJuwq4Rt/7xJTZJfCn6nKON
 Azp8SKjqXqo856nDlA8Nd7fOLPnPOJ5QpfCi0tmU5CCs/Sq1yYHCgKygWxeY1oBaZWYb
 kGBpudkWEL54/cOU43S2z+OxIkYX4TpTV5ikdkZnW/kB08Obi3dtDrEzjL2QwET4XYUz
 cOEBINXIywz9E4Yk9jM9J5PLB6KyrrYuvjShO8OFwruQ3UB9fU9sYdbFP5nqfqJddy5p
 8Lrg==
X-Gm-Message-State: AOJu0YzxJLZ5Ivyv0FATuyfrXU10IJ2i9+FBsSbZz2GXv08mjf/o6a7Z
 UB/DyHdhnNbVfVlHWKQKgShVTAzhLkM=
X-Google-Smtp-Source: AGHT+IHs7Xi0XBgb3bMgMzaxD1naz2qBq63qCggdzvEVojcTTfE4I3AUjdBZyANDjrfbAeWQHvU7UA==
X-Received: by 2002:adf:f389:0:b0:32d:9e13:1bc9 with SMTP id
 m9-20020adff389000000b0032d9e131bc9mr4842581wro.8.1698527347832; 
 Sat, 28 Oct 2023 14:09:07 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 by smtp.gmail.com with ESMTPSA id
 n17-20020adff091000000b0032da4c98ab2sm4604050wro.35.2023.10.28.14.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 14:09:07 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 23:09:04 +0200
Message-Id: <5d97168a26fda40c66ff51e3b52faeb8d6a8201e.1698527340.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1698527340.git.yann.morin.1998@free.fr>
References: <cover.1698527340.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698527348; x=1699132148; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hzaagrZMHLzO8L1h8kLY3Ck/aFoJVm6FBvwVmQfTk2E=;
 b=m4C7cCfZhZpFTqWteuitt8kfDaUMUd371RXjNYHXm6xpmaBRLP4JtZvPV/Qave+sej
 0L5UCQTiUkST4U5Puboz2vEIZaTkvMP8co11AV2W+e6QRRWP3KVZFVlO4ED+825lxbyZ
 T9Mjn0qgoW52yjJCO8OMLgjXqvJO64TT876Lc1Opg6oBzE7A56nnxWLWdWpWamQscELo
 MmMtmI+uHQ/PE8VyaEaEQ1xr3dhVf+GXscZw7Ab9FbADCj6udmrfcZJNKSLGNM/wixFr
 rBYjCUBY6p6TxwAVV5IZ0WJBmgq74dWpJziPOai8SnxaTxiE+3gxwa0MTwR7kxCv78Z7
 0D3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=m4C7cCfZ
Subject: [Buildroot] [PATCH 1/4] docs/manual: svn downloads can be
 hash-checked
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

Since commit 89f5e989323a (support/download/svn: generate reproducible
svn archives), we've been able to generate reproducible archives, and
thus we have been able to verify the hashes for those archives.

However, the manual was not changed, and still falsely hinted that this
was not the cae.

Fix that.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-directory.adoc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-directory.adoc b/docs/manual/adding-packages-directory.adoc
index 04f5241d05..7150018a3b 100644
--- a/docs/manual/adding-packages-directory.adoc
+++ b/docs/manual/adding-packages-directory.adoc
@@ -534,9 +534,9 @@ typically indicates that the +.hash+ file is wrong but the downloaded
 file is probably OK.
 
 Hashes are currently checked for files fetched from http/ftp servers,
-Git repositories, files copied using scp and local files. Hashes are
-not checked for other version control systems (such as Subversion,
-CVS, etc.) because Buildroot currently does not generate reproducible
+Git or subversion repositories, files copied using scp and local files.
+Hashes are not checked for other version control systems (such as CVS,
+mercurial) because Buildroot currently does not generate reproducible
 tarballs when source code is fetched from such version control
 systems.
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
