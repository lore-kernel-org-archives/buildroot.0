Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA5CECAAD5
	for <buildroot@archiver.kernel.org>; Mon,  5 Sep 2022 13:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E71560F4E;
	Mon,  5 Sep 2022 13:55:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E71560F4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BW4W9yP2XI_R; Mon,  5 Sep 2022 13:55:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC4DE60B0E;
	Mon,  5 Sep 2022 13:55:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC4DE60B0E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0043E1BF319
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 13:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEFC381384
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 13:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEFC381384
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hV1VQ4xqdfQ8 for <buildroot@lists.busybox.net>;
 Mon,  5 Sep 2022 13:55:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CA1081361
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CA1081361
 for <buildroot@buildroot.org>; Mon,  5 Sep 2022 13:55:46 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id u9so17283045ejy.5
 for <buildroot@buildroot.org>; Mon, 05 Sep 2022 06:55:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Y7V1lJYbLSwibMmD9FjPG6yCObPXLfg67OzH4CQ6YrA=;
 b=uVaIt+u7HUWzmTNlrAGYlBiW8sgR+J/8XgkxsjjFc6D5r3LihHHADG36+AT6UqtDj/
 Ta+tTE43NKgPge/HXKI41L7u4wV3DRemgsGPexo9c0VuU09lM4JDBmzWQOCc+asleGOy
 dBV9QCgwUyRwGfNAc8GUb3dL829xrzG6o0IQT2/4USxRuFPqMYZo20EzyjyHmja4yXS+
 HtPcvuDkjLxF2BQ7nhw6f6dwNuY7FQ7dCjNO8Mhmb/vtwe2J59ZMMQbQUpBXbDmxJCwj
 eefuV9g1FDSW6bGDcNHTvwVt4RqoqKDSF47TnLxdhPI70MI4a1a/ZwQQPonAYo8cv6We
 pGhg==
X-Gm-Message-State: ACgBeo0YcYPFQL7d2DC2KS76yKlMc6jxbT5gSUa/n3bVAAT9lC4OUmnG
 P9iDFUTgn6ZGAHPmG54JiGr+Cg0DwkSN7A==
X-Google-Smtp-Source: AA6agR6dU+4lwR+S67/y50wyqO+ccvddUIoiLguCl++X5ybm1Ks9zJbGe2m/0L1fyd4KpeoCrJAqaw==
X-Received: by 2002:a17:907:724f:b0:731:9ec:10fc with SMTP id
 ds15-20020a170907724f00b0073109ec10fcmr36558624ejc.427.1662386144490; 
 Mon, 05 Sep 2022 06:55:44 -0700 (PDT)
Received: from sprado-office.spo.virtua.com.br ([2804:14c:46:297c::32fd])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a1709063d2100b0073d7ab84375sm5146080ejf.92.2022.09.05.06.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 06:55:44 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  5 Sep 2022 10:55:33 -0300
Message-Id: <20220905135533.4182511-1-sergio.prado@e-labworks.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=e-labworks-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=Y7V1lJYbLSwibMmD9FjPG6yCObPXLfg67OzH4CQ6YrA=;
 b=0wHBrBIaCZxXISDx3Rb7bD485wdj+6ZFrILU+knTQ6+aPg5hwtnz6aICU5gtSVVjgY
 mX20LJVmfg3x6ZMtFI8+M1N/W2DdEX8Oey2Pjl98Q8rv9ODJE8zz6ITJG6M7rZNlPuiU
 6Md9EqrRFpXElI7BuEEIaPoLhL+pFQVLFbh+RmZgoql+VQxIkZJJXBOqFcqrdJQS/rVV
 hEabdlWMVu1oYQ9qcM6n4CrPCUHhLfeatQGO0PVGAKZQmYSDf2/5Ryh/kxXSxmq9cviR
 8S9rQGr2HJwrmJGhiIkYUx7XJrqLFgcvZFajNRWlEc0Exye8RKLNqX0wSgIzChZ8ZhaY
 23Iw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=e-labworks-com.20210112.gappssmtp.com
 header.i=@e-labworks-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=0wHBrBIa
Subject: [Buildroot] [PATCH] package/stella: bump to version 6.7
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
From: Sergio Prado via buildroot <buildroot@buildroot.org>
Reply-To: sergio.prado@e-labworks.com
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Sergio Prado <sergio.prado@e-labworks.com>

- drop a patch (already in version)
- update Copyright.txt (changed from 1995-2021 to 1995-2022)

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/stella/0001-configure-add-CC.patch | 30 ----------------------
 package/stella/stella.hash                 |  4 +--
 package/stella/stella.mk                   |  2 +-
 3 files changed, 3 insertions(+), 33 deletions(-)
 delete mode 100644 package/stella/0001-configure-add-CC.patch

diff --git a/package/stella/0001-configure-add-CC.patch b/package/stella/0001-configure-add-CC.patch
deleted file mode 100644
index d4b29e39b5d5..000000000000
--- a/package/stella/0001-configure-add-CC.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 143cf9fa13a07b827de7065a5e919631406b0941 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 12 Dec 2021 22:46:52 +0100
-Subject: [PATCH] configure: add CC (#854)
-
-Add CC to fix the following build failure when cross-compiling which is
-raised since
-https://github.com/stella-emu/stella/commit/771b5b44e31de1b81a552ee47b65014fbc338776:
-
-out/src/sqlite/sqlite3.o: file not recognized: file format not recognized
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/stella-emu/stella/commit/143cf9fa13a07b827de7065a5e919631406b0941]
----
- configure | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configure b/configure
-index df666b377..0101d2567 100755
---- a/configure
-+++ b/configure
-@@ -899,6 +899,7 @@ echo "Creating config.mak"
- cat > config.mak << EOF
- # -------- Generated by configure -----------
- 
-+CC := $CC
- CXX := $CXX
- CXXFLAGS := $CXXFLAGS
- LD := $LD
diff --git a/package/stella/stella.hash b/package/stella/stella.hash
index 8aa51181650c..17d059226cfd 100644
--- a/package/stella/stella.hash
+++ b/package/stella/stella.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  d481efc6d27b5294565dfcc10983de2dbc4db8a59932a678ffdb4d2404b8c207  stella-6.6-src.tar.xz
-sha256  d5e5897578c2590e48328986cebd950ff215653f7f506ef93accf981870366a6  Copyright.txt
+sha256  babfcbb39abbd1a992cb1e6d3b2f508df7ed19cb9d0b5b5d624828bb98f97267  stella-6.7-src.tar.xz
+sha256  e82dd017fea2c70a16726aa1d7c05c5b7597e10f7229511c1b110bf84cb507c0  Copyright.txt
 sha256  58530d09b6fcb91ae27071be0081af90e6c2d7fdf991d34a29e234a2a5e75455  License.txt
diff --git a/package/stella/stella.mk b/package/stella/stella.mk
index 198a1134dc7e..aa5da1996e1f 100644
--- a/package/stella/stella.mk
+++ b/package/stella/stella.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLA_VERSION = 6.6
+STELLA_VERSION = 6.7
 STELLA_SOURCE = stella-$(STELLA_VERSION)-src.tar.xz
 STELLA_SITE = https://github.com/stella-emu/stella/releases/download/$(STELLA_VERSION)
 STELLA_LICENSE = GPL-2.0+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
