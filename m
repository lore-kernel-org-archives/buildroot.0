Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DB4CCF9F8
	for <buildroot@archiver.kernel.org>; Sat,  1 Nov 2025 10:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2E5B61C39;
	Sat,  1 Nov 2025 10:35:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CMilMCbVN4e9; Sat,  1 Nov 2025 10:35:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C390961C78
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C390961C78;
	Sat,  1 Nov 2025 10:35:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D7290964
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 10:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCE4361C78
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 10:35:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZQxTslBUYknD for <buildroot@buildroot.org>;
 Sat,  1 Nov 2025 10:35:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D83F961C39
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D83F961C39
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D83F961C39
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 10:35:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b624.dip0.t-ipconnect.de [84.161.182.36])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F10A4A4C4890;
 Sat,  1 Nov 2025 11:35:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33668)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vF8xH-0000000011b-03ER;
 Sat, 01 Nov 2025 10:35:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Doug Kehn <rdkehn@gmail.com>
Date: Sat,  1 Nov 2025 11:35:30 +0100
Message-ID: <20251101103530.124285-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761993331;
 bh=9yPjJtNd4uugz1p8BNUy7X2Cz6kKbAQ483MwYoahK30=;
 h=From:To:Cc:Subject:Date:From;
 b=JgAObaCWdBNdmP80DKlLAIOv+bFUD6mPP+MTKRNB5gct8SRu7hh15D1ZGIJ70CQj9
 58teUGrjeXOUzcB4cQeHfJExGrocv9hlBGjo+A13wE47+/eu2+4ybP8+1RyLDnx1Ws
 WjotDCyBrITNYesMiIwczezXNbauEZGAgeSEmJWsmq4uKTTUxvDAiI7xFt/ONHbJ8i
 aXzTKNBM0M+y0C0yuJRRAq6XA9cp1kZLQzEAp3rOmmi3ACxrgNO1LOJ2HBUUUtprOr
 PAo7SrnN7KRKysFt4Tjf+fzrBou9dnfq0oMMNdrp6HC+7wJ8NpIjx3lkDtROKv9YkI
 7Bdl0ssK6K2dQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=JgAObaCW
Subject: [Buildroot] [PATCH 1/1] package/nss-pam-ldapd: fix build with gcc
 >= 15.x
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
https://autobuild.buildroot.net/results/c30/c30b29723a2f3db6fed5ad0bf0e06c126a857953/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-name-bool-which-is-a-keyword-in-C23.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/nss-pam-ldapd/0001-Fix-variable-name-bool-which-is-a-keyword-in-C23.patch

diff --git a/package/nss-pam-ldapd/0001-Fix-variable-name-bool-which-is-a-keyword-in-C23.patch b/package/nss-pam-ldapd/0001-Fix-variable-name-bool-which-is-a-keyword-in-C23.patch
new file mode 100644
index 0000000000..a3812fcaff
--- /dev/null
+++ b/package/nss-pam-ldapd/0001-Fix-variable-name-bool-which-is-a-keyword-in-C23.patch
@@ -0,0 +1,35 @@
+From 8ddb983a546f632986a84a784c4625110f7782a2 Mon Sep 17 00:00:00 2001
+From: Arthur de Jong <arthur@arthurdejong.org>
+Date: Sun, 23 Feb 2025 15:22:38 +0100
+Subject: Fix variable name (bool) which is a keyword in C23
+
+Closes https://bugs.debian.org/1097481
+
+Upstream: https://arthurdejong.org/git/nss-pam-ldapd/commit/?id=8ddb983a546f632986a84a784c4625110f7782a2
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ nslcd/cfg.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/nslcd/cfg.c b/nslcd/cfg.c
+index ded797a..b984b0e 100644
+--- a/nslcd/cfg.c
++++ b/nslcd/cfg.c
+@@ -207,10 +207,10 @@ static int get_boolean(const char *filename, int lnr,
+   return parse_boolean(filename, lnr, token);
+ }
+ 
+-static const char *print_boolean(int bool)
++static const char *print_boolean(int value)
+ {
+-  if (bool) return "yes";
+-  else      return "no";
++  if (value) return "yes";
++  else       return "no";
+ }
+ 
+ #define TIME_MINUTES 60
+-- 
+cgit v1.2.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
