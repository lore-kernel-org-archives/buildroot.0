Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B79CD6E53
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 17:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 215D842F31;
	Sat, 30 May 2026 17:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mgx6kWe_bj2C; Sat, 30 May 2026 17:58:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BE6142F32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780163923;
	bh=cGqhHrv33U50lnvtOgdXBtOwGuB6CmCU/lIJraVk7Ns=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mD7FxND96UqHCv9RXJFYuvhvKze35Qs3SyBK/CoTKCgX61dggplQlLa32gOsBPol9
	 JbiptWvmFnuTRBdWbaQOE/g4y7S1HgDlDND52UoOo6O0yDSsK1QQLkrJ4UllltTs7v
	 gEX/WLtmPON3O+9dzmlEYJwqs/0XYmfqfcFpDFMYLdG7aNxWTm9MVtOhHTr2BGPRCe
	 AJaBUF3ZO2u0R8wsiypOHwEKzjXQhd3HX/YQIOfv/mkEvaQj8NVKbRzfEOuGopf59o
	 7ti3Z3irr1NNugA+hbJlWT2vAkLcKRW9Zc1iGvOk3GKoMA4Nf2nF2rS4A48eFRH5hS
	 IUYtNGga+xErg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BE6142F32;
	Sat, 30 May 2026 17:58:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F763F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 210CF42EB5
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:58:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jF2ehF8LsIts for <buildroot@buildroot.org>;
 Sat, 30 May 2026 17:58:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D6DA742CCC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6DA742CCC
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6DA742CCC
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:58:39 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-490a7629380so712385e9.0
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780163918; x=1780768718;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FyS44z1ICWNDke5CG6MNnWewevSBu+0WUQll5FoBbsI=;
 b=hBtOz4QAiROQghPOH8GGmELtMjYYi9UIncm6nn5Uqabl7xgqSVsPGZRKSJCLqK50jJ
 SAonRxGDwnMclFy3eyNodwJ8hs9B3vFajy9wQUav9A3vDmbcEQ8rlpEHfIuXC+ZXUwAG
 l9zd1IZejkdZrej+NIqGKnxoW/Ev7CvY7f1PIHi1mOXzIvpcSy1fdRLcMAw/97rH7OXv
 BRL/L9VwaybdwXSIUj0lU14LTGwLSAZFHOn2CnEHIvIvTABIlHIwHzQdFh+jZFddXEiz
 s5aL9uhXPqCStSZgmUMGD4KhqGMwgq3uzsUlT3YK6ZjFGIfwNjWDmS8cXh8P+u57DzKR
 SpPg==
X-Gm-Message-State: AOJu0YyGO830NBc+nmlYej08eVYgbCEhVJcfyQDJ6P+So1W/OWrQilri
 x71KpL4/zYBFMN27m1GS3MOG676302sxeNLokHNNqDbUmO3ChrqkEjKaF2Kt33i2Fjgvn/nziYe
 2jusb
X-Gm-Gg: Acq92OEknFjJQcCgZfNmTh+8wIW7Mao0zgaujGbhskvTX9IYU7OWyDcqtmyQDSAfcQU
 AvJL9vlQubg8t4TPkOOE3rnLwVWihvq9Q9ZvB3jUgvoOhZu+3bA2n9Otj2Ippx3qHspyCpsw92j
 3QFMU3XYG1j1Li7X3cgLBNFm2SRQk0Rn+mHASUe1jNKoBjDpjBVLa+9OO0wjYvf5HlNyqh7WdwN
 oNTdw6hI0uHf6+NuZ5/TVWoWUP0RJwQWzZP8ZlEm86sbV9dwcQPxn3DJ5iY8fXw9BHDiE6+Q4u7
 yZEdR3tb5WFly8sfxXtbXNRYDM9E+ry4Mhypvn3vSK9ed3e5qLfiD47VWNECI0P0BiPx9u64BXo
 xCxqDqRNuLzo/gb0D7ix/Y0p99YdDBuDupqq8Y7O8rD8Gew3kiXDuRWeX/PAzaJdQYNBE5MzPLu
 jBKgit22+GDtIIx1YFJmqv06Psf7mLOjKPxaBRaJRSxCqgrUVZvxBs42xHjSGak1Tg50mEKRyPn
 CR7CVMLk5OsEkGSpY7n46BWuHYLb4KEfH9j
X-Received: by 2002:a05:600c:6385:b0:490:5057:f5f7 with SMTP id
 5b1f17b1804b1-490a291e939mr99225365e9.11.1780163917883; 
 Sat, 30 May 2026 10:58:37 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909cabfd6esm128117435e9.15.2026.05.30.10.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 10:58:37 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sat, 30 May 2026 19:58:31 +0200
