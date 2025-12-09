Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10D3D3B993
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6F4683FA2;
	Tue,  9 Dec 2025 19:41:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tYCn1bBVvF7H; Tue,  9 Dec 2025 19:41:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C367D84746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309317;
	bh=9qdW+VvtC3ibwzbZ8UFYDy6xZXI3zmd65u9aLvv159Y=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YkUEZF2eUta1Ol9ELARQRFGatCfxs3ot01vR39V2P+bKl1jkdt6+CwqqtDm3Yemzj
	 TjXUetTWCdQJtZkpCL8z88xL7zoIpv29SIMkM69Aba9adfOCZpoYkam+XgEEalqrBQ
	 xtS6L16Z29KJUstMekybeztJWJjkI+Bm9gmeAKIGjaweGtD6KxP5htEzm4aJkuDVPc
	 yMw34GV8BJJBdjchijFdpA29e8AzfKLJOzgLAxVv8MGc7urlo50svcgqZI9kFuwXGp
	 GSyPz70c3B4Va6/Pxlslbe24BkmEbrNKpV7a5sDZYuZ8FW4ATIrrlYa6zPkKvlJIOX
	 r/H+O/yvz1DeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C367D84746;
	Tue,  9 Dec 2025 19:41:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 624012C0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48FE66136A
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:41:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ROmi6NAs8UYq for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:41:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2E441612BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E441612BC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E441612BC
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:41:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AB47AA4C2C73;
 Tue,  9 Dec 2025 20:40:14 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yu-000000006DN-1n4n;
 Tue, 09 Dec 2025 19:39:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:26 +0100
Message-ID: <20251209193951.1000100-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209193951.1000100-1-bernd@kuhls.net>
References: <20251209193951.1000100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309214;
 bh=cAa5hQ0qELFdLongGshwjUz1Uv8fuw+/TnNSOxF/AUA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=vM5FCBdyA5++8RPlsWlxyV14Vg+17AFE9ntunZlobXB2FLKbBJE4j55CSEUNQNpDy
 nZgfWI+X/7aPMPpywzA2+BYDD1bKnEbe9ODOYIjMb0cAaA1Z+0XP1aTO1QrenIUZjY
 46cEISmm29qraRC8ju50O9BAsYfJ3oG7RtZiGO3/U7+QQ3VaxNpEcBg6SFoR9M+dzf
 Ev4Qz9cI6MMH79iXbCVwhgqPPiMs6r/59HGUsHy99WXvfsGp2JHbz6XIjqNIeoj2dl
 eyG/quq99FgIVs8e5Zpr923cxBdiBLzf/LDqXXANHh2ANoB3ct1bLw/xHsjzqi1Izp
 UT61gPlyzTwKA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=vM5FCBdy
Subject: [Buildroot] [PATCH/next 06/31] package/python-alembic: bump version
 to 1.17.2
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

https://alembic.sqlalchemy.org/en/latest/changelog.html#change-1.17.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-alembic/python-alembic.hash | 4 ++--
 package/python-alembic/python-alembic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-alembic/python-alembic.hash b/package/python-alembic/python-alembic.hash
index a8ed0dc92e..7729f97a64 100644
--- a/package/python-alembic/python-alembic.hash
+++ b/package/python-alembic/python-alembic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/alembic/json
-md5  5499d3918aec406a1903aed530f7e2a4  alembic-1.16.4.tar.gz
-sha256  efab6ada0dd0fae2c92060800e0bf5c1dc26af15a10e02fb4babff164b4725e2  alembic-1.16.4.tar.gz
+md5  747400a534b73635c91d3b4bb71445c8  alembic-1.17.2.tar.gz
+sha256  bbe9751705c5e0f14877f02d46c53d10885e377e3d90eda810a016f9baa19e8e  alembic-1.17.2.tar.gz
 # Locally computed sha256 checksums
 sha256  35ea9c3419b261faf1be448c4f47d9255281bf6b36b5ffea55052227d4ba54de  LICENSE
diff --git a/package/python-alembic/python-alembic.mk b/package/python-alembic/python-alembic.mk
index 8dbbd0c7d8..530b31246f 100644
--- a/package/python-alembic/python-alembic.mk
+++ b/package/python-alembic/python-alembic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ALEMBIC_VERSION = 1.16.4
+PYTHON_ALEMBIC_VERSION = 1.17.2
 PYTHON_ALEMBIC_SOURCE = alembic-$(PYTHON_ALEMBIC_VERSION).tar.gz
-PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/83/52/72e791b75c6b1efa803e491f7cbab78e963695e76d4ada05385252927e76
+PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/02/a6/74c8cadc2882977d80ad756a13857857dbcf9bd405bc80b662eb10651282
 PYTHON_ALEMBIC_SETUP_TYPE = setuptools
 PYTHON_ALEMBIC_LICENSE = MIT
 PYTHON_ALEMBIC_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
