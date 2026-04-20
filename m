Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B09F557E6
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 08:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 998C660AFD;
	Mon, 20 Apr 2026 08:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AjAX6kLQNl0h; Mon, 20 Apr 2026 08:44:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 932C760B7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776674671;
	bh=s8dbxr+G6T4fgnZaqX76auOyKfzjhQJgyPeMLNCpWMg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qlTO4oEwvihUEOPajJaoZBnbJB7wHVxggSeW+VSsnZZMuowYOWu0Xqe+008aZ3mTS
	 lLMgv3mMR102gr/O9OHcN8AtcJix+oVNGWByk0Ovy49oV/W/mDHjDS0fYIK0Qs5/NA
	 ouoJri2RNo9Bq+sPWXdoIA7Xey3PMgNsog+Z0lTdGKOBQlh1TV7wE7rlJtQzwj+ejO
	 bFMqnMymoSOJ5/aT35TDKmi2brw/LVX3EX0uttezqsl+9fLKZqG8MtFLXfXd2rul5y
	 dAHjz3kh9Hiaw9kyZKPlxTXYTdbvQjhNM+KP6qI1S3OqgH+m8PgwLRTFMYqTil9o82
	 ChGUyObQcGueg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 932C760B7C;
	Mon, 20 Apr 2026 08:44:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9381D24D
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 08:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 908F560B7C
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 08:44:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vOz5t8RAFVWw for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 08:44:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A67E760AFD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A67E760AFD
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A67E760AFD
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 08:44:29 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-c79467f128cso919663a12.3
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 01:44:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776674668; x=1777279468;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2H8kim6Jj9Rfdrwxv62TNFDJi2A0ItlDiOwIvJHNu50=;
 b=j/PGIExChDPDqpTYEE5/A6qHRsfGkW+hEV5YY8Ev9IjGOeX5TQpkPONzSxJqPvgFau
 oPflR4VXtUqUE/oAW1awx1PrZj8SYaD6uc5jUe1Sxd+sCWpVHYnvv2FHRvo16EuE+51e
 WJSS9gvrsYYU9LJ9GU+OAo+8BhHy64dzOrWhzxeJTgn2nIsUfsXmpFVDniPaftUPte+A
 ra5wNUz/xEsL4h4CLYu2ZRGyfHrkDVn3IqvvmUWkenQaOoSjby1jifidCTvvMmiimyUB
 x7ao8Yt2jB4qTzbzp/hWF1bqkYbtR3PKhTMQJmp0YOTdklckWyo9g445LBiNSx75itPk
 7myw==
X-Gm-Message-State: AOJu0YxL0f6LA3KwkKuJ/Xuj5ay0vi8qnonucUBjEzDG3/z/s822fGwi
 YEWs+i/PDuN9RrP8p+08vw5YMy7wh70c1iUBr/iSotImZCRb2NBY5oMpXtRYykf5Xcs=
X-Gm-Gg: AeBDiesn6zECoa18xXZH+d3uI2R+Ob8drAdFNK1EIc9bFUA2vs7sb433vyJE+l1Ik5l
 gKXb5ng1w5v485y/Okhk9QK+EHuor/libWyj71S7ZRjtKkGN8Ne6u66kLHdFboPb4FaSjO4zjE6
 iTblfPZGPCPD4wQFr6Ac1nM3z1QOjuKEVtjptkdpbgS5HePfKMiTqgygDohXNpodoD5AGXgo80R
 GMVtfyvIE8u50lcg0DC1vGvh+zOoI5sOIiZ3e+W9fcuG/4Z0W7MpsfjzvWnZAV115BY+/hVa9AB
 zbj/MTgM8p4FJNl1v2XA69X9yBq8End8eiFW2VMm2eZdSD7ycgaL4jasF6TGze4QarPtpT/EKcf
 2RgwEAsVzfH19gB+e4mmV6o6keoAaXXvKzKv9kb2V7v4qVHjJxPmIRDF0w2chuNcDe4eCNdZnvi
 qu/RFeCH1jIZGtETpsdvlcFcl2OU48Q1dhAFkIIP80wFpaGu4=
