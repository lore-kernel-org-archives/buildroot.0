Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE50BCCD184
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 18:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6162811D5;
	Sun, 12 Oct 2025 18:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AKi4kg5g8nBp; Sun, 12 Oct 2025 18:21:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9320811E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9320811E3;
	Sun, 12 Oct 2025 18:21:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B493DBC
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6C0B4008C
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1_kzbnWBojOv for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 18:21:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A126540082
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A126540082
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A126540082
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:21:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4DBC5A4C670A;
 Sun, 12 Oct 2025 20:20:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45202)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v80g5-000000000yp-1JGW;
 Sun, 12 Oct 2025 18:20:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 20:20:01 +0200
Message-ID: <20251012182016.2711834-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251012182016.2711834-1-bernd@kuhls.net>
References: <20251012182016.2711834-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760293218;
 bh=e2+2nOuI+MkdSW/Q7qogDtumTfNFUzoNn/Ddy7E36W0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=L+2VkAk1hWY78cMFYATCF3xaKJrC+SQx5gnW+VXpN+sGRoItiZ7Ol7YVNR7h0vW0/
 XGmFhVH+wXhracChCs0XxkbkOmNdHxaz0lf2ZnM8otL6ORXDSVwN7bDzS1UMp/VBj/
 39sSnR7cRzASuRVz+cyijUvCoRf+fre6RfzqYJfsPq+eJaZ+l884yFPhzKVzMYPpWE
 yMICm3xQx/umSzy3HKUkB1DaDIvFrtMH6cZCQM90eSSAPL1zCvgBFqosPoT3Vhu9iy
 JWAtxWc8VkCuA1lUFot+njF0vUcTfdA4iGp4keQWWOn0ffL0uKcfnbzw3rSD1t7XrK
 GWsaNtLm5NdBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=L+2VkAk1
Subject: [Buildroot] [PATCH 06/21] package/python-bitarray: bump version to
 3.7.2
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
Cc: Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Grzegorz Blach <grzegorz@blach.pl>,
 James Hilliard <james.hilliard1@gmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/ilanschnell/bitarray/blob/3.7.2/CHANGE_LOG

Updated license hash due to copyright year bump:
https://github.com/ilanschnell/bitarray/commit/0d64d33960344c5e718b78f26d8124ab6626b3a2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-bitarray/python-bitarray.hash | 6 +++---
 package/python-bitarray/python-bitarray.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-bitarray/python-bitarray.hash b/package/python-bitarray/python-bitarray.hash
index 1a75424e02..bcde731b60 100644
--- a/package/python-bitarray/python-bitarray.hash
+++ b/package/python-bitarray/python-bitarray.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bitarray/json
-md5  2a23854c5c9c777625996456c9c88883  bitarray-3.0.0.tar.gz
-sha256  a2083dc20f0d828a7cdf7a16b20dae56aab0f43dc4f347a3b3039f6577992b03  bitarray-3.0.0.tar.gz
+md5  043d05ace953a31bee06a00f2c6c3a3d  bitarray-3.7.2.tar.gz
+sha256  27a59bb7c64c0d094057a3536e15fdd693f8520771ee75d9344b82d0a5ade2d0  bitarray-3.7.2.tar.gz
 # Locally computed sha256 checksums
-sha256  6b5e04f6e0462e1b97be833f9d65e66cd5eceb3283f4a6f532261087d0ab1233  LICENSE
+sha256  a554c25090ad5a5ea8ad35629dacffbb4d887234b011550218a5a1f9090e5274  LICENSE
diff --git a/package/python-bitarray/python-bitarray.mk b/package/python-bitarray/python-bitarray.mk
index 5f47976a41..1aec908619 100644
--- a/package/python-bitarray/python-bitarray.mk
+++ b/package/python-bitarray/python-bitarray.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BITARRAY_VERSION = 3.0.0
+PYTHON_BITARRAY_VERSION = 3.7.2
 PYTHON_BITARRAY_SOURCE = bitarray-$(PYTHON_BITARRAY_VERSION).tar.gz
-PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/85/62/dcfac53d22ef7e904ed10a8e710a36391d2d6753c34c869b51bfc5e4ad54
+PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/e8/c1/644ea86b6f1a0864f656a3b3ee5bf8c29daa895cb3233942315fe065ea3a
 PYTHON_BITARRAY_SETUP_TYPE = setuptools
 PYTHON_BITARRAY_LICENSE = Python-2.0
 PYTHON_BITARRAY_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
