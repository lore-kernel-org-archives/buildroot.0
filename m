Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217BEE66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA3DE80DA8;
	Sun, 21 Dec 2025 22:36:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s6sD2P3foeQE; Sun, 21 Dec 2025 22:36:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3244F80CBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766356571;
	bh=NjlH4AFESyVowNbTlSwoPxr38TP1lDmSUpCh+8epjYM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PO81HRi4hVA+oCaO2PoD3fH005diPsXR/WbfWcFZwsEvDisLdhkofEcojGL4gRhwR
	 AY97lbIJCgfJsC430EOP+UWJze2CZeM1jO4neukb1h32it6ymgJNSb6nHIbRIGC4Qb
	 i9IQ47mhdj0cjuBpVtEBg9brxDmYQBE7xEfiiofyPW6gC0y9DchJ1saHnKWueEvVg4
	 3MCpRAknIfnGKLznKdBzcBIuqXXjAkznTZv24oOz7ut4zoJ44MX2VEoypcz5MwRqws
	 9XF9SPseTO4hFvbGr8G/AluPRKdCGqYvUpNOWUDPBC8uKdBdLK82kCZ3NLgJrwBS/W
	 AzVAdhqJ9MbnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3244F80CBF;
	Sun, 21 Dec 2025 22:36:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B89EB119
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F06A40338
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:36:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hni2a_IDJjDv for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:36:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 94CBC40310
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94CBC40310
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94CBC40310
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:36:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CFA48A4C4E27;
 Sun, 21 Dec 2025 23:35:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60652)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXS0f-000000005pH-3krl;
 Sun, 21 Dec 2025 22:34:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:34:27 +0100
Message-ID: <20251221223441.185169-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221223441.185169-1-bernd@kuhls.net>
References: <20251221223441.185169-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766356503;
 bh=GL9adytMcVqMQNT9KdPnHFE6e8tzVx8sdC+n1q4dgto=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ohPx2kKqP0QOlre1IeOYd+7hS9LFh6VayUC2klgIGXC5ZFpP1+9vYWvmqi9N6UvcV
 DM22VF0xjruocTV0rpfA+t8XbMvpZT0TElcgqM/UqvhrzZPB+v9xwZ9vaJWtaUuapw
 N0Vn2R05y/FvX9e/771J4LAPS598C4GPHi/3YYKmZfHUw+pc70jGZ20A8qv6Ngq0z9
 TCyCdK+4xDOnxnT6CqS9LhUWtlm7v5vaYNm+obMaAwHlbhhJENGw8H03bEMnlFhiSp
 8FTQN++2SBCMGFzgSy3GKokFME7dlwhkoYV1uJ/MyxYYzxuxEnksIa+R0PfOvL5zYi
 0ze6E6PQ5P6Qw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ohPx2kKq
Subject: [Buildroot] [PATCH v2 09/23] package/python-iniparse: update
 tarball URL
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-iniparse/python-iniparse.hash | 5 ++---
 package/python-iniparse/python-iniparse.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/python-iniparse/python-iniparse.hash b/package/python-iniparse/python-iniparse.hash
index afcfcd2ffb..747d403965 100644
--- a/package/python-iniparse/python-iniparse.hash
+++ b/package/python-iniparse/python-iniparse.hash
@@ -1,7 +1,6 @@
-# From https://pypi.org/project/iniparse/#copy-hash-modal-5fdd923b-0592-4d2d-8b49-03472f948290
+# md5, sha256 from https://pypi.org/pypi/iniparse/json
 md5  2054bab923df21107652d009f2373789  iniparse-0.5.tar.gz
 sha256  932e5239d526e7acb504017bb707be67019ac428a6932368e6851691093aa842  iniparse-0.5.tar.gz
-
-# sha256 locally computed
+# Locally computed sha256 checksums
 sha256  ff45637d8a96adc414179e502fbed40160e57205bf2e302140e79a0c71eceaa7  LICENSE
 sha256  9b02e3dfe433ccd2bd94636ef6eb08638b5a54deafe5f87a3d9d9104356c48e0  LICENSE-PSF
diff --git a/package/python-iniparse/python-iniparse.mk b/package/python-iniparse/python-iniparse.mk
index 9f00cf7387..05c9b3930f 100644
--- a/package/python-iniparse/python-iniparse.mk
+++ b/package/python-iniparse/python-iniparse.mk
@@ -6,7 +6,7 @@
 
 PYTHON_INIPARSE_VERSION = 0.5
 PYTHON_INIPARSE_SOURCE = iniparse-$(PYTHON_INIPARSE_VERSION).tar.gz
-PYTHON_INIPARSE_SITE = https://pypi.python.org/packages/source/i/iniparse
+PYTHON_INIPARSE_SITE = https://files.pythonhosted.org/packages/4c/9a/02beaf11fc9ea7829d3a9041536934cd03990e09c359724f99ee6bd2b41b
 PYTHON_INIPARSE_LICENSE = Python-2.0, MIT
 PYTHON_INIPARSE_LICENSE_FILES = LICENSE-PSF LICENSE
 PYTHON_INIPARSE_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
