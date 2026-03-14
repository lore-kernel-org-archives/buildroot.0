Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3AB10706DC
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21C6341229;
	Sat, 14 Mar 2026 14:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f2_v2r4AnrS6; Sat, 14 Mar 2026 14:11:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 553AB411C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497464;
	bh=oH6Tc15EBV0UsHtm8d3l3EBxLC58Una26Lt2AC2BJwg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KfshBh/N2BicSsWq1UJcYAIG33jUSPcndwXYZ+6j3zftodben0HysDWH0DNbUN7Z4
	 rDiEgvHAs7Pj9q0f/rwGWsUtgTRbMaYBVBauqSHMYRXNAwT0pshyRg2LwMRC61BOTI
	 s7cu2CsnUgwdZuoHdCUyTpTlCjp/9zFMndJgKhSmk+riu1D61nkhij+48ynhGNCYcH
	 kFh5ycViwvLmEUVX16ZnFBNqHIo29a/6Q20FQmtHNlYUu1jITRicHsgO6nYlh76RrP
	 ZLf57PRa7fFHQ/QS2UmM6qfZtV56PrbnbSG/zBPyjbDkVXLHf6DGTU4UBDVqG5KknI
	 5NY2xy8fFd0QA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 553AB411C4;
	Sat, 14 Mar 2026 14:11:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D4A43201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D19A26066F
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:11:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UPWroGL1aiKR for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:11:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C158360640
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C158360640
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C158360640
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:11:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 61008A4C144B;
 Sat, 14 Mar 2026 15:06:49 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdX-000000003UM-1qlm;
 Sat, 14 Mar 2026 14:06:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:06:08 +0100
Message-ID: <20260314140633.2967249-72-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497209;
 bh=8K3zqz1/JJ9Qk/R2LpOZm0vfJgYeN2lrQ/yLl1j/PnU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=e9CbJmDKoMyX3D/DvpfPnDzbMeizLwc5shJEGO6udIxu/babtWD3xuGbSnzeGAELb
 4zz1ZAiMsSkKZYxFgE2QadVoTGOLrvvSSzneBsR+u9JdEi+jcQs/igEAZQSoKkYeW6
 pquwWLhOEw44CJ1+8GbLY5V9bHfAHm1P8WGlZYTuTCGmOGTfxY9hDkCYHXH9YRv3yf
 7LsKioB4VzWIfpCPUzzifcNjd1Y1bC92n2zVZw20wU3AVXPPaYumz82gxkGmvYvenp
 YFtAADet/jlSAD/elR7aD9BY+QQFKdK31nEu0X+BuyHvQfMMsTHbBwXSQFkO3Rf28r
 9AUCknlV8Y2dQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=e9CbJmDK
Subject: [Buildroot] [PATCH 72/96] package/python-tftpy: bump version to
 0.8.7
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

https://github.com/msoulier/tftpy/blob/master/ChangeLog.md

Upstream bumped the version without creating a version tag:
https://github.com/msoulier/tftpy/commit/fc93bae6c1852fa187a255095b99ddfaa5a4933e

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-tftpy/python-tftpy.hash | 4 ++--
 package/python-tftpy/python-tftpy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tftpy/python-tftpy.hash b/package/python-tftpy/python-tftpy.hash
index 93fb32621d..a8cb0ba2ec 100644
--- a/package/python-tftpy/python-tftpy.hash
+++ b/package/python-tftpy/python-tftpy.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/tftpy/json
-md5  8f81c101961282c965086fc3cd123a40  tftpy-0.8.6.tar.gz
-sha256  f616f6a43a36d481c266573608597b9dd3c7c63818415d72aa04f1d1795480ea  tftpy-0.8.6.tar.gz
+md5  c7ad05458727c1acbb1898528c4a5f0d  tftpy-0.8.7.tar.gz
+sha256  e8a5aa092dab2e1cbb9b94392036827b808dc37eb6cf1b1ab33c81957b3f5fe2  tftpy-0.8.7.tar.gz
 # Locally computed sha256 checksums
 sha256  fc1460bf698c4207a255fffb446ce21d44cb0d9a8f2ee5ad705cd40969800050  python-tftpy-0.8.5.tar.gz
 sha256  4616f0c71e62ce2e0f6cdd3aef6d3c285f8730c9304b88a9f3ce3f14c2e6f756  LICENSE
diff --git a/package/python-tftpy/python-tftpy.mk b/package/python-tftpy/python-tftpy.mk
index 5b31b4a5cf..db70a07011 100644
--- a/package/python-tftpy/python-tftpy.mk
+++ b/package/python-tftpy/python-tftpy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TFTPY_VERSION = 0.8.6
+PYTHON_TFTPY_VERSION = 0.8.7
 PYTHON_TFTPY_SOURCE = tftpy-$(PYTHON_TFTPY_VERSION).tar.gz
-PYTHON_TFTPY_SITE = https://files.pythonhosted.org/packages/68/7a/15a01d67184aa855e07eac08bfd514e008027ff198b32274f7657d8368ad
+PYTHON_TFTPY_SITE = https://files.pythonhosted.org/packages/4c/4f/92f31ab66baf5147d3c080d1a0820b68bced08a1fe5d3565868118649c81
 PYTHON_TFTPY_LICENSE = MIT
 PYTHON_TFTPY_LICENSE_FILES = LICENSE
 PYTHON_TFTPY_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
