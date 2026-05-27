Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5E9CD4F54
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 21:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7ADD42414;
	Wed, 27 May 2026 21:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VEWTBBrZBEcN; Wed, 27 May 2026 21:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 939ED42418
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779915624;
	bh=3Y4Adge71PFf2OEPd/zMbTK6QwGt7kDF+ZMDfYQSArA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XztPiGEhSTokrLmruWXmoChiUyaGGw1Np7uuJoQA9PM+TGssfECflhIRUl3a4xoKB
	 BlOItt5X0ZM36kuarYmC8d0ZROmQbPd8nDglB1lgN9Kb1W2tX/IP7BcRAcJ1qSklP/
	 qnyjnEHA5oyW3RvZWnjGQBwFoIJuvTujyTuRFh/bctvg698NCbLdQ3K/zofqpsP1au
	 rFhXxgantgSZuASmHy98HJLXJ7tLN65zw9TcsASVcID/o9d7r2Zw/ZBwO1Tr9ZRVFz
	 YYUSpScCrs4mX04rz393Zbo1gLW5tH/9V3gsWcXAVZJ3Kd6tsLhFF+dqj5FQlUohnj
	 w1Jd6nXD+uHkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 939ED42418;
	Wed, 27 May 2026 21:00:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AB2F5288
 for <buildroot@buildroot.org>; Wed, 27 May 2026 21:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CEE94210C
 for <buildroot@buildroot.org>; Wed, 27 May 2026 21:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yA9KouJXPkBA for <buildroot@buildroot.org>;
 Wed, 27 May 2026 21:00:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1946741E77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1946741E77
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1946741E77
 for <buildroot@buildroot.org>; Wed, 27 May 2026 21:00:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c0c6.dip0.t-ipconnect.de [79.214.192.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D4B5CA4C2278;
 Wed, 27 May 2026 23:00:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53568)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wSLMP-000000005B2-0DVh;
 Wed, 27 May 2026 21:00:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Alexander Clouter <alex+buildroot@digriz.org.uk>
Date: Wed, 27 May 2026 23:00:15 +0200
Message-ID: <20260527210017.3567220-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779915617;
 bh=NqIvRcvpKY/DLTyHrwQvFj8cO9OXs4yVctntp42Es10=;
 h=From:To:Cc:Subject:Date:From;
 b=EI2EcIvWT3Wa29qTez7VOjX95/daibsaFixMAAsqsZAjAkWuZ+demB/xQDh+9Jyxk
 +lETolYpIvju/mY2v09Mkb78AroNnwTUULlOvkHsZDUuK9N3fHFlBvRtIhAfIR0Vpq
 EXN02mNVTI1aFyuVVLj92qz3RqqWgQq3Oj0jm+c7r2kBfieO2dretsixWGb6k6611d
 zqmss8aAbhsQ4bNVBg/oSyhJpkgMGGxUr+8hyVp08HYXf4HiFm9uJsws52Q1jxthFq
 KKdZ+PGnR+oC7dhlyfR04MOdR5I9Swfu7Oa72GE9E1RFgwWmcQPxAw4uCoGhSYgrvd
 jriUDWrbFzXTg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=EI2EcIvW
Subject: [Buildroot] [PATCH v2 1/3] package/odhcp6c: fix build with glibc >=
 2.43
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

Buildroot commit 227378b5930b681c79a13476ae60a98753a98a03 bumped glibc
to 2.43 causing build errors in odhcp6c like:

/home/autobuild/autobuild/instance-10/output-1/build/odhcp6c-f19dd37fb467c9cf10cad57aefa0d048312d7dfd/src/config.c:
 In function 'config_parse_opt_string':
/home/autobuild/autobuild/instance-10/output-1/build/odhcp6c-f19dd37fb467c9cf10cad57aefa0d048312d7dfd/src/config.c:338:21:
 error: initialization discards 'const' qualifier from pointer target
 type [-Werror=discarded-qualifiers]
  338 |         char *sep = strpbrk(src, ARRAY_SEP);

Add upstream commit to fix the problem.

Fixes:
https://autobuild.buildroot.net/results/efb/efb43d2dc069f5ba9c56816d670a8a2a3682d9ae/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: added result of Gitlab pipeline passed by series:
    https://gitlab.com/bkuhls/buildroot/-/pipelines/2557223551

 ...p6c-const-cast-for-c23-compatibility.patch | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 package/odhcp6c/0001-odhcp6c-const-cast-for-c23-compatibility.patch