X-Received: by 2002:a05:6a20:158b:b0:39b:fbb2:5e31 with SMTP id
 adf61e73a8af0-3a08d8fb898mr13552339637.43.1776674667943; 
 Mon, 20 Apr 2026 01:44:27 -0700 (PDT)
Received: from fedora ([2409:4064:4e3f:c6c4:9958:eee0:142e:788d])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c797703df68sm7495995a12.27.2026.04.20.01.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 01:44:25 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Mon, 20 Apr 2026 14:14:06 +0530
Message-ID: <20260420084407.37993-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776674668; x=1777279468; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2H8kim6Jj9Rfdrwxv62TNFDJi2A0ItlDiOwIvJHNu50=;
 b=IWN/sJeTxwpvJGCRQLYbCMGbthMSl8nncdIfZLRGEOkmNvr1QirmKjO1yuEySqKCXZ
 njkUqA9nkIwbbeYojumUzNjhhFgItSKk3AEPHQ9Ze7MmvurxebEhTrrkDgI8QU4iQM/L
 xCTygm/+zJ3hxdZUx1sc7nZDj4qhbzDRCgsXcA01cjUUncV2m7eVsEWuM2B/NkBN5xxc
 SVHRv1LCD11yvYxCvh5axrXx3Ez01j3YmgWlDtiEfV29BI45RJsSg90I/X5nmAbGE9IV
 /ce3vaBKEIUbdtiVkERxeSaI6n0+zl8zYM5swEL1qTmhL+dQSTz9eBcmrjZEZv/AM7YO
 h3rg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=IWN/sJeT
Subject: [Buildroot] [PATCH] package/botan: bump to version 3.11.1
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

- Update BOTAN_VERSION to 3.11.1
- Remove 0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch
  as it is already integrated upstream in this version (fixes CVE-2024-50382
  and CVE-2024-50383)
- Remove the --disable-altivec configuration option as it has been removed
  from the Botan build system in version 3.x
- Wrap the --disable-neon logic with ifeq ($(BR2_arm),y). In Botan 3.x,
  the --disable-neon flag is specifically targeted at the arm32 architecture.
  Furthermore, Buildroot's BR2_ARM_CPU_HAS_NEON variable is only defined
  for 32-bit ARM, which previously caused a false-positive --disable-neon
  flag to be passed on AArch64 builds
- Update license.txt hash in botan.hash due to the copyright year update
  to 2026

https://botan.randombit.net/news.html#version-3-11-1-2026-03-31

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 ...avoid-compiler-induced-side-channels.patch | 65 -------------------
 package/botan/botan.hash                      |  4 +-
 package/botan/botan.mk                        | 11 +---
 3 files changed, 5 insertions(+), 75 deletions(-)
 delete mode 100644 package/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch

