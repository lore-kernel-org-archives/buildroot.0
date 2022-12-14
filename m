Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639DCC4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 18:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB24D40BBC;
	Wed, 14 Dec 2022 18:50:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB24D40BBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sO2FjxgNm7b1; Wed, 14 Dec 2022 18:50:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 207E340914;
	Wed, 14 Dec 2022 18:50:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 207E340914
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8FCE31BF312
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 18:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7249581318
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 18:50:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7249581318
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JbMVIOsDvF6Q for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 18:50:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26A2381312
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26A2381312
 for <buildroot@busybox.net>; Wed, 14 Dec 2022 18:50:27 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u12so715023wrr.11
 for <buildroot@busybox.net>; Wed, 14 Dec 2022 10:50:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lYEpS8JBQMOgjC1uQ42eqf8A/PJYlqNswA/DIzKVFeM=;
 b=paDkmCI1v06DeO46UBnyBl2U+uXhKEnTx4dLyCN/9PBXF567Hc4Vi+7vAdT5QoQG0S
 omZs6Aa0e8a1LQz8beXjKbqu3YnX5gFQil/IOmgu7SbbnPDT4x0Fl2pXAsJL5g3WIUkJ
 IQCvtN/buhEgOngfjF0o984z8Pfs90TszmtrBcXu95ANT+b2NEaYIBfIAy3ivKxMDtr7
 2i+KZoVN+3nRA0XbSIEu6g1FCJ1M5FdheQfCKj+BaKszlkSo9h1Az/SDan+9WNMWnKam
 ODfzJEX7AaqKdt9zf5Q04zwsnvVushJCaYBtEUVVeCbXA1OJjtsxgVsa4GtpMCKF2QS2
 R1oQ==
X-Gm-Message-State: ANoB5pmwkM96G7cYc2dTLyhzpD2CEEBkygPL6oXrbI+eR6fWmiPHEy2d
 rLDXwPyAtI621qfxQ70W6JI9V/VqFJQ=
X-Google-Smtp-Source: AA0mqf6sAYXjCcDVzs173GOmYW2LYsgI2Tp4/Lo54l8VSSXPrd2yOOcB6qWTaVlmrvVU+otWGSRnjQ==
X-Received: by 2002:adf:fe46:0:b0:242:1d48:e047 with SMTP id
 m6-20020adffe46000000b002421d48e047mr16029241wrs.34.1671043825114; 
 Wed, 14 Dec 2022 10:50:25 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 i14-20020adfefce000000b0024194bba380sm3723188wrp.22.2022.12.14.10.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 10:50:24 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 14 Dec 2022 19:50:18 +0100
Message-Id: <20221214185018.3340110-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lYEpS8JBQMOgjC1uQ42eqf8A/PJYlqNswA/DIzKVFeM=;
 b=lXMH9brcm2Jjmk9SxDw9pQLDQt+Jwy3WX0FsleUdKojl88kaSRgrOT7935NAkH1afG
 kb4KlIJ38BLfdrc46d7joh7OxzROiY3LL22nWKZpRgBx0Rh1Ax+swWylcRpBU64ZQTbz
 xG9YUl8B6mhv/wjl9Za3HLVSQk44/8bcBpFOG4odpuE8yvoMUIiPjKcniddjacgZfvG+
 +GKD5JeLvkkf4mBhtmOXsSXAnDPOlXr3KEzMC4BJWet82/WHoSCig0XuolZ+qSEEtXOf
 AnIu4S/0kgFAgl4Q8Kjc9DWoGcfrwfks+AsMh/EcZG39y5p9jY8JzXmKuGpm4LFURaj9
 7eCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lXMH9brc
Subject: [Buildroot] [PATCH] package/iproute2: bump to version 6.1.0
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
 package/iproute2/iproute2.hash | 2 +-
 package/iproute2/iproute2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 45af05a20..9e8be43f2 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  523139e9e72aec996374fa2de74be4c53d2dd05589488934d21ff97bae19580a  iproute2-6.0.0.tar.xz
+sha256  5ce12a0fec6b212725ef218735941b2dab76244db7e72646a76021b0537b43ab  iproute2-6.1.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 287c6b14e..9792630f1 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 6.0.0
+IPROUTE2_VERSION = 6.1.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
