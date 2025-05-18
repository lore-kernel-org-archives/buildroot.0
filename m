Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2727EC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 17:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B07AF4085F;
	Sun, 18 May 2025 17:46:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bInpcdCSqL9v; Sun, 18 May 2025 17:46:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC0A44085E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC0A44085E;
	Sun, 18 May 2025 17:46:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B2117E4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2F314077C
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4f1UPqLvTDgX for <buildroot@buildroot.org>;
 Sun, 18 May 2025 17:46:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B001D405D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B001D405D3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B001D405D3
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:46:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a067b.dip0.t-ipconnect.de [91.58.6.123])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E0E10A4C2059;
 Sun, 18 May 2025 19:46:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38314)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uGi5m-000000003tB-0LHo;
 Sun, 18 May 2025 17:46:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Bogdan Radulescu <bogdan@nimblex.net>,
 Joachim Wiberg <troglobit@gmail.com>, Steve Kenton <skenton@ou.edu>,
 Wade Berrier <wberrier@gmail.com>
Date: Sun, 18 May 2025 19:46:26 +0200
Message-Id: <20250518174630.2149476-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1747590390;
 bh=Kg2/jGLCNKI6qHeT1Ilfm3pbiJYQlo2FfScvKL5mMyw=;
 h=From:To:Cc:Subject:Date:From;
 b=Lh+PGzLyClNQZEM2b+SHlOqCmLCUqX7++yk5k/h0ZFKuOfOMRjQd7YXKMgfRgSOQ4
 wZLC7THrz0cd9yJKyfHQU9kQ/gQDdtoV36rSGV0AAEYutovRgwQx0s+zkLz5aKZEQs
 ZIF3Jdl39PM8DFtFihlwz/anOJaFXDoNtc3vJzyV5A9ghsO5qFaIAxOf0tHTg0AF17
 Au0jqdJ4468jdYiXVtz2i9zhT8M5eLQ1k6i//iIKCW+VikwMFF+rxOAbQW1/h08z5r
 SmxqNmuoFP6x2YePbnEucO7D2m4WfxErAQ2qvwrfKFO1Oag9Ew73InUpxNw6vTgKNr
 ho8ZyRg9mgkaQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=Lh+PGzLy
Subject: [Buildroot] [PATCH 1/5] package/iftop: fix build with gcc-15.x
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/iftop/0003-iftop-function-args.patch | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 package/iftop/0003-iftop-function-args.patch

diff --git a/package/iftop/0003-iftop-function-args.patch b/package/iftop/0003-iftop-function-args.patch
new file mode 100644
index 0000000000..7ef38bf0bb
--- /dev/null
+++ b/package/iftop/0003-iftop-function-args.patch
@@ -0,0 +1,18 @@
+Fix gcc-15.x build
+
+Upstream: https://src.fedoraproject.org/rpms/iftop/c/d098f91f0f590c1cab264bf77851d4018c430d9f?branch=rawhide
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+diff -up iftop-1.0pre4/cfgfile.h.fargs iftop-1.0pre4/cfgfile.h
+--- iftop-1.0pre4/cfgfile.h.fargs	2014-01-05 19:47:53.000000000 +0100
++++ iftop-1.0pre4/cfgfile.h	2025-05-15 18:09:05.849754901 +0200
+@@ -13,7 +13,7 @@ typedef struct {
+     int value;
+ } config_enumeration_type;
+ 
+-int read_config();
++int read_config(char *f, int whinge);
+ 
+ char *config_get_string(const char *directive);
+ int config_get_bool(const char *directive);
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