diff --git a/package/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch b/package/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch
deleted file mode 100644
index 22f64be1b9..0000000000
--- a/package/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 53b0cfde580e86b03d0d27a488b6c134f662e957 Mon Sep 17 00:00:00 2001
-From: Jack Lloyd <jack@randombit.net>
-Date: Sat, 19 Oct 2024 07:43:18 -0400
-Subject: [PATCH] Add more value barriers to avoid compiler induced side
- channels
-
-The paper https://arxiv.org/pdf/2410.13489 claims that on specific
-architectures Clang and GCC may introduce jumps here. The donna128
-issues only affect 32-bit processors, which explains why we would not
-see it in the x86-64 valgrind runs.
-
-The GHASH leak would seem to be generic but the authors only observed
-it on RISC-V.
-
-CVE: CVE-2024-50382
-CVE: CVE-2024-50383
-Upstream: https://github.com/randombit/botan/commit/53b0cfde580e86b03d0d27a488b6c134f662e957
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- src/lib/utils/donna128.h      | 5 +++--
- src/lib/utils/ghash/ghash.cpp | 2 +-
- 2 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/src/lib/utils/donna128.h b/src/lib/utils/donna128.h
-index 8212bd349e0..7adf54546df 100644
---- a/src/lib/utils/donna128.h
-+++ b/src/lib/utils/donna128.h
-@@ -8,6 +8,7 @@
- #ifndef BOTAN_CURVE25519_DONNA128_H_
- #define BOTAN_CURVE25519_DONNA128_H_
- 
-+#include <botan/internal/ct_utils.h>
- #include <botan/internal/mul128.h>
- #include <type_traits>
- 
-@@ -73,14 +74,14 @@ class donna128 final {
-          l += x.l;
-          h += x.h;
- 
--         const uint64_t carry = (l < x.l);
-+         const uint64_t carry = CT::Mask<uint64_t>::is_lt(l, x.l).if_set_return(1);
-          h += carry;
-          return *this;
-       }
- 
-       constexpr donna128& operator+=(uint64_t x) {
-          l += x;
--         const uint64_t carry = (l < x);
-+         const uint64_t carry = CT::Mask<uint64_t>::is_lt(l, x).if_set_return(1);
-          h += carry;
-          return *this;
-       }
-diff --git a/src/lib/utils/ghash/ghash.cpp b/src/lib/utils/ghash/ghash.cpp
-index 8c3b1ed6c2a..61b28590002 100644
---- a/src/lib/utils/ghash/ghash.cpp
-+++ b/src/lib/utils/ghash/ghash.cpp
-@@ -131,7 +131,7 @@ void GHASH::key_schedule(std::span<const uint8_t> key) {
-          m_HM[4 * j + 2 * i + 1] = H1;
- 
-          // GCM's bit ops are reversed so we carry out of the bottom
--         const uint64_t carry = R * (H1 & 1);
-+         const uint64_t carry = CT::Mask<uint64_t>::expand(H1 & 1).if_set_return(R);
-          H1 = (H1 >> 1) | (H0 << 63);
-          H0 = (H0 >> 1) ^ carry;
-       }
diff --git a/package/botan/botan.hash b/package/botan/botan.hash
index d948271900..6b391c06a3 100644
--- a/package/botan/botan.hash
+++ b/package/botan/botan.hash
@@ -1,4 +1,4 @@
 # From https://botan.randombit.net/releases/sha256sums.txt
-sha256  67e8dae1ca2468d90de4e601c87d5f31ff492b38e8ab8bcbd02ddf7104ed8a9f  Botan-3.5.0.tar.xz
+sha256  c1cd7152519f4188591fa4f6ddeb116bc1004491f5f3c58aa99b00582eb8a137  Botan-3.11.1.tar.xz
 # Locally computed
-sha256  db9168bdccaaea26557094436652577cc9bf43164e8be078d88aef1342fe4fb6  license.txt
+sha256  758ea6b4a65d5611bf79c24920f92473ef44bdde0b3b97fa578470a0ffc34f14  license.txt
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 38948f0184..989263403f 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-BOTAN_VERSION = 3.5.0
+BOTAN_VERSION = 3.11.1
 BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
 BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2-Clause
 BOTAN_LICENSE_FILES = license.txt
 BOTAN_CPE_ID_VALID = YES
 
-# 0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch
-BOTAN_IGNORE_CVES += CVE-2024-50382 CVE-2024-50383
-
 BOTAN_INSTALL_STAGING = YES
 
 BOTAN_DEPENDENCIES = host-python3
@@ -91,13 +88,11 @@ BOTAN_DEPENDENCIES += zlib
 BOTAN_CONF_OPTS += --with-zlib
 endif
 
-ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),)
-BOTAN_CONF_OPTS += --disable-altivec
-endif
-
+ifeq ($(BR2_arm),y)
 ifeq ($(BR2_ARM_CPU_HAS_NEON),)
 BOTAN_CONF_OPTS += --disable-neon
 endif
+endif
 
 ifeq ($(BR2_SOFT_FLOAT),y)
 BOTAN_CONF_OPTS += --disable-neon
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
