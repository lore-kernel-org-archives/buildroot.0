Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06D3D43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89CD740FED;
	Thu, 11 Dec 2025 19:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PwKM1blQ5WiR; Thu, 11 Dec 2025 19:55:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACB2740880
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765482958;
	bh=QTXNG9/soNMaFgeQRQw6bWBt+QvXKgFAuhuysJwf3M8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kEt/GlkHDmCnygr+7PTnuxhsXnSYPTGgPWO4bveEoFua1TYlEk9RL9BxrAldZP4VR
	 I6J7ALfemJQdXgaCio8DZb5s/Hlibevhae8brZQ6t+4JjP3J47q3yrSdyyi/SS8y1t
	 e5ndG4XYJV/0s8f1Rh09U//QSzJaMoExusz9c/qDj+oWI1xBRIQlLTGiwvI6vDQ+Vz
	 Q1vraK4knZE2oU2/NdKVEVpn0SmjIPq7AtOu7gLF7d7H3/D5deZUPXNdw32SjL4L8e
	 8+aA/2t+Bin3c42sq3fpuln2Vj2NnP29ny2VtIWkVwuUTy4HtwrJWsHWvHP5z69O9a
	 rZkH6WYgx8u4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACB2740880;
	Thu, 11 Dec 2025 19:55:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AF0692C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A07E681068
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WHg6FpBLlrrp for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:55:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8D9B380E70
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D9B380E70
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D9B380E70
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:55:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4DADBA4C352B;
 Thu, 11 Dec 2025 20:55:28 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39350)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vTml6-000000008Hh-0thA;
 Thu, 11 Dec 2025 19:55:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:55:09 +0100
Message-ID: <20251211195527.3276900-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251211195527.3276900-1-bernd@kuhls.net>
References: <20251211195527.3276900-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765482928;
 bh=OqZiFGnfbrro8wAdTh6nHMaqhl28VCojVxxNGfRPfKs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=NcF1R5n0RrYhuZpC/xCcTtJ3j06Q63YyveJ2r+ypq41uf/9viwUviZPgyGUjFsx+S
 vKpJqJqDtYdHNOd/+4RN0VeiE28mcjA3oxYHlnO5RCGwyaRo73BbJk8JbTAoGK6Mw5
 eJKHDIJH7VGroTekt+hS55RBbFbgvt4X/KLq4JC6SJPm8HgPjsbX3fm1EwVR+EmAlz
 TjT6ingwUMAFdbI2zEoOMeByUn1O5AnIbBiuI3pr0xCk6c2Dj2rfSqwi2TaKcl03Q8
 neaS+0J+ihjRv8bm6EIrFvhSxnooJrKrvN/UrhGLskXXy8geiwwKyPRNOFsZ7fGlWe
 s5YFDoeRv4ZfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=NcF1R5n0
Subject: [Buildroot] [PATCH/next 03/21] package/python-cssselect2: bump
 version to 0.8.0
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

https://github.com/Kozea/cssselect2/blob/0.8.0/docs/changelog.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-cssselect2/python-cssselect2.hash | 4 ++--
 package/python-cssselect2/python-cssselect2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cssselect2/python-cssselect2.hash b/package/python-cssselect2/python-cssselect2.hash
index 13bdca9a39..214be0a5fb 100644
--- a/package/python-cssselect2/python-cssselect2.hash
+++ b/package/python-cssselect2/python-cssselect2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssselect2/json
-md5  594ebe75a12dfd6cc288858faeb77415  cssselect2-0.7.0.tar.gz
-sha256  1ccd984dab89fc68955043aca4e1b03e0cf29cad9880f6e28e3ba7a74b14aa5a  cssselect2-0.7.0.tar.gz
+md5  45b5f89f2934fbcb52490483367c3997  cssselect2-0.8.0.tar.gz
+sha256  7674ffb954a3b46162392aee2a3a0aedb2e14ecf99fcc28644900f4e6e3e9d3a  cssselect2-0.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6fd97229a1d1b0f6a8b41e109f413426dbc0874b1e03746d66cc33282601c2c2  LICENSE
diff --git a/package/python-cssselect2/python-cssselect2.mk b/package/python-cssselect2/python-cssselect2.mk
index 67907f9bcd..7a4e2a2342 100644
--- a/package/python-cssselect2/python-cssselect2.mk
+++ b/package/python-cssselect2/python-cssselect2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CSSSELECT2_VERSION = 0.7.0
+PYTHON_CSSSELECT2_VERSION = 0.8.0
 PYTHON_CSSSELECT2_SOURCE = cssselect2-$(PYTHON_CSSSELECT2_VERSION).tar.gz
-PYTHON_CSSSELECT2_SITE = https://files.pythonhosted.org/packages/e7/fc/326cb6f988905998f09bb54a3f5d98d4462ba119363c0dfad29750d48c09
+PYTHON_CSSSELECT2_SITE = https://files.pythonhosted.org/packages/9f/86/fd7f58fc498b3166f3a7e8e0cddb6e620fe1da35b02248b1bd59e95dbaaa
 PYTHON_CSSSELECT2_SETUP_TYPE = flit
 PYTHON_CSSSELECT2_LICENSE = BSD-3-Clause
 PYTHON_CSSSELECT2_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
