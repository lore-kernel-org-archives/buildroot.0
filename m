Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46D7D43343
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A29D680694;
	Thu, 11 Dec 2025 19:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lk6pTu1zK7FF; Thu, 11 Dec 2025 19:55:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5CF380A74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765482944;
	bh=g6g1PdCaFtWUt70PrXJQ4nRGjZG0KsQ79rvMFVyczIw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pakECDCavj+lc51O8eTGW4cNFD2dsCbqehVKj2neKkHsLKaNlpj6gxl8mlU8a8+BZ
	 wQT8HBbWU8pagE25zqW51n7JvxTiwoKlsUYG0JCZMInEKZ3RGbaTCW73cFti2V20u0
	 p9GgBPvpgql892h9jA3GJ0zGTsH+anW6Z7ASxE2hPQExnPPohUtNM4DsqJmNga7Vkj
	 bUwdmqtID3jvF6RG7ltLVV0efPc97eXfX0o3mxZRWTW+iUilkGksoG0toMZqI1a5uj
	 1j2MDap98GQ3YDzUjxFUyNXcrcqsHBNJIN9bmxaiEUMOxneP+AXzfIcYJNiBh/PyWK
	 eaq1+B4XrEXkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5CF380A74;
	Thu, 11 Dec 2025 19:55:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D28E2C6
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 544034005C
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rMeQppLpu35w for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:55:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3D7AF40012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D7AF40012
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D7AF40012
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:55:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 43F5CA4C3409;
 Thu, 11 Dec 2025 20:55:28 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39350)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vTml6-000000008Hh-0X7I;
 Thu, 11 Dec 2025 19:55:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:55:08 +0100
Message-ID: <20251211195527.3276900-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251211195527.3276900-1-bernd@kuhls.net>
References: <20251211195527.3276900-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765482928;
 bh=os9/DkxkrpjNbKyQemA5gjt0O6gvXFv7Y4BC5h86R+4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Ma/1xdAGEg229ZoUcoQ4bDN0ALesfJgyfEFc/RucI1XePCxpFZq6QiRiGAVAVgemW
 oV67uKPipocdJdeNWoqHUkjxlvX6kpvusbjY8ajSE4gFK9qWgFPoTmZaeLyXasqIz4
 DEBCmvvv7qCCOVz/k84p1Tbq7Da9oPSnn1la5vpPrbBaPNB+aR+BqTedSLV7KkiC4/
 j9WuKKcb6D05aDX7aZHft8/9TXS1dMTZ0YcF2jxPSsxIJrVA+ppjmDdmOYvY99RXoE
 m5wmPBLbeuqJelTPzg2CtOzQpz+p7eZZlgb7R+73kW4zkB4sMXrNd4yb51WLSbDO3S
 eMMuBRduXLUhA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Ma/1xdAG
Subject: [Buildroot] [PATCH/next 02/21] package/python-contourpy: bump
 version to 1.3.3
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
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Lionel Flandrin <lionel@svkt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/contourpy/contourpy/blob/v1.3.3/docs/changelog.rst

Updated license hash due to copyright year bump:
https://github.com/contourpy/contourpy/commit/ebb716818af775fb969099617e0d68386217d503

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-contourpy/python-contourpy.hash | 6 +++---
 package/python-contourpy/python-contourpy.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-contourpy/python-contourpy.hash b/package/python-contourpy/python-contourpy.hash
index aef7c3de74..2d5acb2375 100644
--- a/package/python-contourpy/python-contourpy.hash
+++ b/package/python-contourpy/python-contourpy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/contourpy/json
-md5  06a4ae6ab30b855514797cac7073ed08  contourpy-1.3.1.tar.gz
-sha256  dfd97abd83335045a913e3bcc4a09c0ceadbe66580cf573fe961f4a825efa699  contourpy-1.3.1.tar.gz
+md5  3592ea8e491e04fc7a87721e0beb7b0e  contourpy-1.3.3.tar.gz
+sha256  083e12155b210502d0bca491432bb04d56dc3432f95a979b429f2848c3dbe880  contourpy-1.3.3.tar.gz
 # Locally computed sha256 checksums
-sha256  c7d0a153bffaa104044463ebc633793d451722efd3138b5ffd2527b40f1505a2  LICENSE
+sha256  34170979fc64f4f5e6dfa66ef27dec314ffffc5852000c60f4836ec1dfbf156e  LICENSE
diff --git a/package/python-contourpy/python-contourpy.mk b/package/python-contourpy/python-contourpy.mk
index 08c45f3805..4fe04f5f71 100644
--- a/package/python-contourpy/python-contourpy.mk
+++ b/package/python-contourpy/python-contourpy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CONTOURPY_VERSION = 1.3.1
+PYTHON_CONTOURPY_VERSION = 1.3.3
 PYTHON_CONTOURPY_SOURCE = contourpy-$(PYTHON_CONTOURPY_VERSION).tar.gz
-PYTHON_CONTOURPY_SITE = https://files.pythonhosted.org/packages/25/c2/fc7193cc5383637ff390a712e88e4ded0452c9fbcf84abe3de5ea3df1866
+PYTHON_CONTOURPY_SITE = https://files.pythonhosted.org/packages/58/01/1253e6698a07380cd31a736d248a3f2a50a7c88779a1813da27503cadc2a
 PYTHON_CONTOURPY_LICENSE = BSD-3-Clause
 PYTHON_CONTOURPY_LICENSE_FILES = LICENSE
 PYTHON_CONTOURPY_DEPENDENCIES = python-pybind host-python-meson-python
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
