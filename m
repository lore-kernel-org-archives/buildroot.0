Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B51CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 17:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C5FC42C87;
	Sat, 30 May 2026 17:58:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H7i5Cm_gUaHp; Sat, 30 May 2026 17:58:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 521F142EB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780163922;
	bh=yhJzl9tNTv82u7Vx+DzE3zIrk2XfpJMP/QHTnPm8sYs=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=SF6XoReBWUgEQlr9/2PvTMrHPW2TtyOoH4ZePkuM7yxSkGsPog01Z4OCZ7Eq97qsb
	 iiYX1n8LqQHr7OwJBBCeZc4mZpQUFOdf1F1TTs5HOblQF4VNSzdGLMyheSj0NH05WF
	 zM73/GlxfIwRJ53E9gJMScOXMdyZa9nntxVkArB5Di9ZCsjMUQn/W3koEq2e++IWVD
	 6tfXOe1LCgou//S8OXCgc7d8HP616tdZpjEHLdpm8lLiG5rdaK+419FYrmYBqdhAuG
	 d9JOlYiWAa+wXoa0XgLxo0Qa7gyOZPqRWbU3gvoeSL+KzzoswZa6ycljvPuXaNfTze
	 EfnNNsbpkhuoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 521F142EB5;
	Sat, 30 May 2026 17:58:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D9FCD3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F669615EA
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:58:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2cfxByxX7II4 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 17:58:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 39AFE60DEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39AFE60DEA
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39AFE60DEA
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:58:38 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-45fd461e4a5so142933f8f.0
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780163916; x=1780768716;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jzOC0eHgA2PElzC/WV24bGwepEgB6QnQAx6RmMWxYHA=;
 b=Oppk97E0eQYzcM1BkwFpHc04YvSQJ/CPq7TgjJlmhMtJSTnvYoKHVEPQCaohhGVqEd
 dmMZtsEoetyr3AI2ZzS6irXXOBSwL8krjcFeEV61l5+JrbYPMEcgKzrA7b5mYg+E+iBF
 rc5AKQwUd//h7zpBggLDrKuw8rYqamqOy2ncfWdZN/OZp7r3bHvXyG9ok/W23ncTJXU3
 9JM+tlidLi/8wmP2+rQy1SqWu86R+8ed/xKn3t/yQAOcqfUq9HTKF9E/ylzJCvXYK/el
 hP8iHJVGtoEbjFMNRuBOQq/cIU5VrqWlUX4+/ITaZfzhMNoUB9PAQwc0aaVIeuuEEypl
 PDiA==
X-Gm-Message-State: AOJu0YzXBjowaLbYfP6ISbFw+ZjgwaNw0JCnFLUa8BuZU8NBUTFMX0U5
 H1soxHbW0mqOnZzeCORHNQUcpNh7HptefjPM2q1XDWEg1Atuhqa+Il4xpqJg6hgzjP1facJy25M
 QalMr
X-Gm-Gg: Acq92OHp6QiXSk2QfoHpY3cuEfwNathm70ROI7M00D77Wr3j0mUDUHyQqK7mACaofpz
 wFqMPB5Lc+jgPH7xzl8mjF1EtEFlDY0w9c/aIv0JRvxnA2zrBY/zoHSOSP3kAIL/ncRZxueQSLG
 gFW5R4OS0w+0Awi6pFGBx/R8feCziVZeQfZGHf1y50K9AlEcqtpEMWz2c9CmcWEGoNGITCk4kUJ
 67EIduyRh2tPDWL5NRcqAC6LqreUF7YSKRRaEj8YpCwqDj3a6njYZsgqTJtCqL28GmPUTfEzyJC
 AJHJ1MjaW1BV46kKrbKBW7wdvDWtDexKviFW3RbljHFldr3W7e8mcCcx8G6ql8+gFxBZFtNzv1A
 a8D92UbyQN5K3YylxUmigo62lLGJAkXlnpywlAeoDn1YmUGx1fbvlcsoDw6Qx2z1ODM/Bt0tGKM
 l41D8awxvKkBj476xP/ZPh7WBdyPe5qUE1SJYPX3ZJG+GpQCZgk3ahQ97WACLqYUYcNT9GUVvce
 VxZ0hY7RtlzbmITAv7cyFyyFK+v7A8yrz91
X-Received: by 2002:a05:600c:c0d1:20b0:490:688b:f10d with SMTP id
 5b1f17b1804b1-490a290ec8fmr57676405e9.7.1780163916010; 
 Sat, 30 May 2026 10:58:36 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909cabfd6esm128117435e9.15.2026.05.30.10.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 10:58:35 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sat, 30 May 2026 19:58:29 +0200
Message-ID: <20260530175831.1806461-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1780163916; x=1780768716; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jzOC0eHgA2PElzC/WV24bGwepEgB6QnQAx6RmMWxYHA=;
 b=YV05pbSzC438oqPzkaPh8C4g5xTiHCUbmcrs9ZWOuJ5WM3ced/zZqCh5t6EVKbrntm
 /2Q3tMeDAjWab5dl6w4fhbuFZDzlhtzJfrdzePHknTy1REGE8apO3UzI/Yt7+3x9b1l4
 rdNm3cUBTMdoY2jN6fmz/8iMsjP3CvAsqaT5M=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=YV05pbSz
