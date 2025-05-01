Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717BFC369DC
	for <buildroot@archiver.kernel.org>; Thu,  1 May 2025 09:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0606834C6;
	Thu,  1 May 2025 09:09:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FXHCBM51e6mq; Thu,  1 May 2025 09:09:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF5EC82F39
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF5EC82F39;
	Thu,  1 May 2025 09:09:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA91922D
 for <buildroot@buildroot.org>; Thu,  1 May 2025 09:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C45A82F39
 for <buildroot@buildroot.org>; Thu,  1 May 2025 09:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2jszymBCWS6c for <buildroot@buildroot.org>;
 Thu,  1 May 2025 09:09:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B8A8382ED2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8A8382ED2
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8A8382ED2
 for <buildroot@buildroot.org>; Thu,  1 May 2025 09:09:23 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-227a8cdd241so9605155ad.3
 for <buildroot@buildroot.org>; Thu, 01 May 2025 02:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746090562; x=1746695362;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dkNNJv5zLLTQ3gp6cctTSghnCtqJcXEYWMlV/31jiZU=;
 b=s1xPPgLM/NiInZuyfgK63i2q/nvAYDQ5IEKxW7QjHLv8MesDnMy6mjSF16opd+uvPr
 HeeRih3SOyaUQi5mLDTIhbeB1gBP8PtHPCaBAshHmfX9sGbGEySj4gweohUe9ceEZrLR
 IbvQ/hDQxxTjQ0blFlc1bpXRvS3WjY+yG9Tcbx2sIcZtgX/w++wR++hFfd3mCLr1/iH1
 oSAXE+3WipvybeOf4V+MCk0H3odBDw870whoWD3WNGdiUc6owIt343vyfIErJMmjBj6O
 xXVgH7v87v75zc+hGYH+E7lQnMLLIQO97zSISZkLcxySRARabJ/CcQXRmqpvNwwto4Ea
 nDNg==
X-Gm-Message-State: AOJu0YzpiO7IAmwY/F7Seyjm91WePHtL/UuKCo1q2tcPpHNRxVrfsPa6
 HiltXs3I4AeVSw54uV4+BVnx+viWZtDFh8RupkUfs/hFe/+gbqN59vVo7vzA
X-Gm-Gg: ASbGnculqxkzaxLHs67AosL/L+Rd9GID0KpOKzxYe3Pe66TnReMCgL2ho1sehCFJ9Jf
 XOu98aNBx8gAOy9ih1ftLuKo5upVrdgTYrCPG4k7+KMVIML5oW4q9HyC9jgPk6eOVPLwYikCibV
 O2byaYseXTWGoY37OJ1qhospvuED4f7GU1e2/kmk2WHg7NGRchqoDzgsgiYDb8ZF6UKO7TBA6f0
 RHVB2pR+nt4//jgeBX++1J2nxeNpf1l0Md4OD89TFhUO/k5eECV9BmWXfHuCy9ID36YX5R+33zj
 3ojLkBzRh7egtPwu85ojmUV3YkM9xsd0jSAMhtEoSKTgJndwoSriYvOA3RSOygai4a7AjXEe1Au
 wzON/22VPuOYgdhO4HCQ6LrjGqwo=
X-Google-Smtp-Source: AGHT+IG92vOLiyNpGevCuzi+Cx/CdwtcAHGagp8MA7UrGa+fKVkR3UzSib0moZNVmUkEbd6XrTEx6Q==
X-Received: by 2002:a17:903:1103:b0:210:f706:dc4b with SMTP id
 d9443c01a7336-22e040b9bb5mr32856295ad.13.1746090562552; 
 Thu, 01 May 2025 02:09:22 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e0bb05c7esm2680915ad.23.2025.05.01.02.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 02:09:21 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  1 May 2025 02:09:19 -0700
Message-Id: <20250501090919.74916-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746090562; x=1746695362; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dkNNJv5zLLTQ3gp6cctTSghnCtqJcXEYWMlV/31jiZU=;
 b=G6pYdXJIIiXQ5r8NUTtKsXkMtm1OxJBfBRnr3ex4N1hY+epmN7cS2DC2vrYzODxNnp
 SLLHX/ZoWnG2p+yzDYJ6yqLsxELU0KpH+SYUTXVwoF0TondCxwWzC6kUeYQeMoay5xL7
 hoj/yp7A5JFC0Pzrd0fDriwwRGORiKphm6HEbhN5GPbdxpfAhcqgJy5fiyEq/TaKBCwe
 Bwb6hmhBWIzPxVm07MiRlOdzGriTYQbqwSZnEhxr7psjEY7VX3UfnI8sIVbHIqsqmJ8T
 KYZOd71LOXis1c0RHYB4B2nqJg7DcjNHli3OPxedT+gAcYd0z9fmhtJp48x8RgdzDaLY
 6Qsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=G6pYdXJI
Subject: [Buildroot] [PATCH 1/1] package/libcurl: bump version to 8.13.0
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://curl.se/ch/8.13.0.html

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 4a26a1774d..388ddc1418 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-8.12.1.tar.xz.asc
+# https://curl.se/download/curl-8.13.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  0341f1ed97a26c811abaebd37d62b833956792b7607ea3f15d001613c76de202  curl-8.12.1.tar.xz
+sha256  4a093979a3c2d02de2fbc00549a32771007f2e78032c6faa5ecd2f7a9e152025  curl-8.13.0.tar.xz
 sha256  e18f1989333b70044b2adfb7dc2f905d0119dbdcac3bc9f4bc9d540e3a29de5b  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 2066ba0388..5f04fc381f 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.12.1
+LIBCURL_VERSION = 8.13.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
