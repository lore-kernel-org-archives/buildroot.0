Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FACCC6B1D
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 15:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBEAA60705;
	Wed, 14 Oct 2026 15:35:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lz9wPtarVX82; Wed, 14 Oct 2026 15:35:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DC5EE607C3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791992139;
	b=c/MDo23KfEXLNdDTZTQjdeAeMV+PHmtoe6/dNuc8SQuYhVZCwnWg7jHvLE8rsrQIK3xI
	 sYnUq0dX5oBp+Rm0u4I02dnUD4vYw65P2NRxdwpNEb081O9RCo9CV1YCyg7OTleYFqcuP
	 PQ0JYvJPRIrai10Yrn6181VaRfr7SIkKrr1I52QDNnHCa8lGcIMmyDl3zAAyo7CtmSKXS
	 GEYRg3ppwLlgagYmg8b2z4M7PBcIRCz9fuPPW0iWWyhwygLtRgFM9jHgGpJNcPrasArPH
	 WJBSVnAnHs+d0IzPCbtciSYTTiFTITOg+pREe2050MXPOovdoCnUCUHxJEHcghcJv5g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791992139;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EKIyWjSwL1kLM3hL2cIxY8Npu8Fcz2JGWCpwZSxOcV4=;
	b=sVVbe8IfPAZjUfVl8drcgT7eYCaIXmC/TqvcGaAaryyyDk6T8ka/1z7J/vAg2WC8IkDU
	 ivFDKLF/BHrMXClQHxJsfOjh/2E5PmrMbh15qjuw0daXsmPj3oL1yB6uf2iajmai+t0ym
	 cTnuYWwlBw5u1W2PaDNk++5dPXzOHpYu+Ycetd8JzCAGn2fkk83PyXy1OY/XmxGnZ15YC
	 8pBC93afq/LLbiISFDpUJercK1J98qK7rFD+p6awj4sMre4Yky7+0WZb0ZgRfKKueRCE2
	 6r5SubDxCqZAc6/GyO2+68iqjT4yyhiQrPZuVScIxJDdAuC+oWgargg7WxHNwnFclcw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791992138;
	bh=EKIyWjSwL1kLM3hL2cIxY8Npu8Fcz2JGWCpwZSxOcV4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Yk7xPLqWn1B2tC4DXx/jOUExvoveZeyefWNDayHdM/dGi878m+evDM5rCGA10I9u0
	 iIkXWfNd40siL5URHpZD0X6GmP0EQsj726+779z7QpISyo/tnSbLtMgeE4CrklRrFa
	 CfeF7SzyEsdllYP6k800wMHYqPpi+eu/q3sLjfUu4V/yFXeXQIMJcv2Nm0Utzy3s53
	 0EJ62yN4j8L7Mp6ZdYbZqjCM9YDH37pjJNy5C2qfVGJ7QEZrBLKaTKb/BfJmxmIWlO
	 fxQQET3Y7f9/TaT9hx0ckf1SQFBCJmNC+rfsdkH8HExlIKAPgTpPltWrHyItw5YAyu
	 MYLviM+UpgtyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC5EE607C3;
	Wed, 14 Oct 2026 15:35:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 009F92AC
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 15:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAAC6607C3
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 15:35:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SEUe_LExngrp for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 15:35:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E0F3660705
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791992136;
 b=NhB/hmau7G9DpjMWlLWJBGe8AFmMBVbvLGg9ssPf+CgA6lrucCeQmzFX79dHy7hQiNZG
 Y4iEp9rb0VctCmC4xouhqafDyMB36ETIxELB+RpAlmwTlBiIIop0udk6etjTQOYKrHTm2
 6WxsMcYkzDuu8QzncV03yKH58x5tRIskalaB+DzacggNsfRYgPqZ7VcCpAuKoqkuaYVzM
 Quvykb0yZCiBO6B8lyRdRMV1P6fBoMLhCKkIqqVZjqoE51bkg3XBY4n62KcJTT16BfMcg
 OjwT5/xkebQobckdMYdGPfmdFnWhM3nerXV/4yZejDqL6gUkYxs0rODpfiryFXwKfhQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791992136;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=sFgm9NPRi3/dWGPrRSLCuiM80ICcWt9jEF156uvUJqw=;
 b=L2R3H4b8zv/QuffB0kk1Mr84++mCeUUqVRL/z4v605AeHa5RzkR/Gx9keYS5BrJKoct7
 bZ/cUuLsMDTuGlPTHeDMhjZo2itiW5pg4lf/j9y5HMLlFTLxTS1e25uM6VyscBV80yxi3
 YkgFKUzVbfgVm0+en7PbL9lPZs9B+BzE5xz2FxanMT6qODVNV3PBUxwAkHkZgr0XUFBBa
 9+E5dF+x6jmiq4G/heet37n99xD5RTijJPLHevK7PpQHfgTAydBYrrQdnwJw1zKJKtzj6
 3DA8hmaOod94mwxKnisfw+NIOqTbshVSKjJMel7MNJfgjRPM/sAxET9RLxBM3cUWHfQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmx.net;
 dkim=pass header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=F9X5vf8C; 
 arc=none smtp.remote-ip=212.227.15.19
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0F3660705
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 15:35:34 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mnps0-1ws7jf2ckE-00heGn; Wed, 14
 Oct 2026 17:35:29 +0200
