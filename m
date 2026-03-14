Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A64010706DF
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D99624178C;
	Sat, 14 Mar 2026 14:25:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2HH99DW2b79l; Sat, 14 Mar 2026 14:25:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EE7C417B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773498319;
	bh=1OrakVMLRK1FAhuGlT0ks6JydHfO0DSai/ZAwSqD4UI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oQarRq/xlSFiRlu256VnSkl9dqHuuWwZj+YC+TZ7AdEs72iezMjgQktl7FvhXaKy3
	 K2TYk+AqSwZ7uaacfG43ke28hj0HWpjLIuAtaza/RFJtT8EPYa/xN9Kt8lQgbemBVW
	 v5y8QMPfGbxuUYYmAmLF5Vz+P2ou9HErrYyyTKkK0zl3iqvynpFvNo0hVsmCNvJSAI
	 e1M4xfsXhjsecoJutkmxnAi2SJ27LiyEeIb5K+V09hb3CnGtmvNFceJLMqnIQUGiEE
	 Alzoe4EvD0XuZK6fGZcpf3zj8erhgShzymMad2/lSQCqJC/XLtQA+vSoodBsrKi7jG
	 0hgaaia6CyOKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EE7C417B3;
	Sat, 14 Mar 2026 14:25:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F00E201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 707474178C
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:25:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F4o3sZWQ8dV3 for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:25:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 38C9041775
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38C9041775
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38C9041775
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:25:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E7131A4C1D56;
 Sat, 14 Mar 2026 15:07:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdV-000000003UM-1qmJ;
 Sat, 14 Mar 2026 14:06:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:46 +0100
Message-ID: <20260314140633.2967249-50-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497226;
 bh=ZAdYqOsOCwypP2YVoUdAu62AjLkaqqZS+W3y3O9jrr0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=DTybbyW777e6EuY7F0mr11ECU4owrOi7n2GPdqJMLbpuT0l8IfWNryYRXPJXSx39u
 lkbol3DlMZETUUh/U8I9NWXatZX4rkHUfw5j+chSUFqq+/ZeA6KNUdCNOWWHic63vA
 Ej7cH03tSBCIU90iHIpMSLGebRNJZpODwwDhzAlPQ7eDmfpFa3EpFr8zRxgwRdB8SM
 wtSNS7uSILexKAd69V9VtlEEwHD3jRGpVHKrjusGgS1dq4e0GX5M1WDens6N5X1O3q
 zKQX/T6n8lvthHwn/la9U4hh1EnqUNNdUkDIDTVdDVCAufzA047KP9ud2E+XTPC6rG
 LO0/79AT3MRtw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=DTybbyW7
Subject: [Buildroot] [PATCH 50/96] package/python-pycparser: bump version to
 3.0
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Ralf Dragon <hypnotoad@lindra.de>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Mauro Condarelli <mc5686@mclink.it>, Heiko Thiery <heiko.thiery@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Joseph Kogut <joseph.kogut@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Lionel Flandrin <lionel@svkt.org>, Fiona Klute <fiona.klute@gmx.de>,
 Colin Foster <colin.foster@in-advantage.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/eliben/pycparser/releases/tag/release_v3.00

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pycparser/python-pycparser.hash | 4 ++--
 package/python-pycparser/python-pycparser.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycparser/python-pycparser.hash b/package/python-pycparser/python-pycparser.hash
index b93c6ac906..b8a15b5e0a 100644
--- a/package/python-pycparser/python-pycparser.hash
+++ b/package/python-pycparser/python-pycparser.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycparser/json
-md5  bb4946a7b0d83569f5d29f566a55180a  pycparser-2.23.tar.gz
-sha256  78816d4f24add8f10a06d6f05b4d424ad9e96cfebf68a4ddc99c65c0720d00c2  pycparser-2.23.tar.gz
+md5  56f3a0a82595b0cb04976cc0d3271a27  pycparser-3.0.tar.gz
+sha256  600f49d217304a5902ac3c37e1281c9fe94e4d0489de643a9504c5cdfdfc6b29  pycparser-3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0c846399369ea76ddd7b5c44fe6d16497415fcf015f5cbb508c24bf98b81c5b1  LICENSE
diff --git a/package/python-pycparser/python-pycparser.mk b/package/python-pycparser/python-pycparser.mk
index 7194347e78..68b7a1f143 100644
--- a/package/python-pycparser/python-pycparser.mk
+++ b/package/python-pycparser/python-pycparser.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCPARSER_VERSION = 2.23
+PYTHON_PYCPARSER_VERSION = 3.0
 PYTHON_PYCPARSER_SOURCE = pycparser-$(PYTHON_PYCPARSER_VERSION).tar.gz
-PYTHON_PYCPARSER_SITE = https://files.pythonhosted.org/packages/fe/cf/d2d3b9f5699fb1e4615c8e32ff220203e43b248e1dfcc6736ad9057731ca
+PYTHON_PYCPARSER_SITE = https://files.pythonhosted.org/packages/1b/7d/92392ff7815c21062bea51aa7b87d45576f649f16458d78b7cf94b9ab2e6
 PYTHON_PYCPARSER_SETUP_TYPE = setuptools
 PYTHON_PYCPARSER_LICENSE = BSD-3-Clause
 PYTHON_PYCPARSER_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
