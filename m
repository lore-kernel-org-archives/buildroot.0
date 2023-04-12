Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAF6C77B6C
	for <buildroot@archiver.kernel.org>; Wed, 12 Apr 2023 22:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3263581F96;
	Wed, 12 Apr 2023 22:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3263581F96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dH1rgtq2SkOn; Wed, 12 Apr 2023 22:26:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B88581FA8;
	Wed, 12 Apr 2023 22:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B88581FA8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 37C3F1C3D11
 for <buildroot@lists.busybox.net>; Wed, 12 Apr 2023 22:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E5D781FA2
 for <buildroot@lists.busybox.net>; Wed, 12 Apr 2023 22:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E5D781FA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aP2KlLZ_llrD for <buildroot@lists.busybox.net>;
 Wed, 12 Apr 2023 22:26:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12EC781F95
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12EC781F95
 for <buildroot@buildroot.org>; Wed, 12 Apr 2023 22:26:06 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id n14so38112575plc.8
 for <buildroot@buildroot.org>; Wed, 12 Apr 2023 15:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681338366; x=1683930366;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FB6Zlx7pe8eQUxzZDcDQydCj7ApS5kVdgYGr1iwsZ/M=;
 b=EcdchlrzTk7LcYtRecL9unG+B31xQkBFTqbD2cMJZx8voDvleYPa6RRN7KLwKkld6V
 4BRPW50KnCOSvYjDuz9B4joVt+KT8O63BvOIgXFsamTiFzP5gEgIlWDG3BaCvGccbr2U
 y3UicOIHZ2hVcEbWTUCaVV1dMpjb7rXFLDtoRtcgZdOkvqV5OENPCFyz+oZrXDQ72y4C
 f9BP/N2wCGSmAh+6AYDU0A2gikRFFK5pyRt/L+mwxnSbveRZDwoLM/4+DMzXpcx1y9Gg
 Rmfi+7zlhtzS4FvJ1LEp6dAXguRPruudNIHqcqR1wdaSDXLUzmYdnp5+Ea9ihqNumif8
 l03g==
X-Gm-Message-State: AAQBX9fwpxBNBNIdjgNAH6bM6YoF+zPKvbze5eLY8LKehdTG4qWJEp6H
 73dqWfBQVVSUuQkBsv3lapZJSQuymuHjXw==
X-Google-Smtp-Source: AKy350Y5wQdyfuf2X0boip9HRfECypCqY8D6/pKKdLs4ATtUEz7Qa9bfRRmLlilJ2s9z5xDg9GoGVA==
X-Received: by 2002:a17:90a:e7ce:b0:241:c25:14c3 with SMTP id
 kb14-20020a17090ae7ce00b002410c2514c3mr10171037pjb.35.1681338365905; 
 Wed, 12 Apr 2023 15:26:05 -0700 (PDT)
Received: from adam-laptop.hsd1.wa.comcast.net ([2601:603:2180:ebe0::a8d0])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a17090ade9200b00246cf1a8d3dsm58155pjv.17.2023.04.12.15.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 15:26:05 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 12 Apr 2023 15:26:00 -0700
Message-Id: <20230412222602.1975782-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681338366; x=1683930366;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FB6Zlx7pe8eQUxzZDcDQydCj7ApS5kVdgYGr1iwsZ/M=;
 b=K4niPNX4y+Yehr1kNpo/E0rfn0VieOeQd54DlfR9AtyNR0rAWD1ZjK8d/c6sL4cHoJ
 2u1qoaQ/r53x/aNNb2zoXiwwgfueKdFoq/oIytHB0yAh92CiZa2/FUi+IdU+FmaPQiG7
 aZ1gXuitgCBIGZbcxAUeXfSUBqmROSEHOI+REQRjF2PGAY3AwSVVH6VvXwBxZKKtlyFZ
 q0Q9dX6G774tVlpq0p8v3FBwnqc+tPVmRH2dYMW2/qaX4NjVWn3dmUBLTxi0oaNvZCeM
 rFX6Xg8yFBTdjv4NrWPE1Da6X7+vLLxRrZq+Ejd+c4fEXZoScTrAjwJfymaYr5Q+5SzK
 rnbw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=K4niPNX4
Subject: [Buildroot] [PATCH 1/3] package/libnftnl: bump to version 1.2.5
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
Cc: Adam Duskett <aduskett@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Also: Switch to tar.xz as the package is not distributed as a .bz2 any longer.
Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libnftnl/libnftnl.hash | 2 +-
 package/libnftnl/libnftnl.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnftnl/libnftnl.hash b/package/libnftnl/libnftnl.hash
index 113110fc1b..0cb3917f2d 100644
--- a/package/libnftnl/libnftnl.hash
+++ b/package/libnftnl/libnftnl.hash
@@ -1,3 +1,3 @@
 # From http://www.netfilter.org/projects/libnftnl/downloads.html
-sha256  e916ea9b79f9518560b9a187251a7c042442a9ecbce7f36be7908888605d0255  libnftnl-1.2.3.tar.bz2
+sha256  966de0a8120c8a53db859889749368bfb2cba0c4f0b4c1a30d264eccc45f1226  libnftnl-1.2.5.tar.xz
 sha256  98193898c663001eff2fdcfb676e210c13042bc1a05e8d570c363efa396f8e24  COPYING
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index fd87f70091..a7045337d0 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBNFTNL_VERSION = 1.2.3
+LIBNFTNL_VERSION = 1.2.5
 LIBNFTNL_SITE = https://netfilter.org/projects/libnftnl/files
-LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.bz2
+LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.xz
 LIBNFTNL_LICENSE = GPL-2.0+
 LIBNFTNL_LICENSE_FILES = COPYING
 LIBNFTNL_INSTALL_STAGING = YES
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
