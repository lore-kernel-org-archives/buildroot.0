Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE18ED3B993
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B82FA4024E;
	Tue,  9 Dec 2025 19:42:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V-mPAYaAfsFi; Tue,  9 Dec 2025 19:42:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4F404026A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309330;
	bh=Uw8JWcvn39Zjyinr83uOR+DQcON4O7347y3i3NP1vf4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=T7hTcTrhxo5IqAc7eUX6FaO2+Xe5dNqiGRPZA6yNMd3JOQTCLmlxl6Q10139EotFF
	 8Rduyzlw1supv64BHzTFNcu28YmIfU3xiKbfxSHgOJullqllFGIf28OnOfmmXFNS37
	 ryoHch2V+D/LaZ0cd2TlCk0EgXFAbYYc4K6n/xqhwuhIk1kk/1teiNJpFRWilXx1XS
	 mFb7LRwlQOOtMNNzkCxdOzKMCGSfd026Ic7dj73iGCuYC330vw4pWwmormU5t+Xhvt
	 mjNon93Fi0fAIGzKkDc/bWTkyRkZI+KwjKu4hxSu4tfbLFAP8JPXZarxQpWJQGfzyD
	 BU0buup2HCsbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4F404026A;
	Tue,  9 Dec 2025 19:42:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 655C42C0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47F118475C
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:42:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XCq6RkD7rCSq for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:42:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 372768439D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 372768439D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 372768439D
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:42:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DBF3EA4C2C78;
 Tue,  9 Dec 2025 20:40:14 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yu-000000006DN-3G87;
 Tue, 09 Dec 2025 19:39:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:31 +0100
Message-ID: <20251209193951.1000100-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209193951.1000100-1-bernd@kuhls.net>
References: <20251209193951.1000100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309214;
 bh=kjj7z7q9CLvxjdomF7WnQg5pOOJ2mos8bW7+fm+ZjIQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=G/1568RycUB4gBNTAwql76uXt61e3YOffWHGcMZppMBFGayu3ETB1PPDqTKONnP/N
 YAYOp0RPQdQoG/tRaBG32vv6F1GWx7B1NcZkfhvOO0gsTEYGzIklDqmjWw0KlEHaRK
 1lPCNO7znMXB3F6JBw2NaUujQYTgg4ZJ+Kiri4odP2EsZfvyetEtxrqaNmb46c+BQN
 NiBJXG1ageyM/5gRSMg8RjrZRN39j6/cCdLzZg1kzhTO7tH/QUJiMSbwFeXZQpnDZo
 MCrKofRDdB/SaXJSfVkLbMgIzUy+vXsuSYlqy+FIpGP0qkVerHQzpkMf6Z2ZTX1APs
 UHBBQxA+wV2nw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=G/1568Ry
Subject: [Buildroot] [PATCH/next 11/31] package/python-arrow: bump version
 to 1.4.0
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

https://github.com/arrow-py/arrow/blob/1.4.0/CHANGELOG.rst

Switched _SETUP_TYPE to flit.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-arrow/python-arrow.hash | 4 ++--
 package/python-arrow/python-arrow.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-arrow/python-arrow.hash b/package/python-arrow/python-arrow.hash
index 6120069abf..a28ab03863 100644
--- a/package/python-arrow/python-arrow.hash
+++ b/package/python-arrow/python-arrow.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/arrow/json
-md5  f03ecc3edbe2db99f366142f6e0f6d0b  arrow-1.3.0.tar.gz
-sha256  d4540617648cb5f895730f1ad8c82a65f2dad0166f57b75f3ca54759c4d67a85  arrow-1.3.0.tar.gz
+md5  abbbe6bc2414c64ee56f0b59aa6ea25d  arrow-1.4.0.tar.gz
+sha256  ed0cc050e98001b8779e84d461b0098c4ac597e88704a655582b21d116e526d7  arrow-1.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b481f87296cb0abdb13fd8cbb94b14c328be880ec9e68547a61b84dacffd067a  LICENSE
diff --git a/package/python-arrow/python-arrow.mk b/package/python-arrow/python-arrow.mk
index 793cc2640f..c12867bf29 100644
--- a/package/python-arrow/python-arrow.mk
+++ b/package/python-arrow/python-arrow.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_ARROW_VERSION = 1.3.0
+PYTHON_ARROW_VERSION = 1.4.0
 PYTHON_ARROW_SOURCE = arrow-$(PYTHON_ARROW_VERSION).tar.gz
-PYTHON_ARROW_SITE = https://files.pythonhosted.org/packages/2e/00/0f6e8fcdb23ea632c866620cc872729ff43ed91d284c866b515c6342b173
-PYTHON_ARROW_SETUP_TYPE = setuptools
+PYTHON_ARROW_SITE = https://files.pythonhosted.org/packages/b9/33/032cdc44182491aa708d06a68b62434140d8c50820a087fac7af37703357
+PYTHON_ARROW_SETUP_TYPE = flit
 PYTHON_ARROW_LICENSE = Apache-2.0
 PYTHON_ARROW_LICENSE_FILES = LICENSE
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
