Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC29CDB470
	for <buildroot@archiver.kernel.org>; Tue, 23 Jun 2026 08:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B22B8151E;
	Tue, 23 Jun 2026 08:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xWyu_W8AudS2; Tue, 23 Jun 2026 08:45:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43EDE81510
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782204309;
	bh=obsg8yBJ9Aep0Ez2bAfWEU/I747z4kLS4XoE3IQbZog=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JpGKp0s50qf+nH7KqEM/aZ5UC0v6G6XomBZARuEYh8IEGEuk0p82TuuqI5PaTO4zN
	 bdwrsPBUMsJ3SATGDQGN2AhU/noy2SHbAABRzUN8MTod/opGitEi5DxccM33ADw0K0
	 3AYCKWl4xDwBZYauCTYz7A1Ix6ZQTqOpmclM4berD7piGMzdIZEVll8sOv/S4YhW4Q
	 hSE2THXDndPiHF0savciiaRilCm+Gp1xdaboEG1EG7NpOaV34SQ67OgTB+vK7sMBLa
	 wqazwcXHVHpHOLV32+uGj7Paj9Py9pt1In2MyYzqokfoTHkeNdBBee3jxw3LKUhVvw
	 RhQ+ESe+YEMLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43EDE81510;
	Tue, 23 Jun 2026 08:45:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9694D367
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 08:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8906160841
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 08:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id chYzPDF7McKy for <buildroot@buildroot.org>;
 Tue, 23 Jun 2026 08:45:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6A59260840
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A59260840
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A59260840
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 08:45:07 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-490b8ac62baso6701755e9.0
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 01:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782204305; x=1782809105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NKijKXdYbln0BUzgfRgmvomLZhIugKM0KBy7sVwg7Pw=;
 b=M5v2lkhTwr0cgILPWGemK7BpXRWDkmK9Y6PJU1wo7scvID7WViZBK/MRJcF7ZTDd6O
 uusAKd4rL/+v4YyxsJGr7MpHMxjBYDbsIRrWHCQUa2MCx/B7/OLmeaPzxnC0uj6xyrQp
 5bhoWX6GLN3SznDkzSz6N/icSUWEyMAwhgEXxeWSznxfZYBzL0TqpO7z8Mt9Q8blhoTC
 NNV1XdaqIs1LtPylknvazIKRVRNzUwPh7dbKum7+4awPgw0j6ok/WcCe8NbWPSCqepP1
 uX421VJjVHTdRY/2V6g2qJLRjXU6dVxpLxjnO8esQ6Z9vDMciGbf22zuIJHKIjFXsUcl
 4F4g==
X-Gm-Message-State: AOJu0Yxxq3Lx9pJsel6DpMvLR3ZPDR7pd2GyJjkUjcgoT4F6h3k7awtX
 1DFdBJgAJYhqvrNlpr0oTwqbcy6McgU1uVV8isR2Puhb+cAhyXltNZA6FYvB+GZCfXZvnEUJQ/H
 ZdxNuwno=
X-Gm-Gg: AfdE7cm23K6xRo2Tw69g4A/qaxAERGw/0PPJuN0fHF0BXFhiWnWnyD0cYnyx/FqtS9W
 xv7UYoqQi3BYYp89zQsPj+JlONeUJZeu0Zq6K9agHxz2I4XfCXyzBEZL/urZICyNwk1RWPLens7
 s7HjFsUnQ0VrJ7r38d4keDkC5AajKadQnVgplKaqR1mSPypVXtKhWUZYGlj/0nyV/MoBw9QskfA
 NIdM6toNT1fSwRcP7B2iGkwQ5VGHdwPXQ+I7C9sytnMg6FxeCKYxOeTMyCYyFBDSlP6zcoMFlHb
 sFA7aR6RgdqNTIzi/S+mU6+wpbilM8WE+B12oKgUeiL/HNNBmBIyYvcQSxu33kTs70IiGMaguXZ
 w5p5Q7LCGGpU8h9Y6SJMCEmsYFdMaqExNKpCf37702KHk3IJcef2cCGffQsVworm5dkMjqAHJt2
 6FVhCsgFRU/3zjMtO7mIk2STcaLlQvaifWZvyCNaUyFQ5FMxuVZ94qvl/lEwfwy0xW7TJAHgdDy
 ImKmL00r8BaCpgCU6P5
