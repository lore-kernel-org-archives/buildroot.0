Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCC1D609DE
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 19:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F77B61059;
	Tue, 16 Dec 2025 19:50:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O68yTPr14inY; Tue, 16 Dec 2025 19:50:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4A726104B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765914607;
	bh=DLxlJIOSw9VITCNDQly8cNiviGzqa+kvDHYqobYabiQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=pz6zRujCPdgzxfoqB32WPzhxaH4KHHjXUMANgr++KQb5BVyIuvhN3slr/Y9BAh+r0
	 W+d79JGKD5IB2JKVaHXma+fxDG8xeR4hLSPj/RGgJBp8eKFbqXTDfJfZjWdru50FGx
	 tk7g8f8hEuyD2tMV6MGVMBT170OPsGBZXA+xlVq1Zz1aeMKYz7SqGXLo2VhdrsBQjs
	 jv2uoA4U0dIDu0I2J1SXkvjlfKZgg4wNT9mFfXWsdFNhYw78zqJ9oAu7hw455JbUGv
	 u9pN1fWUJ+iWJj2Gz1LfVZudrPM5zC3td42oXdj1R1ITHduF+v5U3GfiRB4l42qxYR
	 3NO/Y7JXx3WUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4A726104B;
	Tue, 16 Dec 2025 19:50:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 008C4372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8282404EF
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:50:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UnqyGS17I-Sn for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 19:50:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D79C140B60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D79C140B60
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D79C140B60
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:50:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 02A2EA4C2DF9;
 Tue, 16 Dec 2025 20:50:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47630)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVb3a-000000001j6-1c9F;
 Tue, 16 Dec 2025 19:50:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 20:50:01 +0100
Message-ID: <20251216195002.3031273-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765914603;
 bh=qIb2jebmFP76w402hEaCkDwSjw3Xow8Thfs2yYPwBDc=;
 h=From:To:Cc:Subject:Date:From;
 b=FE+PwL2OSJTzs0rGjBC9+3vyZsl8jPrZJrRtR5jN20U0f7A1OpN4qNaC7rprBnKas
 InJCm9TZIETPYLVZkuL5Ofinmy54kXWB/3DZXFj1ER3ZX/9e0YvJkMPy4OEb0tCm8C
 Os4nnxk2R7XMqbAzAtc30HBHGUtgwhwsSaSeiaY9zl/hd5DKRQZLetKPgDMI4QUo/b
 cq3cPC3m+6YoN7ExNMTc7C0vP4nrM6A6X8sg6JqHqerlVK88gN0GkSSXBnNHoT5BL+
 SsKsXGGdKcMsZ6x6Ca+rxajtB6/v1u1PI66TyWP5awt+Nn2LzjHZ7Oj5Qh3Nc6TVnl
 mUgg9qm6eGA6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=FE+PwL2O
Subject: [Buildroot] [PATCH 1/2] package/python-aiodns: bump version to 3.6.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/aio-libs/aiodns/releases/tag/v3.6.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-aiodns/python-aiodns.hash | 4 ++--
 package/python-aiodns/python-aiodns.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiodns/python-aiodns.hash b/package/python-aiodns/python-aiodns.hash
index 8e3e66d0f1..a4a242670a 100644
--- a/package/python-aiodns/python-aiodns.hash
+++ b/package/python-aiodns/python-aiodns.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiodns/json
-md5  dd1c76c0b2897589ae9787530cc0e468  aiodns-3.6.0.tar.gz
-sha256  9b0ef54339e6687cdbd39a7d73d7de2467cb5c115281da28f2598f058633dac8  aiodns-3.6.0.tar.gz
+md5  c1552fe562a1f9c98ea4c2311a2c75ba  aiodns-3.6.1.tar.gz
+sha256  b0e9ce98718a5b8f7ca8cd16fc393163374bc2412236b91f6c851d066e3324b6  aiodns-3.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3e91cfa76821ab70d22998136d674d20ae888463a7e8a7f377166cfe1ee64feb  LICENSE
diff --git a/package/python-aiodns/python-aiodns.mk b/package/python-aiodns/python-aiodns.mk
index d0a1ed6e1e..7476c76b72 100644
--- a/package/python-aiodns/python-aiodns.mk
+++ b/package/python-aiodns/python-aiodns.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIODNS_VERSION = 3.6.0
+PYTHON_AIODNS_VERSION = 3.6.1
 PYTHON_AIODNS_SOURCE = aiodns-$(PYTHON_AIODNS_VERSION).tar.gz
-PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/e6/11/238e97cbf5c1c0f725d590a092e0618dcdc50f44dbd1e2a926fae27e6f06
+PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/85/2f/9d1ee4f937addda60220f47925dac6c6b3782f6851fd578987284a8d2491
 PYTHON_AIODNS_SETUP_TYPE = setuptools
 PYTHON_AIODNS_LICENSE = MIT
 PYTHON_AIODNS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
