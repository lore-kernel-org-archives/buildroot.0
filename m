Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EADC88E77
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 12:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AF676080F;
	Wed, 16 Sep 2026 12:53:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wQD9rJ41S0Qh; Wed, 16 Sep 2026 12:52:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 58DC9607F8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789563179;
	b=UvayUcq7nUUNrhImYIwUX1rq0zte2c+bIIl8IimVIwtnH8dL0xa3jKtF+pMkFi56eBuc
	 070vRvesK+UzNGx7kNy+SoVNcZyLNoVouWJdaul7tfQ4wHOmk0IV2sB7E/V+gcNZvvvg2
	 MWCVdKmEXBez4ToQ9ol0uoqrMbdjhODCjs72e5gCLL1VMe5oP07blAw0EYeQptoTVffju
	 RM9kC4PUT6qMMSl4LzEJMCNd3Yrhq+j4nugefMZAzowcirKATk0AKtgnK335/kE8ndWbY
	 sFGjxPb4hBLsiPnooPoiEZ10eP5wZeN/rKMkFWHqjE8CNAUcsB6rYoAeV/tQKiVFDcA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789563179;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=8koOk7xqlev0h3RGe8+aUchEvxoBsueFKFPPIIMgk5A=;
	b=p4MmAIpT5EVPaDP70dmEN+X9XnZSg05OhI1vQgd+7nPk9tqPdU9QdntVU70/F3ZM27QO
	 cDk0YWyiIQaZ+8R6MZr5e6cVO7pepX5QRv3hj1vPf/V7D1frypmiM3TIzUGj8fDXRQ/SJ
	 JfoOcvHEknzTcSd3Gh51r6lW/JmtP059F5QijBuiEQKj0xdGTcn3AgpxHx4iSxZ6KSGLr
	 +39S/vSKH7ZQpO7AcDsyzgayGPoH372oohd8x0Dx/R7K9p2dAHHqphfv7vyTskUcNLNVy
	 umZXQejIWQG+QM0BJaNlCcH74xP03lQb1/Ae2tmDjkTuAAbirfNjWJwDesFsOAAnpLQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789563179;
	bh=8koOk7xqlev0h3RGe8+aUchEvxoBsueFKFPPIIMgk5A=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Y7fny1bC9NwGrRoGQ5y3J+wMqygzESt//h4E5dieB4F7iMoFkNQukJoTPSRbWteyY
	 SN+mscS6mcakDreOtGKJjfiv91Kn11buSqLxZKOYf3NRP9GBzhK2dnOoPX5IFNKyeG
	 qjk8NiNeI2m/53XhPiY702kNXT9bxkmf0tEHg/lMrUZ4rv4dbbfGETVhwFIV7+AkLN
	 bcRgy/oVTFnBh28qZWuBSI0SEgxJ9nz6WUOAlKual7a6ZJjdTCZkXzN6TkaXKZuQ6Y
	 2vX6XRDPZc+r/AnZV/iV01FYXoqm1EXtn0GZobcbfEoAfHZvfrjZQW3jcF8dTE5kir
	 Dm5bEWKf82CWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58DC9607F8;
	Wed, 16 Sep 2026 12:52:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 50BD8388
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35B4E80CBA
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:52:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tn8KqeTmI5Xe for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 12:52:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 22DF9809DD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789563177;
 b=fwO/guqwMmoRUS0SNUsVcrXWqeIETdawkhSHVGroBkLgbwYBcDL0EsHK/fv19l5nkhUj
 ar2VmQQllpIAbZYnqeZAe63yfOJ6J0hGh8U0GiRjH1DerzkWhmbfjG4WJ0LWNzTzKXDnk
 hMejsRHQED6Q+t8pxzvcP9pm87fPg1tf0rD1jIGzcrDpLQkpJ6ogXnU6Vsun/JAi48XZO
 oSED3M+6Lu6QAmnlesYdRUo0+r6eOfmG5OgNOdu9B89DkHO3kVIZXV1PM8ubXV58OSci7
 F7UrBEtamWxHMwGLs5nGlRH6e2egvHQnUleSJkyA9olc8pkmsy9YMe1E00EB/r7IYHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789563177;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=ejT21/er8ZD6gHvlPbJs13mABvtmUoDzNNfw65k7R1U=;
 b=JnjygX3Krm2gGQYeoRFyvwxCeZ3civ/Hn6yydC6R98XN1wlhJBlw+vjOBmMwnqqfARV3
 f1I0+3zzzEhtfG1iYParADfG3GHNfjyuVyQkqPfGF5w9j/rV4cgnp1U0SgEBIWnvSj87t
 bnVKIyetg6EfRI5+DvvbWfy5X7ymezEfAhIWmUs5Csndj2BavolWvWJuFFB60R0M+mZ9m
 WhIorK6EdmWbsxevdLQjE2CrLZn3WK1VycLKzh9prQUVwIMH2tAeoHLsjuwwCpCiaJpkS
 iJTSAtPNAXcEmaHMu7/Ler6idyWF6D5uqaYmSlNrFXxMOffY0zR6JA5unhf4RtVNyng==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b="j/4fz0w0"; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22DF9809DD
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:52:55 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MaJ81-1xLUGG2jeX-00TMqZ; Wed, 16
 Sep 2026 14:52:53 +0200
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 14:52:33 +0200
Message-ID: <20260916125236.2759304-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916125236.2759304-1-fiona.klute@gmx.de>
References: <20260916125236.2759304-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:dB20kWdDeuye/retB+Mnu8cxLHM9lqSls+214KdIRUY07V+U27k
 h2ucUfbnefjAyHT7fx9guS1zIZRPVdxtZubW2H0c36nU4Z6wk75TnKa4C/I4dXOI/58Aw6+
 3ZzotizyrrgoNmYcAzCLwurIIJUx2Lp/zwjGUKDWiqLLSMqXxckHSeQ2VV67nxeZ/qZCzHb
 +HjyF2DoTEBiEKbWkn7Zg==
UI-OutboundReport: notjunk:1;M01:P0:7eleAEEaN+s=;F4I572Y/02ydpy4FTQzEQs17qk2
 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
 atj3uPOfW0AENcnB4GAjgU+HWg==
Subject: [Buildroot] [PATCH 2/5] package/lttng-babeltrace: select
 BR2_PACKAGE_HOST_UTIL_LINUX for host package
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
Cc: "Fiona Klute \(othermo GmbH\)" <fiona.klute@gmx.de>,
 Philippe Proulx <eeppeliteloop@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

HOST_LTTNG_BABELTRACE_DEPENDENCIES already contains host-util-linux,
select its config option to avoid confusion.

Fixes: 106c7d30064cb17ae74708a9bc085e349cc735e2

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 package/lttng-babeltrace/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lttng-babeltrace/Config.in.host b/package/lttng-babeltrace/Config.in.host
index 71b9c7d9ff..e2114b8138 100644
--- a/package/lttng-babeltrace/Config.in.host
+++ b/package/lttng-babeltrace/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_LTTNG_BABELTRACE
 	bool "host lttng-babeltrace"
+	select BR2_PACKAGE_HOST_UTIL_LINUX
 	help
 	  The Babeltrace project provides trace read and write
 	  libraries, as well as a trace converter application. Plugins
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
