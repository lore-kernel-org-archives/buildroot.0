Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AFCE67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F029C821E5;
	Sun, 21 Dec 2025 22:37:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 67m_PgWRxPqf; Sun, 21 Dec 2025 22:37:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AC71821DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766356631;
	bh=9BxrUiIqgRSMjD4xedN5PJRLfsGO6PXSd8sLKq3Avkg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nbVt/jZO1/II9EvR7bIUdPdy3vXp7XFOaDpqUdYkgqGCe200Rcv7c8Ck3KBIfzSkP
	 HNQKptsCi4ptRVvZjdqHkzfFhrWECpw5E7E71VG14LXdIHlG5Jo75g9cABOAkWr9UP
	 YQ/BAgTI/2uBNFadR/HEZDGH+r4xQv4YvgBoZ88KmEfQnMYLZToOsbCj9a/xHZKjqe
	 D0I/SZzMerqFVsCcXeI+ck2Sn8GzZOT6LD6LG/YovWMihv/VtCrz0JjCR13l+Lde+N
	 wzkmQsHqtoVnGZfkjIRB+BRTDKL0upH/7mZqBImEo7kw+IzPIB8V2iDjtaTZjGalN4
	 9fSLWLpQD+z9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AC71821DC;
	Sun, 21 Dec 2025 22:37:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DE32D195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4BCD400B8
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:37:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gKVctTP29Vwm for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:37:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B6ABE40089
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6ABE40089
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6ABE40089
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:37:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E57D0A4C4E42;
 Sun, 21 Dec 2025 23:35:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60652)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXS0g-000000005pH-0nN8;
 Sun, 21 Dec 2025 22:34:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:34:31 +0100
Message-ID: <20251221223441.185169-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221223441.185169-1-bernd@kuhls.net>
References: <20251221223441.185169-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766356504;
 bh=pruITsuPMtHc6+7VEkdNsYj2w1FX5GlSSKxR/VzqkPo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=WjTTpPopPTbgUhbJsXY7PhDjkdFJ+izxJZ1BRSmHWHcRxUv9Iw2OIjZsW5PdEUhBm
 JswlklI4tD7mw8CC8h4qVn5Et/jTfYWUJoxOPrLu2NK4msJF74MSDgZzBAmY5MXPWe
 O54xo/qFnP3J9L9R10eLmRuD2UN7WCPUDD4CC7eHDa9ekKRJFVvrcHw+7t4WzCaFAL
 8loMOMqsTrQ2AQbJ3YlI4Nwj2l07yxSWPOC/p3K5MnxrtS2zl3TDKz2tYLxBTTZiao
 fgu1rZXcyVf9OFsdvYZSVbKZl4FOC3yvGIGK4PidpXMJ+/m4DuECzcHOlLQXvYGhVM
 TwE68uf5bJ9gw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=WjTTpPop
Subject: [Buildroot] [PATCH v2 13/23] package/python-libconf: update tarball
 URL
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
 package/python-libconf/python-libconf.hash | 5 +++--
 package/python-libconf/python-libconf.mk   | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/python-libconf/python-libconf.hash b/package/python-libconf/python-libconf.hash
index d05efd37fd..40dfeadac6 100644
--- a/package/python-libconf/python-libconf.hash
+++ b/package/python-libconf/python-libconf.hash
@@ -1,4 +1,5 @@
-# Locally calculated
-sha256  66897870fcafce05624eafcc99e2dc8e150124e91019d9c29cc4f3bef64311dd  python-libconf-2.0.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/libconf/json
+md5  e212611cbf6a696e05742a983b3a0c57  libconf-2.0.1.tar.gz
+sha256  2f907258953ba60a95a82d5633726b47c81f2d5cf8d8801b092579016d757f4a  libconf-2.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3c2afc8c9f7a12032f225e6fa870e85af14d1b71236afe28d94a4b67e5e8c873  LICENSE
diff --git a/package/python-libconf/python-libconf.mk b/package/python-libconf/python-libconf.mk
index 65bdee8619..5bea1b2cc6 100644
--- a/package/python-libconf/python-libconf.mk
+++ b/package/python-libconf/python-libconf.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 PYTHON_LIBCONF_VERSION = 2.0.1
-PYTHON_LIBCONF_SITE = $(call github,ChrisAichinger,python-libconf,$(PYTHON_LIBCONF_VERSION))
+PYTHON_LIBCONF_SOURCE = libconf-$(PYTHON_LIBCONF_VERSION).tar.gz
+PYTHON_LIBCONF_SITE = https://files.pythonhosted.org/packages/c8/41/592c24b42ec6e349629f2b6310ff31255b213bc696c0e4ad2ee1d2bbb68e
 PYTHON_LIBCONF_SETUP_TYPE = setuptools
 PYTHON_LIBCONF_LICENSE = MIT
 PYTHON_LIBCONF_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
