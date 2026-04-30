Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF88EFF8873
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 16:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B288884E3E;
	Thu, 30 Apr 2026 16:23:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gy8U1vrKblJO; Thu, 30 Apr 2026 16:23:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFFB584E36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777566190;
	bh=WxKJ9zQunOfiJr+VstLsc8BP2XUhPoF81hhnjvV1nfE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cSs6HlcPa5fEL/k4B+veyOxzPH1992l/o00XWivAdGm9/Z24z3jCLDw0niXFOFCaC
	 IYyMLCwSFW3vFeUbrSt34zxParnCWbY18vBJAGiMJbv092S1QC1CgqkSQJGS/nvEhg
	 Ys2bLWbKRdlzX2Qjs5HIeA41Khp//kTxL36RlHYnS/CZwkG42SBnIObQ6c9rBRFq+e
	 8zys4MJs6Z/sDVIQAr6ivSt7/d3IJuRBI9KGfh8peor+bRXTZz0pok87bgGiRA0tCq
	 6XKJ7fyES9B1IEsENRs0AKOXAJqCHjZVCY7Oh338YK7dIaEWd9NSVIfpOvMbV6ekE5
	 mXoT43C5PNnXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFFB584E36;
	Thu, 30 Apr 2026 16:23:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1910918E
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 16:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B42942B35
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 16:23:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 41TEouB96-WT for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 16:23:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BF70542B43
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF70542B43
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF70542B43
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 16:23:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AF288A4C2CE5;
 Thu, 30 Apr 2026 18:22:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45580)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIU9F-000000004jw-3HXJ;
 Thu, 30 Apr 2026 16:21:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 18:21:52 +0200
Message-ID: <20260430162156.3456640-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260430162156.3456640-1-bernd@kuhls.net>
References: <20260430162156.3456640-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777566122;
 bh=uRVyEuXsoiJroTTC5Od+bzyC6BzvZdJHU3oYM0554qQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pYUx5EenFthI+A3EqOE/7rDE6rE2zVIS+QzRCx50Ymd4iiPKUWzBZKmoELaXDWrH0
 DlbrOkExAzO4/bg71ONRNG273wbfr7QquD+KP4evX7vmchpm1l96hmFcEkfmMuI09+
 sth6bvn/StiOAys5qFYgYjNYXwmUuzcVTn2TIqFhWsIXozmBFDz4E8w8XWWpcIw43g
 86ddTyl/CtgU/e/4qotYi9vUW9pUMXYEhIWGAedvWuO8vb78an4qYbfKAcqQM/gbJZ
 ItLWE3AjVBmRwJa29lRY7Or+o2h3A+Yl3E72dCyjBBMQe5gviak7GY7+7oM4ZH/Cq8
 Azv+aTgAUxAAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=pYUx5Een
Subject: [Buildroot] [PATCH 10/14]
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
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
