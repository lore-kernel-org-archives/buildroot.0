Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083ACC021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 11:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2FB181F89;
	Mon, 17 Feb 2025 11:40:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j1iJwS9rXE0Y; Mon, 17 Feb 2025 11:40:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3D9A8200A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3D9A8200A;
	Mon, 17 Feb 2025 11:40:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F62AC8
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 11:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EAD740B47
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 11:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oI7GW9r6rM3F for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 11:40:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 017504048B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 017504048B
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 017504048B
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 11:40:23 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3d14dec3236so12668235ab.0
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 03:40:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739792423; x=1740397223;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ynLvE4D62xpatyrXbcJZYFeUjTWtmFuVB4GzaNkuNsw=;
 b=serFKP9nI1QpjSfa+Xvtbiq8mGYs8K6QRFVqIw5fsWL21j5OxuZClzvGnL1AfAasf9
 Qpg5kZ4jQ6eR1XdQBfXSqhrgqnl+V4QvECSxjtcm6PTKImlJyj4Pb/WEIiytiHKCZZkI
 RvSuJhuwE53INh65C6d36b3W6AyYDMd7OnumIPjgmEXXK/Or6fy97v2NzPgnry3mWcgI
 8JyhPLk9pfpJ6QlTj57aIuraY+4g54OI3o63w9jUQuQGEgSkSrqtZYl0tuQM9J1cxTlo
 Vv57ALwUGXg43cLp49MYC0nLbi/wp4RwmUAr+SbdlJ8q2mENXGUzWnArJ0jWJFAQGt0/
 +UtQ==
X-Gm-Message-State: AOJu0Yx79QpMSO0efwn2biU5bLWCPTKPijPcHXUBYMoUnlKtLEsz+scO
 olPuOmxVb6tUCvHrEDVnOALcvEt1gRBpJRP1rKzU/hjVCWVs7Gdgu5xp6g==
X-Gm-Gg: ASbGnctSMtXEj1HaIOkyIYl10lsl0rfMik/J3N+Tptr6DMVZeejVPcwXQ6Fjz0lmDuE
 bxGdmNhHjSJl+p2U7eRRgfhsdyC3rjCN8qNBXBVLyA7jdiaaheSGLhffJDp2NF4srgSrgPefpEF
 DCtXGatpidtqF6poDoRBM3hKW2W7RClP+zqb2x8I9wjKQB0ng9YTLgfDrtXoicjwZ4exHvjM3S6
 kYALnNLZlCX6rZ3mkBpEuxdwwv7UqnNGcFFYgY5z0hR2uuqC7HSLS+rTl+/oLimi0VwezBwfyqM
 vq7Takhl+wch0C0ON9u16a69ONRucdCLgeaxA3UT9tFItXh+m8Lu/UDfzO37WSnpWQ==
X-Google-Smtp-Source: AGHT+IHCxJbrRL8JvIpukS+mNnBUx52Vofw/IeWyglq5CwQp9GnM+lSKM0R9eFyqd0jY/eUhI3hGUQ==
X-Received: by 2002:a92:ca4f:0:b0:3d0:10a6:99a3 with SMTP id
 e9e14a558f8ab-3d28080b4fcmr70168305ab.12.1739792422736; 
 Mon, 17 Feb 2025 03:40:22 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ed281495a1sm2136073173.21.2025.02.17.03.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 03:40:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Feb 2025 04:40:18 -0700
Message-Id: <20250217114018.1876535-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739792423; x=1740397223; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ynLvE4D62xpatyrXbcJZYFeUjTWtmFuVB4GzaNkuNsw=;
 b=PZkZHKPWZaBUU3WyhNmsJMlTO694bYKFZ+p8A03SEA7q8Sw7GNHlTVaEHcAo52w+o1
 Fnj3ipK/fQKC3i9GBVFQKvGyh/chtDXe50nlKYaEdAhM0OiieaLJIXrY8UcylUoYGHBL
 QqWnnm3mgrPBnibYDYVvN8ZLDs+Y2G6LbhLLjIVQfYQLrov2Y0oqkkQ9APEMeIylbM6N
 5X0K9Iwi2Bd3O9o3RxNWKB72kxP7ie+ZegkcaNZ2COJCIqeW8B119aw3C5nq6sjW21k5
 tmIUuxUWFzK+hfaAE8E3fu/HMGQ4p7cWHDqNBossg0CEmx9hOQpOtOUqHBhqDjNEZBui
 WpmQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PZkZHKPW
Subject: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 1.8.2
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index 1b295127f6..34e0f1da32 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  da4ab5a84c35d0ab00c0fb63975f25c497d6570dcdeaae0ec0f7d9f70f1d5382  python-maturin-1.8.1-cargo2.tar.gz
+sha256  0e8fdcd6cf3f4f7e018a624e35b731d00971b09a71515e6108df43407cd684eb  python-maturin-1.8.2-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index b9816e2119..6a99bbf376 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 1.8.1
+PYTHON_MATURIN_VERSION = 1.8.2
 PYTHON_MATURIN_SOURCE_PYPI = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/9a/08/ccb0f917722a35ab0d758be9bb5edaf645c3a3d6170061f10d396ecd273f
+PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/e0/8f/6978427ce3f72b189012e1731d1d2d27b3151caa741666c905320e0a3662
 PYTHON_MATURIN_SITE = $(PYTHON_MATURIN_SITE_PYPI)/$(PYTHON_MATURIN_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_MATURIN_SETUP_TYPE = setuptools-rust
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
