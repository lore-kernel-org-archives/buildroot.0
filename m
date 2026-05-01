Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE399FF8864
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 06:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87F1285518;
	Fri,  1 May 2026 06:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_WCyvE8Zz_Z; Fri,  1 May 2026 06:26:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8B2A854E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777616806;
	bh=WxKJ9zQunOfiJr+VstLsc8BP2XUhPoF81hhnjvV1nfE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QWg14GxZiIuGBC4xdwZzPs/QAx6f8NwqDSH0Uxzc0r3HzxqDUyuSGoa9d060NLxlW
	 PHl1vV1sltrf/yaVv+aPtjX+Mq1D3Kjfi71946dbJhg8DbTiItXy9CmVkawhsaB3xj
	 GnPIP8ZuJGtMH8RC2X+HoVfsN2CzTcm1AtX1zvQW0HU+I1oejEQsaU+w892QYlgEts
	 gDQ3l8gA25274uMKjAXJP4e99ueMBnkKg0mHM8hxDxiw5e8iH2sQStJWPnW7L6TC23
	 BvMvZDsvg34oiHQnFSV6eD3Bbf0xfvl+hz2CzdiLwwRtCUnXeQ9JSmr+IQr8uT2L9w
	 FhHh1PvZ6PQhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8B2A854E6;
	Fri,  1 May 2026 06:26:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 47A66204
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DB8F40151
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L-YmZLjJ7NjU for <buildroot@buildroot.org>;
 Fri,  1 May 2026 06:26:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 257814006A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 257814006A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 257814006A
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:26:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 35261A4C2CA3;
 Fri,  1 May 2026 08:23:29 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38120)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIhHU-000000007tD-03yI;
 Fri, 01 May 2026 06:23:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 08:23:10 +0200
Message-ID: <20260501062316.1942112-18-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501062316.1942112-1-bernd@kuhls.net>
References: <20260501062316.1942112-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777616609;
 bh=uRVyEuXsoiJroTTC5Od+bzyC6BzvZdJHU3oYM0554qQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Lsi0+SP0SfROMo/MxRRM8enSVF3otMNnqyr6kGxg69xQgRuwhFrpuNQnIYixBV5QB
 8DHKbTkXJWYkRKDP433ssroapWackavLtqme7Cq3d/XbrcaME8Hl0LFKtcF7JoELNC
 WROjfE1vFsPaaF9xWbXkydeaUPNGl9DddO0UROfdwJUrU9Emcya1m//sEUtZ56/DDh
 qS64gcrd//52OALV+G/pJ8ksQt0rs9ybI2NO8fYbC38qqZdpgah6+na7ofl8L6/Atm
 +C4ie3dVR0SMhxbJjqlPkCpeUZKid1co11t52vW/+JqtDE/St44kaSyTnyvUr626nm
 HluiF8e7osZ8w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Lsi0+SP0
Subject: [Buildroot] [PATCH v3 17/21]
 toolchain/toolchain-external/toolchain-external-custom: add gcc 16 version
 selection
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

This patch allows to use an external toolchain based on gcc 16.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../toolchain-external-custom/Config.in.options              | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 9ca024f5b8..f69e09ecf0 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -46,6 +46,11 @@ choice
 	  Set to the gcc version that is used by your external
 	  toolchain.
 
+config BR2_TOOLCHAIN_EXTERNAL_GCC_16
+	bool "16.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+
 config BR2_TOOLCHAIN_EXTERNAL_GCC_15
 	bool "15.x"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
