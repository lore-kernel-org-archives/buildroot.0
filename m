Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BC3C3ABD8
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 15:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F1D2836A7;
	Wed, 14 May 2025 15:13:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yivwZr1T8bfw; Wed, 14 May 2025 15:13:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FADD82F31
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FADD82F31;
	Wed, 14 May 2025 15:13:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EE1DE153
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF3A46081B
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:13:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Es1e1J4tjsR for <buildroot@buildroot.org>;
 Wed, 14 May 2025 15:13:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E4FAF6077F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4FAF6077F
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E4FAF6077F
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:13:01 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id F1A4E2C80169;
 Wed, 14 May 2025 17:12:59 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 14 May 2025 17:12:39 +0200
Message-ID: <20250514151255.2316205-5-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514151255.2316205-1-buildroot@bubu1.eu>
References: <20250514151255.2316205-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747235580; bh=ouHMOtuN5qbfWM9uW9iJ6zoMHiM9M4+XAjYzJQX2EB4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=jz7cUL1jlQzOs3nbqlqzxVRY3G4E2cEulUytwLIDpDb4UwePIGmxAM9PAgZ8ac1LK
 MGe/oIa1A8VuMBVHJIH16IPz7l0LTE1M/P7ueKHwJlJVZsuj9i7Wx1QuK88rdCEsOr
 PsBfas/Au8a9X5ZVo6s5yQHvZN/CoLhtwZEUuV6GtHyQale7LCyE6WiO8Hcqv2hM1H
 ZDSoCY678W4Ukk2c1yUlAQKbCOpzDsm9tHwSWbHROAtlEWvZhx3gJIpu/texcFm5F5
 movEfTKExHnMIJ/1KjputD0uexeJAgUXonGeIVU3m3BcoE+yspxQ6Ic2xTI1xRcrGB
 sb3hpGzDsWy6A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=jz7cUL1j
Subject: [Buildroot] [PATCH v2 05/12] package/python-pydantic-core: bump to
 2.34.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
v1 -> v2: fix typo in commit title
---
 package/python-pydantic-core/Config.in                 | 3 ++-
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-pydantic-core/python-pydantic-core.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic-core/Config.in b/package/python-pydantic-core/Config.in
index 3eeb1844a2..3f985ae4da 100644
--- a/package/python-pydantic-core/Config.in
+++ b/package/python-pydantic-core/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_PYDANTIC_CORE
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
-	  Core validation logic for pydantic written in rust.
+	  Core functionality for Pydantic validation and
+	  serialization.
 
 	  https://github.com/pydantic/pydantic-core
diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index d310e8ae02..e2b5d7ba60 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  94ebefcb84127e3a950129dc2485e046ece91d3a7f0959c6de124eca5573389d  python-pydantic-core-2.29.0-cargo2.tar.gz
+sha256  ef136a7b538eea0cd9b8177a1136a035b62ab1b789ead2f285d811478cb28cdd  python-pydantic-core-2.34.1-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index c27967689d..48fd4960af 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_CORE_VERSION = 2.29.0
+PYTHON_PYDANTIC_CORE_VERSION = 2.34.1
 PYTHON_PYDANTIC_CORE_SOURCE_PYPI = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
-PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/79/f6/904edea98c98c09b8d618d619749af19a50ea5a71b9199ee2131a5a03dfb
 PYTHON_PYDANTIC_CORE_SITE = $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
+PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/42/fa/5f682f3db14e14f7b5b7f5008ac24594b93943d1da4facbacff5876624cf
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
 PYTHON_PYDANTIC_CORE_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
