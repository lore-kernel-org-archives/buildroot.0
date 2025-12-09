Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BB5D3B992
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64CC183FDD;
	Tue,  9 Dec 2025 19:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mHCYPbkMe6mX; Tue,  9 Dec 2025 19:43:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88095843FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309426;
	bh=ro3wpPnvmDqg7/IoCv5LETw6JGumJFf+fYvrcmF5N28=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=W9ezrs/04lFqLVDDvs5xHPctiF0i2lir4NyQdMc3YdAUU2PGwFzC4b7hIMTbldZdu
	 k3VkP8zorgEuFPed7KLOSC7poYVHT6rNqAh9Dc7Y1hE+UY1Xr303I8FBKgdSCvmSlP
	 BoX2QPXq2rHYcLpgHNjvgXIcjitwyeYCy2PMKFT5JUoZbDA96flBztKoNgFcTt6UiL
	 lax2qUotSRX6AQqfVxzZye0n3u1N5Y/Ow36YChDraTfqwwO/svJzGetMqz4xVzcUt9
	 Phfl7pz3EcQvyXJCmkVcgF4hscSGAYAuMknIQ1LJj/pRiafJFY+5Lm/x4XgUw/rbz7
	 Q/nY0ohDmoXGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88095843FE;
	Tue,  9 Dec 2025 19:43:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E08B7E7
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1DC04053A
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IR1SfRiwx-Cg for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:43:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BECA94026F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BECA94026F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BECA94026F
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:43:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8D34BA4C2CC5;
 Tue,  9 Dec 2025 20:40:16 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yv-000000006DN-1krE;
 Tue, 09 Dec 2025 19:39:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:40 +0100
Message-ID: <20251209193951.1000100-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209193951.1000100-1-bernd@kuhls.net>
References: <20251209193951.1000100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309216;
 bh=fvUYgQ8IwSOALlh6Mg1r+ZppByuH5NUCIKsVXP/tWq0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hhDgTpLtIIgtZ9TqOeHzE6wmlC2v2eYKsL5g9m5/xKnEK6QEwibpex8qavrv55cQY
 rSyewlfzSnQ7a3c0F1yuxvSoeABlt3X0sA4FrdBOu2cMepkB4CRpYFRNw35opg3KY3
 090reUpmegXrxMuHi8aI+zN8vAB+pLl78eWCgcVMLIR8HH73zuAMbudL6WgJWS+sP9
 oBe9hAEe3Qac0E0EQ5Vs37H00qS9/ulJ3GiXeVdpXGfgmwE7Y8QUBhCvGm7yFqLGN2
 YLsaiwF2vU2vjYsD+ShO8B8Gq4jaZ8jYAl1DJpqj81b7P+kGvQbrkZxE/r1khMVAC0
 l6ctLD/lLV1fg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=hhDgTpLt
Subject: [Buildroot] [PATCH/next 20/31] package/python-bitarray: bump
 version to 3.8.0
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

https://github.com/ilanschnell/bitarray/blob/3.8.0/CHANGE_LOG

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-bitarray/python-bitarray.hash | 4 ++--
 package/python-bitarray/python-bitarray.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bitarray/python-bitarray.hash b/package/python-bitarray/python-bitarray.hash
index bcde731b60..dee6613e69 100644
--- a/package/python-bitarray/python-bitarray.hash
+++ b/package/python-bitarray/python-bitarray.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bitarray/json
-md5  043d05ace953a31bee06a00f2c6c3a3d  bitarray-3.7.2.tar.gz
-sha256  27a59bb7c64c0d094057a3536e15fdd693f8520771ee75d9344b82d0a5ade2d0  bitarray-3.7.2.tar.gz
+md5  eedc882e4497c9b281f95af354f728d9  bitarray-3.8.0.tar.gz
+sha256  3eae38daffd77c9621ae80c16932eea3fb3a4af141fb7cc724d4ad93eff9210d  bitarray-3.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a554c25090ad5a5ea8ad35629dacffbb4d887234b011550218a5a1f9090e5274  LICENSE
diff --git a/package/python-bitarray/python-bitarray.mk b/package/python-bitarray/python-bitarray.mk
index 1aec908619..00b9a98d4b 100644
--- a/package/python-bitarray/python-bitarray.mk
+++ b/package/python-bitarray/python-bitarray.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BITARRAY_VERSION = 3.7.2
+PYTHON_BITARRAY_VERSION = 3.8.0
 PYTHON_BITARRAY_SOURCE = bitarray-$(PYTHON_BITARRAY_VERSION).tar.gz
-PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/e8/c1/644ea86b6f1a0864f656a3b3ee5bf8c29daa895cb3233942315fe065ea3a
+PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/95/06/92fdc84448d324ab8434b78e65caf4fb4c6c90b4f8ad9bdd4c8021bfaf1e
 PYTHON_BITARRAY_SETUP_TYPE = setuptools
 PYTHON_BITARRAY_LICENSE = Python-2.0
 PYTHON_BITARRAY_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