Message-ID: <20260530175831.1806461-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530175831.1806461-1-romain.naour@smile.fr>
References: <20260530175831.1806461-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1780163918; x=1780768718; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FyS44z1ICWNDke5CG6MNnWewevSBu+0WUQll5FoBbsI=;
 b=lR6DMfESq3mjI4aPQMafGsnXx0uI4isT5rWK93qh+WogYPYYtG8WFTzpLlHGZtziOS
 9gL77lRkv8s+d7S8se9HSUbBk9b6E2owSBZtXgnFZEn0Ee3uJMuTBtHZHw6Rp9VLS0Mc
 YTRGQbCt1ixPOcHzNX5SlWb6A2n+jWvJOvREU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=lR6DMfES
Subject: [Buildroot] [PATCH 3/3] support/testing: use larger runner to
 reduce the CI minute consumed per pipeline
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

Based on the first pipeline result [1], use larger runner for the
following tests:

  tests.fs.test_oci.TestOci.test_run (01:08:15)
  saas-linux-small-amd64 -> saas-linux-xlarge-amd64

  tests.package.test_dpdk.TestDPDK.test_run (01:08:36)
  saas-linux-small-amd64 -> saas-linux-xlarge-amd64

  tests.package.test_z3.TestZ3.test_run (01:11:41)
  saas-linux-small-amd64 -> saas-linux-xlarge-amd64

  tests.package.test_octave.TestOctave.test_run (01:21:57)
  saas-linux-small-amd64 -> saas-linux-xlarge-amd64

  tests.package.test_podman.TestPodmanSlirpNftables.test_run (01:21:15)
  saas-linux-small-amd64 -> saas-linux-xlarge-amd64

  tests.package.test_podman.TestPodmanSlirpIptables.test_run (01:21:25)
  saas-linux-small-amd64 -> saas-linux-xlarge-amd64

  tests.package.test_mariadb.TestMariaDB.test_run (01:26:15)
  saas-linux-small-amd64 -> saas-linux-xlarge-amd64

  tests.package.test_podman.TestPodmanIptables.test_run (01:28:51)
  saas-linux-small-amd64 -> saas-linux-xlarge-amd64

  tests.package.test_podman.TestPodmanTini.test_run (01:29:08)
  saas-linux-small-amd64 -> saas-linux-xlarge-amd64

  tests.package.test_podman.TestPodmanNftables.test_run (01:41:26)
  saas-linux-small-amd64 -> saas-linux-xlarge-amd64

  tests.package.test_weston.TestWeston.test_run (01:26:17)
  saas-linux-large-amd64 -> saas-linux-2xlarge-amd64

  tests.package.test_python_pyqt5.TestPythonPyQt5.test_run (01:41:33)
  saas-linux-large-amd64 -> saas-linux-2xlarge-amd64

  tests.package.test_nodejs.TestNodeJSModuleHostBin.test_run (01:21:06)
  saas-linux-large-amd64 -> saas-linux-2xlarge-amd64

  tests.package.test_flutter.TestFlutter.test_run (01:03:05)
  saas-linux-xlarge-amd64 -> saas-linux-2xlarge-amd64

For tests long that already use 2xlarge runner tag, we may have to run
them on Gitlab runners owned by the Buildroot project.

[1] https://gitlab.com/buildroot.org/buildroot/-/pipelines/2562421098

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/fs/test_oci.py               | 1 +
 support/testing/tests/package/test_dpdk.py         | 1 +
 support/testing/tests/package/test_flutter.py      | 2 +-
 support/testing/tests/package/test_mariadb.py      | 1 +
 support/testing/tests/package/test_nodejs.py       | 2 +-
 support/testing/tests/package/test_octave.py       | 1 +
 support/testing/tests/package/test_podman.py       | 5 +++++
 support/testing/tests/package/test_python_pyqt5.py | 2 +-
 support/testing/tests/package/test_weston.py       | 2 +-
 support/testing/tests/package/test_z3.py           | 1 +
 10 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/fs/test_oci.py b/support/testing/tests/fs/test_oci.py
index 38ed168b62..c2e330c512 100644
--- a/support/testing/tests/fs/test_oci.py
+++ b/support/testing/tests/fs/test_oci.py
@@ -3,6 +3,7 @@ import shutil
 import infra.basetest
 
 
+# gitlab-runner: xlarge
 class TestOci(infra.basetest.BRTest):
     config = \
         """
diff --git a/support/testing/tests/package/test_dpdk.py b/support/testing/tests/package/test_dpdk.py
index 6f55cddee8..0438fe3d4c 100644
--- a/support/testing/tests/package/test_dpdk.py
+++ b/support/testing/tests/package/test_dpdk.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# gitlab-runner: xlarge
 class TestDPDK(infra.basetest.BRTest):
     config = \
         """
diff --git a/support/testing/tests/package/test_flutter.py b/support/testing/tests/package/test_flutter.py
index 95cccb529d..30c6a430fa 100644
--- a/support/testing/tests/package/test_flutter.py
+++ b/support/testing/tests/package/test_flutter.py
@@ -5,7 +5,7 @@ import infra.basetest
 from ..graphics_base import GraphicsBase
 
 