X-Received: by 2002:a05:600c:3b2a:b0:490:af63:2cb1 with SMTP id
 5b1f17b1804b1-4925a0a9b8bmr37381405e9.7.1782204305443; 
 Tue, 23 Jun 2026 01:45:05 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49249207dabsm490734505e9.0.2026.06.23.01.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2026 01:45:05 -0700 (PDT)
To: buildroot@buildroot.org
Cc: romain.naour@smile.fr,
	Dowan Gullient <dowan.gullient@smile.fr>
Date: Tue, 23 Jun 2026 10:44:39 +0200
Message-ID: <20260623084439.2321675-3-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623084439.2321675-1-dowan.gullient@smile.fr>
References: <20260623084439.2321675-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782204305; x=1782809105; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NKijKXdYbln0BUzgfRgmvomLZhIugKM0KBy7sVwg7Pw=;
 b=zlSsP+NZWVlbz0n1+Y2K4d1SreKaPyMs9UmlaJABWDajnKIfexK235/asW0xzvQtSR
 YZHGSKgQ327Z8z/9LkjmgfuJ8/xIG+RZvljFRY51QKIbaxs3rSBBgJJLM2LCEYQuo6cw
 TOVEOwqqbA6kD1JSQhuGUf2wbrkLeCipFjrDw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=zlSsP+NZ
Subject: [Buildroot] [PATCH 2/2] support/scripts/{gitlab-ci.yml.in,
 generate-gitlab-ci-yml}: build runtime kernel in Gitlab CI job
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds manual trigged jobs in GitLab CI to generate pre-built
kernels to be used later by Builroot runtime testsuite.

For now build only one kernel (aarch64/cortex-a53 for Qemu aarch64 virt
target) but we will add more architectures later (x86_64-q35), thus the
'all' option in generate-gitlab-ci-yml.

We rely on the BR_PREBUILT_KERNELS variable to provide the list of
kernels to build. For convenience we can use "all" to build all
supported kernels. When BR_PREBUILT_KERNELS is set, we use its
information to generate the a new job for each requested kernel using
.runtime_prebuilt_kernels template.

The .runtime_prebuilt_kernels use the job name to retrieve the
defconfig used to build the prebuilt kernel. Such defconfig files
are located in support/testing/builtin-kernels/<qemu-arch>/ directory.
They are not usual defconfigs from configs directory.

The generated kernel is located in the output directory, sorted by
architecture & creation date, and named kernel-${BOARD_NAME}-${LINUX_VERSION}
to be added to the build artifacts and then moved to the gitlab package
registry.
We will later update ARTIFACTS_URL in infra/__init__.py to use the URL
of the freshly-generated kernel, with this URL format:
https://gitlab.com/api/v4//projects/<project-id>/packages/generic/prebuilt-kernels-<arch>/<date>/kernel-<name>-<version>

Regarding the package registry, we do not need to create tokens as when a
maintainer will launch the job, it will automatically create a temporary
token to push the generated kernel in the registry.

The goal is to later use this generated kernel in the testsuite instead
of the old ones while preventing to build a kernel for each test.

