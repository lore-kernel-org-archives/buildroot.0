Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39422CCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A6E442747;
	Fri,  1 May 2026 12:45:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m8aXbkTtSTPw; Fri,  1 May 2026 12:45:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32ED642A32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639553;
	bh=sZXynTS3+3wvRF+PskyzQUGroctu2w2TluJa+oRhRMQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dYhTCDsQL2ItzNNWBF7HDtmaFbu+1xxesZZEMnC8BnHOnUQH3fWgNQxN+sFSiAnHb
	 4lUPWFSCtNoqmrgBMxr1xaFOgiPkY1VH3YuvHTby3kvkosusQjIepzR1i11wZ2ZlMG
	 h7Q3Q3f6vIgGz9Wow9iad/VhEZRZVOAI0ByXvdZyItz8o51cy5LjYxTgMdiaYURX9P
	 L259Rx3cyQ3VyLxvd9xZOMxyo32Ks5WrFKpXfMxfKVIXnm9V0dftjlpPAGm+p2qZLg
	 Kxz7SULWPAZRvq5C7Ry3xxvMuHbtqkzMkx2i8Vbxo+D9rTIr+RNql/mpg4Ois7BFea
	 Wthog30tQ1ixw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32ED642A32;
	Fri,  1 May 2026 12:45:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 55D4E127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23D1342747
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hAlFKViHZwRk for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:45:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0C67442A38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C67442A38
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C67442A38
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:45:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CDB93A4C054B;
 Fri,  1 May 2026 14:31:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1P-000000008NC-14ci;
 Fri, 01 May 2026 12:31:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:31:00 +0200
Message-ID: <20260501123100.1918951-75-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638670;
 bh=32GiGFq7IKfrr2x2nAhL062QKQg1n3FCvp4WGmnqkrw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=tuvR6K95JxgnvFqiMqU1UY7VRswbsYmyAIup3J9trg8CPXqZSgWSsR5It1c/67ImH
 XsOFIPFztBJyJ4DPogmCxjDJPNpv4FVN9A6uY3MjWYJkS+Kq3SJu0xidGpL61Ws4Ep
 Tan1KxQdI8KMH6tuNyNiTJQt3ep0oWMAnk1gXXFvhxmWC2f/OSQYVQpPkKfuaVrrYO
 g3tedTXeekmhgIFd+gsXfRciv8ve+hh+/n804Jtt94CUBLe4U6PoJc3IN9VGlZjuEj
 NcJzpRvwhA9YF1z1yayRUgh9hxtIAuuAF+iGLCIqi1TJrcWQbw3n2d8bIVqugpEPI/
 U1ILJcmbSIgmQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=tuvR6K95
Subject: [Buildroot] [PATCH 75/75] package/python-cssutils: bump version to
 2.15.0
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

https://github.com/jaraco/cssutils/blob/v2.15.0/NEWS.rst

Updated license hash due to upstream commit
https://github.com/jaraco/cssutils/commit/0ac56dd192a2d6d8c4dafb41c4701fbea2f844f0

Added dependency to host-python-coherent-licensed due to upstream commit
https://github.com/jaraco/cssutils/commit/d2b8d7750f78e870def98c4e04053af4acc86e29
which was first included in version 2.12.0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-cssutils/python-cssutils.hash | 6 +++---
 package/python-cssutils/python-cssutils.mk   | 8 +++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-cssutils/python-cssutils.hash b/package/python-cssutils/python-cssutils.hash
index 66c87904b4..96576f9717 100644
--- a/package/python-cssutils/python-cssutils.hash
+++ b/package/python-cssutils/python-cssutils.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssutils/json
-md5  c8c21e635454d9ca73b21892def35f55  cssutils-2.11.1.tar.gz
-sha256  0563a76513b6af6eebbe788c3bf3d01c920e46b3f90c8416738c5cfc773ff8e2  cssutils-2.11.1.tar.gz
+md5  8a90c28a2f037c525a25e5a2541fd9a5  cssutils-2.15.0.tar.gz
+sha256  e9739237f3915037dacba787c4b58f280e3ec5d9864953e185bf23d40ff7d021  cssutils-2.15.0.tar.gz
 # Locally computed sha256 checksums
-sha256  03c570a068086ee577dcd795519ea93462b2ed2fcb6dcc4dfce56a71a2fd6e5a  LICENSE
+sha256  b8f0d64361b0d6480ebd172c2c53c51e80745e41d69d612e4ffa35e85f8d822c  LICENSE
diff --git a/package/python-cssutils/python-cssutils.mk b/package/python-cssutils/python-cssutils.mk
index 0fc706780c..9b7a93ddd0 100644
--- a/package/python-cssutils/python-cssutils.mk
+++ b/package/python-cssutils/python-cssutils.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-PYTHON_CSSUTILS_VERSION = 2.11.1
+PYTHON_CSSUTILS_VERSION = 2.15.0
 PYTHON_CSSUTILS_SOURCE = cssutils-$(PYTHON_CSSUTILS_VERSION).tar.gz
-PYTHON_CSSUTILS_SITE = https://files.pythonhosted.org/packages/33/9f/329d26121fe165be44b1dfff21aa0dc348f04633931f1d20ed6cf448a236
+PYTHON_CSSUTILS_SITE = https://files.pythonhosted.org/packages/01/00/7e89107ea389e952eea73b1b90ac6633e15a519c4a518ee90bb93a2f83dc
 PYTHON_CSSUTILS_LICENSE = LGPL-3.0+
 PYTHON_CSSUTILS_LICENSE_FILES = LICENSE
 PYTHON_CSSUTILS_SETUP_TYPE = setuptools
-PYTHON_CSSUTILS_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_CSSUTILS_DEPENDENCIES = \
+	host-python-coherent-licensed \
+	host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
