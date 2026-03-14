Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629DA10706DB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3091C410D7;
	Sat, 14 Mar 2026 14:09:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Xey4wzycNaZ; Sat, 14 Mar 2026 14:09:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5828F4105C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497389;
	bh=rrsZlhaaFRJNAZNipZ1NEPs9mf+GW1cXwmdMMul4lNM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VqujAwYqarD5NZ0no8fpAVxYjc8YbCG09t4645gA6PEf/ejvhfx+tJWzXzm8MTp+g
	 OziBQMn8uSqjhiipaPKQli1jrPOQbn2eqC/FGmQSit0IsBxTouKle99xAVel9mBAoG
	 zjfY+z8FOrRL+7oZGV3hPXEgf700tN5JMlWdF5z5JPvZfofdLIB49BkBsPSWBFu9qC
	 qTMqAGZVEUSeR1OkVJy2RywtFwKx5R3Q8MHhjiQ1sR9dG4Sn7YRsKKw0fUCAtJ6Ecw
	 LRjfAggR18V5Z61bg5GWP5z0h07do2g/X5YzO8KsxsCbIkFKrm/xwMDifIbYJemYJn
	 cQk1DZ+KN0XQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5828F4105C;
	Sat, 14 Mar 2026 14:09:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E94DC201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB349410E6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:09:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XAgFxH4dxMG9 for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:09:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CF5294105C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF5294105C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF5294105C
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:09:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 77691A4C1426;
 Sat, 14 Mar 2026 15:06:47 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdW-000000003UM-3hRH;
 Sat, 14 Mar 2026 14:06:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:06:02 +0100
Message-ID: <20260314140633.2967249-66-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497207;
 bh=oZN8grGwxttJTQU/U1nuc+jQKobgsre32ODEMSQ7Lw4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=qExtR0pD93Rfu4qojYVVRlgRGKIpGemups3NW9z5k6WTwJRIZyIGrP+JacLvuZElK
 BvH944mvfCedXZw3ahdp/0d8XZLc7jtOF/35vUymPLCb5n01Rh9e42KkGCwNNsVf6p
 fYx+2R61VaazlSQPYGQ4lauxPJWHP4/hev+LRbMHNsdGIJwhod7LKfLv20fklRIJ1g
 Lp5IjYChjJOjo87k/+mBJRBkGLGUJkHH13eXiutrhM9pgok92ZHKOPG5SlF9Kimfml
 H48Q879rOjWj2fhz3D90g3VQaH/MhgVuK0Ln7Cci/wVdzWkp0NHJH/JQKiM+CUI0oU
 oW/uai+/FvEiQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=qExtR0pD
Subject: [Buildroot] [PATCH 66/96] package/python-setuptools: bump version
 to 82.0.1
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

https://github.com/pypa/setuptools/blob/v82.0.1/NEWS.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index 0236a13999..12c8ac206e 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools/json
-md5  6e65b88d2466b35e86e5187b99502b1c  setuptools-82.0.0.tar.gz
-sha256  22e0a2d69474c6ae4feb01951cb69d515ed23728cf96d05513d36e42b62b37cb  setuptools-82.0.0.tar.gz
+md5  2d7f1881d7a06abe7fa69412de30cda5  setuptools-82.0.1.tar.gz
+sha256  7d872682c5d01cfde07da7bccc7b65469d3dca203318515ada1de5eda35efbf9  setuptools-82.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 3c94931fbe..fec9153c6e 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 82.0.0
+PYTHON_SETUPTOOLS_VERSION = 82.0.1
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/82/f3/748f4d6f65d1756b9ae577f329c951cda23fb900e4de9f70900ced962085
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/4f/db/cfac1baf10650ab4d1c111714410d2fbb77ac5a616db26775db562c8fab2
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
