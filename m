Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386F4C61DD6
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 12:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3C8C6085B;
	Wed,  2 Sep 2026 12:38:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3VKsmN_qMBkv; Wed,  2 Sep 2026 12:38:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788352718;
	bh=sZtIgE40Bz5Vr814jxKqKeDnRZ2g8LClCyazfGYodVY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DJkm16KVJTFv+YC2qU52RInKZWi5/hYB5gPIm1WmYVksJ31QyEg7FogJu9RmJbUdi
	 4MIMWse8AG+h6bySa1gfI/pBHOVl6yc+lvDBVN2AAT6zcUR6/nOuwQRT+EI561XGp1
	 EJg3KdThdCzaDOWGQpVMKhsup971310GFUjf9W/QEO7D+VRxcrMRFxy3rGU1QF5nv+
	 fcZxAk1TvLLpPjf8ktC+5s/wvOJ/VZzOxDQnPCNgsjyrzh0A0uMih7JqAQEycXUaPR
	 f/Js04MpoxTome9l1RHJNlywr/2qNQl3iAdwsj2gUY7NOIRaWWb/zll5E3m8HfzhwU
	 VnNJWbKEHF6Iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C037E60726;
	Wed,  2 Sep 2026 12:38:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 57638498
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 12:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 491A440810
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 12:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Su4uM5DslZCd for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 12:38:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33AC240808
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 12:38:35 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-48444eff835so254256f8f.3
 for <buildroot@buildroot.org>; Wed, 02 Sep 2026 05:38:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788352713; x=1788957513;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=GvVJjGy0s66yzbnloSfFDA+qz22Fyx7xOPLeGbwllVM=;
 b=FfpTCk2305EggCExHbKT85nAfuZ648RudUhrxKXZB8XHzGj6CaU3xGgy0HAyUDVs2+
 rQr6H8wx3DGVwm5ztvFHByHlxQLiuOrPEKx9H+QQXqTTYH1iyJupuL1eXiwT1Dyo2mA7
 s6tvtZ/r7KVXLEO9dTIqBsZo0YPEZbvk8wNLTypsJETVsqGBPJ/tGO4VpGx1XxaBKDNi
 abjiXj5uqqzuHcN2QsWnEiz5/v07k6SsLPoaV2rrihT3+CFS1lQblp5JKOQ+Py0gqn7M
 xoIz6rlURstrdMwIx9/9qcLBrkzBPf3vKm3gpQoyFvTTdp2/1wWjEO7nLjXPcCOOklAw
 qHcw==
X-Gm-Message-State: AFuF++lbTMQF/yN/Fa3gUWdmvsv+nf8UZdVZ/E4fwgT7bw6oKdI1sf3n
 9vPBV03Uwu4CBPlwqIhlWcdXEL/rVaKffRKnDRVHTLk7vh6/ViCmhHIodIlC03NNOuaHL9x2HZk
 SAC90J2Q=
X-Gm-Gg: AYBFou2p6zLZZkkVBAr3EqXeiOoODzuMBGkUUjAtjnWeZ2iF8t0UXz+RwRxhN4ebqPf
 ngc1x/8s5sz7OV9PePi0+RCcKLcHybuoE4m1vyS2bn3fnxHOIE8mC60eEIolJDPwZZExAJ23alO
 EZ5Ye4EaloBl2uSQ3pR+br6t3S5lifvGzQ0UR2o8RN1DphTcCRVzCPdXB0v2ekNqRq4i6fcd8uE
 T793BwHbJQNaGddBjJ5CNrHvUVvr/4I3OFAZGqo8WyeEGKPCCzEOLoH5XTd7lLi7q4VsAX2bEsk
 prYx2RhRl3d8rvDNwks4zRfFmnEektMkVK6BkCXBJ0G1lkiM/E8+TW6dwN8HuYbdPfH7CNJ/P+X
 BKhjJML3Qx3H5RKUN3qEOyzY85Ha9E0lowWRRPbjsSRMqPw7P5X7ilYmgMfibPfoJUeDrlIAk1e
 mxN3mxDY3Jm6wcTpNpxHDPPuTm8QWAanMIjlW+nCM0FqHudijLvaFPMQdT6R+wNhVj/VC2mbEKT
 JW09g==
