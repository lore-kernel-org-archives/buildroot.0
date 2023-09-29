Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2BBE728CA
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 17:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10C7883227;
	Fri, 29 Sep 2023 17:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10C7883227
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KdV4NzTptajR; Fri, 29 Sep 2023 17:27:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 031F683CDA;
	Fri, 29 Sep 2023 17:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 031F683CDA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B558B1BF83B
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 17:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F31883CAD
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 17:27:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F31883CAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pS-RUOsvFagK for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 17:27:47 +0000 (UTC)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BAC0583C7E
 for <buildroot@busybox.net>; Fri, 29 Sep 2023 17:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAC0583C7E
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-530fa34ab80so2046090a12.0
 for <buildroot@busybox.net>; Fri, 29 Sep 2023 10:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696008465; x=1696613265;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d7RkLX1UJK8QBom7cFoDYSEHE2ffSbiRfK4zqmANpcs=;
 b=EgjFDEfWZcsn+X+UiqPDuUk0SBDDyiZ/R2c5gC8Aq39bB8S7lFCeGDTxsDYpxsLARA
 ++KxBy3c1uLRXcpp8/EFdIs4m+7AumYXl8LpFdXBJrqKOazq6NYMze6Vbpl2t1cUOgNK
 tJGw94fVX9lRA+z27bTsbfHfRjBKdyBuy3uNYEHDP2eA07kKnS2AKDOxai1pLanN+TFY
 bxJcRdXU8NZRHItAdtphewCcf1hkJaAsahNlu196YLF1mmh+LInLsX9TLLkm7GnhNi7w
 N8w6PX/xlDVwJitrw4YeYZLvUcUDhFGAwSD9xxjMPwnlJ1arwpNK0+L3k8Jm536wYfRc
 XtSQ==
X-Gm-Message-State: AOJu0YzqS5XIVTcVLj/drJEwXwQPFYRJVI+NfTAf5mNxktN96jiUEjNd
 Xmo+ZTbJHCCAsZvW+sVN0zf8PmVVgUY=
X-Google-Smtp-Source: AGHT+IGPlmHHulfYSHRhoJ4XqE8DNoiVlRmvPsVxVsj5oxpszJW4I/3Hu0OeoXjCoxcMXVr9v73e/Q==
X-Received: by 2002:a05:6402:1913:b0:529:d147:e9f3 with SMTP id
 e19-20020a056402191300b00529d147e9f3mr4052415edz.5.1696008464438; 
 Fri, 29 Sep 2023 10:27:44 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 q13-20020a056402518d00b005346925a474sm5261561edd.43.2023.09.29.10.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 10:27:44 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 29 Sep 2023 19:27:41 +0200
Message-Id: <20230929172741.3214632-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696008465; x=1696613265; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d7RkLX1UJK8QBom7cFoDYSEHE2ffSbiRfK4zqmANpcs=;
 b=ll/z46vY2iKbAXRSxdj7FIGIHoDKk9exEm5/Mk0YfQ5g7++gH8pXBre+XXtD/lPWHY
 FOKoXTOncnSjmGSpCfNFNR71CjrzvXNHITfwRWiFpx63nEfUV1Q7K6Vr+g3s3ATFlz/f
 BnFH+E4yHG8fJB2i1b4XnTr/AtoPgBViRBcfaR898H+rhc9hdlNXWJ+bo1Md79Yq9LsZ
 MMkyZFrbKsPp0r/5aVYS5Yu6EXKDyc/IpzEMFDxlqfZr1b9gyIEpQNjsayxZ66vZnWYf
 LKHM/67VMdAYqOWB30/F20UkPRJqappD8q+T3PP6UrHGpFdbm8RpJhJcILFqXK36Pe5L
 uVMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ll/z46vY
Subject: [Buildroot] [PATCH] package/lua-messagepack: bump to version 0.5.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

diff COPYRIGHT:
    -Copyright (C) 2012-2019 Francois Perrad.
    +Copyright (C) 2012-2023 Francois Perrad.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-messagepack/lua-messagepack.hash | 6 +++---
 package/lua-messagepack/lua-messagepack.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lua-messagepack/lua-messagepack.hash b/package/lua-messagepack/lua-messagepack.hash
index 5c8dd5936..6c650ce14 100644
--- a/package/lua-messagepack/lua-messagepack.hash
+++ b/package/lua-messagepack/lua-messagepack.hash
@@ -1,4 +1,4 @@
 # computed by luarocks/buildroot
-sha256  cbb1b7b12834b7f49fd20621446ec4d76eff67d324b8182b7988324b10830a43  lua-messagepack-0.5.2-1.src.rock
-sha256  b3b3d8c3d28a4d4f26404cdb7d7d9329e2e831ea2dd2c6b119d958ed113579b2  lua-messagepack-lua53-0.5.2-1.src.rock
-sha256  709fd93a7dd6f8e941e7f0cb9e3eeba1f4de375302f1b19e14bb51aff23c5970  lua-MessagePack-0.5.2/COPYRIGHT
+sha256  fe39b8ad92acf13f91d8660a04ab8fc9fb5d6370f99304d46cab8137ee9147b8  lua-messagepack-0.5.3-1.src.rock
+sha256  a7c1842ab7404104c941bc71809cd41c7685b4cd5edd4f1925f9cbe434f3ed4a  lua-messagepack-lua53-0.5.3-1.src.rock
+sha256  1dbe8e7da2d71088d4759da33a42eda89f5be90d1a9c0b823360a270d6628ed8  lua-MessagePack-0.5.3/COPYRIGHT
diff --git a/package/lua-messagepack/lua-messagepack.mk b/package/lua-messagepack/lua-messagepack.mk
index 33d460b4f..390f85c6e 100644
--- a/package/lua-messagepack/lua-messagepack.mk
+++ b/package/lua-messagepack/lua-messagepack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.5.2
+LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.5.3
 LUA_MESSAGEPACK_VERSION = $(LUA_MESSAGEPACK_VERSION_UPSTREAM)-1
 ifeq ($(BR2_PACKAGE_LUA_5_3)$(BR2_PACKAGE_LUA_5_4),y)
 LUA_MESSAGEPACK_NAME_UPSTREAM = lua-MessagePack-lua53
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
