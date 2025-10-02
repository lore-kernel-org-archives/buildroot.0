Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E2DCAC5B8
	for <buildroot@archiver.kernel.org>; Thu,  2 Oct 2025 15:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F2678474E;
	Thu,  2 Oct 2025 15:06:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 83egRPXBMQVd; Thu,  2 Oct 2025 15:06:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F86F84767
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F86F84767;
	Thu,  2 Oct 2025 15:06:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BEE4613D
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 15:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0F6341205
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 15:06:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id agPpl6tHGNbG for <buildroot@buildroot.org>;
 Thu,  2 Oct 2025 15:06:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F404A411C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F404A411C9
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F404A411C9
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 15:06:47 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b463f986f80so258227566b.2
 for <buildroot@buildroot.org>; Thu, 02 Oct 2025 08:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759417606; x=1760022406;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nclPoRydnkSRbSQZrp9wwibdhJQcFdQaW01rmY2M53g=;
 b=CmvRzq2YBDLeYzcHFrHKTwLugvvYePPtMisctB98OEud34UU4LWSC5lIMvjEHI6dCW
 6t8vtFejEu+XsIEGdqxyZbSAv0zrKb5jmvqFSFZy8j5YQW2UA73Cgi5aiK4H2K1a74h8
 BO549yQv3Ig1XbqTVYYf95XvpOzCmhLXjYrWQI1KmigjkVwzKGljVeCtUwH/QoIcQfS0
 O/mE32bN/vqS01z1LS+/VSi0VvF0kl8227CrQqlyBatSelibVGEI3ZS67akQfD+Spf5e
 AhwMvaQbVDhKusy9IANuSV26NimXN9plbrmElb5dkUmEylpp1q5o4QmDrEVsmSAO7XF0
 EZ3w==
X-Gm-Message-State: AOJu0YzfQy6mo3oMZfYFqsZ56vcoK0iNIUKr+8iHpJZUujdPmtJxu4PV
 slX5WLT1htWHKh/ZyEC9W9qWTe1fat4XRR+LXUbIpP9SRXTX4OYhsfC2Q00ZT/d3aumoM+mP/gO
 le8Lw
X-Gm-Gg: ASbGncsW3kBAmBEUcglVlmMb3gFAMQ+gZargJ1CTrjucB7VmwF102mtZ3uiR6Qoq12Q
 b2gYLJNFAXXZlVpiQPS3U9ApgX/AjElLN84NPeZ2tCNY4ZeadqqCQfFmIB1eChZryyrIkkNhVoe
 PraZu4F/GyrdiIA9KMWXfNpGZMQ0/HvIUp7fWTgJwC8PahxMSa+nnxCadVZNMCPMAi/kSwHH2n+
 8zw78SPUPzN9iEfDcU9sE2C+S6x5OJIhnHjWzqZbLzu3jsLnDs2puUFELHfAlxfHM6AGGrAYEwO
 Y2WvVIM4bLAfVZxCxRfqBFGPXId8amG7dIxI57xDjf7ASHcEPhcrR7uJ4Li1n8fz4J0RCuCTE4i
 S/c462hVj03QQtGmpyIaL0avZtM7ZNuuFdRuIDk6YiA+/DyJZK3fmUr54
X-Google-Smtp-Source: AGHT+IHJWgxH6+Vlvz0mVlTJAM6be9qzi4g/FJwkxPQsKYWYC3an+DKbG/sk6Wvg8MvQARKNwwQdnw==
X-Received: by 2002:a17:907:268b:b0:b46:8bad:6970 with SMTP id
 a640c23a62f3a-b46e603631emr909510566b.36.1759417605935; 
 Thu, 02 Oct 2025 08:06:45 -0700 (PDT)
Received: from dragon.home ([109.136.97.112]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6375eb397fbsm2011877a12.0.2025.10.02.08.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Oct 2025 08:06:45 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu,  2 Oct 2025 17:06:28 +0200
Message-ID: <20251002150628.528563-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1759417606; x=1760022406; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nclPoRydnkSRbSQZrp9wwibdhJQcFdQaW01rmY2M53g=;
 b=F7Ihot/aok/YMs1DLkMF6rDz2Md26OdWdSZTtY+TV0hlYnwlWVOXtL7L4FZZtuoVP3
 uwgizSa4KWrCnQtynZli5JmeYKhMlMsYYXeNMuCxBPQxlfHtjqRB2vaS0bWnWTiepDlk
 SZ/4UJkNvXCMMuXxj3zs4CFm8A5tQ/STCOJlzaQcC+5Vek4wGgPxmsfMoQJks74O/gfc
 7yc/wzP4MPtVce79IXoqYK/W6toQWaE+EgguvnfeU+k2jpv9Lqm7aufsdHpchtBgggjC
 TnPoCYUH31G5EUbXVzLMMylrt8C4KVpqc6HzHPcKBoaeNMJhE9FV2e+uLERH+9zw1XFu
 Lsbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=F7Ihot/a
Subject: [Buildroot] [PATCH v2] package/python-pip: security bump to v25.2
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
Changes v1->v2:
- Fix PYTHON_PIP_SITE that must be updated along the version bump
---
 package/python-pip/python-pip.hash | 4 ++--
 package/python-pip/python-pip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

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
index 9ffc0b66ea..02d7da6fe9 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 25.0
+PYTHON_PIP_VERSION = 25.2
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/47/3e/68beeeeb306ea20ffd30b3ed993f531d16cd884ec4f60c9b1e238f69f2af
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/20/16/650289cd3f43d5a2fadfd98c68bd1e1e7f2550a1a5326768cddfbcedb2c5
 PYTHON_PIP_SETUP_TYPE = setuptools
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
