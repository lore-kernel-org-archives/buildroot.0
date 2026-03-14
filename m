Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FC310706DB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E41741111;
	Sat, 14 Mar 2026 14:17:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IuNhIjsToceh; Sat, 14 Mar 2026 14:17:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DDF94109E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497860;
	bh=cae2q88+D8K7Vf2feL4X5EbZ+oYTXI9PMTeXQo8J6C0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=fdsIFUSQiQOHNdrKZIhy5Vr8MAWUpC2MQfSNY/6miSmF8Ik97I38LQJm87txFNESx
	 4I7+c5PRh+zKsFqIAp67q6RJgoUj1alwa5zMdQioKJyDoBwtT3FsJp5RWSjVYvdL4x
	 QOCqwJA762PEgLzVzSboj6vTHylaw21hj/w/4VH+0KVN3OokRTnS4n3/GvoK4APn8j
	 DZBc0q80fREd2zale4eIjmv9Gl72JcMHPifNL4Drt6OngxaIcZKrGIDs9JAngKfMWQ
	 14JruVZVZDO4n0GxmW+xWU2p6h3WLgiMF4suv1sk9z7rYnNwizdDSn3CSBfKyZDCEI
	 Rsal/V7jCEygA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DDF94109E;
	Sat, 14 Mar 2026 14:17:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DED571B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C49BC4109B
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:17:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lv75ITwPEh-e for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:17:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BF1D64108E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF1D64108E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF1D64108E
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:17:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EB683A4C17A6;
 Sat, 14 Mar 2026 15:06:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdS-000000003UM-0dUu;
 Sat, 14 Mar 2026 14:06:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:09 +0100
Message-ID: <20260314140633.2967249-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497219;
 bh=9UxxeqFV4J+FwV/LXZDtc/7kS9uJ2+g3vTu/y1GMAhE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=qZbplQe6FF5rdYLFEiJgXQrHjV/kO67jW/QAPcKTZOhAA+O8EoSqXcWonHe/yq2KX
 SE8oyb9waa1460gKboo36LNcJO6t7H0wwTyNdSa9H67ctW28I77tTW9acEX8Lvegd0
 gZ5AhIgrfhuhh/TkQv2PC12TlHOu8N9lByXMPXSI7Eav8ft2kdNnxKf7nfwtGL0vzy
 pG69MOJnyBjT09UKKh6HhVFm1hjiWQ3/OR0S1uVwWVbo0WXJSvbjOsGEq+AWhx8H2o
 A4HbbqdqSuKEOx7ots1tSIiqExDoEEMpAzz9Ld5O2a+NzI5BkR8HlpJMz3c6TNWNR0
 KoQuhJZvzgiJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=qZbplQe6
Subject: [Buildroot] [PATCH 13/96] package/python-cssselect2: bump version
 to 0.9.0
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

https://github.com/Kozea/cssselect2/releases/tag/0.9.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-cssselect2/python-cssselect2.hash | 4 ++--
 package/python-cssselect2/python-cssselect2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cssselect2/python-cssselect2.hash b/package/python-cssselect2/python-cssselect2.hash
index 214be0a5fb..65319e4ac8 100644
--- a/package/python-cssselect2/python-cssselect2.hash
+++ b/package/python-cssselect2/python-cssselect2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssselect2/json
-md5  45b5f89f2934fbcb52490483367c3997  cssselect2-0.8.0.tar.gz
-sha256  7674ffb954a3b46162392aee2a3a0aedb2e14ecf99fcc28644900f4e6e3e9d3a  cssselect2-0.8.0.tar.gz
+md5  2aa3610000b7aeabe8da9cad3c390078  cssselect2-0.9.0.tar.gz
+sha256  759aa22c216326356f65e62e791d66160a0f9c91d1424e8d8adc5e74dddfc6fb  cssselect2-0.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6fd97229a1d1b0f6a8b41e109f413426dbc0874b1e03746d66cc33282601c2c2  LICENSE
diff --git a/package/python-cssselect2/python-cssselect2.mk b/package/python-cssselect2/python-cssselect2.mk
index 7a4e2a2342..3644bdca18 100644
--- a/package/python-cssselect2/python-cssselect2.mk
+++ b/package/python-cssselect2/python-cssselect2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CSSSELECT2_VERSION = 0.8.0
+PYTHON_CSSSELECT2_VERSION = 0.9.0
 PYTHON_CSSSELECT2_SOURCE = cssselect2-$(PYTHON_CSSSELECT2_VERSION).tar.gz
-PYTHON_CSSSELECT2_SITE = https://files.pythonhosted.org/packages/9f/86/fd7f58fc498b3166f3a7e8e0cddb6e620fe1da35b02248b1bd59e95dbaaa
+PYTHON_CSSSELECT2_SITE = https://files.pythonhosted.org/packages/e0/20/92eaa6b0aec7189fa4b75c890640e076e9e793095721db69c5c81142c2e1
 PYTHON_CSSSELECT2_SETUP_TYPE = flit
 PYTHON_CSSSELECT2_LICENSE = BSD-3-Clause
 PYTHON_CSSSELECT2_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
