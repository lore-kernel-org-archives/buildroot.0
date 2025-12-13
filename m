Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C9CD5AE41
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 14:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2E6360859;
	Sat, 13 Dec 2025 14:06:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UsXwl1Ckvl15; Sat, 13 Dec 2025 14:06:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01B2E60862
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765634781;
	bh=Szkm5jwZ6adNg2NVOT9Vcrg64F4oVMs8G3iwfisVys0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Cg9Ie2RODMFJCsF7609D6KPhrIHgi42O20QsR+LmWbtVJ5DLdtM0dRLyq83cygeXB
	 uO5LQ353M0/TAFQfJd1oW0WNvhOGleNJiOE04fMKj6PQQT3M7OEsPfwkHHvIC2pqt4
	 JoSu/L/X3EcfHPAGkN7Q5Zt5EdZu/0o1WAc0bI4LwJR8bCX1CzgZJz6hvrgmzqBoaL
	 fpX9dNk5o8OdWtgsB93O/by3alL9lQcbSawk/W3UIbuC4Dp7Y815yXO3jPsJImaPTO
	 Th5iAHCFbo/+oXaqHtASAkzPIY0Oj9TgziUw681VyPfsGV6+VECM1dS6GK4LJElKw1
	 HFGQNFfwp35+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01B2E60862;
	Sat, 13 Dec 2025 14:06:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FFD413D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D95C40279
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:06:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WBvKgc4WC-Am for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 14:06:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3250340018
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3250340018
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3250340018
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:06:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8E734A4C4065;
 Sat, 13 Dec 2025 15:05:28 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49778)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUQFO-000000004dt-3YLD;
 Sat, 13 Dec 2025 14:05:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 15:05:16 +0100
Message-ID: <20251213140522.1322763-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213140522.1322763-1-bernd@kuhls.net>
References: <20251213140522.1322763-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765634728;
 bh=l4WLk1hLb40QpmeXHTo/Pww2+6tlDsi6alWYgtU4Nas=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hHZHslC7az5BSLcKpo+dqn6rRo5Q/ptZJ67SjIaD2hnJp5muO/5imOfkbWiOmcVet
 0S1d+dNGqdxh7YXZyEWEZ1TRV3Oli7lsxdu2fNXoZrpkXSW4VtMoeVhGfdcDmFNOJq
 Tsp1BgOj5kaYeLeohzIh3OUU1GaMiuBC8mlqpJZP0hDNoV4d2TKunzqoZW4ZIwFkh/
 +jMVHHvcVEmpci5sogBY8LApIO6wx2akdrGDpy5KURT4ZuEIdXEdArJORsRThC1Vd6
 9VjnLBJjmrF8QjR9WiQot2vwOAwFTGA/2YDuNgxrRybx1qiAnxy0UokjmN9sEpoD9Z
 3p6i3Nz80zZrQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=hHZHslC7
Subject: [Buildroot] [PATCH 08/14] package/python-matplotlib-inline: bump
 version to 0.2.1
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

Switched build system to flit:
https://github.com/ipython/matplotlib-inline/commit/d9002a8d3a706487a879b8260e30e0d9d1f22dcd

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../python-matplotlib-inline/python-matplotlib-inline.hash  | 4 ++--
 .../python-matplotlib-inline/python-matplotlib-inline.mk    | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-matplotlib-inline/python-matplotlib-inline.hash b/package/python-matplotlib-inline/python-matplotlib-inline.hash
index 1925a09808..6370d2ce87 100644
--- a/package/python-matplotlib-inline/python-matplotlib-inline.hash
+++ b/package/python-matplotlib-inline/python-matplotlib-inline.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/matplotlib-inline/json
-md5  96fe871bf30dc414e6724423c1e2ebb1  matplotlib_inline-0.1.7.tar.gz
-sha256  8423b23ec666be3d16e16b60bdd8ac4e86e840ebd1dd11a30b9f117f2fa0ab90  matplotlib_inline-0.1.7.tar.gz
+md5  25b1b460ee846df0d4d5d92dc8e6664c  matplotlib_inline-0.2.1.tar.gz
+sha256  e1ee949c340d771fc39e241ea75683deb94762c8fa5f2927ec57c83c4dffa9fe  matplotlib_inline-0.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  8521b036c6448e0e0aa7213d4713b6fdee0f4c64c9f320450f77346bf5c0e8e4  LICENSE
diff --git a/package/python-matplotlib-inline/python-matplotlib-inline.mk b/package/python-matplotlib-inline/python-matplotlib-inline.mk
index 961b50120a..54c4a18661 100644
--- a/package/python-matplotlib-inline/python-matplotlib-inline.mk
+++ b/package/python-matplotlib-inline/python-matplotlib-inline.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_MATPLOTLIB_INLINE_VERSION = 0.1.7
+PYTHON_MATPLOTLIB_INLINE_VERSION = 0.2.1
 PYTHON_MATPLOTLIB_INLINE_SOURCE = matplotlib_inline-$(PYTHON_MATPLOTLIB_INLINE_VERSION).tar.gz
-PYTHON_MATPLOTLIB_INLINE_SITE = https://files.pythonhosted.org/packages/99/5b/a36a337438a14116b16480db471ad061c36c3694df7c2084a0da7ba538b7
-PYTHON_MATPLOTLIB_INLINE_SETUP_TYPE = setuptools
+PYTHON_MATPLOTLIB_INLINE_SITE = https://files.pythonhosted.org/packages/c7/74/97e72a36efd4ae2bccb3463284300f8953f199b5ffbc04cbbb0ec78f74b1
+PYTHON_MATPLOTLIB_INLINE_SETUP_TYPE = flit
 PYTHON_MATPLOTLIB_INLINE_LICENSE = BSD-3-Clause
 PYTHON_MATPLOTLIB_INLINE_LICENSE_FILES = LICENSE
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
