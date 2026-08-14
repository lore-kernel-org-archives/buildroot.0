Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3650C5CFCF
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 19:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62CB0409AF;
	Fri, 14 Aug 2026 19:59:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oa8qNKOSrBUy; Fri, 14 Aug 2026 19:59:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80C1F40C1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786737566;
	bh=Su6CTvHTk3cZvXIG+btm2xeuryHqSuCIS+zHnl9+7lo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KIkrUqoTtYJPZNBrKmPzL3fArE6s78yiZha9HSQFaztvTJenQL9+g9qCk3BCLq8Sn
	 06JBq05jmhKOxSdDmt/xDAbGPwytdhmzhCUInfYHilwwLi9Eaf4QUPJr4TPZghRb8A
	 d1dsxoJUg4YXUNa/DjRh9NHjvRDG+Y6SwGESTrU1xa1UAmek8Nbrse1Vv9U4nODcU6
	 DWquaSUZgGd1/FkgrXMnjt9aFB5Og8fHQ8q3LU4jAbtT+6gKUDjNp1UN/9PAXpnG2w
	 BPbXMSGNGMuPV0nfF8iM8MOWgxN1sZzvFohSkIkUQWW4KOk15/48OfKqkZIrHMRbaJ
	 nHCYx5akMi4Wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80C1F40C1A;
	Fri, 14 Aug 2026 19:59:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AE7E23F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00CD1811D5
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zDkzbUs4o2jz for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 19:59:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8834980E85
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8834980E85
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8834980E85
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:21 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5VD8-1wwdo138rS-00re0o; Fri, 14
 Aug 2026 21:59:15 +0200
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Nathaniel Roach <nroach44@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Fiona Klute <fiona.klute@gmx.de>
Date: Fri, 14 Aug 2026 21:58:51 +0200
Message-ID: <20260814195856.3295644-6-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814195856.3295644-1-fiona.klute@gmx.de>
References: <20260814195856.3295644-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Xdbhp+lSw2nHg2mKVHAa1WYdHapX+naa+4APH+wHMWKGfUlyJC4
 1QjR8xo3CjhHgpEuXuk2dcMxSTXywzCI9yz1zTTwUfWxOSjbK5BqR3aApsb+XTpLRnuzhdi
 VDllWNKEOrRJcAyd6tzbYlStqrGWkXJZX/ixnSR08xScfqsqKwbhgp4UJiCrGqzUL2Z3SYL
 q082VtrJebJuJyc2bLdDQ==
UI-OutboundReport: notjunk:1;M01:P0:XiN2MRoRWho=;G7ZdPNCs9YO2degjFEViJyTf0w5
 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
 dNq5dhQ==
Subject: [Buildroot] [PATCH 05/10] package/libpeas: update project URL
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

wiki.gnome.org has a big deprecation warning saying "All information
on this site is out of date and should not be used." Point at the
project repository instead.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/libpeas/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libpeas/Config.in b/package/libpeas/Config.in
index 33fae14d4c..a9ab94369b 100644
--- a/package/libpeas/Config.in
+++ b/package/libpeas/Config.in
@@ -18,7 +18,7 @@ config BR2_PACKAGE_LIBPEAS
 	      Python and Lua
 	    - Simplicity of the API
 
-	  https://wiki.gnome.org/Projects/Libpeas
+	  https://gitlab.gnome.org/GNOME/libpeas
 
 if BR2_PACKAGE_LIBPEAS
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
