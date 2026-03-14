Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B68E10706DF
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBA8240FB4;
	Sat, 14 Mar 2026 14:22:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mPaiYQEVPTxx; Sat, 14 Mar 2026 14:22:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 182B94101E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773498150;
	bh=cL9BRK3pYZXaRjXTFcPEZxifO+j1+BroJaPGf+n4sR0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Dh0I2eKcz5x7uVOGos43V1smZ+J2HWLmEd+vpT+S9QJC82dwGtFFAQCSWlOINdPbp
	 gEoNgPwcfUKhDWHSaWOb/WbrkO0IfviBAceo5r05NW4b5Px6Yx06+TTBkSs2DZ6u4A
	 N3ec96gw+qZNb5nlugrgs9pO+uuodgy+WKwhmwM8rEmpGsMXC5WEJmTbeLENoXzZSe
	 1J4KeT4kflczpMMW+cjJFW0cWaAUHU3I0ruvgfra163mnaMmU1ADwTrtrX+8FELfau
	 uM7/Ca8j3R2ZHJAUs5CdPNnX26dqQAQocKRglopCyVtKKZlw3oSsmZgx1YK8zmOutG
	 b+LZXzWH6E8aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 182B94101E;
	Sat, 14 Mar 2026 14:22:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B82471B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E2DF80BB6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:22:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j4cU5PfM6a5l for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:22:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 943A980BAA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 943A980BAA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 943A980BAA
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:22:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AEF48A4C1A22;
 Sat, 14 Mar 2026 15:07:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdU-000000003UM-1GYP;
 Sat, 14 Mar 2026 14:06:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:33 +0100
Message-ID: <20260314140633.2967249-37-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497224;
 bh=r/uGFEs7MvBEVzzucs0Mqbr211Vx39zOOvUV4+g3TaQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=JjZlWfpW5dom2nj3Pr14YbKjeVINIHgN1OS+Ks0BLpjkNS31Y1ojs6Xe6ci4V2jJr
 eSIzy9NF0beL/2noYYCf+47+hf/K2D7SvPmOBBeYBaqEYaZBceF0t67ylxoaXeux7n
 Th+4NiurK7n4eUWVBPhmfKPuSXlAkF7b+MRb3mA6tkfaJpawE6bk4bBKM1GR199imK
 Z02VujTpF73matb1dz8lIl9qlxU+2jzOErtUJdSMlxS42emCSIP5bIIbFbwNbYFd0Q
 FwNaGCKVdWXUUOLdFZA7hUKsRh98jKXTV7h08aLfjD7yASAEts2SXjO76ulf0gzdXK
 KWqUkFe6xGG7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=JjZlWfpW
Subject: [Buildroot] [PATCH 37/96] package/python-packaging: bump version to
 26.0
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Ralf Dragon <hypnotoad@lindra.de>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Mauro Condarelli <mc5686@mclink.it>, Heiko Thiery <heiko.thiery@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Joseph Kogut <joseph.kogut@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Lionel Flandrin <lionel@svkt.org>, Fiona Klute <fiona.klute@gmx.de>,
 Colin Foster <colin.foster@in-advantage.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/pypa/packaging/blob/26.0/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-packaging/python-packaging.hash | 4 ++--
 package/python-packaging/python-packaging.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-packaging/python-packaging.hash b/package/python-packaging/python-packaging.hash
index f1910a7ad2..fd5ec922f7 100644
--- a/package/python-packaging/python-packaging.hash
+++ b/package/python-packaging/python-packaging.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/packaging/json
-md5  ab0ef21ddebe09d1803575120d3f99f8  packaging-25.0.tar.gz
-sha256  d443872c98d677bf60f6a1f2f8c1cb748e8fe762d2bf9d3148b5599295b0fc4f  packaging-25.0.tar.gz
+md5  2cbdbb5754f038736c3c361826c6872a  packaging-26.0.tar.gz
+sha256  00243ae351a257117b6a241061796684b084ed1c516a08c48a3f7e147a9d80b4  packaging-26.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cad1ef5bd340d73e074ba614d26f7deaca5c7940c3d8c34852e65c4909686c48  LICENSE
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.APACHE
diff --git a/package/python-packaging/python-packaging.mk b/package/python-packaging/python-packaging.mk
index 9d6847426d..c46390d0bc 100644
--- a/package/python-packaging/python-packaging.mk
+++ b/package/python-packaging/python-packaging.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PACKAGING_VERSION = 25.0
+PYTHON_PACKAGING_VERSION = 26.0
 PYTHON_PACKAGING_SOURCE = packaging-$(PYTHON_PACKAGING_VERSION).tar.gz
-PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/a1/d4/1fc4078c65507b51b96ca8f8c3ba19e6a61c8253c72794544580a7b6c24d
+PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/65/ee/299d360cdc32edc7d2cf530f3accf79c4fca01e96ffc950d8a52213bd8e4
 PYTHON_PACKAGING_SETUP_TYPE = flit
 PYTHON_PACKAGING_LICENSE = Apache-2.0 or BSD-2-Clause
 PYTHON_PACKAGING_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
