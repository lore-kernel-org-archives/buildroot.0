Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B9EF47CD8
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 21:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EF1E40D35;
	Thu,  5 Mar 2026 21:12:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yIQr9c9EWEVV; Thu,  5 Mar 2026 21:12:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A288A40D26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772745141;
	bh=qCSODALiXSkOURkwSdWy0ZKNT4RJ3QfarJkIH3xRm0I=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=i5sNSJy1XvrpPfc1weF9oBpleuTuG2MljB1Otsw7r/a58YPKgZbNCSjWtJWRdmfc/
	 1CMXUU5tjohIFb4R7rQzzajTncYKwpb7SzkuCcpapZHoHOO8Bhjwu0Vytmw/oq6LJa
	 oRxzS3GUQKUn2R+huLl2Wmmq1qbUaAy5zH3Ve95tG9yxQBBK6GeBYITnmbnWaLcGZI
	 q4xN3gF+5/RjACszrJ7om4u6p7LuqBRSYrG8gfdulLusiQIsIJdemmICAmAFplLC+A
	 3ZJy7kQalY7LM9Kp30ZdmRO+SF4W7pVn7FW7yl3bzJZITFz9IF5v8SyS2f/TObIdP9
	 8YXaTbF/fPY7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A288A40D26;
	Thu,  5 Mar 2026 21:12:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BB1DA223
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 21:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0CAD60E30
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 21:12:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JUWdhlgtBMPt for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 21:12:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9214B6082C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9214B6082C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9214B6082C
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 21:12:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 51F84A4C373F;
 Thu,  5 Mar 2026 22:09:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47648)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vyFxA-000000003FD-1XSb;
 Thu, 05 Mar 2026 21:09:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  5 Mar 2026 22:09:47 +0100
Message-ID: <20260305210950.3471974-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305210950.3471974-1-bernd@kuhls.net>
References: <20260305210950.3471974-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772744998;
 bh=VAi9FgGRsEHNGf+xD9bLpjE+NN+tEwNX8FTAPHggqHM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=kETrpAqUkYVpnucY8wilbCXrGH8qAifT0qxjYolPr79IdqO7NSPNv680bfiByTxbT
 dWyoB+r+qBo09XQBTVdZLnHU7utShK2mFHyPY8HBu1ch/CRLMNpUeHXKvfi7PosynY
 1SNN8j9UXrtOloOnVSuzAuKgu4IYL8QzksTKUCBHJSrdYu1cWtfcNc3MLVjjnKeDBX
 UVKyXWaPRoaEiKTSZHPMNzzoNTsYAYOoitfCrGt4jXiHaUh9/xLhfguq7nyfVXMOIc
 6O2dMkddcNJfChwCT25pJUwcU1ETNVEeDmlNPLj0fCANSRfunHcfw70yVMaHthweUa
 vEocV8KwcX0eQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=kETrpAqU
Subject: [Buildroot] [PATCH v2 12/14] DEVELOPERS: remove Bernd Kuhls from
 libldns
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Pieter De Gendt <pieter.degendt@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2673a59824..835be1f6a3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -430,7 +430,6 @@ F:	package/libhdhomerun/
 F:	package/libheif/
 F:	package/libid3tag/
 F:	package/libilbc/
-F:	package/libldns/
 F:	package/libmicrohttpd/
 F:	package/libminiupnpc/
 F:	package/libmspack/
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