-# gitlab-runner: xlarge
+# gitlab-runner: 2xlarge
 class TestFlutter(infra.basetest.BRTest, GraphicsBase):
     config = f"""
         BR2_aarch64=y
diff --git a/support/testing/tests/package/test_mariadb.py b/support/testing/tests/package/test_mariadb.py
index d40ffdba96..67ae61c3e1 100644
--- a/support/testing/tests/package/test_mariadb.py
+++ b/support/testing/tests/package/test_mariadb.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# gitlab-runner: xlarge
 class TestMariaDB(infra.basetest.BRTest):
     # We use a specific configuration for:
     # - using Aarch64, to have more than 256MB memory,
diff --git a/support/testing/tests/package/test_nodejs.py b/support/testing/tests/package/test_nodejs.py
index 0e679a0ddd..5f3d41a28c 100644
--- a/support/testing/tests/package/test_nodejs.py
+++ b/support/testing/tests/package/test_nodejs.py
@@ -29,7 +29,7 @@ class TestNodeJSBasic(infra.basetest.BRTest):
         self.assertRunOk("node sample_nodejs_basic.js")
 
 
-# gitlab-runner: large
+# gitlab-runner: 2xlarge
 class TestNodeJSModuleHostBin(infra.basetest.BRTest):
     config = \
         """
diff --git a/support/testing/tests/package/test_octave.py b/support/testing/tests/package/test_octave.py
index 4b269e3af0..5c0b26a5fd 100644
--- a/support/testing/tests/package/test_octave.py
+++ b/support/testing/tests/package/test_octave.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# gitlab-runner: xlarge
 class TestOctave(infra.basetest.BRTest):
     # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it does
     # not include gfortran.
diff --git a/support/testing/tests/package/test_podman.py b/support/testing/tests/package/test_podman.py
index 9d86a06129..bd16bd99ac 100644
--- a/support/testing/tests/package/test_podman.py
+++ b/support/testing/tests/package/test_podman.py
@@ -211,11 +211,13 @@ class PodmanBase(infra.basetest.BRTest):
         self.assertEqual(len(img_info), 0, f"{len(img_info)} image(s) still present, expecting 0")
 
 
+# gitlab-runner: xlarge
 class TestPodmanIptables(PodmanBase):
     def test_run(self):
         self.do_test()
 
 
+# gitlab-runner: xlarge
 class TestPodmanNftables(PodmanBase):
     config = PodmanBase.config + """
     BR2_PACKAGE_NFTABLES=y
@@ -225,6 +227,7 @@ class TestPodmanNftables(PodmanBase):
         self.do_test()
 
 
+# gitlab-runner: xlarge
 class TestPodmanTini(PodmanBase):
     config = PodmanBase.config + """
     BR2_PACKAGE_PODMAN_INIT_TINI=y
@@ -234,6 +237,7 @@ class TestPodmanTini(PodmanBase):
         self.do_test()
 
 
+# gitlab-runner: xlarge
 class TestPodmanSlirpIptables(PodmanBase):
     config = PodmanBase.config + """
     BR2_PACKAGE_PODMAN_NET_SLIRP4NETNS=y
@@ -243,6 +247,7 @@ class TestPodmanSlirpIptables(PodmanBase):
         self.do_test()
 
 
+# gitlab-runner: xlarge
 class TestPodmanSlirpNftables(PodmanBase):
     config = PodmanBase.config + """
     BR2_PACKAGE_NFTABLES=y
diff --git a/support/testing/tests/package/test_python_pyqt5.py b/support/testing/tests/package/test_python_pyqt5.py
index fd933ba560..571012ed7c 100644
--- a/support/testing/tests/package/test_python_pyqt5.py
+++ b/support/testing/tests/package/test_python_pyqt5.py
@@ -3,7 +3,7 @@ import os
 import infra.basetest
 
 
-# gitlab-runner: large
+# gitlab-runner: 2xlarge
 class TestPythonPyQt5(infra.basetest.BRTest):
     # We use a specific configuration for:
     # - using Aarch64, to have more than 256MB memory,
diff --git a/support/testing/tests/package/test_weston.py b/support/testing/tests/package/test_weston.py
index 1b25d5ac5e..c8b243a6a7 100644
--- a/support/testing/tests/package/test_weston.py
+++ b/support/testing/tests/package/test_weston.py
@@ -5,7 +5,7 @@ import infra.basetest
 from ..graphics_base import GraphicsBase
 
 
-# gitlab-runner: large
+# gitlab-runner: 2xlarge
 class TestWeston(infra.basetest.BRTest, GraphicsBase):
     config = \
         """
diff --git a/support/testing/tests/package/test_z3.py b/support/testing/tests/package/test_z3.py
index 30794a250b..851dcfab1a 100644
--- a/support/testing/tests/package/test_z3.py
+++ b/support/testing/tests/package/test_z3.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# gitlab-runner: xlarge
 class TestZ3(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
