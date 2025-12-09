Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B799D3B98F
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F8508237A;
	Tue,  9 Dec 2025 19:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GxMbbE6Qh_or; Tue,  9 Dec 2025 19:45:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74F9B82387
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309513;
	bh=+31eHi+t7N29UKjgAZsYhewQpOzZB0bhQX3e0DylZ8Y=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=U9Jk1aiuq+8IG8QBPiXSUGnZbFzp7tJaug8gZ5sdze8KNtKJw5YhkluKteBspNHEG
	 yDaTlkaGI0MHR7FXITQsd1DiExhR/GkxbGjhP1xkVzi537hRRhOOd5cnW/ves3Yl4Z
	 lTc68ijezlsUM+qNzReFCu+3tFWnwhydlEpXnbORB+OMAfCgqJgP10t4PK7w20DvE4
	 jyflhwwBlNG8eWHux+vLGNHkKr9b1mp/kdNqZQXqTGxkEF3QLv+ICPr0T96OOW/VLu
	 jtmRo1Li/JStATDImxsh2gwFWFr0kP4E9s32oJ79hzAByV3X02Yw6qesOEZU/A858x
	 2B2l04r+GgkGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74F9B82387;
	Tue,  9 Dec 2025 19:45:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BE4B7E7
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF8B46136A
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:45:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kGoDDqwz5H4B for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:45:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A0E1F60A35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0E1F60A35
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0E1F60A35
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:45:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 42798A4C2D13;
 Tue,  9 Dec 2025 20:40:18 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yv-000000006DN-3jb0;
 Tue, 09 Dec 2025 19:39:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:47 +0100
Message-ID: <20251209193951.1000100-27-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209193951.1000100-1-bernd@kuhls.net>
References: <20251209193951.1000100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309218;
 bh=O0EHEY7ngP5dNFbS8UHgLAFsIiPFE3Elf0Nj2NwKkZ8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=gQ2YJhx+8fFNQzDoOU+BiwS2HUbrLKsC/syRkjPIGyzZ6/UUOCchzsw2o3vHU5jBQ
 UDzFMAJHITgE8lbBZLFpo060Z216N8LdjZJ9OZBPy50QG4S/CfTHnoB5bP85Ntmf2v
 SvGRSWYH9hPpzGtYwChjei6G/5BitvTPnDPkl8c+guy77Zg7bVghLyUvu7C4y+36GP
 FOv3n4vuRILDgZVMoR/yqk/vF/1c/Ge2p8xJ03qR/01gY8Ny21/eh2zMtexgYN2rPA
 70hNooaoNLfN/19BDGQkFiCkIDM35oG+YYPF32lYdeXuXV9b8r4bjDv4wNMiVu72Hf
 NNPu0PnybM4Rw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=gQ2YJhx+
Subject: [Buildroot] [PATCH/next 27/31] package/python-cbor2: bump version
 to 5.7.1
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

https://github.com/agronholm/cbor2/blob/5.7.1/docs/versionhistory.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-cbor2/python-cbor2.hash | 4 ++--
 package/python-cbor2/python-cbor2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cbor2/python-cbor2.hash b/package/python-cbor2/python-cbor2.hash
index 8c30bced20..54c297bdb4 100644
--- a/package/python-cbor2/python-cbor2.hash
+++ b/package/python-cbor2/python-cbor2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cbor2/json
-md5  0804f5be872bcdbed12fb1314615b461  cbor2-5.6.5.tar.gz
-sha256  b682820677ee1dbba45f7da11898d2720f92e06be36acec290867d5ebf3d7e09  cbor2-5.6.5.tar.gz
+md5  9f5b82e0ca69926b4eb9dc145b82c524  cbor2-5.7.1.tar.gz
+sha256  7a405a1d7c8230ee9acf240aad48ae947ef584e8af05f169f3c1bde8f01f8b71  cbor2-5.7.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a6afd126d8f545a15166a22f25fadff4b9fb4978bbdd17e97d97d950b66d2fef  LICENSE.txt
diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index 9e410376fb..65873d77ca 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CBOR2_VERSION = 5.6.5
+PYTHON_CBOR2_VERSION = 5.7.1
 PYTHON_CBOR2_SOURCE = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
-PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/e4/aa/ba55b47d51d27911981a18743b4d3cebfabccbb0598c09801b734cec4184
+PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/a2/b8/c0f6a7d46f816cb18b1fda61a2fe648abe16039f1ff93ea720a6e9fb3cee
 PYTHON_CBOR2_SETUP_TYPE = setuptools
 PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
