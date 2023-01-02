Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9D6C46467
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 12:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33E07813D7;
	Mon,  2 Jan 2023 12:21:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33E07813D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ruebdjZQ8qe6; Mon,  2 Jan 2023 12:21:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DE1581349;
	Mon,  2 Jan 2023 12:21:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DE1581349
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C0CF51BF33E
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 12:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AAD281349
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 12:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AAD281349
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pSi3-r6jsrA2 for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 12:21:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EF8D8109A
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3EF8D8109A
 for <buildroot@busybox.net>; Mon,  2 Jan 2023 12:21:20 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id ja17so20246796wmb.3
 for <buildroot@busybox.net>; Mon, 02 Jan 2023 04:21:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NZr02eszOZ17fIarACRqBx4Fw+ogrIF1lPu5RvtFdlY=;
 b=7c/aa4skQCPKr8XuVbz22zbpRhBM4nkjMpPIzzjBkkihCGUv3Tg9GdEBdvizuA5tcd
 ve30OLOoJw1k1DboUJQH37GEuWKqEhD7rfN2S9qUM8XCFwaE0L4jZWLw/vZL67be6ICT
 RY/ZM18Rg7493phNMR2Ev+zsK/2+kZp9UsX0lqTIE+Ys+RkdClMD8t62bKCMeOQ/W5dK
 zldqlT3Noaz3KGKYt+p66O/4oEiPDMUPJT6QVJvMatS5dEH36UkKbHDQs0DoL+bnnL9L
 ciaZnz3JtTRKs/Cw9zdVYWyBx5gKpKLIv6hdhH+EcanIvLL1asyO67sTWevJAyHmms6T
 E65Q==
X-Gm-Message-State: AFqh2kqqa2lT7YDozpBBBjZn/vytC5avwl7HSIohKBr9vCzVuXScr+Ho
 cm/81EqFwTFeK5Ao/AAtqlhMB7Zs3kc=
X-Google-Smtp-Source: AMrXdXvaPvuvQkZwX6qAxoBoHaSoHPYitlf1fqiCbZN8HA0DvWumaQ/jo/sqjMwEjRnOqbWqF4cveQ==
X-Received: by 2002:a05:600c:41d1:b0:3d2:3d7b:6118 with SMTP id
 t17-20020a05600c41d100b003d23d7b6118mr28446888wmh.24.1672662078365; 
 Mon, 02 Jan 2023 04:21:18 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a05600c188700b003d9aa76dc6asm10585249wmp.0.2023.01.02.04.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 04:21:17 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  2 Jan 2023 13:21:12 +0100
Message-Id: <20230102122112.1912236-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NZr02eszOZ17fIarACRqBx4Fw+ogrIF1lPu5RvtFdlY=;
 b=Py09l7JkSdXPv9AMlWXcWikaVFGlqK99/Oyr1OHAvw+vkmEJL8d6YifcTGzp/OLBkV
 cFaB0tVb9TZ+RN3g7v+RO2PBQgu6mYJlfBeLNk1iKKgfsNaFt/dVjZInfcQFUEeKUV9a
 jCej7pEjUNdbqt3aX5WfqFy7S9rWfp8iwAG1pU5nM4ghj+2s2MkJSDmBb5Qn+Ptc5Avy
 IAH+ryI4AH0ESSGl11glvTUcnJNM4N2hNhUwnla10tNg+Ej0e+QmvkTrOjY+/FvIZacl
 jMTky2jxCc5COuISeQDmA7hCUmdbxEUTOI2K1asu/m7AtAbr4ZJyAXjuGgJwc1ozt3ud
 AD+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Py09l7Jk
Subject: [Buildroot] [PATCH] package/hwdata: bump to version 0.365
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index 6c5a091a0..4f56b0c12 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  f0bb38588b9fcb43e15dac4ce8461b7580ef38ac20ecab83cef638413646decb  hwdata-0.358.tar.gz
+sha256  d6ae2436a69c6f5e04d926f5d753a99d90deb864065a2e2f8a8eda87b70dcdd5  hwdata-0.365.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index b2e183807..00fe6c145 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.358
+HWDATA_VERSION = 0.365
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
