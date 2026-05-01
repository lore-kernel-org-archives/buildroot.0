Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C4CCD3424
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 615BB425E3;
	Fri,  1 May 2026 12:45:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iFCDe5ms1kpF; Fri,  1 May 2026 12:45:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF9EF4243E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639528;
	bh=lnT0Ik745f/oMI0k6ImgMoila1M0tLSso9xVD1Fr/f8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KCJHJXNVQO2OSTAKBbNsXR4Oj/9PPnagjwDpkFaV6Uq+NBtgmozcTp9bid6fblOaO
	 z63TEACsKxNnffa0xKSExGaHyEBvBxvlZ3tP1A8O+ZfjL3fsFQIzrnSrDAvfpUjnuK
	 bnNd4fDeVdWRchPHODO+/e1J+U3a9KfqA+MfZP3//zd2uzUGcW9yL+WV9Be6fVDRxy
	 88VlCK8lS30nQL+cDCQb5S1wLlewB7uZxylYSC/hsetQlFiGW1i9FiZYojQj7rcL30
	 KRPbHrJTBdZZErkpTLe9o2hlXRLi1aWZAyuAiBqOSz2zzaJgdlYg5w3JNP/jHr/dQY
	 IfY5uIPcgLrRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF9EF4243E;
	Fri,  1 May 2026 12:45:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CCF32127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B37D7423F8
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:45:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KKj63GxEcpmT for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:45:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A4F134225F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4F134225F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A4F134225F
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:45:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8C75CA4C30A0;
 Fri,  1 May 2026 14:31:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1L-000000008NC-2imW;
 Fri, 01 May 2026 12:31:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:19 +0200
Message-ID: <20260501123100.1918951-34-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638670;
 bh=RCjorBtlWazg3kQXcUKJhcZ0DCEDUY4n+0T4HfdEIpQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=k3jyRoe9bs1imWf1+j6Ip+2wJCgfCfplYlOi8i9oVyC9VAw3TuCXUSKytqf/sYLtb
 XLbAOBgcsnmLVX3d2WCPAsezxlSmS/iqCB0Xmbzf9As8IZhtqI/iKzyvj8pogChQUl
 x0zCh89l8/eTBvXo+WDBzmxkwqxU7Ef0oKKeJb7EqsiIHGUWF7Wz87+8h1TQgVVH1w
 g59usoMEP76cvcqKJjLYeEm8WTPaNL2mVpgtN3anMMwbkbTc+/HFlO9NJVU9BoPAA3
 56BJXd21ha9a6et3q0Hu+tejRTWxu1rH1bA3hPdttc2j1S3ZMeCEgYXetD/EvuV56K
 etUYOCHQjeC2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=k3jyRoe9
Subject: [Buildroot] [PATCH 34/75] package/python-patch-ng: bump version to
 1.19.1
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

https://github.com/conan-io/python-patch-ng/releases/tag/1.19.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-patch-ng/python-patch-ng.hash | 4 ++--
 package/python-patch-ng/python-patch-ng.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-patch-ng/python-patch-ng.hash b/package/python-patch-ng/python-patch-ng.hash
index f832552c30..467423a887 100644
--- a/package/python-patch-ng/python-patch-ng.hash
+++ b/package/python-patch-ng/python-patch-ng.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/patch-ng/json
-md5  208be456725a65cb570ffd3e3589f6ba  patch-ng-1.19.0.tar.gz
-sha256  27484792f4ac1c15fe2f3e4cecf74bb9833d33b75c715b71d199f7e1e7d1f786  patch-ng-1.19.0.tar.gz
+md5  ce9a4d39c104658cbee699b6522cdf6f  patch_ng-1.19.1.tar.gz
+sha256  036a3cc00134ec53f37e92333958ee75e117f2e62a5ec2b85c7122e5e815c29e  patch_ng-1.19.1.tar.gz
 # Locally computed sha256 checksums
 sha256  d807f69dbc4f24153544ac011b741015ea47231c69fe16b1e74759f299349a78  LICENSE
diff --git a/package/python-patch-ng/python-patch-ng.mk b/package/python-patch-ng/python-patch-ng.mk
index fe24b0bc95..b5f285d106 100644
--- a/package/python-patch-ng/python-patch-ng.mk
+++ b/package/python-patch-ng/python-patch-ng.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATCH_NG_VERSION = 1.19.0
-PYTHON_PATCH_NG_SOURCE = patch-ng-$(PYTHON_PATCH_NG_VERSION).tar.gz
-PYTHON_PATCH_NG_SITE = https://files.pythonhosted.org/packages/65/bb/ebd7c6058dcfbf634986f9a8b3fb638f3269501c73701a48b7530042da5b
+PYTHON_PATCH_NG_VERSION = 1.19.1
+PYTHON_PATCH_NG_SOURCE = patch_ng-$(PYTHON_PATCH_NG_VERSION).tar.gz
+PYTHON_PATCH_NG_SITE = https://files.pythonhosted.org/packages/da/b6/8ea8095f964f93567bbe28709298b30104ad418b50d4217538387bf48f7d
 PYTHON_PATCH_NG_SETUP_TYPE = setuptools
 PYTHON_PATCH_NG_LICENSE = MIT
 PYTHON_PATCH_NG_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
