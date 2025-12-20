Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8EFE67483
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA36160E78;
	Sat, 20 Dec 2025 21:45:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ehZS2Cr_sAW; Sat, 20 Dec 2025 21:45:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1448060E21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766267133;
	bh=oYP4W10kGGq8WcLOLGVTjl6l0UThsz8+PBsPaxgdCfs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JWkH4r0mnV5B0l8y03MfVIJSmIucWecArjIWR/+sSmFPXGegpjeU8HJ71Sjxd/YyO
	 MH7SGEy+ic5KSabDlayo0bi06SprL2SPP76P8Gr/QlGGqj3cICVV3/PQNl62ZKPmds
	 01RLZ9Q83pHjx50oCpeCC5IOcilx2HrJ1495vWO4Q03Fr/paBmm/Y0yLhX5IgKX/L8
	 7kwHIa6uVOxnqW3vmlPGv7mmmU1CQtAoTstCvd0FrL7Uii8o1NSZ3VfBks9/3ROEl7
	 FN0YWgh9WpBr78t5+O5M7w/I+JBu5f11ZAnG+KE6/ueFOciB+CAG/MjVdjdAppDPNH
	 pycJeN6TLVltQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1448060E21;
	Sat, 20 Dec 2025 21:45:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 44923119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3638E406DD
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:45:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ItML_7fGYt7 for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:45:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2B7EF405A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B7EF405A3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B7EF405A3
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:45:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 80EC8A4C5012;
 Sat, 20 Dec 2025 22:42:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39116)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4iF-000000002DO-32OX;
 Sat, 20 Dec 2025 21:42:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:42:02 +0100
Message-ID: <20251220214206.1089100-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220214206.1089100-1-bernd@kuhls.net>
References: <20251220214206.1089100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266931;
 bh=TLnLA9Vz3yMJ0fSQUZ067VEqBV8PlDaCvKwfDmvz724=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Z14z6UqA2ZIDzT655HLmrHAwCxHKS9I2tMlT7FsuuuWOuSdFLWD/hm/YJwu14y24O
 JOlyRddCGKNmT0hZ8qOXVVpVUi2G/RZsdyfBSyp2X3RBEttFCRUf7DH8peGxGwHBlq
 9trBS1pN3tb/nhts7lOgfdu2TWvU1NaMy9IgmBcQrG8nMmwHMJR0ZiAitLN/HqXBG0
 lxJkeRZGD26Kbp+4eELY1b5P3ECNIied2V75IaBmF7gnvrSP16gI5zWTml8KVu2IJS
 VUrbSYSoVXRhLgdinvx2ufVUQvmtHAC991BM+tBi1ehLLt6uhltOGP4q0Z71KOcJTC
 nNXC0O3Xc43Fw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Z14z6UqA
Subject: [Buildroot] [PATCH 14/18] package/python-botocore: bump version to
 1.42.14
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
 Grzegorz Blach <grzegorz@blach.pl>, Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/boto/botocore/blob/1.42.14/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 8f2792c829..6b4d788410 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  ed7c48a9f7b0b422b71e6507ab14f957  botocore-1.42.5.tar.gz
-sha256  37bfc487f14286d9795920807fcb8318b940835b18fff6bec5253449f377136f  botocore-1.42.5.tar.gz
+md5  5905039db132a93c73a18ad9e497bb43  botocore-1.42.14.tar.gz
+sha256  cf5bebb580803c6cfd9886902ca24834b42ecaa808da14fb8cd35ad523c9f621  botocore-1.42.14.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index c3770b4833..3d7fe258bb 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.42.5
+PYTHON_BOTOCORE_VERSION = 1.42.14
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/8c/46/5b40b1deb780869ca9f0c1de47062a78a0494b53d6f9d6bad10fc38eef9d
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/35/3f/50c56f093c2c6ce6de1f579726598db1cf9a9cccd3bf8693f73b1cf5e319
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
