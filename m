Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0E8D5B86D
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E160380E30;
	Mon, 15 Dec 2025 21:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bcg2rNOt-M8P; Mon, 15 Dec 2025 21:44:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08A2280E65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765835096;
	bh=6UlPBDGMx5YJM5GGdFAUzG9aJJbRDi0CWVh129aCeoI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=hNZVwUDWo5Gj+u/hrTv+/UTKs743lpjmRi3TusxnBx/piO68pHFmcXtZCQ/dZaXC4
	 CHZ3HhDm9Nfza5rmAmvsWJIGpXUIz2NmR2G082oc2olZxO5zKZmhXk3dg77keQuP5b
	 6lmbyyD5qiJEAU4WLdqcto5jSmasydST2/U14wUcaiyAzBOcI74Mvy3VtWOZTjgkoF
	 /12c4ARCiRJvKSQ2dWCR/BMQBbvPtIoPChTx9IhoG3Lcv5YKTW4PnlkDXoNpBrbXSY
	 baLvPnjD+izYarUZZqplxTRfKP7KNpR0mfhbS43V5Wn00LLcDquQrQIIOjBjm9W0Jk
	 Pa33eChrerasw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08A2280E65;
	Mon, 15 Dec 2025 21:44:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E2AFC117
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8EE060F08
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R97b2MRSlFxW for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:44:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 168B160804
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 168B160804
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 168B160804
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:44:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C9CF4A4C427E;
 Mon, 15 Dec 2025 22:44:48 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40054)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVGN6-000000006QJ-0Fhl;
 Mon, 15 Dec 2025 21:44:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 22:44:48 +0100
Message-ID: <20251215214448.2621174-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765835088;
 bh=s7HNCcASNEhAue6836mEB2AOuhLqU5p8/YSn+TlWDgo=;
 h=From:To:Cc:Subject:Date:From;
 b=mwtpCES5XaM0MICIsjXoQThK92q6RzA43XUfmroYY4/blORwWVDDL93YhW42qTeNL
 Fxe1XaBqxlOEvm1u1LfWtFejj6V132CX1bE5xkW7HoiM6WaiXwJx+yHG/BHO+gR43K
 PYeJQtWUoaDUZn49SpW5B8P3zHhfFlaoTyxaq1q4SYaHgxznxV+O7gyzBKotEoCLsM
 NOAUjWqJqHPYEabxNy1zeK+ijG32Z6yY2mh7+g9w1iitJ719DZV0LaSu0xu2wAGZ5X
 Hp1lZ1Ca/VSnsb7NHDBG9vKxvLqCXlARgYZYkXBESULw8AyowWMaEGoVYNKNpx1qWl
 7APk80vZ3PkTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=mwtpCES5
Subject: [Buildroot] [PATCH 1/1] package/python-jeepney: bump version to
 0.9.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.com/takluyver/jeepney/-/blob/0.9/docs/release-notes.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-jeepney/python-jeepney.hash | 4 ++--
 package/python-jeepney/python-jeepney.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jeepney/python-jeepney.hash b/package/python-jeepney/python-jeepney.hash
index 31a5bac183..4e405bfd34 100644
--- a/package/python-jeepney/python-jeepney.hash
+++ b/package/python-jeepney/python-jeepney.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jeepney/json
-md5  7e2151e9197c751ceca6550bc6b3294c  jeepney-0.8.0.tar.gz
-sha256  5efe48d255973902f6badc3ce55e2aa6c5c3b3bc642059ef3a91247bcfcc5806  jeepney-0.8.0.tar.gz
+md5  d0c0d388ee003d6475750aebe56fc699  jeepney-0.9.0.tar.gz
+sha256  cf0e9e845622b81e4a28df94c40345400256ec608d0e55bb8a3feaa9163f5732  jeepney-0.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  1b22b049b5267d6dfc23a67bf4a84d8ec04b9fdfb1a51d360e42b4342c8b4154  LICENSE
diff --git a/package/python-jeepney/python-jeepney.mk b/package/python-jeepney/python-jeepney.mk
index ac4c0283a8..f61e54b871 100644
--- a/package/python-jeepney/python-jeepney.mk
+++ b/package/python-jeepney/python-jeepney.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JEEPNEY_VERSION = 0.8.0
+PYTHON_JEEPNEY_VERSION = 0.9.0
 PYTHON_JEEPNEY_SOURCE = jeepney-$(PYTHON_JEEPNEY_VERSION).tar.gz
-PYTHON_JEEPNEY_SITE = https://files.pythonhosted.org/packages/d6/f4/154cf374c2daf2020e05c3c6a03c91348d59b23c5366e968feb198306fdf
+PYTHON_JEEPNEY_SITE = https://files.pythonhosted.org/packages/7b/6f/357efd7602486741aa73ffc0617fb310a29b588ed0fd69c2399acbb85b0c
 PYTHON_JEEPNEY_SETUP_TYPE = flit
 PYTHON_JEEPNEY_LICENSE = MIT
 PYTHON_JEEPNEY_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
