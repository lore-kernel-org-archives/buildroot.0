Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9845FF8864
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 06:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AD3A40D3E;
	Fri,  1 May 2026 06:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fhs5SjU2GEe0; Fri,  1 May 2026 06:26:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A32F240D8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777616783;
	bh=AdLv01MtExyvmxSBjsJ3UVmpw0EzZiJ1L1Jn/khSvjQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nhCaJEWNYz02oPfc9NFMuO2rZvhe2GrMkeu1tI/HyneVams9nX5cPciJPgjTD+eO1
	 5meojhvM+EBzuWDIgtQRK1LhFfjSmMnNdUiQeZbEhE0LqqDDi/Gpya/EdX+wf5JpFg
	 nVx49QyotJ5mjlHixFAmfDhtupt/FvIpz79+Yw+kQ2NLQE6Ci2HKDbrqf139AqF8Fy
	 aenX++Dbmzawury6alXVgE8VmAVl44MX8uwt7w4i3LOSGL5qPveoZcwBgteFQbcPov
	 oCruy41qm8KlpYVZHhuHhcUdc8vZqQ5AFp9Xr52ExF23rLI0tzmFCkq/SPA1ePDUAm
	 S9ZYT9UFDsi6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A32F240D8D;
	Fri,  1 May 2026 06:26:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 70101204
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55AFF60A37
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:26:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IepkDKbBp57y for <buildroot@buildroot.org>;
 Fri,  1 May 2026 06:26:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 779CA6090C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 779CA6090C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 779CA6090C
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:26:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E09BBA4C2C83;
 Fri,  1 May 2026 08:23:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38120)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIhHT-000000007tD-3kpp;
 Fri, 01 May 2026 06:23:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 08:23:08 +0200
Message-ID: <20260501062316.1942112-16-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501062316.1942112-1-bernd@kuhls.net>
References: <20260501062316.1942112-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777616608;
 bh=bWNhI1r3yyLPULUxeRm76DoW0v6JWSGkuWwUGWbp3u8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=VWT4Asceucc+OEDbUP+80x+18eoUCqAB/XSzYiGxYpcUP42NmOxn5m+8xiUDrWzFa
 MlTv0ay9WH/dObQJY+S+fWEuljS7Hke5lboZibTvhTQYrgxzQwrlTsqNfg40V/LLxX
 bP/+1SxYJjC53+b7zCElOHf70OJKbThcU2zbCaOA++WMChz9oEK2ilUL/7Pgmeb+dX
 JynHdjb8pxRfdI2zsEmKhdb+qmfzg/D9eRfzWznFDYRrkpqDcZAs1Z6wwiGTbT5Fy2
 xVr2f2CXcSYCIF8yEQd2hLDas1NdRoMV9hZB7dOMlDABIJ/bP2hn7+mtRobCB0V7dF
 9/VtCXzRCw/CQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=VWT4Asce
Subject: [Buildroot] [PATCH v3 15/21] toolchain/Config.in: add
 BR2_TOOLCHAIN_GCC_AT_LEAST_16 blind option
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Tudor Holton <buildroot@tudorholton.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In order to add gcc 16 support in follow-up commits, introduce
BR2_TOOLCHAIN_GCC_AT_LEAST_16 symbol.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 toolchain/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 910cd103dc..5aa6cf8f6d 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -848,10 +848,15 @@ config BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	bool
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 
+config BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	bool
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_GCC_AT_LEAST
 	string
+	default "16"	if BR2_TOOLCHAIN_GCC_AT_LEAST_16
 	default "15"	if BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	default "14"	if BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	default "13"	if BR2_TOOLCHAIN_GCC_AT_LEAST_13
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
