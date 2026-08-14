Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF25EC5CFCF
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 19:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2F0540C16;
	Fri, 14 Aug 2026 19:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E5fBnkXJXf2P; Fri, 14 Aug 2026 19:59:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4BDA40C32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786737569;
	bh=RjOyHh0T5U6l7RNrS0esEtVrDKbfnEc2TCdIf0ZHEp0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VpT5XsrveYtqIhF/VduYRCiSARb4/xmtB5oZh3s0jb2O55VJQ0/FbYiXNEAoWFIsO
	 dIZNDnLPjsPWEI5aBu/xZyLFaKBkSrbz5Av76fxa1jsG50q9XZJr4fetln4lYn15hx
	 uzThmgweJ/B3+XWlIF/8fNLWpez7Ij3nu5W8yqeWJoaK7aHLovaLHbjzFjE1LY4mtp
	 EWEKt/cMpVEub+JPoDucS7CeD6z5IWggJ3jQ/fAnid70tB55oJDqn+hryWVFNMJAy8
	 XuclwUOvyYQSZ2dlFfOrqGBArPLBxRl5omAPO0MRnHPfmeZp7XjhtgDExRkr/jspqb
	 woRfzBcl9o85w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4BDA40C32;
	Fri, 14 Aug 2026 19:59:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D2EB23F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62549811D5
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PtVQ7qLqPkYq for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 19:59:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F23CC81241
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F23CC81241
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F23CC81241
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:25 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEFzx-1wklKP1ywn-007uon; Fri, 14
 Aug 2026 21:59:20 +0200
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Nathaniel Roach <nroach44@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Fiona Klute <fiona.klute@gmx.de>
Date: Fri, 14 Aug 2026 21:58:55 +0200
Message-ID: <20260814195856.3295644-10-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814195856.3295644-1-fiona.klute@gmx.de>
References: <20260814195856.3295644-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:KWlihAncU5RHk/KdRFBtaSlSF80IbgdwWVG4nPI0p63vPJDaD6Q
 gkoB9nkb3jVsztgEFriifnBMfi5wBmZYyf42Bzkmtm/eXOT48JdE44+qyRfXWGcEao+1wjt
 E9s1AHUEWj0YppN+yA3TOic10fj4Rks/zzCK/qMzJGYxzIBhaPEIeVSzmaTXhOT9pOCrJqt
 aQB1l42Vne1aL160jdRLA==
UI-OutboundReport: notjunk:1;M01:P0:4SLQscRXJFw=;xxqQtzgLA7MkmbvOozZhW6fRMRq
 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
 UUxUViO0EM93of26ntQcWseWeNDU=
Subject: [Buildroot] [PATCH 09/10] package/cantarell: update project URL
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
project website instead.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/cantarell/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cantarell/Config.in b/package/cantarell/Config.in
index 78af96d595..2dfec0889c 100644
--- a/package/cantarell/Config.in
+++ b/package/cantarell/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_CANTARELL
 	  The Cantarell font family is a contemporary Humanist
 	  sans serif designed for on-screen reading.
 
-	  https://wiki.gnome.org/Projects/CantarellFonts
+	  https://cantarell.gnome.org/
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
