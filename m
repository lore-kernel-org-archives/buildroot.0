Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0444D6B6B4
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 23:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A010B80A58;
	Wed, 30 Oct 2024 23:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9XUpDuHVjWIk; Wed, 30 Oct 2024 23:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9781E80BC5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9781E80BC5;
	Wed, 30 Oct 2024 23:01:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D3CE494E
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 23:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DAE340147
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 23:01:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8i_0G9MCFjc4 for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 23:01:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 87EB4400A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87EB4400A6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87EB4400A6
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 23:01:36 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43163667f0eso2899545e9.0
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 16:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730329294; x=1730934094;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ADw5hWhx1HEfrRxoWm3nPea+UqHIReFT9U+5UrG5izo=;
 b=N/Mjw3ddpsMt7NS4URn2+hlUnM15FcG2L+EoQ2nApybpU7MGkhByhuLHC+cgKSyefD
 bOPW4NHiRWzJrDIiS102CeCd9QliSN2eCEHVISuceySDdoMyH3RYacJgK2PKfsw2bBUX
 tAxAVW+kJsfbKt3rjgOeyiSOi7KmbIpeMj3G7MswFX6WIHK30jLz7a6eSKLtgnUbUzuN
 hOG+MRgf2f/O8GUxMVUUwKzXytAy4+A91o6gHzEaspkyDJsjR41ZRj+TAmoPuFad6b5d
 95J8f3UjrSqx6oHJxsJ4RB0QKcCZTppcxZf0cTd+cWx9JYUvUapWLFj/cQpeRbwpyPiy
 eUcA==
X-Gm-Message-State: AOJu0YyfYgNzfUKBDltf7R3vLzgkuW0ug7DV3FGuS45FvLK9f0UHQ+kp
 istckhPAnse1Qfp3t0E7wRBBSKnJ288gDa/gT8+2Q2/VpD8hHhQnGaGx+rmFJytVNnhzxc1qJUP
 8
X-Google-Smtp-Source: AGHT+IGh9m8ewXsfXCYqPO1C9UCROkquhWJu/9R/5Lsm7vqgTdNFJC+yn3+W/GEi0r8U5S+hkDlg4A==
X-Received: by 2002:a05:600c:1c82:b0:431:5503:43ca with SMTP id
 5b1f17b1804b1-4319ad16173mr135352205e9.28.1730329294200; 
 Wed, 30 Oct 2024 16:01:34 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10e7435sm290261f8f.52.2024.10.30.16.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 16:01:33 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Thu, 31 Oct 2024 00:01:30 +0100
Message-ID: <20241030230130.2523437-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730329294; x=1730934094; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ADw5hWhx1HEfrRxoWm3nPea+UqHIReFT9U+5UrG5izo=;
 b=hPsjAWhPeDUy8qtOS1TvRtyUmAFZ19Z6aGCAwK8mIoHiirwG1n40NQIQ3nFX3JtVp/
 dqizNCCOjgQmb7RqDJ/0fzjIcl/fD1qafVT6oL5DbHMkE+k059igk5fPfrT8FPo4plkr
 bNN5gnK4o70CSJpuC/l6LlxrUlQwvZYdzV0z8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=hPsjAWhP
Subject: [Buildroot] [PATCH] support/testing: TestPythonPy3SciPy: needs a
 toolchain with Fortran support
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to the Bootlin bleeding-edge toolchain since stable toolchain no
longer provide Fortran support since 2024.05-1 release [1].

The Fortran support is now optional in toolchain-builder tool and
only enabled for bleeding-edge toolchains [2].

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/d3ad58dce9cafccb22d782e56677e060d5eb5a52#428f572a75eed97c0a70da290028c0efb4224a79_545_536
[2] https://gitlab.com/buildroot.org/toolchains-builder/-/commit/a178b246259d92e23679b777fa3d6c166cc424d5

Fixes: (partially)
https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992675

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
We are back to the first build issue...
  meson.build:203:49: ERROR: Could not get pkg-config variable and no default provided for <PkgConfigDependency lapack: True None>
---
 support/testing/tests/package/test_python_scipy.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_python_scipy.py b/support/testing/tests/package/test_python_scipy.py
index fb51f25d79..b32ace8c83 100644
--- a/support/testing/tests/package/test_python_scipy.py
+++ b/support/testing/tests/package/test_python_scipy.py
@@ -5,8 +5,15 @@ from tests.package.test_python import TestPythonPackageBase
 
 class TestPythonPy3SciPy(TestPythonPackageBase):
     __test__ = True
-    config = TestPythonPackageBase.config + \
+    # Need to use a different toolchain than the default due to
+    # missing Fortran support (required by python-scipy) in Bootlin
+    # toolchain 2024.05
+    config = \
         """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE=y
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_SCIPY=y
         BR2_TARGET_ROOTFS_EXT2=y
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
