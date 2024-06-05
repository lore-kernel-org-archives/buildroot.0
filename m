Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5A3C27C53
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 14:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BF3C61113;
	Wed,  5 Jun 2024 14:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p0Fl2NmnSJ7P; Wed,  5 Jun 2024 14:18:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7024A61124
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7024A61124;
	Wed,  5 Jun 2024 14:18:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C7A271BF23C
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 14:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B07A640B83
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 14:18:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IfvhvQE_OBVx for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 14:18:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9744040AF9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9744040AF9
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9744040AF9
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 14:18:20 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42108856c33so5890765e9.1
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 07:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717597098; x=1718201898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EXEt1uTrRMKQs7MaogRVn4eClR3bjhl52Wah0AACkA8=;
 b=vFNKQrzO42NSXzY9wG2fJ1IBK2Wg8HVXnhPYfvvJc5SJTLT3UExGkJ9fXjrK1hIa1b
 +5yyOqH2r18OklPYJuC1beOxU58uCnnDaFhM6ngoYGEPjSljA0JRV53DbCDvX/xpiyfb
 WU/7pk7mnWxYes01Bygxqi+espxymsoxBqmPYVFEwCT8bNqy+GVDc1lxkALKnakmXfNP
 hxC3FxztFdI5pakdsynl5T9+Cbffx+DoUbf5GUGmqVrQpvac06I70kT7JT9QFqOY+y/t
 glk4OeO105IU/3lAA40pW2qa+8mGVkvhAz9e4zfYeCk2noPoClXRrMygPf7YYLvwncfy
 5Qow==
X-Gm-Message-State: AOJu0YxFXXCTsXCGDlHHoNG17KMtZ5vFCXgUMJ71D6T/pHNzwoAK4hnP
 4XAjKE8dyySFmi7cOjtz/oSjDcMG98p56f4zoqGtfTSlhxtYZfBZRKpW+Q==
X-Google-Smtp-Source: AGHT+IHkmFBckHsyUcaTA/q6QmHjOjU9B9mCa+w+4/syNlAl1f0TvPuMDekpSycEns+YcOlhgYouVg==
X-Received: by 2002:a05:600c:5122:b0:421:4b0a:5006 with SMTP id
 5b1f17b1804b1-4214b0a5ffemr47449185e9.7.1717597098332; 
 Wed, 05 Jun 2024 07:18:18 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42158149057sm24253925e9.36.2024.06.05.07.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 07:18:18 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 16:18:09 +0200
Message-ID: <0701cc12109fac5527a26e5a22907cc763fb75de.1717597094.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717597094.git.yann.morin.1998@free.fr>
References: <cover.1717597094.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717597098; x=1718201898; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EXEt1uTrRMKQs7MaogRVn4eClR3bjhl52Wah0AACkA8=;
 b=DdYdz5RtFasuShEimsALILLbKp2tU/ac/MPJ7q7VUoJWDcjVY25rXxtL66StlNg2HC
 q6DgX2L3MYFPUYXFS3AuzoORAr29inPhfm8fZd0RoDG1G+s9Um7rUOeqRG4HHib1Po0E
 NgczRmeWVDxyt4GaoVCdzqO3ybeosm77S3DKyx3jUWsRHjKxR52WpUQrl75GEyUlEYCF
 1F3nWFFLWySjwMzPyhNIDEUmfM7LHziWcadl3QZq7oNzH0F0ns7lZLUTYZODLUGDQKiN
 /aPi6ZeNCQU9wFpAJtuO8YHl1Tgscg9qsTKSezNqpayCrepulZJibWTMOJT0wA4VE2XC
 PZUA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DdYdz5Rt
Subject: [Buildroot] [PATCH 1/9] fs/tar: use appropriate TAR
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
 fs/tar/tar.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/tar/tar.mk b/fs/tar/tar.mk
index 841af14706..92b39f993f 100644
--- a/fs/tar/tar.mk
+++ b/fs/tar/tar.mk
@@ -13,7 +13,7 @@ TAR_OPTS += --pax-option=exthdr.name=%d/PaxHeaders/%f,atime:=0,ctime:=0
 
 define ROOTFS_TAR_CMD
 	(cd $(TARGET_DIR); find -print0 | LC_ALL=C sort -z | \
-		tar $(TAR_OPTS) -cf $@ --null --xattrs-include='*' --no-recursion -T - --numeric-owner)
+		$(TAR) $(TAR_OPTS) -cf $@ --null --xattrs-include='*' --no-recursion -T - --numeric-owner)
 endef
 
 $(eval $(rootfs))
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
