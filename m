Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0CDF34C5C
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 15:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A392384799;
	Mon, 13 Apr 2026 15:12:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GSB4-tPrVM12; Mon, 13 Apr 2026 15:12:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5788084637
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776093173;
	bh=J/15QamYar1ovxefL/zl35n6TszKL+g85Vp4bx5ezoQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B9ye2kR75CQMsKsdBQMJVjrti/W6WIw/iGleWmxlLIfbAAhYHX/d1UE9r1JBZ2oUW
	 /9NrdDmJCAid1i6wSqTINtaf98t9T3vOCJrYe6DP2U8y6E30zKYQzSGwDLX3LZvbZn
	 4coaxduiqyk6lKGaL0W+L30BSUCX0xvx6+7FNUi2RYeiyCNz70fgwlgGg6xy6DoFsP
	 ggu6I4Ih38XBxgnr06YmH8infALbyoZVfAE3u7oHOZHfgbvMJhOCTImykF223iHsNW
	 m1SwrJZU7XnuQsNpsjQKclMbzAP6cBhpuz7nG1ZyE6OcS6+JMPuHCunpswqgpyZ+Gw
	 cYnJulKO3AqRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5788084637;
	Mon, 13 Apr 2026 15:12:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25115283
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 15:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15DA9422EA
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 15:12:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id diVSdBa7VTEM for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 15:12:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 02E86422E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02E86422E7
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02E86422E7
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 15:12:50 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-43cf8fe9c2aso2862897f8f.2
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 08:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776093169; x=1776697969;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tHPH1lXtAMGXAA/Wwhlr4VqAvK3YuWzDG5wZG9rKPDw=;
 b=Eu9tjJEg4MOALeJ9MnRO/ae2t+W+C27dC77MXkZ52Y/0EQ/y92GqKDUqjEmlZ+2cxO
 QGQuqzo7VPu5RsMI5chTFwewmzRAN9S1pVdKO82GGTWCdBkcTVUeOaSqsbmpCausuTI6
 oQvhcfqlclt+sL3U79dtbOrEo1gKKC4/1LdFBjIZujUBMXAgYbk9bXbK6XXUdiPkn9wO
 BGbVU1fSeKRvV7bqtvLpf40A5QObe6Xm/mM0tZZC3Hb27W1bBKBVcNaZJ3vqRjJrJNy7
 4HucqDkeQSaTGTSsksrBCP+YJ+EG6lkqfLBFJQ8Cem79Rb0dyhWz6DyA+3EFkX/9ufwb
 IySQ==
X-Gm-Message-State: AOJu0YyhidxOaBjvolwW0ZUCrBvoge0tUkS7qaul1NTyykqEzqGmVLvL
 MLo+LQ7Y50BxHMfPsaz4m5iLabtfjnOk8OlbLtoCY5MznJ1TL5Zvo+siUb/eNA==
X-Gm-Gg: AeBDieuctNl6NFeyTvoYcwPxcuN/trYInlrtmmUM9hj94CNwNrYkXSd1eKx1nwZ7Pdh
 NXoK9pbXo7SgPP27R7lJS5rZzkz9HGHI5W0zH1aime/temqZcq+/L4jGl3cwzg1fWJuUcKSSjp9
 HY1a7WDAheC/E7ZvX+woOZGWe0opQuWk20h3YcIEQFJrbn05HeeVlW27YanHyMUgJJzsh9TWjy0
 lDG/0QMbmrxgMJ4Ruzo3P7vrFgtRyj9OMo0dsIMJNKBG/HnCjwx2f5MsB8AerYVWxBFpFwvkB1V
 DI+nIpgNnx6qwh8cO+zfedzLIbtjeARUKhnkpDIfT6VsmhAnkvPQ9wMuUvNkRZBwKdIuOGIQ5Jc
 7JLIhX78igxIaPie5/AhzlYIjbHhMbQFT4ysrfysyzoKv88cUIU9rxwo3tckL/+o2l3g6olRMzX
 FjxsosXbJhx4mhlzOy
X-Received: by 2002:a5d:5f53:0:b0:43d:5833:fdc5 with SMTP id
 ffacd0b85a97d-43d642b6b90mr22455563f8f.25.1776093167815; 
 Mon, 13 Apr 2026 08:12:47 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:e29d:2bc5:1d06:3359])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d7c135fd6sm8908945f8f.28.2026.04.13.08.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2026 08:12:47 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Vincent Jardin <vjardin@free.fr>,
 Maxime Leroy <maxime@leroys.fr>
