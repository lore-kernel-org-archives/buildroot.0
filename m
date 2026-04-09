Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2627AE9DE62
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 08:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDAF140F45;
	Thu,  9 Apr 2026 08:23:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h7BvrJOTqzSv; Thu,  9 Apr 2026 08:23:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F19E540EF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775723027;
	bh=+GbVmfX0KpSbAadwVSNa88OrYstEsXVv5PRrzKcPSCI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FcpBa/3PJDLbG8SXTciCMPdociVRYUtzyKSKk0afCrfDroH4t3RyhonLo/EAqS7tG
	 3zo2uux8Lovgi1u+gSOGrP3jDIYiHTJeVLnKqfRsXWsKBwFka+4505Q5/s7fRuchz/
	 x+mj3Lf3MERAwB6dyfbje14WZNZ4I6ADAkV9qvOFG/P7zWbxrvDgswSY3eWxP6HQdU
	 rSYUuo0CZmNIEHpQqjGXAXcD4oWrnXyh5RubONIeiC9pNVYEKwuj13xmhkFKZk0mXW
	 F7HyP7jWlt7r8gO6BSPuC3v1RfrFaiNQshPsSdG8P6GkWQ129R+v8MR1Ceup6UuCns
	 f2QHB9pcl1zag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F19E540EF8;
	Thu,  9 Apr 2026 08:23:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C242237
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D45982784
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uhh1_6rxwLtf for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 08:23:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DB6918272C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB6918272C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB6918272C
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:23:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca66.dip0.t-ipconnect.de [79.214.202.102])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D405DA4C07B9;
 Thu,  9 Apr 2026 10:23:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40362)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wAkfu-0000000012r-31bP;
 Thu, 09 Apr 2026 08:23:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Alexander Clouter <alex+buildroot@digriz.org.uk>
Date: Thu,  9 Apr 2026 10:23:42 +0200
Message-ID: <20260409082342.3957780-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775723022;
 bh=egM2VHTEgh0aCLLNtVjsq96MmbLx9zU7zpsS9JfcPyc=;
 h=From:To:Cc:Subject:Date:From;
 b=qYEWBuMTFSi9kcYUPppDATPUl8PU08ivKRrxubKlTF5Mm53Olchr6uIr6aohSIPSQ
 ucmaZyfrnHIepELbeHNIOILKGaUbUCyK+XVK+MHoZBb33s0qygRwT2Tw9R5mfsX+Au
 AgjfqgnzH0Ve3kp0iflFi/SKQOrC8FvjpNOYZK81B+B2dirk8VYnJmBv2YwJTQ2uHe
 MSpr4YY5aLnqQefADeBjnpmyomcQyqc08kuOvZ52TDQdgFtfVg7ZIwuyyvUz724RyH
 iCZ5NcDae4ENkQlviahbrzUHMR5tes3kX6bngexv+obpENy1XpDLsO6Qb/gi5GXG8W
 HUOH80gJ88nUw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=qYEWBuMT
Subject: [Buildroot] [PATCH 1/1] package/odhcp6c: fix build with glibc >=
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