Subject: [Buildroot] [PATCH 1/3] Revert "support/testing: generate runtime
 test jobs with runner tags"
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

The CI minute cost estimate is wrong for two reasons:
  1) Job duration was in minutes instead of seconds
  2) The cost factor is really 0,5 [1] instead of
     based on runner type * 0,5.

Due to this two mistake, the real CI minute cost is 7982.1 [2] instead
of 350.

Since we want to backport this patch, having a correct CI minute cost
estimate in the commit log would be better. Lets revert last changes
about runner tag and try again.

[1] https://docs.gitlab.com/ci/pipelines/compute_minutes/#cost-factors-of-hosted-runners-for-gitlabcom
[2] https://gitlab.com/buildroot.org/buildroot/-/pipelines/2562421098

This reverts commit 38039415f86c6e500ff6c296313dff5c8cc2f468.
This reverts commit 825abb268233f05bb20296048fd29006d2d1a86d

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/misc/gitlab-ci.yml.in                 | 24 -------------------
 support/scripts/generate-gitlab-ci-yml        | 12 ++--------
 support/testing/tests/boot/test_edk2.py       |  1 -
 support/testing/tests/boot/test_grub.py       |  3 ---
 support/testing/tests/init/test_systemd.py    | 23 ------------------
 support/testing/tests/package/test_aichat.py  |  1 -
 support/testing/tests/package/test_bcc.py     |  1 -
 support/testing/tests/package/test_bitcoin.py |  1 -
 support/testing/tests/package/test_clang.py   |  1 -
 .../package/test_distribution_registry.py     |  1 -
 .../tests/package/test_docker_compose.py      |  2 --
 .../testing/tests/package/test_dosfstools.py  |  1 -
 .../testing/tests/package/test_firewalld.py   |  2 --
 .../testing/tests/package/test_fluidsynth.py  |  1 -
 support/testing/tests/package/test_flutter.py |  1 -
 support/testing/tests/package/test_fwts.py    |  1 -
 .../tests/package/test_glslsandbox_player.py  |  1 -
 support/testing/tests/package/test_glxinfo.py |  1 -
 .../testing/tests/package/test_gnuradio.py    |  1 -
 .../testing/tests/package/test_gstreamer1.py  |  1 -
 support/testing/tests/package/test_kmscube.py |  1 -
 .../testing/tests/package/test_libcamera.py   |  1 -
 .../testing/tests/package/test_llama_cpp.py   |  1 -
 support/testing/tests/package/test_mender.py  |  1 -
 support/testing/tests/package/test_mesa3d.py  |  1 -
 support/testing/tests/package/test_nodejs.py  |  3 ---
 .../testing/tests/package/test_openblas.py    |  1 -
 support/testing/tests/package/test_openjdk.py |  1 -
 .../tests/package/test_perl_dbd_mysql.py      |  1 -
 .../tests/package/test_python_pyqt5.py        |  1 -
 .../tests/package/test_python_scipy.py        |  1 -
 support/testing/tests/package/test_rust.py    |  1 -
 .../package/test_uboot_openssl_pkgconfig.py   |  1 -
 support/testing/tests/package/test_weston.py  |  1 -
 support/testing/tests/package/test_wine.py    |  1 -
 support/testing/tests/package/test_xen.py     |  2 --
 support/testing/tests/package/test_zfs.py     |  3 ---
 .../tests/toolchain/test_aarch64_64k.py       |  3 ---
 38 files changed, 2 insertions(+), 103 deletions(-)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index 81c380a4ed..ada36d0d60 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -5,30 +5,6 @@ stages:
 before_script:
   - git config --global --add safe.directory ${CI_PROJECT_DIR}
 
-.runner-small:
-    tags:
-        - saas-linux-small-amd64
-
-.runner-medium:
-    tags:
-        - saas-linux-medium-amd64
-
-.runner-large:
-    tags:
-        - saas-linux-large-amd64
-
-.runner-xlarge:
-    tags:
-        - saas-linux-xlarge-amd64
-
-.runner-2xlarge:
-    tags:
-        - saas-linux-2xlarge-amd64
-
-.runner-buildroot-runner-only:
-    tags:
-        - buildroot-runner
-
 .check-check-package_base:
     stage: test
     script:
diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 2a8c9be5f5..be2b8f0fe9 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -24,7 +24,7 @@ _EOF_
 gen_tests() {
     local -a basics defconfigs runtimes
     local do_basics do_defconfigs do_runtime do_testpkg
-    local defconfigs_ext cfg runner tst
+    local defconfigs_ext cfg tst
 
     basics=( check-package check-symbol DEVELOPERS package symbol )
 
@@ -133,15 +133,7 @@ gen_tests() {
 
     if ${do_runtime:-false}; then
         printf 'runtime_test_download: { extends: .runtime_test_download }\n'
-        for test in "${runtimes[@]}"; do
-            test_file=$(echo "${test}" | tr '.' '/' | sed 's%\(.*/test_[^/]*\)/.*test_run$%support/testing/\1.py%g')
-            test_name=$(echo "${test}" | sed 's/.test_run$//g' | sed 's/.*\.//')
-            runner=$(grep -w -B 1 "${test_name}" "${test_file}" | head -1 | sed -n 's/^.*# gitlab-runner: \(.*\)/\1/p' ) || true
-            if [ -z "${runner}" ]; then
-                runner="small"
-            fi
-            printf '%s: { extends: [ .runtime_test_base, .runner-%s ]}\n' "${test}" "${runner}"
-        done
+        printf '%s: { extends: .runtime_test_base }\n' "${runtimes[@]}"
     fi
 
     if [ -n "${do_testpkg}" ]; then
diff --git a/support/testing/tests/boot/test_edk2.py b/support/testing/tests/boot/test_edk2.py
index 452697e085..8489e82860 100644
--- a/support/testing/tests/boot/test_edk2.py
+++ b/support/testing/tests/boot/test_edk2.py
@@ -3,7 +3,6 @@ import os
 import infra.basetest
 
 
-# gitlab-runner: large
 class TestEdk2(infra.basetest.BRTest):
     config = \
         """
diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
index 8f081f927b..e873683b5a 100644
--- a/support/testing/tests/boot/test_grub.py
+++ b/support/testing/tests/boot/test_grub.py
@@ -32,7 +32,6 @@ class TestGrubi386BIOS(infra.basetest.BRTest):
         self.emulator.login()
 
 
-# gitlab-runner: large
 class TestGrubX8664EFI(infra.basetest.BRTest):
     config = \
         """
@@ -85,7 +84,6 @@ class TestGrubX8664EFI(infra.basetest.BRTest):
         self.assertRunOk(cmd)
 
 
-# gitlab-runner: large
 class TestGrubAArch64EFI(infra.basetest.BRTest):
     config = \
         """
@@ -127,7 +125,6 @@ class TestGrubAArch64EFI(infra.basetest.BRTest):
         self.assertRunOk(cmd)
 
 
-# gitlab-runner: large
 class TestGrubRiscV64EFI(infra.basetest.BRTest):
     scripts = [
         "board/qemu/post-image.sh",
diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index 472a65db57..893cc17408 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -65,7 +65,6 @@ class InitSystemSystemdBase(InitSystemBase):
         self.check_network("eth0")
 
 
-# gitlab-runner: medium
 class TestInitSystemSystemdRoNetworkd(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
         """
@@ -78,7 +77,6 @@ class TestInitSystemSystemdRoNetworkd(InitSystemSystemdBase):
         self.check_systemd("squashfs")
 
 
-# gitlab-runner: medium
 class TestInitSystemSystemdRwNetworkd(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
         """
@@ -90,7 +88,6 @@ class TestInitSystemSystemdRwNetworkd(InitSystemSystemdBase):
         self.check_systemd("ext2")
 
 
-# gitlab-runner: medium
 class TestInitSystemSystemdRoIfupdown(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
         """
@@ -104,7 +101,6 @@ class TestInitSystemSystemdRoIfupdown(InitSystemSystemdBase):
         self.check_systemd("squashfs")
 
 
-# gitlab-runner: medium
 class TestInitSystemSystemdRoIfupdownDbusbroker(TestInitSystemSystemdRoIfupdown):
     config = TestInitSystemSystemdRoIfupdown.config + \
         """
@@ -121,7 +117,6 @@ class TestInitSystemSystemdRoIfupdownDbusbroker(TestInitSystemSystemdRoIfupdown)
         self.assertEqual(len(out), 1)
 
 
-# gitlab-runner: medium
 class TestInitSystemSystemdRoIfupdownDbusbrokerDbus(TestInitSystemSystemdRoIfupdownDbusbroker):
     config = TestInitSystemSystemdRoIfupdownDbusbroker.config + \
         """
@@ -129,7 +124,6 @@ class TestInitSystemSystemdRoIfupdownDbusbrokerDbus(TestInitSystemSystemdRoIfupd
         """
 
 
-# gitlab-runner: medium
 class TestInitSystemSystemdRwIfupdown(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
         """
@@ -142,7 +136,6 @@ class TestInitSystemSystemdRwIfupdown(InitSystemSystemdBase):
         self.check_systemd("ext2")
 
 
-# gitlab-runner: medium
 class TestInitSystemSystemdRwIfupdownDbusbroker(TestInitSystemSystemdRwIfupdown):
     config = TestInitSystemSystemdRwIfupdown.config + \
         """
@@ -159,7 +152,6 @@ class TestInitSystemSystemdRwIfupdownDbusbroker(TestInitSystemSystemdRwIfupdown)
         self.assertEqual(len(out), 1)
 
 
-# gitlab-runner: medium
 class TestInitSystemSystemdRwIfupdownDbusbrokerDbus(TestInitSystemSystemdRwIfupdownDbusbroker):
     config = TestInitSystemSystemdRwIfupdownDbusbroker.config + \
         """
@@ -167,7 +159,6 @@ class TestInitSystemSystemdRwIfupdownDbusbrokerDbus(TestInitSystemSystemdRwIfupd
         """
 
 
-# gitlab-runner: medium
 class TestInitSystemSystemdRoFull(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
         """
@@ -197,7 +188,6 @@ class TestInitSystemSystemdRoFull(InitSystemSystemdBase):
         self.check_systemd("squashfs")
 
 
-# gitlab-runner: medium
 class TestInitSystemSystemdRwFull(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
         """
@@ -267,7 +257,6 @@ class InitSystemSystemdBaseFactory():
         self.assertEqual(out[0], "foobar")
 
 
-# gitlab-runner: medium
 class TestInitSystemSystemdRoNetworkdFactory(
     InitSystemSystemdBaseFactory,
     TestInitSystemSystemdRoNetworkd,
@@ -276,7 +265,6 @@ class TestInitSystemSystemdRoNetworkdFactory(
         TestInitSystemSystemdRoNetworkd.config
 
 
-# gitlab-runner: medium
 class TestInitSystemSystemdRoIfupdownFactory(
     InitSystemSystemdBaseFactory,
     TestInitSystemSystemdRoIfupdown,
@@ -285,7 +273,6 @@ class TestInitSystemSystemdRoIfupdownFactory(
         TestInitSystemSystemdRoIfupdown.config
 
 
-# gitlab-runner: medium
 class TestInitSystemSystemdRoIfupdownDbusbrokerFactory(
     InitSystemSystemdBaseFactory,
     TestInitSystemSystemdRoIfupdownDbusbroker,
@@ -294,7 +281,6 @@ class TestInitSystemSystemdRoIfupdownDbusbrokerFactory(
         TestInitSystemSystemdRoIfupdownDbusbroker.config
 
 
-# gitlab-runner: medium
 class TestInitSystemSystemdRoIfupdownDbusbrokerDbusFactory(
     InitSystemSystemdBaseFactory,
     TestInitSystemSystemdRoIfupdownDbusbrokerDbus,
@@ -303,7 +289,6 @@ class TestInitSystemSystemdRoIfupdownDbusbrokerDbusFactory(
         TestInitSystemSystemdRoIfupdownDbusbrokerDbus.config
 
 
-# gitlab-runner: medium
 class TestInitSystemSystemdRoFullFactory(
     InitSystemSystemdBaseFactory,
     TestInitSystemSystemdRoFull,
@@ -363,7 +348,6 @@ class InitSystemSystemdBaseOverlayfs():
         self.assertEqual(out[0], "foobar")
 
 
-# gitlab-runner: medium
 class TestInitSystemSystemdRoNetworkdOverlayfs(
     InitSystemSystemdBaseOverlayfs,
     TestInitSystemSystemdRoNetworkd,
@@ -372,7 +356,6 @@ class TestInitSystemSystemdRoNetworkdOverlayfs(
         TestInitSystemSystemdRoNetworkd.config
 
 
-# gitlab-runner: medium
 class TestInitSystemSystemdRoIfupdownOverlayfs(
     InitSystemSystemdBaseOverlayfs,
     TestInitSystemSystemdRoIfupdown,
@@ -381,7 +364,6 @@ class TestInitSystemSystemdRoIfupdownOverlayfs(
         TestInitSystemSystemdRoIfupdown.config
 
 
-# gitlab-runner: medium
 class TestInitSystemSystemdRoIfupdownDbusbrokerOverlayfs(
     InitSystemSystemdBaseOverlayfs,
     TestInitSystemSystemdRoIfupdownDbusbroker,
@@ -390,7 +372,6 @@ class TestInitSystemSystemdRoIfupdownDbusbrokerOverlayfs(
         TestInitSystemSystemdRoIfupdownDbusbroker.config
 
 
-# gitlab-runner: medium
 class TestInitSystemSystemdRoIfupdownDbusbrokerDbusOverlayfs(
     InitSystemSystemdBaseOverlayfs,
     TestInitSystemSystemdRoIfupdownDbusbrokerDbus,
@@ -399,7 +380,6 @@ class TestInitSystemSystemdRoIfupdownDbusbrokerDbusOverlayfs(
         TestInitSystemSystemdRoIfupdownDbusbrokerDbus.config
 
 
-# gitlab-runner: medium
 class TestInitSystemSystemdRoFullOverlayfs(
     InitSystemSystemdBaseOverlayfs,
     TestInitSystemSystemdRoFull,
@@ -408,7 +388,6 @@ class TestInitSystemSystemdRoFullOverlayfs(
         TestInitSystemSystemdRoFull.config
 
 
-# gitlab-runner: medium
 class InitSystemSystemdBaseOverlayfsVarBacking(InitSystemBase):
     @classmethod
     def gen_config(cls, overlaydir: str) -> str:
@@ -423,7 +402,6 @@ class InitSystemSystemdBaseOverlayfsVarBacking(InitSystemBase):
         self.assertRunOk("grep '^other-var-backing-store /run/buildroot/mounts/var tmpfs' /proc/mounts")
 
 
-# gitlab-runner: medium
 class TestInitSystemSystemdRoFullOverlayfsVarBackingMountUnit(
     TestInitSystemSystemdRoFullOverlayfs,
     InitSystemSystemdBaseOverlayfsVarBacking,
@@ -437,7 +415,6 @@ class TestInitSystemSystemdRoFullOverlayfsVarBackingMountUnit(
         self.check_var_mounted()
 
 
-# gitlab-runner: medium
 class TestInitSystemSystemdRoFullOverlayfsVarBackingFstab(
     TestInitSystemSystemdRoFullOverlayfs,
     InitSystemSystemdBaseOverlayfsVarBacking,
diff --git a/support/testing/tests/package/test_aichat.py b/support/testing/tests/package/test_aichat.py
index 009d6e98a3..50c07f87dc 100644
--- a/support/testing/tests/package/test_aichat.py
+++ b/support/testing/tests/package/test_aichat.py
@@ -5,7 +5,6 @@ import time
 import infra.basetest
 
 
-# gitlab-runner: medium
 class TestAiChat(infra.basetest.BRTest):
     rootfs_overlay = \
         infra.filepath("tests/package/test_aichat/rootfs-overlay")
diff --git a/support/testing/tests/package/test_bcc.py b/support/testing/tests/package/test_bcc.py
index b98c37077d..51f175a5b4 100644
--- a/support/testing/tests/package/test_bcc.py
+++ b/support/testing/tests/package/test_bcc.py
@@ -4,7 +4,6 @@ import time
 import infra.basetest
 
 
-# gitlab-runner: 2xlarge
 class TestBcc(infra.basetest.BRTest):
     # This test is using a Kernel >= 5.2, so it will use
     # CONFIG_IKHEADERS. Those Kernel headers are unpacked from
diff --git a/support/testing/tests/package/test_bitcoin.py b/support/testing/tests/package/test_bitcoin.py
index 186240b280..a942504af4 100644
--- a/support/testing/tests/package/test_bitcoin.py
+++ b/support/testing/tests/package/test_bitcoin.py
@@ -5,7 +5,6 @@ import time
 import infra.basetest
 
 
-# gitlab-runner: medium
 class TestBitcoin(infra.basetest.BRTest):
     # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it does
     # not include BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
diff --git a/support/testing/tests/package/test_clang.py b/support/testing/tests/package/test_clang.py
index 439e5b9cd2..bc44a5804a 100644
--- a/support/testing/tests/package/test_clang.py
+++ b/support/testing/tests/package/test_clang.py
@@ -5,7 +5,6 @@ import infra.basetest
 FUZZ_TIMEOUT = 120
 
 
-# gitlab-runner: 2xlarge
 class TestClangCompilerRT(infra.basetest.BRTest):
     br2_external = [infra.filepath("tests/package/br2-external/clang-compiler-rt")]
     # Without this option the test fails due to insufficient address space for 64-bit allocator
diff --git a/support/testing/tests/package/test_distribution_registry.py b/support/testing/tests/package/test_distribution_registry.py
index 66e0b5d39d..35942db29c 100644
--- a/support/testing/tests/package/test_distribution_registry.py
+++ b/support/testing/tests/package/test_distribution_registry.py
@@ -3,7 +3,6 @@ import os
 import time
 
 
-# gitlab-runner: large
 class TestDistributionRegistry(infra.basetest.BRTest):
     config = \
         """
diff --git a/support/testing/tests/package/test_docker_compose.py b/support/testing/tests/package/test_docker_compose.py
index ad9a46ac16..db7e50914c 100644
--- a/support/testing/tests/package/test_docker_compose.py
+++ b/support/testing/tests/package/test_docker_compose.py
@@ -76,13 +76,11 @@ class BaseTestDockerCompose(infra.basetest.BRTest):
         self.python_docker_test()
 
 
-# gitlab-runner: large
 class TestDockerComposeRunc(BaseTestDockerCompose):
     def test_run(self):
         self.do_test()
 
 
-# gitlab-runner: large
 class TestDockerComposeCrun(BaseTestDockerCompose):
     config = BaseTestDockerCompose.config + """
         BR2_PACKAGE_CRUN=y
diff --git a/support/testing/tests/package/test_dosfstools.py b/support/testing/tests/package/test_dosfstools.py
index a63dbad38f..f32ff81c01 100644
--- a/support/testing/tests/package/test_dosfstools.py
+++ b/support/testing/tests/package/test_dosfstools.py
@@ -4,7 +4,6 @@ import subprocess
 import infra.basetest
 
 
-# gitlab-runner: large
 class TestDosFsTools(infra.basetest.BRTest):
     # This test needs a Kernel with vfat and NLS support. The vfat
     # filesystem also needs character set conversion libraries, since
diff --git a/support/testing/tests/package/test_firewalld.py b/support/testing/tests/package/test_firewalld.py
index 9a1bd41f62..1093873b38 100644
--- a/support/testing/tests/package/test_firewalld.py
+++ b/support/testing/tests/package/test_firewalld.py
@@ -4,7 +4,6 @@ import time
 import infra.basetest
 
 
-# gitlab-runner: large
 class TestFirewalldSystemd(infra.basetest.BRTest):
     """Build the kernel as firewalld requires several the nftable options."""
 
@@ -63,7 +62,6 @@ class TestFirewalldSystemd(infra.basetest.BRTest):
         self.assertEqual(exit_code, 0)
 
 
-# gitlab-runner: large
 class TestFirewalldSysVInit(infra.basetest.BRTest):
     """Build the kernel as firewalld requires several nftable options."""
 
diff --git a/support/testing/tests/package/test_fluidsynth.py b/support/testing/tests/package/test_fluidsynth.py
index 7ebbf5e642..909c878b75 100644
--- a/support/testing/tests/package/test_fluidsynth.py
+++ b/support/testing/tests/package/test_fluidsynth.py
@@ -3,7 +3,6 @@ import os
 import infra.basetest
 
 
-# gitlab-runner: medium
 class TestFluidsynth(infra.basetest.BRTest):
     # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it is
     # armv5 and based on qemu versatilepb which is limited to 256MB of
diff --git a/support/testing/tests/package/test_flutter.py b/support/testing/tests/package/test_flutter.py
index 95cccb529d..19406b7cb1 100644
--- a/support/testing/tests/package/test_flutter.py
+++ b/support/testing/tests/package/test_flutter.py
@@ -5,7 +5,6 @@ import infra.basetest
 from ..graphics_base import GraphicsBase
 
 
-# gitlab-runner: xlarge
 class TestFlutter(infra.basetest.BRTest, GraphicsBase):
     config = f"""
         BR2_aarch64=y
diff --git a/support/testing/tests/package/test_fwts.py b/support/testing/tests/package/test_fwts.py
index 86ae99ac9f..a58f9ccb80 100644
--- a/support/testing/tests/package/test_fwts.py
+++ b/support/testing/tests/package/test_fwts.py
@@ -3,7 +3,6 @@ import os
 import infra.basetest
 
 
-# gitlab-runner: large
 class TestFwts(infra.basetest.BRTest):
     kernel_fragment = \
         infra.filepath("tests/package/test_fwts/linux-efi-test.fragment")
diff --git a/support/testing/tests/package/test_glslsandbox_player.py b/support/testing/tests/package/test_glslsandbox_player.py
index 669292ca75..f72ac2adce 100644
--- a/support/testing/tests/package/test_glslsandbox_player.py
+++ b/support/testing/tests/package/test_glslsandbox_player.py
@@ -3,7 +3,6 @@ import os
 import infra.basetest
 
 
-# gitlab-runner: xlarge
 class TestGlslsandboxPlayer(infra.basetest.BRTest):
     config = \
         """
diff --git a/support/testing/tests/package/test_glxinfo.py b/support/testing/tests/package/test_glxinfo.py
index 2c3181d9fb..8680477b15 100644
--- a/support/testing/tests/package/test_glxinfo.py
+++ b/support/testing/tests/package/test_glxinfo.py
@@ -5,7 +5,6 @@ import infra.basetest
 GLXINFO_TIMEOUT = 120
 
 
-# gitlab-runner: large
 class TestGlxinfo(infra.basetest.BRTest):
     config = \
         """
diff --git a/support/testing/tests/package/test_gnuradio.py b/support/testing/tests/package/test_gnuradio.py
index 9b8ab2f558..1fc0479d21 100644
--- a/support/testing/tests/package/test_gnuradio.py
+++ b/support/testing/tests/package/test_gnuradio.py
@@ -3,7 +3,6 @@ import os
 import infra.basetest
 
 
-# gitlab-runner: large
 class TestGnuradio(infra.basetest.BRTest):
     # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it does
     # not include: BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
diff --git a/support/testing/tests/package/test_gstreamer1.py b/support/testing/tests/package/test_gstreamer1.py
index 3b2899b9fe..82829dab98 100644
--- a/support/testing/tests/package/test_gstreamer1.py
+++ b/support/testing/tests/package/test_gstreamer1.py
@@ -3,7 +3,6 @@ import os
 import infra.basetest
 
 
-# gitlab-runner: medium
 class TestGstreamer1(infra.basetest.BRTest):
     # This test creates a full, yet simple, Gstreamer pipeline which
     # encodes/decodes a video, using only plugins from Base and Good
diff --git a/support/testing/tests/package/test_kmscube.py b/support/testing/tests/package/test_kmscube.py
index 1e75948c20..4a0eb07c32 100644
--- a/support/testing/tests/package/test_kmscube.py
+++ b/support/testing/tests/package/test_kmscube.py
@@ -3,7 +3,6 @@ import os
 import infra.basetest
 
 
-# gitlab-runner: xlarge
 class TestKmsCube(infra.basetest.BRTest):
     config = \
         """
diff --git a/support/testing/tests/package/test_libcamera.py b/support/testing/tests/package/test_libcamera.py
index bc52498a75..c785e340d6 100644
--- a/support/testing/tests/package/test_libcamera.py
+++ b/support/testing/tests/package/test_libcamera.py
@@ -3,7 +3,6 @@ import os
 import infra.basetest
 
 
-# gitlab-runner: medium
 class TestLibCamera(infra.basetest.BRTest):
     # A specific configuration is needed for testing libcamera:
     # a kernel config fragment enables v4l2 vimc driver.
diff --git a/support/testing/tests/package/test_llama_cpp.py b/support/testing/tests/package/test_llama_cpp.py
index 682ee0b172..4462be0a5b 100644
--- a/support/testing/tests/package/test_llama_cpp.py
+++ b/support/testing/tests/package/test_llama_cpp.py
@@ -3,7 +3,6 @@ import os
 import infra.basetest
 
 
-# gitlab-runner: medium
 class TestLlamaCpp(infra.basetest.BRTest):
     config = """
         BR2_aarch64=y
diff --git a/support/testing/tests/package/test_mender.py b/support/testing/tests/package/test_mender.py
index 14440c9527..0c83c5644e 100644
--- a/support/testing/tests/package/test_mender.py
+++ b/support/testing/tests/package/test_mender.py
@@ -57,7 +57,6 @@ class TestMenderRO(TestMenderInfra):
         self.run_mender_test()
 
 
-# gitlab-runner: large
 class TestMenderSystemd(TestMenderInfra):
     config = \
         """
diff --git a/support/testing/tests/package/test_mesa3d.py b/support/testing/tests/package/test_mesa3d.py
index 24fc6df59e..f5133c2eef 100644
--- a/support/testing/tests/package/test_mesa3d.py
+++ b/support/testing/tests/package/test_mesa3d.py
@@ -4,7 +4,6 @@ import infra.basetest
 RUSTICL_TIMEOUT = 180
 
 
-# gitlab-runner: 2xlarge
 class TestMesa3DRusticl(infra.basetest.BRTest):
     config = """
         BR2_aarch64=y
diff --git a/support/testing/tests/package/test_nodejs.py b/support/testing/tests/package/test_nodejs.py
index 0e679a0ddd..2884529c6e 100644
--- a/support/testing/tests/package/test_nodejs.py
+++ b/support/testing/tests/package/test_nodejs.py
@@ -3,7 +3,6 @@ import os
 import infra.basetest
 
 
-# gitlab-runner: 2xlarge
 class TestNodeJSBasic(infra.basetest.BRTest):
     config = \
         """
@@ -29,7 +28,6 @@ class TestNodeJSBasic(infra.basetest.BRTest):
         self.assertRunOk("node sample_nodejs_basic.js")
 
 
-# gitlab-runner: large
 class TestNodeJSModuleHostBin(infra.basetest.BRTest):
     config = \
         """
@@ -57,7 +55,6 @@ class TestNodeJSModuleHostBin(infra.basetest.BRTest):
         self.assertRunOk("node sample_nodejs_module.js")
 
 
-# gitlab-runner: 2xlarge
 class TestNodeJSModuleHostSrc(infra.basetest.BRTest):
     config = \
         """
diff --git a/support/testing/tests/package/test_openblas.py b/support/testing/tests/package/test_openblas.py
index edfd08c55c..9cfe08ef2c 100644
--- a/support/testing/tests/package/test_openblas.py
+++ b/support/testing/tests/package/test_openblas.py
@@ -3,7 +3,6 @@ import os
 import infra.basetest
 
 
-# gitlab-runner: large
 class TestOpenBLAS(infra.basetest.BRTest):
     config = \
         """
diff --git a/support/testing/tests/package/test_openjdk.py b/support/testing/tests/package/test_openjdk.py
index d57bc0a711..0dc69b7c49 100644
--- a/support/testing/tests/package/test_openjdk.py
+++ b/support/testing/tests/package/test_openjdk.py
@@ -3,7 +3,6 @@ import os
 import infra.basetest
 
 
-# gitlab-runner: large
 class TestOpenJdk(infra.basetest.BRTest):
     br2_external = [infra.filepath("tests/package/br2-external/openjdk")]
     config = \
diff --git a/support/testing/tests/package/test_perl_dbd_mysql.py b/support/testing/tests/package/test_perl_dbd_mysql.py
index b9dfd97347..93551b420f 100644
--- a/support/testing/tests/package/test_perl_dbd_mysql.py
+++ b/support/testing/tests/package/test_perl_dbd_mysql.py
@@ -2,7 +2,6 @@ from tests.package.test_perl import TestPerlBase
 import os
 
 
-# gitlab-runner: xlarge
 class TestPerlDBDmysql(TestPerlBase):
     """
     package:
diff --git a/support/testing/tests/package/test_python_pyqt5.py b/support/testing/tests/package/test_python_pyqt5.py
index fd933ba560..65130f9c03 100644
--- a/support/testing/tests/package/test_python_pyqt5.py
+++ b/support/testing/tests/package/test_python_pyqt5.py
@@ -3,7 +3,6 @@ import os
 import infra.basetest
 
 
-# gitlab-runner: large
 class TestPythonPyQt5(infra.basetest.BRTest):
     # We use a specific configuration for:
     # - using Aarch64, to have more than 256MB memory,
diff --git a/support/testing/tests/package/test_python_scipy.py b/support/testing/tests/package/test_python_scipy.py
index af7aa8f0c0..608a3f6e87 100644
--- a/support/testing/tests/package/test_python_scipy.py
+++ b/support/testing/tests/package/test_python_scipy.py
@@ -3,7 +3,6 @@ import os
 from tests.package.test_python import TestPythonPackageBase
 
 
-# gitlab-runner: large
 class TestPythonPy3SciPy(TestPythonPackageBase):
     __test__ = True
     # Need to use a different toolchain than the default due to
diff --git a/support/testing/tests/package/test_rust.py b/support/testing/tests/package/test_rust.py
index 5602aee3e7..763125ca20 100644
--- a/support/testing/tests/package/test_rust.py
+++ b/support/testing/tests/package/test_rust.py
@@ -35,7 +35,6 @@ class TestRustBin(TestRustBase):
         self.assertRunOk("rg Buildroot /etc/issue")
 
 
-# gitlab-runner: 2xlarge
 class TestRust(TestRustBase):
     config = \
         """
diff --git a/support/testing/tests/package/test_uboot_openssl_pkgconfig.py b/support/testing/tests/package/test_uboot_openssl_pkgconfig.py
index 6d6be9fa7b..55a45f44fc 100644
--- a/support/testing/tests/package/test_uboot_openssl_pkgconfig.py
+++ b/support/testing/tests/package/test_uboot_openssl_pkgconfig.py
@@ -3,7 +3,6 @@ import os
 import infra.basetest
 
 
-# gitlab-runner: large
 class TestUbootOpensslPkgConfig(infra.basetest.BRTest):
     config = infra.basetest.MINIMAL_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_weston.py b/support/testing/tests/package/test_weston.py
index 1b25d5ac5e..c4a522c95b 100644
--- a/support/testing/tests/package/test_weston.py
+++ b/support/testing/tests/package/test_weston.py
@@ -5,7 +5,6 @@ import infra.basetest
 from ..graphics_base import GraphicsBase
 
 
-# gitlab-runner: large
 class TestWeston(infra.basetest.BRTest, GraphicsBase):
     config = \
         """
diff --git a/support/testing/tests/package/test_wine.py b/support/testing/tests/package/test_wine.py
index 77f233fef4..8c7b80f522 100644
--- a/support/testing/tests/package/test_wine.py
+++ b/support/testing/tests/package/test_wine.py
@@ -3,7 +3,6 @@ import os
 import infra.basetest
 
 
-# gitlab-runner: large
 class TestWine(infra.basetest.BRTest):
     # Wine depends on i386 architecture. The pre-build runtime test
     # Kernel (for armv5) cannot be used. The config also uses a ext4
diff --git a/support/testing/tests/package/test_xen.py b/support/testing/tests/package/test_xen.py
index 8793ec6762..23efb2055d 100644
--- a/support/testing/tests/package/test_xen.py
+++ b/support/testing/tests/package/test_xen.py
@@ -149,7 +149,6 @@ class TestXenBase(infra.basetest.BRTest):
         self.assertRunOk("brctl show")
 
 
-# gitlab-runner: large
 class TestXenAarch64(TestXenBase):
     # Test Xen on 64b Arm.
     # Boot flow: Qemu Devicetree -> U-Boot -> Xen UEFI -> Linux
@@ -190,7 +189,6 @@ class TestXenAarch64(TestXenBase):
         self.run_xen_test(arch="aarch64", options=qemu_opts)
 
 
-# gitlab-runner: large
 class TestXenArmv7(TestXenBase):
     # Test Xen on 32b Arm v7.
     # Boot flow: Qemu Devicetree -> U-Boot -> Xen -> Linux
diff --git a/support/testing/tests/package/test_zfs.py b/support/testing/tests/package/test_zfs.py
index ba9c8d3e90..384fad7e33 100644
--- a/support/testing/tests/package/test_zfs.py
+++ b/support/testing/tests/package/test_zfs.py
@@ -63,7 +63,6 @@ class TestZfsBase(infra.basetest.BRTest):
             self.assertRunOk(cmd, timeout=self.timeout)
 
 
-# gitlab-runner: medium
 class TestZfsGlibc(TestZfsBase):
     config = TestZfsBase.config + \
         """
@@ -74,7 +73,6 @@ class TestZfsGlibc(TestZfsBase):
         TestZfsBase.base_test_run(self)
 
 
-# gitlab-runner: large
 class TestZfsUclibc(TestZfsBase):
     # The Bootling aarch64 uclibc stable 2025.08-1 needs to be
     # rebuild with uClibc-ng 1.0.55.
@@ -94,7 +92,6 @@ class TestZfsUclibc(TestZfsBase):
         TestZfsBase.base_test_run(self)
 
 
-# gitlab-runner: medium
 class TestZfsMusl(TestZfsBase):
     config = TestZfsBase.config + \
         """
diff --git a/support/testing/tests/toolchain/test_aarch64_64k.py b/support/testing/tests/toolchain/test_aarch64_64k.py
index 9962fea813..7cdbdb9faf 100644
--- a/support/testing/tests/toolchain/test_aarch64_64k.py
+++ b/support/testing/tests/toolchain/test_aarch64_64k.py
@@ -42,7 +42,6 @@ class TestAarch64Pages64kBase(infra.basetest.BRTest):
         self.assertEqual(2 ** order * 64 * 1024, size)
 
 
-# gitlab-runner: large
 class TestAarch64Pages64kGlibc(TestAarch64Pages64kBase):
     __test__ = True
     config = TestAarch64Pages64kBase.config + \
@@ -51,7 +50,6 @@ class TestAarch64Pages64kGlibc(TestAarch64Pages64kBase):
         """
 
 
-# gitlab-runner: large
 class TestAarch64Pages64kuClibc(TestAarch64Pages64kBase):
     __test__ = True
     config = TestAarch64Pages64kBase.config + \
@@ -60,7 +58,6 @@ class TestAarch64Pages64kuClibc(TestAarch64Pages64kBase):
         """
 
 
-# gitlab-runner: large
 class TestAarch64Pages64kMusl(TestAarch64Pages64kBase):
     __test__ = True
     config = TestAarch64Pages64kBase.config + \
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
