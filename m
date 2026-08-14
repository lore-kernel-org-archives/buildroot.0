Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD02C5CFC1
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 19:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36F7440C16;
	Fri, 14 Aug 2026 19:59:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gRPPs9U4Awi3; Fri, 14 Aug 2026 19:59:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66E2240C1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786737563;
	bh=g9MgwDeHhGvTrjbatG2R9CWAxl9mlk93bXTa6ZTTgkA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=feoObSuibTELudicbVlBCO0ApL6IrkxyFZ9VELPefEJCS0/MckS60iyrLaACWUYec
	 TmAO0Qv6BAdh1ePm3bXKip2gN4bHHdfS1ngEV9wu93o8xX+vY7OpBa2aE+aqnajvyv
	 NJa8jkjKoOESDhoPdmibywuMgA7uC0ipj4smNYuRXUgsJxkzdjckr/spfFDiVPfJpY
	 7FiCAMRtkYf7DEMLj0cxcD+tnIdefG6xUBnALUBySFMq90MD5gbN1VVNkyydkwMlJ2
	 vrsohMIUQNsQ6Pydpup7DF2CjWbJktJfqHhF6EdhWTWiSZ7GNibyAFvAZaQ1ISGRCb
	 NNk58Pme9RV5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66E2240C1A;
	Fri, 14 Aug 2026 19:59:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EAB623F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64FC740C16
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zT4QuHASMwyN for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 19:59:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2120940C2E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2120940C2E
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2120940C2E
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:19 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mf078-1xN8s00mio-00iwqg; Fri, 14
 Aug 2026 21:59:18 +0200
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Nathaniel Roach <nroach44@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Fiona Klute <fiona.klute@gmx.de>
Date: Fri, 14 Aug 2026 21:58:53 +0200
Message-ID: <20260814195856.3295644-8-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814195856.3295644-1-fiona.klute@gmx.de>
References: <20260814195856.3295644-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:q8CSX+YwZouiM0IJX9gvDcOt3UqBA46MyJlu4Zz6o6mnRvfZ6uK
 HklFxcNgr05GE1jKbuH91e1+8+IYQmaGkshseTnl5NdsNaECg/3DE2f1ijZpP2xhCe2WFAQ
 FoBIQLMszaHYoDAYPoToeegyiJRWwglYzimLEqXZVDpVhQOY53grREV/zf1VVsXL/yJPA5F
 H+HS4NSTCoWvwswmUeVBQ==
UI-OutboundReport: notjunk:1;M01:P0:99VFZtsI8Eg=;6JkGHI6KCNMk2uBHQ8tw7t4q7ky
 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
 IhOmIdQ==
Subject: [Buildroot] [PATCH 07/10] package/libsoup: update project URL
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
 package/libsoup/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index 02e8e8b578..f566e9a508 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_LIBSOUP
 	  and the GLib main loop, to integrate well with GNOME
 	  applications.
 
-	  https://wiki.gnome.org/Projects/libsoup
+	  https://gitlab.gnome.org/GNOME/libsoup
 
 if BR2_PACKAGE_LIBSOUP
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