Date: Mon, 13 Apr 2026 17:11:48 +0200
Message-ID: <20260413151148.42226-4-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413151148.42226-1-maxime@leroys.fr>
References: <20260413151148.42226-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776093169; x=1776697969; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tHPH1lXtAMGXAA/Wwhlr4VqAvK3YuWzDG5wZG9rKPDw=;
 b=UsB5S2yaBMN4ZvjKgn0tNEoMEENdyc5H9SM3SKBLjNqv5+Xd/j+uVDUqMOnuAEaWhw
 QetU3Bw+9R0omNKmOvd+zGWw/n5f2dgrJS5WNGVKVMzC1sgSmvNtzjW3suxurjqO/j9u
 ivTYI7OhrMz4yPmcOYSQy4waZjdlVLv9ahohPrUrVvXhVVZ89bPZG9sn5dZhqp1ivV0X
 /MWHTtdnLt2E4v125z91Rcj2ufERvxQyYiSTBA0bv4hkvHo9d1bMk+VqN90nVlOsIsdY
 u9iXUp15c1OLTkUCKcawqESVsq2L+3ZPQP3POYOjv8nX31nfy5G620f3SrzYHW1rvzEn
 HFbA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=UsB5S2ya
Subject: [Buildroot] [PATCH 3/3] package/grout: bump version to 0.15.0
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

Drop util-linux dependency, libsmartcols is no longer used.
Bump GCC requirement from 4.9 to 13 for gnu2x and C23 enum underlying
types support.

See the release note of the new version:
https://github.com/DPDK/grout/releases/tag/v0.15.0

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 package/grout/Config.in  | 10 ++++------
 package/grout/grout.hash |  2 +-
 package/grout/grout.mk   |  5 ++---
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/package/grout/Config.in b/package/grout/Config.in
index 1cfec41d7a..c57937dc18 100644
--- a/package/grout/Config.in
+++ b/package/grout/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_GROUT
 	bool "grout"
 	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS # dpdk
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dpdk
-	depends on BR2_USE_MMU # dpdk, numactl, libecoli, util-linux-smartcols
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # dpdk
+	depends on BR2_USE_MMU # dpdk, numactl, libecoli
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_13 # C23 enum underlying types
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19 # dpdk
 	depends on BR2_TOOLCHAIN_USES_GLIBC # dpdk
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC # numactl
@@ -14,16 +14,14 @@ config BR2_PACKAGE_GROUT
 	select BR2_PACKAGE_NUMACTL
 	select BR2_PACKAGE_LIBECOLI
 	select BR2_PACKAGE_LIBMNL
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
 	help
 	  Graph router based on DPDK
 
-comment "grout needs a glibc toolchain w/ dynamic library, threads, wchar, gcc >= 4.9, headers >= 4.19"
+comment "grout needs a glibc toolchain w/ dynamic library, threads, wchar, gcc >= 13, headers >= 4.19"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_13 || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
diff --git a/package/grout/grout.hash b/package/grout/grout.hash
index bf3d6b87ec..ead390f8fc 100644
--- a/package/grout/grout.hash
+++ b/package/grout/grout.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  4ccceea87ead25dfbee7d44d25283abc61173caf6bae08c9644fa9a6cb6b9ade  grout-0.14.3.tar.gz
+sha256  c4a289d13453a42961db2131a179e95965450feb27505f4c463adbd8970e0440  grout-0.15.0.tar.gz
 sha256  1e412aae8da58b718c78b3d7a52eb547004384d4347e4746a22ca6af7522930c  licenses/BSD-3-clause.txt
diff --git a/package/grout/grout.mk b/package/grout/grout.mk
index 39bdc7f824..0b66995dfe 100644
--- a/package/grout/grout.mk
+++ b/package/grout/grout.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GROUT_VERSION = 0.14.3
+GROUT_VERSION = 0.15.0
 GROUT_SITE = $(call github,DPDK,grout,v$(GROUT_VERSION))
 GROUT_LICENSE = BSD-3-Clause
 GROUT_LICENSE_FILES = licenses/BSD-3-clause.txt
@@ -18,8 +18,7 @@ GROUT_DEPENDENCIES = \
 	libevent \
 	libmnl \
 	numactl \
-	libecoli \
-	util-linux
+	libecoli
 
 define GROUT_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TUN)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
