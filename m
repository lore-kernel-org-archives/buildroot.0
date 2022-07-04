Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAB7C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 05:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B63D60C01;
	Mon,  4 Jul 2022 05:57:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B63D60C01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oQSJk9ixlZbn; Mon,  4 Jul 2022 05:57:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BC9160B2B;
	Mon,  4 Jul 2022 05:57:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BC9160B2B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 986BD1BF3C0
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 05:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80E348268B
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 05:57:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80E348268B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9u3NNA_wRjnZ for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 05:57:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E35982681
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E35982681
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 05:57:00 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id pk21so14870109ejb.2
 for <buildroot@buildroot.org>; Sun, 03 Jul 2022 22:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nTl9gPYxjTyT4bQ8dPTanSnG0ac3oZ+i1UK0yLdi2vQ=;
 b=ysl8pAE6MLhuKMbdsJ8YANq+QHpw6iMivvfgSdoJr00YSWb2nwQJdQrdyPZbbcCrD6
 ERM6OIRUbPoyoWK9FEL4jKCP/0xNgxcVUzaj2unHXkFV/iGDG3dK2Z8wepywrPThMNfX
 KSJu8qJhcpaVyjG3X2/38rHkKXjuGbVjztuQJPdDvNlZCWvoXpttCwGXLxQjCGC0OyVf
 uD55R6rwR3dZhgdYQ/LAFtdHOHioTpC4Q0uVhV9y5wKoPYolDjhtFDTHU9SQ4YG0Q0ME
 6CeqB49bPqfLi+JIJ/C2Vkv+gD+8lxuq3G502pTlgVvknrfPEFBAOdXA202Kp1WlaBXZ
 PXcQ==
X-Gm-Message-State: AJIora+OOBmCAn76pfBhaORSbXUxg+ShijgPt1j28QJFHdWwKu97dVPz
 3tTOYoUgPVt73q74bL0uk7b8yh2FPoA=
X-Google-Smtp-Source: AGRyM1tSZq52Nz4S+2lAtV+TdxZ/aUEr4tY1P6ZCXnzlmZMbrKGY87uJkAEduJaySvdU3Iua7Hx2AQ==
X-Received: by 2002:a17:907:ea5:b0:726:2c1c:312f with SMTP id
 ho37-20020a1709070ea500b007262c1c312fmr26446840ejc.248.1656914218060; 
 Sun, 03 Jul 2022 22:56:58 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a170906780600b006fef557bb7asm13729888ejm.80.2022.07.03.22.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 22:56:57 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Jul 2022 07:56:47 +0200
Message-Id: <20220704055649.2780-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nTl9gPYxjTyT4bQ8dPTanSnG0ac3oZ+i1UK0yLdi2vQ=;
 b=ekzrswIPZLYdek8hrw4XNgyeMQz7TVhHRNUafJEy18Ll1Jo4gy/nop2xtQzijvwY4s
 wmm3b1F18r99m/hDKKnNGqmU7LSQpsM7GPwXAD6bit/vgu5lXUtmUmIxCWabc+vWcdyu
 /A026Vo1gXO2NNqXFdcx7VwsMqzUNcRrCvzD7NcfjKbqGEdLDCH1741uzzDIDg//GKYQ
 BJPW98JctutiBRPXDooBrqxF6uN0E59pAMl2lll1i7GueqxieFGOP+MaQqwKZ5unyZFI
 SsP7Dixuvgw1IYmY5fUL2+i4RlN+sue9udc8E0cYY8eHYwPZhoAf946ywItd1TcjK1pX
 Sg/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ekzrswIP
Subject: [Buildroot] [PATCH 1/4] package/libyang: bump version to 2.0.194
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/libyang/libyang.hash | 2 +-
 package/libyang/libyang.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libyang/libyang.hash b/package/libyang/libyang.hash
index df794cc9f1..c064c2e69c 100644
--- a/package/libyang/libyang.hash
+++ b/package/libyang/libyang.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7ed65c3e180eb14183d72676468b2b81682baef0957d88d0114341d886c19093  libyang-2.0.164.tar.gz
+sha256  94898ee391c238dcd29ff21092e5dcab4e17b9623e88862a55b72fc6168846f8  libyang-2.0.194.tar.gz
 sha256  0b7ec43747d211a1e49c53588b0822062947bab6bdcc95238578beab34cba5bb  LICENSE
diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index e2dc810fe0..36f452ca07 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBYANG_VERSION = 2.0.164
+LIBYANG_VERSION = 2.0.194
 LIBYANG_SITE = $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
 LIBYANG_LICENSE = BSD-3-Clause
 LIBYANG_LICENSE_FILES = LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
