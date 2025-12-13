Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3119AD5AE41
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 14:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F346040B6E;
	Sat, 13 Dec 2025 14:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mboIurdPGb7N; Sat, 13 Dec 2025 14:05:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1E0340A9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765634730;
	bh=2+yIUv2CYteNH1LgiSMN33c4/SoHzDAK0FwY4b40Xu0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=X/9q5ozCThnvD82pCeLnD00v9yluHm+NujONJ+dFbPkVG8p21fvsqcdpwxQCavg4X
	 ZthrekE2RrzWQQLZg79qnFxhljzF505QOSNOejiZ8rp1vivIcxYxcslya7Fm0I5+Py
	 SmqFMpcwpg5cnVJcr0tJjugoVm41fhSgnDo8ZDV/WRWPpjp7poALe8aDw/VHKlEKvL
	 pndo67hAGC67TUALpnTDqlAZijkRCOtFCIQ1oOEmwTOZ8LiUewUegjLBhNeuat28q+
	 kF5B43cLSx/EoXP8tnVjo9v7meYYN1r2H1b6abJuLnypgGvXG1zEE5je8FeE54T/xW
	 bgHWaIaJFSC7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1E0340A9E;
	Sat, 13 Dec 2025 14:05:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 391552C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F1D981261
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:05:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 86likD2z5Jea for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 14:05:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 647888125F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 647888125F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 647888125F
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:05:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D4190A4C35C7;
 Sat, 13 Dec 2025 15:05:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49778)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUQFO-000000004dt-1vLu;
 Sat, 13 Dec 2025 14:05:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 15:05:10 +0100
Message-ID: <20251213140522.1322763-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213140522.1322763-1-bernd@kuhls.net>
References: <20251213140522.1322763-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765634722;
 bh=2KkeQIu4GS+/Rulkn2Vz7xfc1nLDYLx+ZwpcUrPp2BM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=c244C0k9UTeOvfd+3QFJ8H7NkoeO09jlKniq0JQ+WuhCVP2qvzIQVSZiTmVE2C7cr
 U65tx6WpPiUsIjYbbD3sI4Jf3rbcBLSGbAs8D6wRp68zMlMTW+Eeeu8Htn/h29Rh0n
 ZIfqHCCXKFgesjuRShnwg7QKwkFxL5je2Pez6SD+Zr4MQxgACvak0HCS0GmnT4PE9E
 QRPy2kkuUJhl72DTv5KQy0v7bYNWrd5cmzw1IThMe9PHxdBhAFZytzrBMbga7XCF04
 wWHbomSGnKQg8V0tUfDvgwdrf/D4cXasSIthS6ZUJ47GlzZ4/qbj99qVDugNs2pJd7
 S4nNL3BH2Kipw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=c244C0k9
Subject: [Buildroot] [PATCH 02/14] package/python-jsonschema: bump version
 to 4.25.1
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/python-jsonschema/jsonschema/blob/v4.25.1/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-jsonschema/python-jsonschema.hash | 4 ++--
 package/python-jsonschema/python-jsonschema.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jsonschema/python-jsonschema.hash b/package/python-jsonschema/python-jsonschema.hash
index 79d64f4846..d35f8c383c 100644
--- a/package/python-jsonschema/python-jsonschema.hash
+++ b/package/python-jsonschema/python-jsonschema.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/jsonschema/json
-md5  a2cb5fee4da011118708ab275b34f30b  jsonschema-4.23.0.tar.gz
-sha256  d71497fef26351a33265337fa77ffeb82423f3ea21283cd9467bb03999266bc4  jsonschema-4.23.0.tar.gz
+md5  e33f133a5b56b9f9756b38065849c86f  jsonschema-4.25.1.tar.gz
+sha256  e4a9655ce0da0c0b67a085847e00a3a51449e1157f4f75e9fb5aa545e122eb85  jsonschema-4.25.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4f92a015a13c4d1a040bef018aa13430b4f1bc73b41b16bb846c346766de7439  COPYING
 sha256  837402bd25fad9b704265801ca3f92566a98157c1f9a7acd6f446299ba1c305a  json/LICENSE
diff --git a/package/python-jsonschema/python-jsonschema.mk b/package/python-jsonschema/python-jsonschema.mk
index 9f99628b5d..1407a414e0 100644
--- a/package/python-jsonschema/python-jsonschema.mk
+++ b/package/python-jsonschema/python-jsonschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JSONSCHEMA_VERSION = 4.23.0
+PYTHON_JSONSCHEMA_VERSION = 4.25.1
 PYTHON_JSONSCHEMA_SOURCE = jsonschema-$(PYTHON_JSONSCHEMA_VERSION).tar.gz
-PYTHON_JSONSCHEMA_SITE = https://files.pythonhosted.org/packages/38/2e/03362ee4034a4c917f697890ccd4aec0800ccf9ded7f511971c75451deec
+PYTHON_JSONSCHEMA_SITE = https://files.pythonhosted.org/packages/74/69/f7185de793a29082a9f3c7728268ffb31cb5095131a9c139a74078e27336
 PYTHON_JSONSCHEMA_SETUP_TYPE = hatch
 PYTHON_JSONSCHEMA_LICENSE = MIT
 PYTHON_JSONSCHEMA_LICENSE_FILES = COPYING json/LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
