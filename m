Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC572CD3424
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E9EA84F86;
	Fri,  1 May 2026 12:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nVgSrZ60dICP; Fri,  1 May 2026 12:32:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3FF684F94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777638730;
	bh=09khRwVVz44noDrnWSg6mdZ1zDs4xtW99XkB8718wB8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gx+Q/+sKHUbLqKWEboJpYGXEbSoQZY4LkiK5856e0zfySxA1n47MAgNriSKO+tsmq
	 r029PWprzdX/ECI21wYtifoVALBlsZ1fc4sgiwHMDg5HV8G2TeRUGpyjzOqMy3v3ly
	 YYOgSYNFzK5EYjOdMWHnBUNSmQA0EyU6G7NjbxjfC6fNfXM3DnfCU/H9SiLkYBe1yo
	 tamwc/EVTvBf4VHiyQWyC6LK8CZi/xKw7KXtVk72tUOVatS+U+1I4RmQlMJdCnFW/l
	 Z8x0CmlFlwtWAaw57a7mNq5uy9x6fv75y6y/UYAUTDCijdOaoSn4WuFS6w7UYGme7L
	 kaANHOBpFV85A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3FF684F94;
	Fri,  1 May 2026 12:32:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DE9CB127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4D5384F94
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U4UAJYK5m5UT for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:32:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A88FC84F86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A88FC84F86
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A88FC84F86
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:32:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AA295A4C2E86;
 Fri,  1 May 2026 14:31:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1K-000000008NC-2t42;
 Fri, 01 May 2026 12:31:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:08 +0200
Message-ID: <20260501123100.1918951-23-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638662;
 bh=IwemBSpwfec8+gxOdtIshzmn1ieTZny+UOL6k/SE0QE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=BCOx1hiD3RFStzOUWr9GRPiZj7CuQJxV1F5hRby8rfJtmDlAUKEc/AvrOIDLwqbB1
 9ODUGjEg6z2BfR/ZOpCLqOEHFGv9Nf3F3pC0jmcVF9JVZPr16OTARFBubzthq5ucAo
 Reb0OOYfylQdEPLIZq7vRSKg4NvoXfflrXZ9hW6HJFaT3GVANv3Xd8EzrZs8N87uxY
 tha/6Brhc3y6pcVBkDrd9G4VPKPL2mVwJ5xfm/pvNNdSdM/I0wDLukWOP0NgTeC+Ym
 Sd/bAtUfBXHh0kw6XSmy64eKhwt83W8sPYS2P5lSYTcDtDNYeoFG/iqwX1/Xud1N2V
 FN+jgpfETYrSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=BCOx1hiD
Subject: [Buildroot] [PATCH 23/75] package/python-hiredis: bump version to
 3.3.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/redis/hiredis-py/releases/tag/v3.3.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-hiredis/python-hiredis.hash | 4 ++--
 package/python-hiredis/python-hiredis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hiredis/python-hiredis.hash b/package/python-hiredis/python-hiredis.hash
index 57e658e6e3..8804a47b8a 100644
--- a/package/python-hiredis/python-hiredis.hash
+++ b/package/python-hiredis/python-hiredis.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/hiredis/json
-md5  3dc0c18cedc67e6eb9027245157a29b3  hiredis-3.3.0.tar.gz
-sha256  105596aad9249634361815c574351f1bd50455dc23b537c2940066c4a9dea685  hiredis-3.3.0.tar.gz
+md5  ac8a2fa2182ff57c5fb5650d71e85b59  hiredis-3.3.1.tar.gz
+sha256  da6f0302360e99d32bc2869772692797ebadd536e1b826d0103c72ba49d38698  hiredis-3.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3256b5b77e98aa34ff31a4d2c2c10f7f177b0f3058753a6044430a168987353b  LICENSE
 sha256  dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb  vendor/hiredis/COPYING
diff --git a/package/python-hiredis/python-hiredis.mk b/package/python-hiredis/python-hiredis.mk
index 6cedbe0076..a722f2eab9 100644
--- a/package/python-hiredis/python-hiredis.mk
+++ b/package/python-hiredis/python-hiredis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HIREDIS_VERSION = 3.3.0
+PYTHON_HIREDIS_VERSION = 3.3.1
 PYTHON_HIREDIS_SOURCE = hiredis-$(PYTHON_HIREDIS_VERSION).tar.gz
-PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/65/82/d2817ce0653628e0a0cb128533f6af0dd6318a49f3f3a6a7bd1f2f2154af
+PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/97/d6/9bef6dc3052c168c93fbf7e6c0f2b12c45f0f741a2d30fd919096774343a
 PYTHON_HIREDIS_SETUP_TYPE = setuptools
 PYTHON_HIREDIS_LICENSE = MIT, BSD-3-Clause
 PYTHON_HIREDIS_LICENSE_FILES = LICENSE vendor/hiredis/COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
