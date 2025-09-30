Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 149E9CCA468
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 10:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC104811E1;
	Tue, 30 Sep 2025 10:31:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vxXHKrjRdsAu; Tue, 30 Sep 2025 10:31:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D84A80CAE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D84A80CAE;
	Tue, 30 Sep 2025 10:31:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 57A87111
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 10:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4940F40528
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 10:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LIVAk0bpkeNB for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 10:31:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B81AE409E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B81AE409E9
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B81AE409E9
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 10:31:22 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-46e3cdc1a6aso33319725e9.1
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 03:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759228280; x=1759833080;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HWqUTcaCj5+X7thDpqC4NwZDPfNt1/V2p2JGGJflDLM=;
 b=XdniA30e47Q2txwBNeJs/F6OKoUnljKAF0TSFnRVeI2YMkK2Ev1YQNeiCRErvTIc2q
 r1dWcxEONp6fQamfEcBQFb1pOy8xWEw94J4uMJQvbTaVQNlm/k5cyIOIlLtbNx/kQMPe
 9GTpfRYA9WCiNSNfv39UAHbqiXja3KdhQb+6mux7t9J79wsPfz4eDzNo3cWAUOW+tTIl
 b/FszdsVkjOHKSDJnoDF20tQzO8+QmRUynPwoGQEem3M8YSGcn3QyQMK3d4dPfolvR3Y
 uKpdtlyoJ+x3VCI9ruvjvuUfh572drQIXWjX+CvwOHkqz82QYWzfmj1a9hN3rUlKr4gC
 ENEQ==
X-Gm-Message-State: AOJu0Yw0EmtMGNk6q8nvs20rDg7Tpui4bxeab6+FxZpYfpKpbe27MjQ4
 XWoMMtpISYh58Wnd1MQ1ev4qJq2JQlsMIHHnB7Vk4TloRoUsquFHlxhJ8PoM0c/Nhgn2taE2bjR
 5iDWp
X-Gm-Gg: ASbGnctahh7KcA0+BUhrscTewnbZimxl/xrjOVuPVCr9th9sD0Wv4ZzkmDv+oee8Vmh
 0TwssDMoG4mKiaPoW8Wr8U/Rdn/72DpCGEMWYSkCObhEfVx25M9/DBqkOeTd1SLmtgDRuhQ80+i
 5jlYSeRFWfkejHnfnAt17vj+vOY6TMQRGzTEmeG729y61rI1tTsGLLvCV5anioR7pnhrvzzhuk4
 AdMSx+gtOmUjuEEIaaWjSc3eugg1SRZE4to6xmGujdo/7RJX59gevf4erQsaJdhiGtPj6iy30Zy
 MlD3YDC9Z1bjAaO6rd+uKmknRPE4qeocS85pU5QxTg6Z2eeSRd68YIng4/zn3VZlg7PM/8WkVs8
 j+Vuj3MQkPCpMBfotpFucYzoEJIOqrMwkcP6KPDobI8pHW+bgi4Sl/US6/QiJpv870ZOfB5F2SM
 hbd/EYAp83m2eOCohjY9eplolYFwqkxA+et6B2cNLUINz7ZyXjz6Y=
X-Google-Smtp-Source: AGHT+IHYVOnpVAocl/uj5Xb42z3bvzdxMUL7qi71TwIf9qh5iwZXOm/YyS+c9UNjZCU3LI9Hu5yHpA==
X-Received: by 2002:a05:600c:c0c8:b0:46d:34cc:e9c1 with SMTP id
 5b1f17b1804b1-46e58aac9b3mr26249465e9.4.1759228280403; 
 Tue, 30 Sep 2025 03:31:20 -0700 (PDT)
Received: from dragon.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab6a514sm262842595e9.22.2025.09.30.03.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 03:31:20 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 12:31:05 +0200
Message-ID: <20250930103105.54262-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1759228280; x=1759833080; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HWqUTcaCj5+X7thDpqC4NwZDPfNt1/V2p2JGGJflDLM=;
 b=WbqvceBzvhtgrE+8H1Nbtpl3wh1XYccCN47lkCAoBIrtduDk/mVLzZGbfOZ2Ma0rpY
 cvHgtHTEsQnCfnT2qh/yShrdXV1zFc/AIO7C6pPmcfNoRlYl0qKOSA5BOq/PFr7S0vz0
 ESi5RlaNhI49poejNZeKWEZKm5a6rLwkUuwsMrN4BkKNoOBFxMNFZtOiUsbOzJIJaJP6
 3xY2Z1lU/cjvjPTwTXrtrft7mOplFHzPifog0qVAwvAoO4GCv+7wetferTcEpBH8Jphn
 p6eZZExEqeNUCS6Vnmwkn4ml+g2u03sE/ythVJ+hC/JA0KqKfj64jqD4H4BZ0ARd/ygX
 9gvQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=WbqvceBz
Subject: [Buildroot] [PATCH] package/python-pip: security bump to v25.2
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following vulnerability:
- CVE-2025-8869:
    When extracting a tar archive pip may not check symbolic links point
    into the extraction directory if the tarfile module doesn't implement
    PEP 706. Note that upgrading pip to a "fixed" version for this
    vulnerability doesn't fix all known vulnerabilities that are
    remediated by using a Python version that implements PEP 706.  Note
    that this is a vulnerability in pip's fallback implementation of tar
    extraction for Python versions that don't implement PEP 706 and
    therefore are not secure to all vulnerabilities in the Python
    'tarfile' module. If you're using a Python version that implements PEP
    706 then pip doesn't use the "vulnerable" fallback code.  Mitigations
    include upgrading to a version of pip that includes the fix, upgrading
    to a Python version that implements PEP 706 (Python >=3.9.17,
    >=3.10.12, >=3.11.4, or >=3.12), applying the linked patch, or
    inspecting source distributions (sdists) before installation as is
    already a best-practice.
    https://www.cve.org/CVERecord?id=CVE-2025-8869

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/python-pip/python-pip.hash | 4 ++--
 package/python-pip/python-pip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index f6b11ee26a..ad70f0da7b 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5  c698f55e2015dc7dbb5b77c6df1cc88a  pip-25.0.tar.gz
-sha256  8e0a97f7b4c47ae4a494560da84775e9e2f671d415d8d828e052efefb206b30b  pip-25.0.tar.gz
+md5  6d109857fa69274dacfc1d6528471eb5  pip-25.2.tar.gz
+sha256  578283f006390f85bb6282dffb876454593d637f5d1be494b5202ce4877e71f2  pip-25.2.tar.gz
 # Locally computed sha256 checksums
 sha256  634300a669d49aeae65b12c6c48c924c51a4cdf3d1ff086dc3456dc8bcaa2104  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 9ffc0b66ea..42231e254c 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 25.0
+PYTHON_PIP_VERSION = 25.2
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
 PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/47/3e/68beeeeb306ea20ffd30b3ed993f531d16cd884ec4f60c9b1e238f69f2af
 PYTHON_PIP_SETUP_TYPE = setuptools
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
