Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712A3CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D856584510;
	Fri, 29 May 2026 18:10:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mttgsBwgX5R9; Fri, 29 May 2026 18:10:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F84784525
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780078238;
	bh=Rv0KhX/p+Ogr7V5KHGQk65va+VZ//01NCrvsbisWFWg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CXlhHb/3E91qMF5tWq3d8ZhilzE6Cpf1gHBgW5IidHydkhWyiu3XkBduo+WMoCVQK
	 vrUoCltvtTeZ1Wajytud4Y/eo6yDB8DD2KNfLBUkrwNPCZEqJ5sc7CG/LcZJbOB05n
	 1ihB8u6lBYvyeUJTDBCvYr0WoQxhjRqDLKFHHgMHlkq1rVPHYNo1TVQdPA9wateh1n
	 cpz+PpHtqVGl4iBuoplYcams1KyyQSLGifbkk6ekqbG99fOsAYS/4R17NQVJdPwp7Z
	 tqaSYliwuhLh3n9fV/2/eN5fr6wYdMDVj35hLHS2shhhbgEjva8DU+qffvHGjefKu+
	 eFUPKP/hH2w3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F84784525;
	Fri, 29 May 2026 18:10:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D65B2D3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B737B420E4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:10:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pC7rXaSImCfp for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:10:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EDB542112
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EDB542112
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:10:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B167787411; Fri, 29 May 2026 18:10:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 20:03:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07f872bfe20615261ab51d76b598ae62573e06d9
X-Git-Newrev: 8aff626d5c0d62ebc6cc0184c806109c494c320c
X-Patchwork-Hint: ignore
Message-Id: <20260529181018.B167787411@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/odhcp6c: fix build with glibc >=
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8aff626d5c0d62ebc6cc0184c806109c494c320c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 ...-odhcp6c-const-cast-for-c23-compatibility.patch | 102 +++++++++++++++++++++
 1 file changed, 102 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
