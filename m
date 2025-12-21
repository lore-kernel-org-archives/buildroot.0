Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C719CE67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E4F78127C;
	Sun, 21 Dec 2025 22:30:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2XcKt2NC7wJ9; Sun, 21 Dec 2025 22:30:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3333681589
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766356207;
	bh=90LPaVjthWcv8nNyKCS1FYHuK8G6bUCAsGmPKFRLXeI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Lk/2ehIHHMpcKB0V6l+xfxy8L8ynY+8TNFIgg8ynBjMwwSkZY6REXDMWjXrFK/ot6
	 ZDUcGP4BWf7SJ+2Oj1nAaRUgDgGPUnjdaq88TKaB/HhOOlCHo3X/XlZAZbnWVVXAAX
	 uFz6eDku93dv/w1GJYYF5RFYhyVzEF1ixtJcDJ5k8y9Z2Bn6liMuf82QLPTSjNg02K
	 VbgfBfFvK+q1Pl2+/rk3GfHPUGSD6Ei6c4paId/NDB3vzgkebtKFw6ca91PXYhmoE3
	 XfQ74bBrz6ouzGZ8soiJPIRqYkPgFHKZ/8PminwsJGnbEA+pHEWgAsjXr68X4aE5Nj
	 OzvfupbFYNfxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3333681589;
	Sun, 21 Dec 2025 22:30:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EAE1195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 358F4407BA
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7YzaHU2bBGXU for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:30:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CF477407A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF477407A4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF477407A4
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:30:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5F7C2A4C4C64;
 Sun, 21 Dec 2025 23:30:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46252)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXRw8-000000004xC-3S7l;
 Sun, 21 Dec 2025 22:30:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:29:55 +0100
Message-ID: <20251221223000.184312-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221223000.184312-1-bernd@kuhls.net>
References: <20251221223000.184312-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766356201;
 bh=bKQlmP2/cUZJbLbuLQBbpDzv5MNgpozgE1/3s5dWoo4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pU1e6uRPo8PCxJBA38+16IikL99cXW+rwY+iXfQYBkKop6c58SwO85zHtz18zw5jF
 weJvmyIDA0cBTr9NtGJR8uJ/BWxcr8X+OO8nDLfl7i+WU3BE+p1hXrFUrLjp8p3c5R
 oGnesy41bnXmthtkaPX3IKdu/WKTcV/8gsczXYv3D4DHhzS3Tihl5gdUcstJ8F7Nte
 Y5X6CIZxZlM+ZBVN4Ptfm9b0JJsWcte2SJZXT4qYsBzBIIexT7n8ZxSXYpYG3MohfG
 z15ZggnYD+5PXT/zdQAfjux6VAei1NJmpCjyd1jvHi41xYBSoQVNz0KjmkzLVok106
 GU6gL+RULR/MA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=pU1e6uRP
Subject: [Buildroot] [PATCH 2/7] package/python-pbr: bump version to 7.0.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://docs.openstack.org/pbr/latest/user/history.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pbr/python-pbr.hash | 4 ++--
 package/python-pbr/python-pbr.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pbr/python-pbr.hash b/package/python-pbr/python-pbr.hash
index 58503eaf11..797e4ce94f 100644
--- a/package/python-pbr/python-pbr.hash
+++ b/package/python-pbr/python-pbr.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pbr/json
-md5  64cd498740ec05994ef0592c73c351c5  pbr-7.0.1.tar.gz
-sha256  3ecbcb11d2b8551588ec816b3756b1eb4394186c3b689b17e04850dfc20f7e57  pbr-7.0.1.tar.gz
+md5  5e6b4341677c4d330637add000f59fdc  pbr-7.0.3.tar.gz
+sha256  b46004ec30a5324672683ec848aed9e8fc500b0d261d40a3229c2d2bbfcedc29  pbr-7.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  LICENSE
 sha256  eb4a8c8791f6caab1cf36df26db2b6f4e2ddda52657b060ff7f02abc63910aef  pbr/tests/testpackage/LICENSE.txt
diff --git a/package/python-pbr/python-pbr.mk b/package/python-pbr/python-pbr.mk
index ec530ded04..9b3d34c4e8 100644
--- a/package/python-pbr/python-pbr.mk
+++ b/package/python-pbr/python-pbr.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PBR_VERSION = 7.0.1
+PYTHON_PBR_VERSION = 7.0.3
 PYTHON_PBR_SOURCE = pbr-$(PYTHON_PBR_VERSION).tar.gz
-PYTHON_PBR_SITE = https://files.pythonhosted.org/packages/ad/8d/23253ab92d4731eb34383a69b39568ca63a1685bec1e9946e91a32fc87ad
+PYTHON_PBR_SITE = https://files.pythonhosted.org/packages/5e/ab/1de9a4f730edde1bdbbc2b8d19f8fa326f036b4f18b2f72cfbea7dc53c26
 PYTHON_PBR_SETUP_TYPE = setuptools
 PYTHON_PBR_LICENSE = Apache-2.0 (module), BSD-3-Clause (test package)
 PYTHON_PBR_LICENSE_FILES = LICENSE pbr/tests/testpackage/LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
