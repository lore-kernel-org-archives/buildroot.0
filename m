Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89761D6AB16
	for <buildroot@archiver.kernel.org>; Thu,  2 Apr 2026 22:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D57C240D84;
	Thu,  2 Apr 2026 22:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NxUbpwmnI18j; Thu,  2 Apr 2026 22:45:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B082140D3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775169929;
	bh=fqknkern2l5BA05akNnD7dcrOxTAiBjua4dD1adDghQ=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=pZzKCGa5HfV2FRNR6j2YYOjvDInz/73KxLWmOC084Xz7MaVswxrvLRRJWvyB6s0HT
	 P35S8RavEMsHbudh80+AGoccy6600QAymTpN1KyjYH6SMzoTUa2IbIlMz8XBQVb+oj
	 gUAdSS+4T6xZWrcLXCDTvqNXz4DcQF5VHD82nS5hCIwa91ynjaJ5yqjPgwumfMJFQ1
	 3Pt2ZgXisIos+y1P/t8DcJnyWuLlvwX0Y5nRu84M55C3jlFDratQDetmA7WDQnJP4Z
	 G/n4RjtT7NL+OEPd72OLvE9KQbXiVkC2MENeV0amZV8F7MlVB9M5x+C1iomPCB7GVZ
	 b3ZGEOTfnYe5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B082140D3E;
	Thu,  2 Apr 2026 22:45:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EAB392A2
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 22:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6C93607CA
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 22:45:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5pPJzEtQBIfw for <buildroot@buildroot.org>;
 Thu,  2 Apr 2026 22:45:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AED3660777
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AED3660777
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AED3660777
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 22:45:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D8E11C59F4F
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 22:45:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1DE29602CD;
 Thu,  2 Apr 2026 22:45:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E4F651045030D; 
 Fri,  3 Apr 2026 00:45:21 +0200 (CEST)
Date: Fri, 03 Apr 2026 00:44:43 +0200
MIME-Version: 1.0
Message-Id: <20260403-fix_faketime-v1-1-3e35e7b9c419@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMUQqDMBAFryL73UhcbcFepYgY89JuRSuJiiDe3
 Wg/h2FmowAvCPRMNvJYJMhviJDdEmo/zfCGEhuZWPNDFzpXTtbaNR0m6aHYlNY6g6xkUExGj+i
 v3etM7qnmdKXqr8Jsvminc0f7fgDbgMX9ewAAAA==
X-Change-ID: 20260403-fix_faketime-2b9ddfbe192e
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Bernd Kuhls <bernd@kuhls.net>
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1775169923; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=APXkCluo5N8ElzDlkESR4el7/JfTCUwB8cvCyfOopzA=;
 b=rRINVBqaSy8YuyacuiutYfPSRsQ2RjNOIrjVD8SdB5IWPvBVyTVS2qftCfNjBk6GRD8nKO
 xULD/7voBJWWJRneq7VHArhrXDqvL2G1r7fcnb9RoXXtRp7wC+sCQPuJGNIMp42bAq31qg
 B6/WwiMAxfal3BQmYH5Eg2QRmnJHil2Sijmb7ldKzIPj758nN/jOJaFknZNylk0sfJ80G2
 i5cN9B0SmZfxc8TWy2C9XdHbR0vMf9x89d4UtCmfBKa1KJZky73QbNxxuGY0CAmPaZYABY
 OyBMDfYFh7q9yDD+VWwFsS6KJB6Xod42Hp6JH6vdk3V/7dE9Y+jge87IaqSWGw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=rRINVBqa
Subject: [Buildroot] [PATCH 2025.02.x] package/faketime: rebase patch on
 v0.9.10
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
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As of glibc 2.43, faketime build was broken in buildroot because of a
missing const qualifier. A patch was applied to it in master to fix this
issue.
Sadly, due to a difference in faketime version between master (v0.9.12) and
2025.02.x (v0.9.10), the patch didn't apply properly in 2025.02.x.

Rebase the faketime patch on v0.9.10.
Fixes:
https://autobuild.buildroot.org/results/761/761250e8cbb2602abdc7752d182a44b6f7de5e11

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 ...onst-qualifiers-to-fix-build-with-ISO-C23.patch | 23 ++++++++--------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/package/faketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch b/package/faketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch
index ce84d40699..c889dfae29 100644
--- a/package/faketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch
+++ b/package/faketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch
@@ -1,4 +1,4 @@
-From dbe865dfdba0145d993d70b7fd4ec88b2f47554b Mon Sep 17 00:00:00 2001
+From 1f4f260977a7fcd09fb71b83ee64c4d87b868441 Mon Sep 17 00:00:00 2001
 From: Tomas Korbar <tkorbar@redhat.com>
 Date: Mon, 15 Dec 2025 11:03:21 +0100
 Subject: [PATCH] Add const qualifiers to fix build with ISO C23
@@ -8,15 +8,17 @@ Fix https://github.com/wolfcw/libfaketime/issues/524
 Upstream: https://github.com/wolfcw/libfaketime/commit/dbe865dfdba0145d993d70b7fd4ec88b2f47554b
 
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Thomas: Rebased for version v0.9.10]
+Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
 ---
- src/libfaketime.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ src/libfaketime.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/libfaketime.c b/src/libfaketime.c
-index ef1dca9..02839c8 100644
+index e632395..955cf3c 100644
 --- a/src/libfaketime.c
 +++ b/src/libfaketime.c
-@@ -2666,7 +2666,7 @@ int timespec_get(struct timespec *ts, int base)
+@@ -2365,7 +2365,7 @@ int timespec_get(struct timespec *ts, int base)
  static void parse_ft_string(const char *user_faked_time)
  {
    struct tm user_faked_time_tm;
@@ -25,15 +27,6 @@ index ef1dca9..02839c8 100644
    char * nstime_str;
  
    if (!strncmp(user_faked_time, user_faked_time_saved, BUFFERLEN))
-@@ -3338,7 +3338,7 @@ static void prepare_config_contents(char *contents)
- bool str_array_contains(const char *haystack, const char *needle)
- {
-   size_t needle_len = strlen(needle);
--  char *pos = strstr(haystack, needle);
-+  const char *pos = strstr(haystack, needle);
-   while (pos) {
-     if (pos == haystack || *(pos - 1) == ',') {
-       char nextc = *(pos + needle_len);
 -- 
-2.47.3
+2.53.0
 

---
base-commit: 894ab931e1edcb2171e6c09c8efc70dd546ab52e
change-id: 20260403-fix_faketime-2b9ddfbe192e

Best regards,
--  
Thomas Bonnefille <thomas.bonnefille@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