To: buildroot@buildroot.org
Date: Wed, 14 Oct 2026 17:35:26 +0200
Message-ID: <20261014153526.1672168-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:HwGSRXYM6iCt+pRCwBU5/GXlxw6vG9eTZThnMPulN0o6DdZVNUV
 H2gU0x6obj5dskY4r33vX41HWRaqUtmcPSJb7iSAy8NCIs2LmCejL/srWbHOmDsN5MmEp/W
 892CKdu04YmmA/ff+hWMmBOrbmwiw56B+HRH2fX1mBvr8Vpeyie7e01dgD0gDMhbJ5DhUGC
 5TWVYVTudZbWQtfaLaW9Q==
UI-OutboundReport: notjunk:1;M01:P0:Ev3uva0QozY=;k8DTLhiYcX5I3gCE7o2UVRo27/U
 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
 bP+jkVmkmURimAyzTjXd0QD7sVLiw=
Subject: [Buildroot] [PATCH v1] package/libcurl: security bump version to
 8.23.0
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- bump to version 8.23.0 (for details see [1], [2])
- drop '--enable-smb'/'--disable-smb' as smb support is gone (see [1])

[1] https://curl.se/changes.html
[2] https://daniel.haxx.se/blog/2026/10/14/curl-8-23-0/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libcurl/libcurl.hash | 6 +++---
 package/libcurl/libcurl.mk   | 4 +---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 0a7b9e0169..086f3d8978 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,7 +1,7 @@
-# From https://github.com/curl/curl/releases/tag/curl-8_22_0
+# From https://github.com/curl/curl/releases/tag/curl-8_23_0
 # after checking pgp signature:
-# https://curl.se/download/curl-8.22.0.tar.xz.asc
+# https://curl.se/download/curl-8.23.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  f7ef3ae8a22e521f289803fe93543eb64c329b58aa73a9e224dfd915a2a5f4f7  curl-8.22.0.tar.xz
+sha256  8dadd7d2536a314f982ad05a651b713f426bf7d02cc2c76cffb9796f2218e6c5  curl-8.23.0.tar.xz
 # Locally computed
 sha256  82f2f4427d6545ee5aaac4f0b80428da6cc8ba41c2cf5da3a03680ec327b9681  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index c3590a8a9e..00f718fbec 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.22.0
+LIBCURL_VERSION = 8.23.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
@@ -161,7 +161,6 @@ LIBCURL_CONF_OPTS += \
 	--enable-imap \
 	--enable-pop3 \
 	--enable-rtsp \
-	--enable-smb \
 	--enable-smtp \
 	--enable-telnet \
 	--enable-tftp
@@ -172,7 +171,6 @@ LIBCURL_CONF_OPTS += \
 	--disable-imap \
 	--disable-pop3 \
 	--disable-rtsp \
-	--disable-smb \
 	--disable-smtp \
 	--disable-telnet \
 	--disable-tftp
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
