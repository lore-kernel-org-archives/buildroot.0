Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C30FF8860
	for <buildroot@archiver.kernel.org>; Sat, 25 Apr 2026 14:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F0BC83E92;
	Sat, 25 Apr 2026 14:43:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GPnJZvKHqiZZ; Sat, 25 Apr 2026 14:43:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B147B83E93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777128210;
	bh=bqWfr/i+AXY2xK2ycr0hBgQmf/imqRI/NHyi58Iys9U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QLtyj8tyHiCHVOgnKSl/fenHW1o9Sri0fZDlb3LC51guGhlKt50deYp/I5iUmfrw9
	 VwQElkvBjt+ZYtTAFliH+uXfOdvL9L5/MOz2nZY+CAXnJ9AIC481rjEnQxvXiB6ETZ
	 stWaHohSkr8dKV2gErFPhQC9tvEw561AHcjByoWTKykRdiy3fL6+ErhC2aBHYKfXG2
	 IecTWbcG+cok3Pf20QzBrYOpl66Z8p5Gtaz4H8dgQXX6CV9owrb92aUAfy4cxLpS7y
	 pQaynsThII6ApGJMU8NTO7hu2pIW5CSH1Dl2ah5FXUeLIOwYA66ZbeMgiSUddSsH4k
	 ynTl8EBkRoZxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B147B83E93;
	Sat, 25 Apr 2026 14:43:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C6E7194
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 14:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AEFB40A95
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 14:43:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 85iXPAqa_MQr for <buildroot@buildroot.org>;
 Sat, 25 Apr 2026 14:43:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 086D640C89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 086D640C89
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 086D640C89
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 14:43:27 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUXpK-1vqDQT2dWK-00IxPP; Sat, 25
 Apr 2026 16:43:25 +0200
To: buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Sat, 25 Apr 2026 16:43:05 +0200
Message-ID: <20260425144306.881411-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260425144306.881411-1-fiona.klute@gmx.de>
References: <20260425144306.881411-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Hu1fJv5OBYu0rbgqFuejbHhsAngVhNL4KkmEPaAjl9WDtFGevhv
 Az4gPWgbV6KJDuldikbhAYEaqBsel658zKDkNz6nAWOK4HNyKrOeM/4Km4tTrv7yvDoMXax
 lzYg174kBi+4mrpX0ZZe2Yarsuy1VWJXxxfSZMr58KZFeuB5wsWZeuvxTnHv8OxToJlAUuW
 Hbn9veXvGk/856++TSdNA==
UI-OutboundReport: notjunk:1;M01:P0:npgWwyHEl2k=;fCMyDsbj6TqRAIPjkLcrUF/zqFR
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777128205; x=1777733005; i=fiona.klute@gmx.de;
 bh=M/xvUAuHc6P806XmF/KLYCfM9M0khjHiBe6Zp14Tvc8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=dsZxYj0Q4yaJzQ8KrCQIKQfG71LSdQoCOC1XxyL+5tTinVIykfD/Id7iWZ/nSUlp
 EXfC/tL1VXLsuRGyVnT7fYR9B5GYA+0gYYltg2CzrdnKisKukBwLKxwcVFZlNl/d4
 4ss52/0hOZ2jUsRFdaZXDnlfhD0SW2uy2tjf8OygVZa9TmmjMFEemAOVVdcqN/MOV
 3FQqdlIZULuHe1olgiGsEL+EZThyHYqM3GObuSgn8HBFGYogkCwemh0HdNSvzGBxM
 1/8vugoKXeuqz3cASmw+RPr313inAaYMHomBMgpkYrBAcZ4qRaOZsXcezc0TX8Ycw
 S6m285/Vy/zUNA27/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=dsZxYj0Q
Subject: [Buildroot] [PATCH 2/3] support/scripts/pkg-stats: format upstream
 URL info consistently in HTML
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use only one of the classes for "error" or "warning" status so they
look different, and format the error/warning text for both. Do not
make the text a link if the URL is None.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 support/scripts/pkg-stats | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 1d50c86d40..e14a64c0bf 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1055,14 +1055,19 @@ def dump_html_pkg(f, pkg):
     div_class = ["centered upstream_url data"]
     div_class.append(f'_{pkg_css_class}')
     url_str = pkg.status['url'][1]
-    if pkg.status['url'][0] in ("error", "warning"):
-        div_class.append("missing_url")
-    if pkg.status['url'][0] == "error":
-        div_class.append("invalid_url")
-        url_str = f"""<a href="{pkg.url}">{pkg.status['url'][1]}</a>"""
-    else:
+    if pkg.status['url'][0] == "ok":
         div_class.append("good_url")
         url_str = f'<a href="{pkg.url}">Link</a>'
+    else:
+        if pkg.status['url'][0] == "warning":
+            div_class.append("missing_url")
+        else:
+            # "error" status
+            div_class.append("invalid_url")
+        if pkg.url is not None:
+            url_str = f"""<a href="{pkg.url}">{pkg.status['url'][1]}</a>"""
+        else:
+            url_str = pkg.status['url'][1]
     f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">{url_str}</div>\n')
 
     # CVEs
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
