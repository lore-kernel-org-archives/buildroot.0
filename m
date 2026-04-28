Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA0BFF885D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 07:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F7BC40A8B;
	Tue, 28 Apr 2026 07:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cNthJrMSdoP9; Tue, 28 Apr 2026 07:36:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F81D40A99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777361803;
	bh=FmAHhbAqR1eRAiMu18QgboLgMsNLMe+VGMuv99UxgFc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=k3PCeGvsr0p+bq0ss0OBrY/8NKzo5WQSBgDFgD435QcwA3cyVjmNp9Qa0ISni8AiI
	 9ynBCStTokI4vhfFyq0fhjZd6Lu65yDVpX87YY9bzL+uX8mgnwpgq5Vx4yzIG/WzXk
	 j/o3sUZXlCWzbaxMFX4Ya8NaJzyb+HNrdX1+sr2u4Q8zdWFzEj8qzAinfTg41zkahi
	 u5nlb57PYjcH9nmQU9Ov181dd8mHidicQgw06ysziJse5ZAwiQjfu6yh9qhEoLMj9e
	 GOEVBMtVwnCJp9IaYOsa+uLi5IN32MYGTViuwgaJ4BbkNawi4fS8/M6EyRCWLabFpA
	 nQnaNdtoD0Z+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F81D40A99;
	Tue, 28 Apr 2026 07:36:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 96DA7231
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 07:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C0224060E
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 07:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZHX8LAYN5A5o for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 07:36:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.10.208.50;
 helo=mout-b-105.mailbox.org; envelope-from=manuel.diener@oss.othermo.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 652FA405F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 652FA405F0
Received: from mout-b-105.mailbox.org (mout-b-105.mailbox.org [195.10.208.50])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 652FA405F0
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 07:36:40 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-b-105.mailbox.org (Postfix) with ESMTPS id 4g4XLR60svz9y8Z;
 Tue, 28 Apr 2026 09:36:31 +0200 (CEST)
From: Manuel Diener <manuel.diener@oss.othermo.de>
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 09:35:41 +0200
Message-ID: <20260428073542.1027653-3-manuel.diener@oss.othermo.de>
In-Reply-To: <20260428073542.1027653-1-manuel.diener@oss.othermo.de>
References: <20260428073542.1027653-1-manuel.diener@oss.othermo.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.othermo.de; s=MBO0001; t=1777361791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YQbLxcVSH/mo6IGJKuis59fglwcTlFEGhiaHrH6F+tU=;
 b=BTtijzmnva7JestxdWVFkTo3jcwlXAnUTYKZWkGIbFJ91GFdbpDLhXRGTKN0l86aP0DIx2
 qgzWgRhauEmHyJmV7UYB5wjAhg95b3thccKqZ206rblB0m8dVIKiebAEa2BGCvwyHMQi5E
 oNSItBapl6b+ByobnaCjeV/XQ/eR/bhr66+ksxEpDiLnXsRREi0FpcCveZfDN7/MIinLHG
 5VK1svkbBrosPu0tXvSQkvx7O0Pn/cJTi6AlThm/lAaurNmxkZyctoIQDxvqc0ISB5brPx
 ahNxIJBnsxLy6E6RuRRbqcChNgUj+c4dX6nIHMCY3lRk96X0dprDcS6K2/cSuA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=BTtijzmn
Subject: [Buildroot] [PATCH 3/3] package/python-pydantic-settings: bump to
 version 2.14.0
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
 Manuel Diener <manuel.diener@oss.othermo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/pydantic/pydantic-settings/releases/tag/v2.14.0

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
---
 .../python-pydantic-settings/python-pydantic-settings.hash    | 4 ++--
 package/python-pydantic-settings/python-pydantic-settings.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic-settings/python-pydantic-settings.hash b/package/python-pydantic-settings/python-pydantic-settings.hash
index 7d450bd9a3..8b4850c569 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.hash
+++ b/package/python-pydantic-settings/python-pydantic-settings.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic-settings/json
-md5  11f7d886512c22a68c740c3e2b58651f  pydantic_settings-2.13.1.tar.gz
-sha256  b4c11847b15237fb0171e1462bf540e294affb9b86db4d9aa5c01730bdbe4025  pydantic_settings-2.13.1.tar.gz
+md5  08bd879ddfc1547b9cf1a32a90cfa86e  pydantic_settings-2.14.0.tar.gz
+sha256  24285fd4b0e0c06507dd9fdfd331ee23794305352aaec8fc4eb92d4047aeb67d  pydantic_settings-2.14.0.tar.gz
 # Locally computed sha256 checksums
 sha256  eb355a753e020346d33d83bf9769135b89fc610568ac531a01c295bcee7fd998  LICENSE
diff --git a/package/python-pydantic-settings/python-pydantic-settings.mk b/package/python-pydantic-settings/python-pydantic-settings.mk
index 8ed968601d..10d79b46b7 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.mk
+++ b/package/python-pydantic-settings/python-pydantic-settings.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_SETTINGS_VERSION = 2.13.1
+PYTHON_PYDANTIC_SETTINGS_VERSION = 2.14.0
 PYTHON_PYDANTIC_SETTINGS_SOURCE = pydantic_settings-$(PYTHON_PYDANTIC_SETTINGS_VERSION).tar.gz
-PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/52/6d/fffca34caecc4a3f97bda81b2098da5e8ab7efc9a66e819074a11955d87e
+PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/42/98/c8345dccdc31de4228c039a98f6467a941e39558da41c1744fbe29fa5666
 PYTHON_PYDANTIC_SETTINGS_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_SETTINGS_LICENSE = MIT
 PYTHON_PYDANTIC_SETTINGS_LICENSE_FILES = LICENSE
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
