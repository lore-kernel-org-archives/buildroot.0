Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F335BCCF9E3
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 21:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9F1D41559;
	Thu, 30 Oct 2025 21:42:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SkHJbsAeJaE7; Thu, 30 Oct 2025 21:42:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4018414B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4018414B5;
	Thu, 30 Oct 2025 21:42:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F1130160
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5B25414B5
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:42:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gtaq86MeQSIK for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 21:42:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D07A74143F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D07A74143F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D07A74143F
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:42:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cb2.dip0.t-ipconnect.de [91.58.12.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B9A62A4C5B3F
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 22:41:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41906)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vEaP6-000000004EC-2uUH
 for buildroot@buildroot.org; Thu, 30 Oct 2025 21:41:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 22:41:53 +0100
Message-ID: <20251030214156.1307743-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251030214156.1307743-1-bernd@kuhls.net>
References: <20251030214156.1307743-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761860516;
 bh=mnMujB8kndpbNvZcYhQpytAufedqdrLp3JWhJGtoMBs=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=LBd0fdfPxyTpr65GqQHNrHoVG0mZDk5MBgbbpXq+OKXnzARcFI7aADPhjGp+2KvVT
 Dmc6UTW0HbMV8cerofN92PWV/3QoRrbTH/gZ3WlN+rynJDTRQyqvATmrXQVjgv0lc8
 0nxhhEuHMUr2FGV4TdS89d1D63Lx5tZ0ibkNQzmlqpxsGalbKR/PLYtfXtSmJ6n+aO
 6+N4GoVI/METbmMS0JALY3+hVB6ihfJuXEguV6AgXWiLJJ4l4dBiBjtFSTnSBqDHZG
 AQjkt9v2MrQgzDodkv6j5WlX2eymBRynnuoOu8/73+4/Xlo0CZKPelxz5uiGYow+2F
 HwmFjj355Xwgw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=LBd0fdfP
Subject: [Buildroot] [PATCH 2/5] package/bind: drop unrecognized options
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

Buildroot commit c9515c8b63bc9bc84b52b731c2c72031acd240d2 bumped bind to
9.18.28 which removed dnssec-keymgr:
https://gitlab.isc.org/isc-projects/bind9/-/blob/v9.18.28/doc/notes/notes-9.18.0.rst?ref_type=tags&plain=1#L187

but forgot to remove the configure option --with-python
https://gitlab.isc.org/isc-projects/bind9/-/commit/98b3b93791777218c04a67ddaef22619162249f7
https://gitlab.isc.org/isc-projects/bind9/-/commit/305ca032a0d3afd779b2b97bb36971e1072f0453

Configure option --enable-epoll was also removed upstream in 9.18.16:
https://gitlab.isc.org/isc-projects/bind9/-/commit/6b6076c882a00028197b04a827f6cf8e7a5369de

Configure option --enable-backtrace was also removed upstream in 9.18.0:
https://gitlab.isc.org/isc-projects/bind9/-/commit/e847591867cfe542c9e52d6176e0a2bb6e2ca875

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/bind/bind.mk | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 11730b6e7e..d137245ef9 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -30,9 +30,7 @@ BIND_AUTORECONF = YES
 BIND_CONF_OPTS = \
 	--without-cmocka \
 	--without-lmdb \
-	--enable-epoll \
 	--disable-doh \
-	--disable-backtrace \
 	--disable-static \
 	--with-openssl=$(STAGING_DIR)/usr
 
@@ -95,14 +93,6 @@ else
 BIND_CONF_OPTS += --with-libxml2=no
 endif
 
-# Used by dnssec-keymgr
-ifeq ($(BR2_PACKAGE_PYTHON_PLY),y)
-BIND_DEPENDENCIES += host-python-ply
-BIND_CONF_OPTS += --with-python=$(HOST_DIR)/bin/python
-else
-BIND_CONF_OPTS += --with-python=no
-endif
-
 ifeq ($(BR2_PACKAGE_READLINE),y)
 BIND_DEPENDENCIES += readline
 else
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
