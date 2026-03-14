Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1319D10706DE
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD55540AC8;
	Sat, 14 Mar 2026 14:22:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8zdONvi2LAzH; Sat, 14 Mar 2026 14:22:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BAEA40ACB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773498125;
	bh=C/YDuvgRzngl2g+ETBMFVI1VqLBL/YoaDBDku3qdi/Y=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=q83parJQcHkwKvsLFVXUzLk/B/zGIqQ+UDwRfkKMAzu4XMm7hrjTEOndTsjMRoTFS
	 6UZvN+2EDzLkURXmXxNBFkdLDZ3+KA641FTBHWhStfrrZuPMhUPd2v50ktNYBGlB4g
	 hjZ8hDTkBhQLZxn0l7xGm5nIFMeDxlATRAWCpsdzzFoWvm3AHIcTxJmdYkhstQ94eq
	 80lyqwzXO2HWdyfN27wvo1L52ZesWYDPEQGjISRJifFzZIiaa2XUufUMJYmZ5rvwJn
	 Weq79ZBDuzhmep0A4gSaNmVeINjQvoT7aT9L+H8+S9Gg0OMiVf6DPdn1/Qysoi/5zc
	 rQrsYEHHmqOrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BAEA40ACB;
	Sat, 14 Mar 2026 14:22:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CD32F201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF0B880ACC
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dd5YKdD7XlRL for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:22:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A4D0E80ACA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4D0E80ACA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4D0E80ACA
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:22:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5EC92A4C1A1E;
 Sat, 14 Mar 2026 15:07:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdU-000000003UM-0A6Z;
 Sat, 14 Mar 2026 14:06:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:30 +0100
Message-ID: <20260314140633.2967249-34-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497224;
 bh=8+VNa/eH72daAh8iKE+/4LQK6/1O+S0r73fWi6CxSpc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=LGQXXYc9l2b3qOYN3zv5kKVIXJEP2cFunpNGATlr8daEANJ5g7DrkA4TreDPHVTOB
 cuJMtItpIGO6dWD1iGJU4Ppl0jFuTCOxtKm3ICMLLaqPxkSVLpX0UVy9sYECNBEbTG
 TjNTEeQBqTFVmArrD+evmQDtmURE25ZeDxnkvfaRkgUxEWvpIeSN+GkZUIqjsexgE9
 A7fSqqsGW/JqOFHuu9AbQgO1eO6foMew9DLXZgpO6bIoCM9l3Y+Wm/W07c9TM+vFEC
 zCqzyhlFEaJCXnTkDathnIqx2VUCfMXZQUQIvoEdJkBayMIjQWNReuNV/7h/V5GFiW
 wye1mShCXQmWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=LGQXXYc9
Subject: [Buildroot] [PATCH 34/96] package/python-marshmallow: bump version
 to 4.2.2
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

https://github.com/marshmallow-code/marshmallow/blob/4.2.2/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-marshmallow/python-marshmallow.hash | 4 ++--
 package/python-marshmallow/python-marshmallow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-marshmallow/python-marshmallow.hash b/package/python-marshmallow/python-marshmallow.hash
index bce3e58f6e..56bc15bfa2 100644
--- a/package/python-marshmallow/python-marshmallow.hash
+++ b/package/python-marshmallow/python-marshmallow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/marshmallow/json
-md5  09036899f9ccc33eafc5c7d7040952d2  marshmallow-4.2.0.tar.gz
-sha256  908acabd5aa14741419d3678d3296bda6abe28a167b7dcd05969ceb8256943ac  marshmallow-4.2.0.tar.gz
+md5  d3f861e4957521a6a15eb906194deb70  marshmallow-4.2.2.tar.gz
+sha256  ba40340683a2d1c15103647994ff2f6bc2c8c80da01904cbe5d96ee4baa78d9f  marshmallow-4.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  906b5d9051e426144cb173ad911667b8ebd05a9c584c2c26c135b32a3ed12001  LICENSE
 sha256  f982e6fd97ba00973e94605b972ff04894b22c4fa937b868828b32ae8f0a7c2e  docs/license.rst
diff --git a/package/python-marshmallow/python-marshmallow.mk b/package/python-marshmallow/python-marshmallow.mk
index d748774246..5e86821d0a 100644
--- a/package/python-marshmallow/python-marshmallow.mk
+++ b/package/python-marshmallow/python-marshmallow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARSHMALLOW_VERSION = 4.2.0
+PYTHON_MARSHMALLOW_VERSION = 4.2.2
 PYTHON_MARSHMALLOW_SOURCE = marshmallow-$(PYTHON_MARSHMALLOW_VERSION).tar.gz
-PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/bc/34/55d47aab1ef03fb5aab96257a31acfc58791d274cf86c044e6e75e6d3bfe
+PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/f9/03/261af5efb3d3ce0e2db3fd1e11dc5a96b74a4fb76e488da1c845a8f12345
 PYTHON_MARSHMALLOW_SETUP_TYPE = flit
 PYTHON_MARSHMALLOW_LICENSE = MIT
 PYTHON_MARSHMALLOW_LICENSE_FILES = LICENSE docs/license.rst
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
