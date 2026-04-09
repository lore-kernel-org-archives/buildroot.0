Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9125E9DE6D
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 08:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D5BF41114;
	Thu,  9 Apr 2026 08:46:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j_ioN7GmlR7a; Thu,  9 Apr 2026 08:46:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1AA3410A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775724412;
	bh=8fafzs2zsUaIC+dhc3dOSFb1fdFtdf6m7aDhH9myV0A=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aMibNyM2nBnwVxcEg/O6pynuLVRi/UJtHDJEyexWIUg5huzsqlGzoNzGaKkd6yseD
	 xSTmHEzONmE+pwclz5R9khF+yWcjp5PQPNvD6raPz+jRLGmwhIgj8o2Gs1nr/H5Kyv
	 O3+9+gHLEH+uZRxTm243T34a10Pmi7cynMTsT4hZ9IXjGTzpCUzITk2duPLwxGcm9E
	 VlWe7x29baL/vfF548nYUfE1gcJ235aOr5XirUbtK6yOjVowBB7+cFQ/C4+Oyz5Pe9
	 5AstwTQJNj8P1cXaVZnXLOgT3JBC8LvYLwcSnQJcsHK7g9BUY+PbN/BaUOkJs+QKTG
	 dDwi0icPMYtAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1AA3410A8;
	Thu,  9 Apr 2026 08:46:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EAC34237
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0ED54022E
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:46:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vt0EixiRoqnl for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 08:46:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BAF5C400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAF5C400BA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BAF5C400BA
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:46:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca66.dip0.t-ipconnect.de [79.214.202.102])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3290CA4C0985;
 Thu,  9 Apr 2026 10:43:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35588)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wAkyk-000000004SH-0fga;
 Thu, 09 Apr 2026 08:43:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Cans <laurent.cans@gmail.com>, Mario Lang <mlang@blind.guru>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Phil Eichinger <phil.eichinger@gmail.com>
Date: Thu,  9 Apr 2026 10:43:01 +0200
Message-ID: <20260409084305.3960494-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409084305.3960494-1-bernd@kuhls.net>
References: <20260409084305.3960494-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775724200;
 bh=QtFarPK5zwyDrDklpd8wxVxhr9dCyb8actVRy2TX6fM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pTKbtZ3PHaM///n3vCdxvTsmM54DzzpKatDZ4njJ3E8EZo3tVgujrlpoLc9b9TDQK
 s14xHtNPIeRiZrOHeTQKam9eu9C/iJlppGFssu6GNSr150GuVYaqGYj+fZSEW4AIG6
 xQtM8n8TBiNyCYQh1ESFs7ku5E5I2cFJ3Y3Oojy12jTmsvC1dAllRQ04sg4SpyIgEO
 t0bUf4X9sO6Wk2vmFO/R6MXSOUauSY+ngLYMJ7QkwjFA1AmUcgsn1gEctumtyEbL6y
 x3PnyUh15hhICjicMumguQh3OEHn5GvWP3IL8PEW6e8WKAVW3I8NE01YqOHiv1bnAa
 ecwBZKvSdnoAQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=pTKbtZ3P
Subject: [Buildroot] [PATCH 17/20] package/postgis: switch to pcre2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream added additional and optional support for pcre2 in version
3.2.0:
https://github.com/postgis/postgis/commit/6cf2fba94a434e79d6526a6a5cfdb6057a91bff8
which was added to buildroot in 2021 with commit
5084994d3f6dce350de091cd813047e658b9363d.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgis/postgis.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index 42511536aa..0a55ee0e58 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -33,8 +33,8 @@ else
 POSTGIS_CONF_OPTS += --without-raster
 endif
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
-POSTGIS_DEPENDENCIES += pcre
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+POSTGIS_DEPENDENCIES += pcre2
 endif
 
 ifeq ($(BR2_PACKAGE_PROTOBUF_C),y)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
