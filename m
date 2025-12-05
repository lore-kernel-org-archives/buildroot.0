Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8081AD2F7CC
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 12:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAC8F61CB1;
	Fri,  5 Dec 2025 12:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qg8ZBZ45c6aJ; Fri,  5 Dec 2025 12:21:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A84D61C9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764937285;
	bh=HVameisuxHkhKaovNSckQaKHlA3wqxvGjEVKmUpaNS0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=nzasuvKFdAnqq1PJ0KE+1NtEtHyhpfqg/B7AvL+/BoqbxVk9buSTuZntTvbF9NOWF
	 +ERcfeiL3OXivbtJzjscxYynH5Yj2HqFJRNqDbYkvwsydrl8FnmOq80pZ2c2p8tIzv
	 UYYiLw6vtgGgiuesDG7LATMVw4oIgrZ38mFz5VbqQf0lsUKftsSVmYG2TkcvM8A1WB
	 AurVQGR7Sb5hIVV/ikYkv6/h/Vj5fURGmBT3AXrkvCWUkkkY7GyUBDxKBpbeDwLoeG
	 MwoUdS2GQmxYyczpzqYneYUgArLjCXyEzKWnMNYP9SVPIO9uijj3ijrN7IBIptMMKl
	 iqdyFdWzch5Sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A84D61C9F;
	Fri,  5 Dec 2025 12:21:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 624D51A9
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 12:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 604AE404E4
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 12:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bObXRlriVGgc for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 12:21:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2B7B0404B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B7B0404B9
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B7B0404B9
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 12:21:23 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 5CFA82C89475;
 Fri, 05 Dec 2025 13:21:20 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri,  5 Dec 2025 13:21:21 +0100
Message-ID: <20251205122122.579507-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1764937280; bh=mh2/h86JMWnCuPFkuQ4TugyG4xZQovlqPED8wYvr+HI=;
 h=From:To:Cc:Subject:Date;
 b=KNnSSJywnVisJo2zxVRcmuJN5CIxhSPSVc3aXBPk0WmSfpgsBj+rTKeq1r0oa702F
 /92zpItxW82VPLeKiKGKqrqsaBPKmYKijwtT3pcgvNuLqnCcLpYYr390N3XmLIuoxW
 JbORjcgkg47nrcVpSy605J8qaNpi9PUOZWbySI6cCr/jyChxc7yLC6Iankcc4vYbYd
 baLHZ0chrEey9tOqsdSpvJCjjc2F1t0VLlFB9htej5Wm8Kd5bNFMIEOqaIZ5VS8Kx+
 wTlD/nEx9GsymIP67hoPo/mNnkz4pVbKeIG4TwPxq2jfO8kqftP3dKeWMOoc6DBffl
 dHljy0v7g+P5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=KNnSSJyw
Subject: [Buildroot] [PATCH] package/python-pydantic: bump to 2.12.5
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release Notes: https://github.com/pydantic/pydantic-core/releases/tag/v2.41.5

No bump of pydantic-core as the version requirement didn't change.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-pydantic/python-pydantic.hash | 4 ++--
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index 587007361b..85fe1c998b 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  ae668857700cf7db44db2d3492aadf56  pydantic-2.12.4.tar.gz
-sha256  0f8cb9555000a4b5b617f66bfd2566264c4984b27589d3b845685983e8ea85ac  pydantic-2.12.4.tar.gz
+md5  beb5176b58bf266a874ab4d085cdb766  pydantic-2.12.5.tar.gz
+sha256  4d351024c75c0f085a9febbb665ce8c0c6ec5d30e903bdb6394b7ede26aebb49  pydantic-2.12.5.tar.gz
 # Locally computed sha256 checksums
 sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index 99845f8bce..dfa30f7a56 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 2.12.4
+PYTHON_PYDANTIC_VERSION = 2.12.5
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/96/ad/a17bc283d7d81837c061c49e3eaa27a45991759a1b7eae1031921c6bd924
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/69/44/36f1a6e523abc58ae5f928898e4aca2e0ea509b5aa6f6f392a5d882be928
 PYTHON_PYDANTIC_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
