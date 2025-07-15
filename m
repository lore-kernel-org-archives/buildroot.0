Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8513C83F27
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 21:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90A974060A;
	Tue, 15 Jul 2025 21:05:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v_P-xxBDiv6Z; Tue, 15 Jul 2025 21:05:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B63AF405C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B63AF405C9;
	Tue, 15 Jul 2025 21:05:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DE45DF
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 21:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FF2060D97
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 21:05:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nq0jY9C8yWeo for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 21:05:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9AA086110F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AA086110F
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9AA086110F
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 21:05:12 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3df5249601cso46571965ab.1
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 14:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752613511; x=1753218311;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2MHLV8SJlFXTMF7nBh5IVLPRLcrxPbVkXV3nKZ09bdI=;
 b=EQ6fVYGv0Aj1aJDWDGHhGDHrFfPIllYQAw/QjqRa6JX4F8qmspkugWu5SJoiFyLtBr
 YT3uuKCLIwSQog6dz35lAB5Bd5MWZnHDqqfP1zXtoAk3c821UdxO2kRft6ZkfmFU/Gf6
 rYfi9eopcBATiD7cDsmBo0LmLmkaTyCRYNGKnpq7z3XxC4SVw4PZEzxfxeQyUD9I/GVG
 UGeoBqh4eMGGFHacZvQ67aOnCXN/QP03pUcStzQkYtHKVcHlfgFn7QK84Cyzh1OW7O0y
 fVbBaOMN6ZyrdB21MzLRjttXYCdPX5240ExKqzlypHScQjiIcpUmYWfbz6PynGQiHX4J
 KCLA==
X-Gm-Message-State: AOJu0YyFDcd7vB0LRqHd7sa/n1M2qvoBo+5z6GTc6LiDpj4ccbn11/7/
 GEzzEuRWn75bhElRVhWPZbETuwamHFpdUFn5fH4z0CfU5nzHHienJLnwxM781yu1AeQ=
X-Gm-Gg: ASbGnctlb7Qaks0YmNe3jeYeumvBSQMaFw20ogP/WfKEXsq7e7NqJUc+fFjT1wShQHQ
 dzFLgBsW6aQfRJZii0NAT8BcTMfTCJdP6ZGO0ckAACPqmrYquHatnEjwMcc6FxcM0/ldl8wirQg
 gb0PtNq/26AaVgdDT/Ue+MBw/sIfNV1zzDD3uN1Wl50n9BYCW5MJe6k4m80s2T7oH/NDYA4raG0
 0CRHYEP9tbnuB8XJpHGxFzLVtieemsobBKv3Pvc00lRI7eYwj+faRtspEuDTcdGjSQpodDOB7iJ
 BzCg/D9kPurli2G7thv/hR7+5GO/IGnwkTv/MAJZh0Kx9v54aB8CxMvCVxtizaKC7IZE1qDMwCd
 3upk1MdK0Q7CFTXhbNnJHHGT/wJ8b0J8jY+zKTupfECE4LWJ3+ce/i/1SJfmrIu0KVaCGH6PpJ2
 anaSaw1+Ld2XHFO2hwyA==
X-Google-Smtp-Source: AGHT+IE8WwGw2pFh3sRgVjx0ZDoLDOuWweha+UhJeXzfZ2f2uR2OsEuD6WAgw/WZ5ANAdsjK0Kq33Q==
X-Received: by 2002:a05:6e02:1c07:b0:3dd:b523:7abe with SMTP id
 e9e14a558f8ab-3e282e8e501mr3227435ab.18.1752613511286; 
 Tue, 15 Jul 2025 14:05:11 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-236-108.hlrn.qwest.net.
 [71.218.236.108]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3e24623ea31sm39495025ab.56.2025.07.15.14.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 14:05:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 15 Jul 2025 15:05:09 -0600
Message-Id: <20250715210509.544485-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752613511; x=1753218311; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2MHLV8SJlFXTMF7nBh5IVLPRLcrxPbVkXV3nKZ09bdI=;
 b=RR2bDNYDPs1VNlqLAwHZzS2Prh6TMfVg5FXCA43JHJ0AHzX7BUz2CwIlFYv1Vx23vQ
 57qa0k+7ZuJYsDyxs/Hd56Ifh3DgBZL0wDlz5W9OCCwlM+ycwGlNcUNdl1qcViftxXgq
 o2CUK0jrq7TT2jyVZm/KA15NENcv/F/F2JUKN3Cqvdfyjby8CkWNEDuiOYbvBSp48K8G
 3nZ4cki2na4FrFd9gYD+DFzNpmPXbnF64AAoV2hKUSBJm1XFSEBOsbpbjCX7oCsWp3BH
 h4CFNBJ7WZP7eEM6yoeTwMbyr9BFhEHHhdPZc0Q1kPWxTyLn9edw2FoLUgmnbeEiSqvZ
 DENg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RR2bDNYD
Subject: [Buildroot] [PATCH 1/1] package/libjcat: bump to version 0.2.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libjcat/libjcat.hash | 2 +-
 package/libjcat/libjcat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libjcat/libjcat.hash b/package/libjcat/libjcat.hash
index b6dc8d2f69..8f50f8798f 100644
--- a/package/libjcat/libjcat.hash
+++ b/package/libjcat/libjcat.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a6232aeca3c3fab6dbb3bed06ec3832088b49a4b278a7119558d72be60ce921f  libjcat-0.2.1.tar.xz
+sha256  f2f115aad8a8f16b8dde1ed55de7abacb91d0878539aa29b2b60854b499db639  libjcat-0.2.3.tar.xz
 sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  LICENSE
diff --git a/package/libjcat/libjcat.mk b/package/libjcat/libjcat.mk
index c365c1914b..4a7f304c2a 100644
--- a/package/libjcat/libjcat.mk
+++ b/package/libjcat/libjcat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBJCAT_VERSION = 0.2.1
+LIBJCAT_VERSION = 0.2.3
 LIBJCAT_SITE = https://github.com/hughsie/libjcat/releases/download/$(LIBJCAT_VERSION)
 LIBJCAT_SOURCE = libjcat-$(LIBJCAT_VERSION).tar.xz
 LIBJCAT_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
