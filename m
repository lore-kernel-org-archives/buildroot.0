Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F2CE6FE4F
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 07:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAD40408BD;
	Sat,  7 Sep 2024 07:23:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UoE7t7ACJemY; Sat,  7 Sep 2024 07:23:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94699408CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94699408CF;
	Sat,  7 Sep 2024 07:23:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 40B941BF401
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 07:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EA6781759
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 07:23:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vnKm0X-ODCPX for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 07:23:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 03AC48135C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03AC48135C
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03AC48135C
 for <buildroot@busybox.net>; Sat,  7 Sep 2024 07:23:00 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c25554ec1eso3106123a12.1
 for <buildroot@busybox.net>; Sat, 07 Sep 2024 00:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725693779; x=1726298579;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=51DLPRWjgQ9crSbLN7hbXp63QkB0E7rzqkCHvLu77kQ=;
 b=BvNFm8f5CICqwlIVKkeHtGggTq/lkwN9d1+sQL+zm4bFXDUlv9XAAtcmDqUKwuYFmH
 gajMgXuVRT+2vE1TDkQ9uKGezZrijUfA13uR57rCcMhr0aXWS5kBPR0Kd17x5/TYyzTg
 7klwGMtzNuaFcRo/RkS6jwmjLY2BPX0LKhTE68m6XDdUIqcTKxwFPjD03dYpww6rLesi
 /0RdBVi/ub9xzNuLd52Omo59fGb81X6g/88LWev0xlg/ISYqiEe+NBAfPh2zvT4FV50U
 PG5u09HDhL2RoUaj/y2aAsWK1XV5U+GOijMaa6rhuGIRPxwK+kkuBAUsmoxpKxbM7tEX
 qYwQ==
X-Gm-Message-State: AOJu0YzFzm8bAeNK34uuTLLgI08CeDePHnOv2roNQr8jwhDCG6RdCdzZ
 WBihVC4Pqdr2Wh3frcRE8AFvWKOTKKDo2ECvyQYNFtaDcjFY70MbqkFKY6QUNmb4q9IC5y7xR4S
 hsg==
X-Google-Smtp-Source: AGHT+IG/G23MVn0xaEnuQqiM7gdvlDzZhaMNJJ+dFkvepGPqO/CLTQKReT8YvXK0nKJCHF+EmSviNw==
X-Received: by 2002:a05:6402:40cd:b0:5be:f1a7:c2cd with SMTP id
 4fb4d7f45d1cf-5c3e974b43fmr1749262a12.31.1725693777736; 
 Sat, 07 Sep 2024 00:22:57 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd76edasm353902a12.77.2024.09.07.00.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Sep 2024 00:22:57 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat,  7 Sep 2024 09:22:53 +0200
Message-ID: <20240907072254.3248370-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1725693779; x=1726298579; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=51DLPRWjgQ9crSbLN7hbXp63QkB0E7rzqkCHvLu77kQ=;
 b=rHCIMtqZDqoPnVWcRRQY+TnxX0jLJg0ycdg+lcdznPfAPokquMKAscn8b9WXaFagIi
 sPyzQY2PAkfgSdqH758EiXWONp9hHoSlNh4CEwCtp4oRz4X73I4/KjALMlOyPdQoGN9j
 70ZLib6YR7rD5y2yidzCq07Q2Vb0fOVhl/TOFjqZL/uV0LTbmiHxh6XvXClUUVkNpNi9
 DyifoH66FZyLn3yj0zkJgDbjfhmzU+0WcKQx9kbJzbbv/HpDrAxju/9/wRtwsB4IPm2H
 kDbre6/7Jwt7kPgdYPVCwxqc5MkVi511+sipeHsP6gaFpddroyKeoz4ZBSix0luJ1lcF
 hpEQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=rHCIMtqZ
Subject: [Buildroot] [PATCH] package/lmdb: bump to version 0.9.33
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

switch site to git.openldap.org

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lmdb/lmdb.hash | 2 +-
 package/lmdb/lmdb.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/lmdb/lmdb.hash b/package/lmdb/lmdb.hash
index d72c66aac..4b80953df 100644
--- a/package/lmdb/lmdb.hash
+++ b/package/lmdb/lmdb.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  dd70a8c67807b3b8532b3e987b0a4e998962ecc28643e1af5ec77696b081c9b0  lmdb-0.9.31.tar.gz
+sha256  d19d52725800177b89d235161c0af8ae8b2932207e3c9eb87e95b61f1925206d  openldap-LMDB_0.9.33.tar.bz2
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  libraries/liblmdb/LICENSE
diff --git a/package/lmdb/lmdb.mk b/package/lmdb/lmdb.mk
index 86d72e1ab..e4f929c7f 100644
--- a/package/lmdb/lmdb.mk
+++ b/package/lmdb/lmdb.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LMDB_VERSION = 0.9.31
-LMDB_SITE = $(call github,LMDB,lmdb,LMDB_$(LMDB_VERSION))
+LMDB_VERSION = 0.9.33
+LMDB_SOURCE = openldap-LMDB_$(LMDB_VERSION).tar.bz2
+LMDB_SITE = https://git.openldap.org/openldap/openldap/-/archive/LMDB_$(LMDB_VERSION)
 LMDB_LICENSE = OLDAP-2.8
 LMDB_LICENSE_FILES = libraries/liblmdb/LICENSE
 LMDB_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