diff --git a/package/odhcp6c/0001-odhcp6c-const-cast-for-c23-compatibility.patch b/package/odhcp6c/0001-odhcp6c-const-cast-for-c23-compatibility.patch
new file mode 100644
index 0000000000..cdb26a7434
--- /dev/null
+++ b/package/odhcp6c/0001-odhcp6c-const-cast-for-c23-compatibility.patch
@@ -0,0 +1,102 @@
+From 3b69378125aba61b3391bf5fe607983ce75b839c Mon Sep 17 00:00:00 2001
+From: Rosen Penev <rosenp@gmail.com>
+Date: Wed, 8 Apr 2026 14:14:56 -0700
+Subject: [PATCH] odhcp6c: const cast for c23 compatibility
+
+strpbrk is now a macro that returns const based on the parameter. Cast
+it away when we don't want const.
+
+Signed-off-by: Rosen Penev <rosenp@gmail.com>
+
+Upstream: https://github.com/openwrt/odhcp6c/pull/156
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/config.c | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/src/config.c b/src/config.c
+index 54e2d35..c1a3a99 100644
+--- a/src/config.c
++++ b/src/config.c
+@@ -338,7 +338,7 @@ static int config_parse_opt_u8(const char *src, uint8_t **dst)
+ static int config_parse_opt_string(const char *src, uint8_t **dst, const bool array)
+ {
+ 	int o_len = 0;
+-	char *sep = strpbrk(src, ARRAY_SEP);
++	char *sep = strpbrk((char*)src, ARRAY_SEP);
+ 
+ 	if (sep && !array)
+ 		return -1;
+@@ -362,7 +362,7 @@ static int config_parse_opt_string(const char *src, uint8_t **dst, const bool ar
+ 		src = sep;
+ 
+ 		if (sep)
+-			sep = strpbrk(src, ARRAY_SEP);
++			sep = strpbrk((char*)src, ARRAY_SEP);
+ 	} while (src);
+ 
+ 	return o_len;
+@@ -371,7 +371,7 @@ static int config_parse_opt_string(const char *src, uint8_t **dst, const bool ar
+ static int config_parse_opt_dns_string(const char *src, uint8_t **dst, const bool array)
+ {
+ 	int o_len = 0;
+-	char *sep = strpbrk(src, ARRAY_SEP);
++	char *sep = strpbrk((char*)src, ARRAY_SEP);
+ 
+ 	if (sep && !array)
+ 		return -1;
+@@ -399,7 +399,7 @@ static int config_parse_opt_dns_string(const char *src, uint8_t **dst, const boo
+ 		src = sep;
+ 
+ 		if (sep)
+-			sep = strpbrk(src, ARRAY_SEP);
++			sep = strpbrk((char*)src, ARRAY_SEP);
+ 	} while (src);
+ 
+ 	return o_len;
+@@ -408,7 +408,7 @@ static int config_parse_opt_dns_string(const char *src, uint8_t **dst, const boo
+ static int config_parse_opt_ip6(const char *src, uint8_t **dst, const bool array)
+ {
+ 	int o_len = 0;
+-	char *sep = strpbrk(src, ARRAY_SEP);
++	char *sep = strpbrk((char*)src, ARRAY_SEP);
+ 
+ 	if (sep && !array)
+ 		return -1;
+@@ -433,7 +433,7 @@ static int config_parse_opt_ip6(const char *src, uint8_t **dst, const bool array
+ 		src = sep;
+ 
+ 		if (sep)
+-			sep = strpbrk(src, ARRAY_SEP);
++			sep = strpbrk((char*)src, ARRAY_SEP);
+ 	} while (src);
+ 
+ 	return o_len;
+@@ -442,7 +442,7 @@ static int config_parse_opt_ip6(const char *src, uint8_t **dst, const bool array
+ static int config_parse_opt_user_class(const char *src, uint8_t **dst, const bool array)
+ {
+ 	int o_len = 0;
+-	char *sep = strpbrk(src, ARRAY_SEP);
++	char *sep = strpbrk((char*)src, ARRAY_SEP);
+ 
+ 	if (sep && !array)
+ 		return -1;
+@@ -471,7 +471,7 @@ static int config_parse_opt_user_class(const char *src, uint8_t **dst, const boo
+ 		src = sep;
+ 
+ 		if (sep)
+-			sep = strpbrk(src, ARRAY_SEP);
++			sep = strpbrk((char*)src, ARRAY_SEP);
+ 	} while (src);
+ 
+ 	return o_len;
+@@ -555,7 +555,7 @@ int config_parse_opt(const char *opt)
+ 	struct odhcp6c_opt *dopt = NULL;
+ 	int ret = -1;
+ 
+-	data = strpbrk(opt, ":");
++	data = strpbrk((char*)opt, ":");
+ 	if (!data)
+ 		return -1;
+ 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
