Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0042AEB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 17:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B7FA60B16;
	Mon, 17 Jul 2023 17:56:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B7FA60B16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BNy-XQf2f9nS; Mon, 17 Jul 2023 17:56:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFB7460E41;
	Mon, 17 Jul 2023 17:56:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFB7460E41
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 114A61BF337
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 17:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D2F38186E
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 17:56:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D2F38186E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HgZrHjCYMx0g for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 17:56:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6F2381854
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B6F2381854
 for <buildroot@busybox.net>; Mon, 17 Jul 2023 17:55:59 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b701e1ca63so72139531fa.1
 for <buildroot@busybox.net>; Mon, 17 Jul 2023 10:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689616557; x=1692208557;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tKXhZUJIuoBSKRUqpVCAF5Qvtx7hXbhbXuRm8PzxiNM=;
 b=We9GijF0i+HyGmo6lC3wKNgycyLiwdF2RX7ZK7xeo5PRJxr7+5EjdkkP2Y7zovCTA0
 KGJX54DB25XzvZNUyG7B1HpW75kuSP2sx4gNEifOXoTcrYTo8yrkwXjZtreletnSCjCC
 cCMx10AbP6Un5TGcpb5j8Oqa7RN7IbT7fQXAggMlvm0flqMP/B3FKuMhvSGujo4aRODC
 /WyfYghTEO5MbjTHLuHutJM+51W/6dUDzwlcCn3gYM81Hynx0Kop02hrpDo0a+Z7Vf71
 /2G1fx2El/nxgplJDE7sFl2uystoRAhNdyIvXsHoFd0UpV73gfDePTbykYBjtYuNOxQq
 lztw==
X-Gm-Message-State: ABy/qLY/1TqfOvOTo+LY1PldpQ/tepRWkiNU26s/n4HOvnMxpzcJTkiw
 DIGpTJnjro7GKpInPhz0bLzHXxOBllI=
X-Google-Smtp-Source: APBJJlHRYgFIaX/HyxGYNDb74QOAiyW7kOGAWE1PLQuRSTziAJEuNb/GX3MihQV53l7T2zUh20b/dA==
X-Received: by 2002:a05:6512:311a:b0:4f8:75ac:c4e8 with SMTP id
 n26-20020a056512311a00b004f875acc4e8mr8892298lfb.43.1689616557339; 
 Mon, 17 Jul 2023 10:55:57 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 h14-20020a1ccc0e000000b003fbb618f7adsm329789wmb.15.2023.07.17.10.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 10:55:57 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 17 Jul 2023 19:55:46 +0200
Message-Id: <20230717175547.781816-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230717175547.781816-1-francois.perrad@gadz.org>
References: <20230717175547.781816-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689616557; x=1692208557;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tKXhZUJIuoBSKRUqpVCAF5Qvtx7hXbhbXuRm8PzxiNM=;
 b=rPAGxcr4ZnokktvpM5meiSBEStZuzeToY7i3mKO9iynVf78GIZg0oc/q30FIU8Lf9O
 d0o9Pu/d3oBqV7E4CP+vzX2d65hNr/WYaOfc7Wz3Qy7f4SBx3x7/c4+aNDZBE6hDeFoO
 ggLA5QdXXH8imiG4BJMA4yS5AxBdydftb7cBNbUjoIL6QkV1D9vSIoZHa2QAa8Edmgen
 U9zz9IyAe6qpCtRdG7HIz7TWuII0tGoKfr2XRI5QbMr6fb3XLoH6lzhV+w5yi1cg1WM5
 ruBWVJyRRenzgdWYr58i1O/NsNQ68pcI8KRMRQvfXttwulJ/dKsU+TFM7G2D8O1Sx349
 Yi3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=rPAGxcr4
Subject: [Buildroot] [PATCH 2/3] package/lua-livr: bump to version 0.3.0
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
-Copyright (C) 2018-2021 Francois Perrad.
+Copyright (C) 2018-2023 Francois Perrad.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-livr/lua-livr.hash | 4 ++--
 package/lua-livr/lua-livr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-livr/lua-livr.hash b/package/lua-livr/lua-livr.hash
index fe9876909..314f1d2bf 100644
--- a/package/lua-livr/lua-livr.hash
+++ b/package/lua-livr/lua-livr.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  e2f39316b8a1e66420c56e8ddc9ce4c0118c1a240582f2ba52d7627da6dfb76d  lua-livr-0.2.2-1.src.rock
-sha256  69fd426251454ea43a8068e58ac25d882922372de6b22e249bb56e00ea2cd834  lua-LIVR-0.2.2/COPYRIGHT
+sha256  531c4d56e2ef7906a6075e61fafee9ea265dc1a62698b966f5fc2f3abda23084  lua-livr-0.3.0-1.src.rock
+sha256  c6c2ca8e29b8e3b0558b046ffcbd4a5c31800bdca4520002ed4af76985f82d7d  lua-LIVR-0.3.0/COPYRIGHT
diff --git a/package/lua-livr/lua-livr.mk b/package/lua-livr/lua-livr.mk
index 3f114c725..fb835a1f9 100644
--- a/package/lua-livr/lua-livr.mk
+++ b/package/lua-livr/lua-livr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LIVR_VERSION = 0.2.2-1
+LUA_LIVR_VERSION = 0.3.0-1
 LUA_LIVR_NAME_UPSTREAM = lua-LIVR
 LUA_LIVR_LICENSE = MIT
 LUA_LIVR_LICENSE_FILES = $(LUA_LIVR_SUBDIR)/COPYRIGHT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
