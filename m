Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A727CD3424
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C0B56F774;
	Fri,  1 May 2026 12:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9p1Oez9oT4Ji; Fri,  1 May 2026 12:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06D8461B89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639057;
	bh=em1ZpeFOJ5eGwUkZnYhieE1hbaM5CrlriPSyLNNF3Eo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cQHZqFr/YwSmELcbRvomIx3n45N16I6a89XMwz0aYWlMji3yoHdeq1LFanOAIHj3W
	 2WUI9mhHI5UEwpUcBcCGi7cApIqyk4swEfWm/g1HiDnCxBPF2K+3fhMw4DFmqcutqv
	 AzjWrbt7m5mmZ1Nh+0+enEsTjIhGJWxUduOip3Jnk+weknZb7qDtHMMgwqP9nBxHUk
	 SW0USrHzorYzCluBxHNamt6Hgyqw+S/sSxHqUyQOdUWwKbqLhX8GM/nwQuOx2mMn/E
	 tguG4N48uMF6AqjtidiVsl9wddn+DJMLkectBvSTCgGTvKjYFoa98P4HvtG3VaJxt0
	 8ucCpVBVuANUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06D8461B89;
	Fri,  1 May 2026 12:37:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D5B0127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B557425DE
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:37:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LGOV6-mGAj9T for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:37:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 85DCE425D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85DCE425D6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 85DCE425D6
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:37:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 80366A4C2ED3;
 Fri,  1 May 2026 14:31:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1L-000000008NC-2LuE;
 Fri, 01 May 2026 12:31:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:18 +0200
Message-ID: <20260501123100.1918951-33-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638666;
 bh=Z33UjQvJ6MHkZufLF5r8oESMvLjYhftdgOkki0eT3y0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ERINBtVOXeIl8IE+SogSUClxqBC5+caQZtIpOxWeTF7yvI7dc7uEBj+bi6A4Lpt2P
 uxspc2fFKTAvgBR1wnooXEul6boJRXrJEF7tm6OgptjFYcW+t/MpKX/ql9cdkq9BHH
 82xI2igtqgR9a2omtzUfM/9jhaoBsWZqVzuBHZyB3bp1RXgjmF7nmklsdjcGqyjCrM
 eajcCIMCR1WWH2cjJwnNw9rLCQB2AMJ7RwjtUz9d60Ff9eqL+vHxAI1FB8X4eXgFpT
 sEQa2vaFQJ14ce6rOf3Ku2DIq2wGukKm+gj2UpRRpqp7S9zJB5Szo63piKbCP0iAP8
 ewGKEAaS9p1kA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ERINBtVO
Subject: [Buildroot] [PATCH 33/75] package/python-packaging: bump version to
 26.2
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

https://github.com/pypa/packaging/blob/26.2/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-packaging/python-packaging.hash | 4 ++--
 package/python-packaging/python-packaging.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-packaging/python-packaging.hash b/package/python-packaging/python-packaging.hash
index fd5ec922f7..a5183b1422 100644
--- a/package/python-packaging/python-packaging.hash
+++ b/package/python-packaging/python-packaging.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/packaging/json
-md5  2cbdbb5754f038736c3c361826c6872a  packaging-26.0.tar.gz
-sha256  00243ae351a257117b6a241061796684b084ed1c516a08c48a3f7e147a9d80b4  packaging-26.0.tar.gz
+md5  edae3d061c39a2ff713a97e133dbc50c  packaging-26.2.tar.gz
+sha256  ff452ff5a3e828ce110190feff1178bb1f2ea2281fa2075aadb987c2fb221661  packaging-26.2.tar.gz
 # Locally computed sha256 checksums
 sha256  cad1ef5bd340d73e074ba614d26f7deaca5c7940c3d8c34852e65c4909686c48  LICENSE
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.APACHE
diff --git a/package/python-packaging/python-packaging.mk b/package/python-packaging/python-packaging.mk
index c46390d0bc..41f8fef6a2 100644
--- a/package/python-packaging/python-packaging.mk
+++ b/package/python-packaging/python-packaging.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PACKAGING_VERSION = 26.0
+PYTHON_PACKAGING_VERSION = 26.2
 PYTHON_PACKAGING_SOURCE = packaging-$(PYTHON_PACKAGING_VERSION).tar.gz
-PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/65/ee/299d360cdc32edc7d2cf530f3accf79c4fca01e96ffc950d8a52213bd8e4
+PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/d7/f1/e7a6dd94a8d4a5626c03e4e99c87f241ba9e350cd9e6d75123f992427270
 PYTHON_PACKAGING_SETUP_TYPE = flit
 PYTHON_PACKAGING_LICENSE = Apache-2.0 or BSD-2-Clause
 PYTHON_PACKAGING_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
