Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306A7CAC597
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 00:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3D0D81233;
	Tue, 16 Sep 2025 00:30:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1sL0Z8Kg9Gh1; Tue, 16 Sep 2025 00:30:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F62B81264
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F62B81264;
	Tue, 16 Sep 2025 00:30:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C67A22F
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D8DE60DB9
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:30:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p3m7cap5xFKz for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 00:30:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5441560DAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5441560DAB
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5441560DAB
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:30:39 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-408929699eeso23358005ab.1
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 17:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757982638; x=1758587438;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PnfIOiEVo7oUIZ77mTcaLeLVkG7GRGF+Djy4/yCrU6c=;
 b=Bfoou3qW1wJ3DtJfmn5jq9iyFr2pn/AGoDEPvLB54rRFrhRVnQ4VUHw56V2Uqu+yQc
 mgvp7TjKmhbiKCOU8X8o0sIg6dkzMhMLPCjqIe23FCJ2T8PmHlY5Nad/k422l7FIzbqk
 FgcjNIiMd/dzh+Yln6vDDcY8TZ0witoheGTqy12Zxdf+PDrVB6kGGtUtC4jk1oL+ZXIe
 bKw4aNUlHMEQS+KjRF+H4/tXeVHPQf9MIbKMFKsBqhWa1vzRkeVujgWdEs7AMgdFVvSH
 8aYRn1t9iceiecxw/qQTaIXtznJV2/gSIzgTiIgkLXhZ0qG+3B+EC0q95pg5NL/FvkU0
 4CQA==
X-Gm-Message-State: AOJu0YwBk3bKNHbs0AYnRgIILZPIV1cZssPbrZd2GRbg2GbgVY7vZl5q
 jzROrtIlTHHAB6fZIiSWjzZGVgZcYE47O/8EGIgGFlp4B4i7BEzqKNjfqV+Zvw==
X-Gm-Gg: ASbGncvSJJQi3ojCL9hU6rdznvjmg3EMs53/O5FC8uxT+oKqB9vHE+GOPL47QTPj4Ce
 GTUAjWuqIf/kkao/1+8Q6Oh3CE8fsVI3zuugB409XDFC+kJqQseCTDAHtdxac53XjOMPy1NvgCW
 VK4Ahi9RqqTkyu59dabgznTM8DXpv7g2s0TV7xMgrpVIEE2SD3kc2/Dyac0AprpRM8ieLuaEmr8
 HV8tL20xxpBdL5PXRoLgwN71H4B5EausaaCzruE1PKKTdXrQatvT+72oLUWZ6LbAS/il6JMCSSb
 XqtNOdgc9pRyYIRmBEwPoteZ+AZhY5uD6L+frZDyaytwjsBw2/96Qm+yLChZ8Mf5sWd36K0PVGP
 vevx69VjfgzWmWjz5OZonY2DN2rLtkvKdNa/WtMyB9/Up7T52UADy3tp+RC/99k/m9jn+urCvpV
 H5QkpH3rvL5mU=
X-Google-Smtp-Source: AGHT+IEbDK7jt20/saskkGdBx5kA3XWCi9tyf2V+S6cWk8Qw6fOsfBAgjZmxx8lg2quP+17l+0iHHQ==
X-Received: by 2002:a05:6e02:1988:b0:40e:9e8c:b48c with SMTP id
 e9e14a558f8ab-420a311fe64mr146122735ab.15.1757982637977; 
 Mon, 15 Sep 2025 17:30:37 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-511f2efb5d5sm5263988173.14.2025.09.15.17.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 17:30:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 18:30:36 -0600
Message-ID: <20250916003036.2506534-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757982638; x=1758587438; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PnfIOiEVo7oUIZ77mTcaLeLVkG7GRGF+Djy4/yCrU6c=;
 b=Y90m3Uf10ySquimj1X2jvUTlWpp789sPyI5dNGuFKxIhc4wSl/LoXObNKEceXGNZEq
 8nennig1vn3GCjjRe1Uev2z2DFObNi8YBpzEX7jhKKWMoHaDigEewr6X5PSkKIUCZWZM
 vGob1ao+QD7t0j2P5ED62mfSRhCWZGHMbCCYLyycY7f4+jEhOSo8dw6xAp8VI1hZj9N/
 DlezpMnmbdppMscNmCBEug+i+NwzNxbVIVqayXve711cghyWc1i54Uj0uR1U8+TvEpkS
 YWLk4vz3w+G8vQxymMPHHNXV2q3l25LFGm9hOa6LA5xmjPrSLiesD7d5vlAYuJ9iX2oK
 wt4A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Y90m3Uf1
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic-core: bump to
 version 2.39.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-pydantic-core/python-pydantic-core.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index 735abcb4c6..4f4fb124d2 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  d075c06f299090879748db99ab202a253e9a2b22ee4140b96c0257257b9351c8  python-pydantic-core-2.33.2-cargo4.tar.gz
+sha256  7bd7d4a01c14c612d1f03654695e57ce4669df7bbfda1febc23b08b79dafd4cd  python-pydantic-core-2.39.0-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index 5085b906d5..7342711b2a 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -6,10 +6,10 @@
 
 # python-pydantic pins an exact version of pydantic-core in pyproject.toml,
 # make sure to sync pydantic-core to this version when updating pydantic
-PYTHON_PYDANTIC_CORE_VERSION = 2.33.2
+PYTHON_PYDANTIC_CORE_VERSION = 2.39.0
 PYTHON_PYDANTIC_CORE_SOURCE_PYPI = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
 PYTHON_PYDANTIC_CORE_SITE = $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
-PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/ad/88/5f2260bdfae97aabf98f1778d43f69574390ad787afb646292a638c923d4
+PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/fe/29/7ce2ccd75e3da2dae8b2c21ed15f596ddd6430fc603951b4c6292b47dec3
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
 PYTHON_PYDANTIC_CORE_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