X-Received: by 2002:a5d:5f88:0:b0:484:3728:1369 with SMTP id
 ffacd0b85a97d-48488efe756mr8234957f8f.6.1788352713108; 
 Wed, 02 Sep 2026 05:38:33 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448ed2edfsm6052056f8f.23.2026.09.02.05.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 05:38:32 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed,  2 Sep 2026 14:38:17 +0200
Message-ID: <20260902123817.192274-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902113553.164630-1-titouan.christophe@mind.be>
References: <20260902113553.164630-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 for 2025.02.x] package/{glibc,
 localedef}: security bump to v2.41-159
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following known vulnerabilities:
- CVE-2026-5435
- CVE-2026-6238
- CVE-2026-6791
- CVE-2026-6368
- CVE-2026-19499
- CVE-2026-77117
- CVE-2026-80489

(alternative to commit be382f6061216ca82a735d0992894c4e6fe5173a)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
Changes v1-v2:
    - Also bump version in localedef (forgotten in v1)
---
 package/glibc/glibc.hash       |  2 +-
 package/glibc/glibc.mk         | 24 +++++++++++++++++++++++-
 package/localedef/localedef.mk |  2 +-
 3 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 03e8722057..87dd8b67ac 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  130d77e16a08f7e52e14b49d8554997877a4fe82ac6b840a0202716146ac8fb5  glibc-2.41-143-gfc7a48bc9e999c0f9a1f9fa1b209eac1d6a93363-git4.tar.gz
+sha256  e3550f6d074325ad8ee75fff96f16a967055e88f69e1455333ace515b8ac2067  glibc-2.41-159-g3d141c23899d90559741b5fe74db97ccf0ef5c29-git4.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 7c64fea4a2..65a99b4a68 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.41-143-gfc7a48bc9e999c0f9a1f9fa1b209eac1d6a93363
+GLIBC_VERSION = 2.41-159-g3d141c23899d90559741b5fe74db97ccf0ef5c29
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -66,6 +66,28 @@ GLIBC_IGNORE_CVES += CVE-2026-5928
 # Fixed by glibc-2.41-142-g1a74f82eedaf0987eda1f522121e6a48fac502e7
 GLIBC_IGNORE_CVES += CVE-2026-5450
 
+# Fixed by glibc-2.41-149-g0e8c56b386d72ba2ddf15784423f2e894c63a241
+GLIBC_IGNORE_CVES += CVE-2026-5435
+
+# Fixed by glibc-2.41-150-g05e1eaea619072a92ff1f5fefe1ac2dd5758829c
+GLIBC_IGNORE_CVES += CVE-2026-6238
+
+# Fixed by glibc-2.41-152-g965b580070b8184b0dd390800d9194291a600e67
+GLIBC_IGNORE_CVES += CVE-2026-6791
+
+# Fixed by glibc-2.41-153-gdfc8ef388ef7856f318ade7dec501f92ce54f9e3
+GLIBC_IGNORE_CVES += CVE-2026-6368
+
+# Fixed by glibc-2.41-156-g5256941bc811248670eda4636dccd0a390d34dec
+GLIBC_IGNORE_CVES += CVE-2026-19499
+
+# Fixed by glibc-2.41-157-ge43e46f94398b3de446fec11da1e7633ea5202ec
+GLIBC_IGNORE_CVES += CVE-2026-77117
+
+# Fixed by glibc-2.41-158-gec116a0fbedcc860631e525e70b409cf295f27da
+GLIBC_IGNORE_CVES += CVE-2026-80489
+
+
 # glibc is part of the toolchain so disable the toolchain dependency
 GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
 
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 2549aaaf99..9a19ebc4aa 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION, SITE and LICENSE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.41-143-gfc7a48bc9e999c0f9a1f9fa1b209eac1d6a93363
+LOCALEDEF_VERSION = 2.41-159-g3d141c23899d90559741b5fe74db97ccf0ef5c29
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
