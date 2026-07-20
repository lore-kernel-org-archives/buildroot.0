Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63608C44520
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 17:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 230DC80D1D;
	Mon, 20 Jul 2026 17:04:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BlIFQOrACDPq; Mon, 20 Jul 2026 17:04:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A82B80BFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784567092;
	bh=klADwodaTUdvoQDuiPMqn5pl2qOjKwfeMyqTG6RksTQ=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=dRul3Ej+lkDlv0SdJIYagSKxVZ8I6hK9ksd4xNvLx1ErUwXFw8EqHQw+vJSHtUNda
	 V1DfgIO8khqDOhbStmqw5eW4dwqWk95iHLwirng5AS6dZmKUh3ENwA2vZEHJY3k+37
	 1MAQV6yIRTUjZomW3xtRufrfU7SJwQ8hzfMqpKlEWy/W0IFaAm4NC1XQWAjY7Bp5kT
	 /fpQK/F4XIkmZnpWZBnklFtDa0c6Cec87v92dwUC+ZzBNvMn3wsnlEnxh2VpYtUEiV
	 VL/Her+j/WRvh2dvJrDrFq8VKmEfmpNhKfXS4OKJ3VZJXPYVpHbSzJoQlBBkK6D/LN
	 Ps4QjkgvuUB4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A82B80BFF;
	Mon, 20 Jul 2026 17:04:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F18F20C9
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 17:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30AA9606ED
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 17:04:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nSfk8_KnBfea for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 17:04:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3F490606C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F490606C6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F490606C6
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 17:04:48 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnakR-1xTCRc3JYr-00eaoh; Mon, 20
 Jul 2026 19:04:45 +0200
To: buildroot@buildroot.org
Date: Mon, 20 Jul 2026 19:04:34 +0200
Message-ID: <20260720170437.133823-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260720170437.133823-1-fiona.klute@gmx.de>
References: <20260720170437.133823-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:g190jQ5MgmkdkD9FybYAyE42iO37ecmFFgF1u/mOfhizI95mVGF
 J5V9huO1xdqkILcBi16R2evNCEX7D0rg7q7Ty6n7H7fqU4YPcP+yb5YCN/pqLa4LR/GMaI9
 VHMYzVlm81re1sgNAldCpa4QCTpyccdiQwRSr8XoD1h9ZS8dXGuPFESVXVgoTZ7YdIknzCg
 j1fFfVAm6BQIb8VsHVNsg==
UI-OutboundReport: notjunk:1;M01:P0:yVUYN2Cjt9g=;B1mDJ9Ty5XNupsp5ISe9DP3Etnj
 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
 =
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1784567085; x=1785171885; i=fiona.klute@gmx.de;
 bh=s3i/Z/hIxWzfT37tzud8l54wIEoy2fL86fF1n9F6qcI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=SJGtrJD7gBtngZx8jWw0w26RXPJnqLz1Gg0ACjv5iZ/uXeKkuhvHxzFG1NO8vOx9
 P+TaXl6uaS0/2zA3PBOJmtPK9G6b8mfVJOqls7e7G9cd+Z0KjvZu8OakMxhyufED+
 4K9O4KG0gyyCrCgE/mSgyFqHXxdCZ1s1Ey4WAe+MFUX28HFt6XpcJPPN5A0eYFY/e
 OEuMu/zmvCHiXe7io5OLAjSeZB03ocQVI01iPny37psDIxS72dBOnBLS5H4s/3rg8
 wGq9dbSfmbvHqrEeGWYgxwDbe2pxvhizWnMZokA0l3R2TCSny01LfSgAmTHO4pthW
 MZLuNe6aIMH6nMsSfw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=SJGtrJD7
Subject: [Buildroot] [PATCH 2/4] package/dbus-broker: clarify license
 information
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Davide Viti <zinosat@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Norbert Lange <nolange79@gmail.com>,
 "Fiona Klute \(Othermo GmbH\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>

All these bundled subprojects explicitly give "Apache-2.0 OR
LGPL-2.1-or-later" in their README.md files.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
---
Note that the dbus-broker "main" branch has changed its license to
GPL-3.0-or-later, DBUS_BROKER_LICENSE describes the packaged v37 (latest
release).

 package/dbus-broker/dbus-broker.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dbus-broker/dbus-broker.mk b/package/dbus-broker/dbus-broker.mk
index 7e029879f9..869eec462b 100644
--- a/package/dbus-broker/dbus-broker.mk
+++ b/package/dbus-broker/dbus-broker.mk
@@ -10,7 +10,7 @@ DBUS_BROKER_SITE = https://github.com/bus1/dbus-broker/releases/download/v$(DBUS
 
 DBUS_BROKER_LICENSE = \
 	Apache-2.0, \
-	Apache-2.0 and/or LGPL-2.1+ (c-dvar, c-ini, c-list, c-rbtree, c-shquote, c-stdaux, c-utf8)
+	Apache-2.0 or LGPL-2.1+ (bundled subprojects c-dvar, c-ini, c-list, c-rbtree, c-shquote, c-stdaux, c-utf8)
 # For the third-party code, the licensing legal-info is inconsistent between
 # the AUTHORS and README, so keep both
 DBUS_BROKER_LICENSE_FILES = \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
