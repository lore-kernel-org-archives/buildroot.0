Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38480CD5BAC
	for <buildroot@archiver.kernel.org>; Sat, 23 May 2026 15:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D28DF60B4F;
	Sat, 23 May 2026 15:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C0ukVch_okdh; Sat, 23 May 2026 15:19:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECFB360B4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779549589;
	bh=cRK4M5T4pJGrxZ1BJXLauz5LAoJOqXRCGCQwqxGzjjA=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=eArNWpnUipUw21BXOkRCfK/z8CC+GvTUvGv5LH++M/PpeeHZrvg/c9ol+ffypmNPm
	 v/5ndrNkPqo6kQX9HzS5Fp7eH5r45zjjjPoIgUKQNjJzT716s7LlNyCg129YODTA7x
	 uaEOxaxcCDs2VoVOKmFzPGGOVNGazgy7wzj3bjLehBOIOz2acbuZKHn8YvPmziIAgg
	 KYeRo9f6V7Z8FNovliioxi8yN8e6ub7YmmW27e5JKHkfuKy8vmNljKQq5QYE2s9YXB
	 wKVoFk+KwJrjWxi0IDh9PZey4h1RE07wHCRbWs5ov9u3A+dQC+VU4VhEvJuePFDP6K
	 iib2/HPm1oqvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECFB360B4A;
	Sat, 23 May 2026 15:19:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 222AB263
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1397B4048A
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YgfhgwlMt-Oj for <buildroot@buildroot.org>;
 Sat, 23 May 2026 15:19:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=and@gmx.li; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A11734017C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A11734017C
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A11734017C
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:19:44 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4b1o-1wSSIK208c-00Fj9z; Sat, 23
 May 2026 17:19:34 +0200
To: buildroot@buildroot.org
Date: Sat, 23 May 2026 15:19:11 +0000
Message-ID: <20260523151911.10285-9-and@gmx.li>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260523151911.10285-1-and@gmx.li>
References: <20260523151911.10285-1-and@gmx.li>
MIME-Version: 1.0
X-Provags-ID: V03:K1:H78Tr/Oc5x6u0Lhb4MW1PBLyAkHiT4dbg+Nv9Q6jIlWPUgvDIHd
 bVQvp2+sbOOo/5Pwx0Q7BidpPlWG0YT5dekXpDpJj9q3qaLGf94dO38pD5DCCwGEQRxs5XY
 t67w/0MANGtv7cXalzHS5Iwrxs0gFcqz+z3SwzWgAIqyL4SotzpxfhfCSnmWc/ajUHj9XcG
 p8yGHYUppkriNSAgsQfyQ==
UI-OutboundReport: notjunk:1;M01:P0:ze7s/cFvk9Y=;Y1vl4temP4iGdtjI+RUaD+eTx0t
 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
 gfrlaFIlv/q7vmsJ3NmX6y9k3tmnTWwK+kjfV21
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.li; 
 s=s31663417; t=1779549574; x=1780154374; i=and@gmx.li;
 bh=QxP3pPxsM+tRuXTOloEYv+XHKDktRWfNDt9TO5eZWUE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=gq5YyD3XmI/tZywycDmBsrXz+AAUgAaMUPT62cTr520l82zW0gzhnhrLXTfmUDsQ
 RmutpwNBaxKy/LSd1GS6cbEFVjY7Qj71qgXZ0PCMLiAdUCjn+GfeaIRnUguyclbAX
 0+88CW90o8KG4QOS+zWl20YdI5mqEfFpdsxFuD+BzQF65qXNCSYAic32/1G0xw+i5
 had6Za/Me6481DzTm9B8mHKPKVNXOj+BmIHaVBlJKrGVRQZ92i2yptQUxFwdtbzZ/
 QJrsc+8u5IFIPEnJC0CTAdBFTzTU48zahYnxXTZKbQo4H3n34jYc9YG9lSbUA1Y/N
 hrB75hq+irjIUetUIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.li
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.li header.i=and@gmx.li
 header.a=rsa-sha256 header.s=s31663417 header.b=gq5YyD3X
Subject: [Buildroot] [PATCH/next v2 9/9] package/luksmeta: modify
 !BR2_STATIC_LIBS reason
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
From: Andreas Mohr via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Mohr <and@gmx.li>
Cc: "Yann E . MORIN" <yann.morin@orange.com>,
 Laurent Vivier <laurent@vivier.eu>, Sen Hastings <sen@hastings.org>,
 Christian Stewart <christian@aperture.us>, Petr Vorel <petr.vorel@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There are two libraries with same crc32 definition

Signed-off-by: Andreas Mohr <and@gmx.li>
---
 package/luksmeta/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luksmeta/Config.in b/package/luksmeta/Config.in
index ddc9b6f3..45732733 100644
--- a/package/luksmeta/Config.in
+++ b/package/luksmeta/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LUKSMETA
 	bool "luksmeta"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # cryptsetup -> lvm2
 	depends on BR2_USE_MMU # cryptsetup -> lvm2
-	depends on !BR2_STATIC_LIBS # cryptsetup -> lvm2
+	depends on !BR2_STATIC_LIBS # Build fails because of multiple crc32c() definitions
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # cryptsetup -> json-c
 	select BR2_PACKAGE_CRYPTSETUP
 	help
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
