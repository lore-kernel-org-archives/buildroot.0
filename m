Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200C0CD13D3
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 16:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C194B84C32;
	Thu, 30 Apr 2026 16:22:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SxlE54-X1uuT; Thu, 30 Apr 2026 16:22:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D1C684E38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777566165;
	bh=EMWV8C2wSx3aKxgnHA40FrmAJB2MH/p4hJCOrkPF2rU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QAYDWHJr6+VfYg+kFmbJtBbRgoBL3oecs9ZfdaMMr7HlVUs4Ioabky+E7XXGRPB/Z
	 bIwpldw0cGRymj3kkiTB91990/MzONoWaJi7Hr6bdLJS/tK7qbviRXRNOKfipDmrBm
	 S1nAUvNtnHbbb0KrbH0IYW/hTLWTW2WsQ8mWhFoAB3ZjqBp9drWbB9iNVhpIvGj3Tq
	 1rUCSal2hs2BTKRJO9KAR9kx3W5CHkPjsCE8c6PqMlEWFoRpqzyoLYG7Xgj4wzpr15
	 251YKW1EGnNtt81n0goYEPnVlHkQpSVMI3sDdf88ufGJPzJ3HLSAiF5YFYXDMB7Ga7
	 oFEqBb9KxrBZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D1C684E38;
	Thu, 30 Apr 2026 16:22:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 03FE318F
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 16:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE303424E4
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 16:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G3p7QnD_QW2p for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 16:22:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DD0A740089
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD0A740089
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD0A740089
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 16:22:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9E2F0A4C2CDE;
 Thu, 30 Apr 2026 18:22:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45580)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIU9F-000000004jw-31dr;
 Thu, 30 Apr 2026 16:21:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 18:21:51 +0200
Message-ID: <20260430162156.3456640-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260430162156.3456640-1-bernd@kuhls.net>
References: <20260430162156.3456640-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777566122;
 bh=YInEGN7jDme+QbAv8Gp+YGScu3e4B0elA6ZvIbYSQLI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=lkkWrlyMrnljfdRoTxMc+xMEldvdVQdT+dpwyIg8fTCuYUtXgv00khOboztOFJJ55
 akpWzdUGfqFUTAcZ3dmaLn9DyRWMSWZKqi1Jbyfg2WKPXkEFX6KIgNnIrJSWRW/T99
 Ta3wcIXUY5AiKChiMkdY7Mr3c80RaY4YrvCb89yLoVviF1sUYRwXQCCnpUyXZYSZpr
 cquXuezw4ZAyuTIPkGg33oEEZH9Bof1yeLA/Tso9jYPOspPYnZEKXg+q4bs11KyR2/
 HsM2/EYp1mbLOJNgp8BNGXj95Y4a7QSucXo6It1s7RD9pIQUTMW+wlDpVd42Yt4/Xn
 QiIIabcVEb1CQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=lkkWrlyM
Subject: [Buildroot] [PATCH 09/14] arch/Config.in: introduce
 BR2_ARCH_NEEDS_GCC_AT_LEAST_17
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 arch/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index 624b5e9d21..863a1eed34 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -344,6 +344,10 @@ config BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	bool
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 
+config BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+
 # The following string values are defined by the individual
 # Config.in.$ARCH files
 config BR2_ARCH
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
