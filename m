Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0F8FF885D
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 15:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3EA34292E;
	Sun, 26 Apr 2026 15:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BK71TT0AsTCs; Sun, 26 Apr 2026 15:33:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AF9742910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777217634;
	bh=V1GTM9fqXYYwGd9itAd4aJGsPMUlVS0S1bMS66kTyHU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mavKSnkiEHO6M59CLNYEfn7ttGooaJz/XMcqUW1a+hwAflj52nhsJcF0khpj9zA6M
	 Q4MPU1283LOgSTxdYyo7TFQLaur/ybihpBg83oPjGuDwjhRXa2CN2cJdox318thki4
	 RIp75CnocwFUkiOz5L655C+86bCirS8v5OmN1GIfrGbfc6sXL2fNImjhhFtnLIUJf2
	 nqzpn9PPTG9KV/7Uzj7mifnSXB6GvETOzo9rbFjTu5jjSurxCJX7/hgB7MPK+5gAKw
	 urlza756l8EbwWsvkvZ6tf7bkKel/xnjwDYf3LQmFkaeBPmojTZrPt5aslONzh30in
	 H427i8OC1stiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AF9742910;
	Sun, 26 Apr 2026 15:33:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B20EE231
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 15:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 975F061C0C
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 15:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QxNsAtIt8twi for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 15:33:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 27A0561C0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27A0561C0A
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27A0561C0A
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 15:33:50 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MnakX-1vYJHl15lt-00hYnz; Sun, 26
 Apr 2026 17:33:48 +0200
To: buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Sun, 26 Apr 2026 17:33:30 +0200
Message-ID: <20260426153334.1026982-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426153334.1026982-1-fiona.klute@gmx.de>
References: <20260426153334.1026982-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:S9JrNdcuCyPjUxv6Z5C1qaqFkoLv2Hz0JEVoBCJ47OhgOQ6tf2L
 AP9VKmhGrGRtaPkPi4CFb1zYEe+6NT0wNqB7IQmM80Sl0aihSgknpFU30yngQF2rBGRJPz9
 +k59QhxLqgzENX4zVN9XXPfzd/aLrwWhW/17YmQytfhSJ1QeYlWQCwFQHUmWtMLEKzK/BhW
 L2PWbPL9jyu9uYMu7+FJQ==
UI-OutboundReport: notjunk:1;M01:P0:1jxPtOZD73M=;wz1a2sSO9R5H/MYwxfslSycITgw
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777217628; x=1777822428; i=fiona.klute@gmx.de;
 bh=wH8v0HjDzXtx/PtzVm6+KEhGFWa4hr14Sa8sy/ELlCA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=QZTDtZlWvLHGgjbt3Ssall0DCPiPuu+98O65fPCz9s1RHhaE+AeDviK1jDr2gSrm
 zmBBwV/dBfnZ1N+Yhtex8fQ5T1QpJN4le0lQq1fagcBaGS35jX9g5nJb6gRro+mqa
 4GVxjDkwFTtAIy0RGKLvO3y3Xcvmak4oM4hwNqOzwD8iWmq3SRPCit5H7Se+Bx2Fm
 a11eDkxoCQzZ+5W5l+YAicUemwMrcyBD6dkz4waruwmIgxFvWjkQZaCYHfa1madat
 cHEoXyulvOzyk+I2jAaP+4H39MglbEQU5SfovnI528P0FH+rFe8U/3WwmgzabUo/E
 DI+8q8dxXiFpADP86g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=QZTDtZlW
Subject: [Buildroot] [PATCH v2 2/6] support/scripts/pkg-stats: format
 upstream URL info consistently in HTML
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
index efb85a7405..a87bb23a8e 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1057,14 +1057,19 @@ def dump_html_pkg(f, pkg):
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
