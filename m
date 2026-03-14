Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752AE10706DD
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DC57407C9;
	Sat, 14 Mar 2026 14:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VS4gMJ0Qtzx0; Sat, 14 Mar 2026 14:17:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B23D4087A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497836;
	bh=6jx73aI/XlpXbFqTysluaCApOeJtLYiyyfWdEIIxjEg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DmpaepSKlWLoCHGHKp8IBtP/7T3GO2fVeEIfA/9L2fYr4kpyOieHvBzPMRprpqxMJ
	 evbbmJ7yNakEz0aIK5L3cgt5MYYVToHD+nY6OSlBCDSHCOxU/o9yOIlJzVgOT1K4i3
	 EgM/v1c+VOrQPleM988wAvzgxis/r9zZ4H8kqaN+ld2lWJBuo7mf0dVo766mDY5Prz
	 w0BLhGnEFbTglsLVs07RTDMRDm/ms7y71n+IIRdYvOlRx49DGx/Nx1ZYITPl8RWyod
	 Y5reyJg+Esz4Gwe9EjWDUIK1b18eWInqGCRWofIdCN/gTLurufJ2U8u2oaiWgbYv6E
	 GKUK0Q2dGhZ1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B23D4087A;
	Sat, 14 Mar 2026 14:17:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EDB6B201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEF8260781
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u6Z2_xsdeaSe for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:17:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D178D60718
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D178D60718
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D178D60718
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:17:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 56C03A4C174B;
 Sat, 14 Mar 2026 15:06:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdR-000000003UM-42E9;
 Sat, 14 Mar 2026 14:06:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:07 +0100
Message-ID: <20260314140633.2967249-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497219;
 bh=Ql99xywe//gzhp7H/D9DoSwmknUjfRATnbRKLGKmbU0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=LGmtiNQQ9zwji/w0GSP3zp3s95oitG05L/fM0zqZTmmCp4vagRCEmhKLkEv8n3Mmf
 OGO0vPIZ6R93lQx19Qi5Lu1yR5R/8XQZs9jGpnQRDIMPdKlHj8E+PmIleKUmq1HbB3
 dOQVR704w4xOZ473sA5Lg6uUF8NFd8H9xUPzsumDeMvzKaUIACzkhI0sJqwR6NgISw
 E3TyttNfCTzyxhtrGY07DGxJKVupRwzrZNxtF6Xi8vBHfpdzxCKTChYf40gtFDq/Hv
 pukzaG25c8m7DXqTM1IxRl64umA6ke7ke0CI6RE6NFiAYl33fBh3DLwTFdvNcUZnG9
 lP+Tv8Mwpj97g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=LGmtiNQQ
Subject: [Buildroot] [PATCH 11/96] package/python-charset-normalizer: bump
 version to 3.4.5
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

https://github.com/jawah/charset_normalizer/blob/3.4.5/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../python-charset-normalizer/python-charset-normalizer.hash  | 4 ++--
 .../python-charset-normalizer/python-charset-normalizer.mk    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-charset-normalizer/python-charset-normalizer.hash b/package/python-charset-normalizer/python-charset-normalizer.hash
index dd10c11e73..1094f419a3 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.hash
+++ b/package/python-charset-normalizer/python-charset-normalizer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/charset-normalizer/json
-md5  3c73a3c5c05a896c1169d8b5298dc4e5  charset_normalizer-3.4.4.tar.gz
-sha256  94537985111c35f28720e43603b8e7b43a6ecfb2ce1d3058bbe955b73404e21a  charset_normalizer-3.4.4.tar.gz
+md5  cde800b3dada84f6041196f40f4b2ad1  charset_normalizer-3.4.5.tar.gz
+sha256  95adae7b6c42a6c5b5b559b1a99149f090a57128155daeea91732c8d970d8644  charset_normalizer-3.4.5.tar.gz
 # Locally computed sha256 checksums
 sha256  6d0d41bfe170ac6c7dc248c9a63e254d0fb45a60d50a8257d0af92c6e249b887  LICENSE
diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
index f793241a1e..ce91028b31 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.mk
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHARSET_NORMALIZER_VERSION = 3.4.4
+PYTHON_CHARSET_NORMALIZER_VERSION = 3.4.5
 PYTHON_CHARSET_NORMALIZER_SOURCE = charset_normalizer-$(PYTHON_CHARSET_NORMALIZER_VERSION).tar.gz
-PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/13/69/33ddede1939fdd074bce5434295f38fae7136463422fe4fd3e0e89b98062
+PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/1d/35/02daf95b9cd686320bb622eb148792655c9412dbb9b67abb5694e5910a24
 PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
 PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
 PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
