Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE6DD3B992
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5603C84419;
	Tue,  9 Dec 2025 19:43:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vv1-26LuzUX7; Tue,  9 Dec 2025 19:43:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DBFA84432
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309402;
	bh=wD+XBY9BOJzEjb/b12ISW4riExvMz+7Pb41vZkYNJL4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FDNsGFiDfWOEcfREO03j1OPw7z2++3DfQX1Imfg+v7OGDWc0UN8qztvZPHa7X559H
	 dltAVom8VqZU33M9x9I+JeINFKe9TWQKUQkkq41LiiZ0kfe/GFbxAD4dxuc1KtezeP
	 vAcqoDaTvEkTgk2UcMvzdkiQTd9CuCm2DvptT/Ib9MnBjVykxhifbWJxsyHhgqc+RD
	 eDaFTOtSw3un2KT2KYEPHZMKqPb2o7DTSJyf6ZuHT+/hyos1CKkjg2vRZMwS86S+Wc
	 VovgOUGmqCNbXK/qWxDgqgYji0DCyzSJE5O+mAwZbm5pw8Y7Ke9CoDFq8vdihttpD6
	 tzzgt40DV46Aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DBFA84432;
	Tue,  9 Dec 2025 19:43:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 86DCFE7
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CEBC608EE
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:43:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i4vOSuZ5QJHv for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:43:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6079E608D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6079E608D0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6079E608D0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:43:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 268A1A4C2CB0;
 Tue,  9 Dec 2025 20:40:16 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yv-000000006DN-1AfD;
 Tue, 09 Dec 2025 19:39:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:38 +0100
Message-ID: <20251209193951.1000100-18-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209193951.1000100-1-bernd@kuhls.net>
References: <20251209193951.1000100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309216;
 bh=IuW5URJ5s5PikpYxBkAOEowPtOI/IhZJa0emo4uW3Xo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=SJ0ysXt1u1X0qGf2hclCkCQnWXoER0cpu8xA+w4QSWOZvMJUOfEUzUqBwb5indrn+
 j7kkkKlpOyJ/kXjQLAjXv5WPYPBDzrZfM+H/YLRBgRzUXNrFGg2fFNY4pJNwNXebv8
 I11442YGImSI5ztZ6dIqfUAXYS5xulQ2tb3DlpmWulSoI6JKZ229jsGzsPnfStH4gN
 940diLVsc+5W9yiOAVaXanD6G1SVTUVTP8WKqs9Ai7RZselW91Idu9g6kp/GBll4uI
 Hu/he1scnSD171aK0ow8IiqFX+7OnEwBaT81+TL4jJVwxjeg67d1nUEF5NWPYTyXUI
 koHaJ/TbBV0Ig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=SJ0ysXt1
Subject: [Buildroot] [PATCH/next 18/31] package/python-beautifulsoup4: bump
 version to 4.14.3
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://git.launchpad.net/beautifulsoup/tree/CHANGELOG
(from master branch, no 4.14.3 tag available)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-beautifulsoup4/python-beautifulsoup4.hash | 4 ++--
 package/python-beautifulsoup4/python-beautifulsoup4.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.hash b/package/python-beautifulsoup4/python-beautifulsoup4.hash
index 149eeff67d..32c331e28b 100644
--- a/package/python-beautifulsoup4/python-beautifulsoup4.hash
+++ b/package/python-beautifulsoup4/python-beautifulsoup4.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/beautifulsoup4/json
-md5  4ecf1fb561e84adfb3146650e3d51394  beautifulsoup4-4.12.3.tar.gz
-sha256  74e3d1928edc070d21748185c46e3fb33490f22f52a3addee9aee0f4f7781051  beautifulsoup4-4.12.3.tar.gz
+md5  c7e801c7d4e2300c1112eeb0b21ccb9b  beautifulsoup4-4.14.3.tar.gz
+sha256  6292b1c5186d356bba669ef9f7f051757099565ad9ada5dd630bd9de5fa7fb86  beautifulsoup4-4.14.3.tar.gz
 # Locally computed sha256 checksums
 sha256  55b4d8d4b1e5bc86d10efac91b74c87bcb77526b0f5b9edaf8b9cd2adc7397b2  LICENSE
diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.mk b/package/python-beautifulsoup4/python-beautifulsoup4.mk
index ba54f68c83..a9661345aa 100644
--- a/package/python-beautifulsoup4/python-beautifulsoup4.mk
+++ b/package/python-beautifulsoup4/python-beautifulsoup4.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BEAUTIFULSOUP4_VERSION = 4.12.3
+PYTHON_BEAUTIFULSOUP4_VERSION = 4.14.3
 PYTHON_BEAUTIFULSOUP4_SOURCE = beautifulsoup4-$(PYTHON_BEAUTIFULSOUP4_VERSION).tar.gz
-PYTHON_BEAUTIFULSOUP4_SITE = https://files.pythonhosted.org/packages/b3/ca/824b1195773ce6166d388573fc106ce56d4a805bd7427b624e063596ec58
+PYTHON_BEAUTIFULSOUP4_SITE = https://files.pythonhosted.org/packages/c3/b0/1c6a16426d389813b48d95e26898aff79abbde42ad353958ad95cc8c9b21
 PYTHON_BEAUTIFULSOUP4_SETUP_TYPE = hatch
 PYTHON_BEAUTIFULSOUP4_LICENSE = MIT
 PYTHON_BEAUTIFULSOUP4_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
