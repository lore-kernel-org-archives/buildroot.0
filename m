Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3C1FCB602
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 22:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB39081A5F;
	Fri,  6 Mar 2026 22:42:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t8kjzGjGhj-6; Fri,  6 Mar 2026 22:42:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07A7481DAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772836928;
	bh=4HFrz1RMBZW7+khuqlupHyaS2sXyyLHEDANkjtHTUFk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=STl6GU58+twC9mYJNTbyg3x7fQ4EOvkl2uQDiD+y4+d1KhpVyRHv9oN4AMOnUgPBY
	 nFOtzLxrF1J2y2w7n1fnLJvA11cP6MaNyGJvBUZFTNH69PpGMcYKa37gCYBLXtjUsH
	 BWN+/pgsmCtPeHkap8ArU/zDVQy81uMW+MxXXFIQ0PjiLuqyu+FUFdVXnp0MTxRpwC
	 SC4RdTO/SwkJ0290KMuPBswrkByUStO+jdEU0ejgcnFi2NCiLZMr0cdfNkW53E0CNS
	 sTSA6I5d+4f6WB6UxA2vpA7XBg5pychK8Shfw6Wl0COTMW/B0LXefAbMAqjERPPi3G
	 uMnfgEucO7Row==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07A7481DAB;
	Fri,  6 Mar 2026 22:42:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DAA0169
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 22:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5F2E6078A
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 22:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c-9R7701Z8OT for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 22:42:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9D8C6606E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D8C6606E5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D8C6606E5
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 22:42:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C425EA4C3760
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 23:42:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39324)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vydrv-000000004J2-1twi
 for buildroot@buildroot.org; Fri, 06 Mar 2026 22:42:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  6 Mar 2026 23:42:03 +0100
Message-ID: <20260306224203.121328-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772836923;
 bh=cpKhoWQOia/gXQ2tMPZCMKcB01DhT2i1gtkIcfmkXWs=;
 h=From:To:Subject:Date:From;
 b=W5LS23k0ai0WS9bvrfjNJwDyVVKHWuRDn9P9NcPSKRU1flgEWh0HBS0zqHpTyb52K
 8y1PVgGFW3S5AUk+tT2slVAXPpgjjjtffC5gPssYXHN2E4HoGHnWGSdhm7K+BOAC9a
 1JwOcsktIdam3eRLhs9Z/uJFGbxtnMOH74+amBzQjQGwTq4gWleTplcItmEVo/Re4j
 NxkKuaR2jBqfnRu8lI5WW70r2VAquNGt7FEwsix/D3HhDTjfFVYbXhvcHYGGzcbL+J
 UrbCBcSNpcHUVh2u3dZlhcKmJqhNtq4Q6dd71JvAicILFQM7BKksMW7+apFlGYMYYD
 OZpeNx1RFwl+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=W5LS23k0
Subject: [Buildroot] [PATCH 1/1] package/faketime: fix host build with glibc
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

Fixes:
https://autobuild.buildroot.net/results/911/9112933e2560b155a9c61f321874ec245b62b2a5/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...qualifiers-to-fix-build-with-ISO-C23.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/faketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch

diff --git a/package/faketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch b/package/faketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch
new file mode 100644
index 0000000000..ce84d40699
--- /dev/null
+++ b/package/faketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch
@@ -0,0 +1,39 @@
+From dbe865dfdba0145d993d70b7fd4ec88b2f47554b Mon Sep 17 00:00:00 2001
+From: Tomas Korbar <tkorbar@redhat.com>
+Date: Mon, 15 Dec 2025 11:03:21 +0100
+Subject: [PATCH] Add const qualifiers to fix build with ISO C23
+
+Fix https://github.com/wolfcw/libfaketime/issues/524
+
+Upstream: https://github.com/wolfcw/libfaketime/commit/dbe865dfdba0145d993d70b7fd4ec88b2f47554b
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/libfaketime.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/libfaketime.c b/src/libfaketime.c
+index ef1dca9..02839c8 100644
+--- a/src/libfaketime.c
++++ b/src/libfaketime.c
+@@ -2666,7 +2666,7 @@ int timespec_get(struct timespec *ts, int base)
+ static void parse_ft_string(const char *user_faked_time)
+ {
+   struct tm user_faked_time_tm;
+-  char * tmp_time_fmt;
++  const char * tmp_time_fmt;
+   char * nstime_str;
+ 
+   if (!strncmp(user_faked_time, user_faked_time_saved, BUFFERLEN))
+@@ -3338,7 +3338,7 @@ static void prepare_config_contents(char *contents)
+ bool str_array_contains(const char *haystack, const char *needle)
+ {
+   size_t needle_len = strlen(needle);
+-  char *pos = strstr(haystack, needle);
++  const char *pos = strstr(haystack, needle);
+   while (pos) {
+     if (pos == haystack || *(pos - 1) == ',') {
+       char nextc = *(pos + needle_len);
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
