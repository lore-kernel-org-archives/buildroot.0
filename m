Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37241C77B61
	for <buildroot@archiver.kernel.org>; Tue, 25 Apr 2023 17:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DADFA61476;
	Tue, 25 Apr 2023 17:15:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DADFA61476
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 64ZxybEqsbp6; Tue, 25 Apr 2023 17:15:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BF3961487;
	Tue, 25 Apr 2023 17:15:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BF3961487
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1DB871BF82D
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 17:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B851640CAA
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 17:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B851640CAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SYVS78F8UOa2 for <buildroot@lists.busybox.net>;
 Tue, 25 Apr 2023 17:15:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E977641175
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E977641175
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 17:15:02 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-63d4595d60fso37141667b3a.0
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 10:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682442902; x=1685034902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/z+S7ItTS/AB7N6sF+38kNep6zgCg4vMMjr56SMrtKU=;
 b=Xx1FXohBvzxmsLC65bfQoj8krGoEgLxrHkwKieGHBSAy78bFSJ87flszx/6iFLJd/y
 dtypLACx84/g0GIL45g1nYpc0zqfdKQS9l27k3QA59FYzBlkp2xM4y3vO3xwU/G9hwjw
 MNEimVbKtD72bhilR5u4Fzb9hdzxImgrRg0R8c6w95RwD56BkkY+z45R5RN3WkUKKRZK
 vCs7OxZArQBjsPzvoU9GOtPp9SeUNFLuBEHyUqKNrgfszm4AWTIvhb2pITIkPcv9gULM
 jT8D2OPzbY5utPbiMUAKHZAdRMScmZt4LGOr1GIfNwjrzvNSnzVCXGem38/koAQo60YU
 vLPQ==
X-Gm-Message-State: AAQBX9cT/MSxOqTMhc5iUAuvjn34VF39igbTD+0E/QmszlOxfqQ1kzcm
 ZF8ko6RZ73Yrw1ari0VWhmnHUxYL3OeKuQ==
X-Google-Smtp-Source: AKy350ZaFXt079Lpoy2CcwLGYxEmslpvTn7iR7JuGev7iyj9/S23l8zlPjyR2rsjsyrjAJoXqSgvjw==
X-Received: by 2002:a05:6a00:2d86:b0:63b:19e5:a96e with SMTP id
 fb6-20020a056a002d8600b0063b19e5a96emr21277690pfb.9.1682442901896; 
 Tue, 25 Apr 2023 10:15:01 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:603:2180:ebe0::51c9])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a056a00218b00b0063b8ada8777sm9582454pfi.112.2023.04.25.10.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 10:15:01 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Apr 2023 10:14:44 -0700
Message-Id: <20230425171454.48802-4-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425171454.48802-1-aduskett@gmail.com>
References: <20230425171454.48802-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682442902; x=1685034902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/z+S7ItTS/AB7N6sF+38kNep6zgCg4vMMjr56SMrtKU=;
 b=LXupdbexkMNASA2+2bWxmd6imIhvsx0y8nr2B1Fq5ELw7TQqOoHEMDer0ZXTk/avzh
 rByGHJKJZxPK+J1NlSF6LSkO45DYx7P+b4sdeqF/975JeCKMUhVuLK57M60dwOn9cP6Q
 gowYKyjuMS6Hl4wVPM+YXmMOsFcga/3/SaekpIuHvxm6n6ZqOcFVhPd2EXSC9UUz43ZX
 2GiGaYOV/hBlJBFTb6iQj0vwvXs/L7LX+VU8fqLPMxYiAT+iYyTA/ZS/bCkN8YeRLW32
 s/zsZj+4wykDiSsZdCju99lc2pvdQblzsT7/NdkvZVehnMimOKu4on1DI+kfjKnpff46
 nEVg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=LXupdbex
Subject: [Buildroot] [PATCH v2 03/13] package/libsepol: bump to version 3.5
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change the license file to LICENSE. The hash remains the same.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libsepol/libsepol.hash | 4 ++--
 package/libsepol/libsepol.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libsepol/libsepol.hash b/package/libsepol/libsepol.hash
index 039e4e3c7e..c243aaae2b 100644
--- a/package/libsepol/libsepol.hash
+++ b/package/libsepol/libsepol.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  2d97df3eb8466169b389c3660acbb90c54200ac96e452eca9f41a9639f4f238b  libsepol-3.3.tar.gz
+sha256  78fdaf69924db780bac78546e43d9c44074bad798c2c415d0b9bb96d065ee8a2  libsepol-3.5.tar.gz
 
 # Hash for license file
-sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
+sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  LICENSE
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index 8551a5de79..f7782542ec 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBSEPOL_VERSION = 3.3
+LIBSEPOL_VERSION = 3.5
 LIBSEPOL_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSEPOL_VERSION)
 LIBSEPOL_LICENSE = LGPL-2.1+
-LIBSEPOL_LICENSE_FILES = COPYING
+LIBSEPOL_LICENSE_FILES = LICENSE
 LIBSEPOL_CPE_ID_VENDOR = selinuxproject
 
 LIBSEPOL_INSTALL_STAGING = YES
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
