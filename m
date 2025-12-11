Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3617ED43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 540B341026;
	Thu, 11 Dec 2025 19:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7aAjJrYj_MyQ; Thu, 11 Dec 2025 19:20:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DB4541025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765480801;
	bh=V1vqRFLxdQy774JEu94O2Yxo1vpYfnj11eTSF/a7VO8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=CvwBwMsyIlbzroq0ohdBBk917pN+BjDH14bCI1qli2IHmmf7HKJAp2bbi8pNAFGfm
	 fjE78CrQ9bh1eyh7RjQpU3VJhRVxx44PTMAiquyT2BD1eV44ASUtMn6Bh8CNzWVA0u
	 YXiEdxpzTIAUx+KZ91qi2dQnjY0fpsjlUz7ITbFhLHzjwP1DaBNq+Q2tUoUGyTm19W
	 73loC3GzDsKdoRliAeJb/RHFv6oG+YoW5C47ZxmwHSPujmr72YhLSQPNkzOp6EdBJK
	 qbNOnaTUZCcI/HVXFJk9/iMmlFqvZVESR7Qvq18FlAd781bO5n96+1+ahozgPuBHNc
	 XAbxrOxoFV/1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DB4541025;
	Thu, 11 Dec 2025 19:20:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D48F42C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAE0281003
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kp7Z85SZoMRh for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:19:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2DD3981099
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DD3981099
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DD3981099
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:19:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 41E30A4C231C;
 Thu, 11 Dec 2025 20:19:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34914)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vTmCg-0000000022H-0npn;
 Thu, 11 Dec 2025 19:19:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:19:53 +0100
Message-ID: <20251211191953.3189198-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765480794;
 bh=VY3VG8FrhCmEu79aG3U9pDElBjHyjzDfJNtVhpJQmoo=;
 h=From:To:Cc:Subject:Date:From;
 b=BwD9JY4hgc6XwJ2OCmFWzKFZwFXpxc5kA281yIjDIGXrqksIJ9pg+s89w/zOCu6mk
 wq1iQpOBek7bakwli0zuinr3tg01znUO5yIxoQXiYpemDFa30pEkg4jJdD0/l4fKS1
 1kQ828ufrPxW1wBTkHYAwdVvi1/IvFTiKF61h5x/tUCx5ny1O41YN9e6JY+yY0voON
 APB5xLc+HarfsY1JbatTb7ebfmTE/wZe8Wm+QjTSAjHfOVSc35PLAU41NfzOfx5y1m
 H59P3KbE8iCDDZ5cvgQJUQFPwvmCrO1TJvpOF8KbRI4QRAED9NV/VVlUrhp2tdfoIr
 M2ZNOW3l4kMcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=BwD9JY4h
Subject: [Buildroot] [PATCH 1/1] package/python-fonttools: security bump
 version to 4.61.0
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

https://github.com/fonttools/fonttools/releases/tag/4.61.0

Fixes CVE-2025-66034:
https://github.com/fonttools/fonttools/security/advisories/GHSA-768j-98cg-p3fv

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-fonttools/python-fonttools.hash | 4 ++--
 package/python-fonttools/python-fonttools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index 49f1ca0235..b83663e8fb 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  b4b79d23865d50084d4c05defa186fc9  fonttools-4.60.1.tar.gz
-sha256  ef00af0439ebfee806b25f24c8f92109157ff3fac5731dc7867957812e87b8d9  fonttools-4.60.1.tar.gz
+md5  55a7d3d40e191410bbe604d0d795baa4  fonttools-4.61.0.tar.gz
+sha256  ec520a1f0c7758d7a858a00f090c1745f6cde6a7c5e76fb70ea4044a15f712e7  fonttools-4.61.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index 3094b1985c..592ef51354 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.60.1
+PYTHON_FONTTOOLS_VERSION = 4.61.0
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).tar.gz
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/4b/42/97a13e47a1e51a5a7142475bbcf5107fe3a68fc34aef331c897d5fb98ad0
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/33/f9/0e84d593c0e12244150280a630999835a64f2852276161b62a0f98318de0
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