We use "armv8" as alias to aarch64 cortex-a53 cpu target. "aarch64" is not
specific enough since it could be any of the armv8 or armv9 cores.

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/misc/gitlab-ci.yml.in          | 50 ++++++++++++++++++++++++++
 support/scripts/generate-gitlab-ci-yml | 21 ++++++++++-
 2 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index 81c380a4ed..4410377ad2 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -176,3 +176,53 @@ before_script:
             - br-test-pkg/*/defconfig
             - br-test-pkg/*/build/build-time.log
             - br-test-pkg/*/build/packages-file-list*.txt
+
+.runtime_prebuilt_kernels:
+    stage: test
+    script:
+        - |
+            {
+                case ${CI_JOB_NAME} in
+                armv8)
+                    DEFCONFIG_NAME="support/testing/builtin-kernels/aarch64-virt/kernel_aarch64_virt_defconfig"
+                    ;;
+                *)
+                    echo "${CI_JOB_NAME} not supported"
+                    exit 1
+                esac
+            }
+        - OUTPUT_DIR=output
+        - mkdir -p ${OUTPUT_DIR}
+        - echo "Configure Buildroot for ${DEFCONFIG_NAME}"
+        - make defconfig BR2_DEFCONFIG=${DEFCONFIG_NAME}
+        - echo "Build ${CI_JOB_NAME} kernel"
+        - *run_make
+        - echo "Upload of the kernel to Package Registry..."
+        - |
+          KERNEL_FILE=$(ls output/images/kernel-* 2>/dev/null | head -n 1)
+          if [ -n "$KERNEL_FILE" ]; then
+           FILENAME=$(basename ${KERNEL_FILE})
+           KERNEL_DATE=$(date +%Y-%m-%d)
+           echo "Upload of artifact for date : ${KERNEL_DATE}"
+           curl --header "JOB-TOKEN: ${CI_JOB_TOKEN}" \
+                --upload-file "${KERNEL_FILE}" \
+                "${CI_API_V4_URL}/projects/${CI_PROJECT_ID}/packages/generic/prebuilt-kernels-${CI_JOB_NAME}/${KERNEL_DATE}/${FILENAME}"
+          else
+            echo "Error : No kernel found in output/images/"
+            exit 1
+          fi
+    retry:
+        max: 2
+        when:
+            - runner_system_failure
+            - stuck_or_timeout_failure
+    artifacts:
+        when: always
+        expire_in: 2 weeks
+        paths:
+            - .config
+            - build.log
+            - output/images/kernel-*
+            - output/build/build-time.log
+            - output/build/packages-file-list.txt
+            - output/build/generated-kernel-fragments/linux-gen-pkgs.fragment
diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 48c272e6f5..48922a5d93 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -23,7 +23,7 @@ _EOF_
 
 gen_tests() {
     local -a basics defconfigs runtimes
-    local do_basics do_defconfigs do_runtime do_testpkg
+    local do_basics do_defconfigs do_prebuilt_kernels do_runtime do_testpkg
     local defconfigs_ext cfg runner tst
 
     basics=( check-package check-symbol DEVELOPERS package symbol )
@@ -56,6 +56,17 @@ gen_tests() {
             do_runtime=true
             ;;
         esac
+    elif [ -n "${BR_PREBUILT_KERNELS}" ]; then
+        case "${BR_PREBUILT_KERNELS}" in
+            (all)
+                prebuilt_kernels=( "armv8" )
+                do_prebuilt_kernels=true
+                ;;
+            (armv8)
+                prebuilt_kernels=( "${BR_PREBUILT_KERNELS}" )
+                do_prebuilt_kernels=true
+                ;;
+        esac
     else
         case "${CI_COMMIT_REF_NAME}" in
           (*-basics)
@@ -113,6 +124,7 @@ gen_tests() {
     if [    -z "${do_defconfigs}" \
          -a -z "${do_runtime}" \
          -a -z "${do_testpkg}" \
+         -a -z "${do_prebuilt_kernels}" \
        ]
     then
         do_basics=true
@@ -147,6 +159,13 @@ gen_tests() {
     if [ -n "${do_testpkg}" ]; then
         printf '%s: { extends: .test_pkg }\n' "${do_testpkg[@]}"
     fi
+
+    if [ -n "${do_prebuilt_kernels}" ]; then
+        printf '%s: { extends: .runtime_prebuilt_kernels }\n' \
+               "${prebuilt_kernels[@]}"
+    fi
+
+
 }
 
 main "${@}"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
