Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD3FC43458
	for <buildroot@archiver.kernel.org>; Thu,  9 Jul 2026 15:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 308DD4057C;
	Thu,  9 Jul 2026 15:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rvEi6DpLrFdS; Thu,  9 Jul 2026 15:05:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45E2740587
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783609529;
	bh=Hu9wPLqHM0sMrc/YvjHU+sAaoQkdY76yJ8+IpUXT3WE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Owo1wLaDuw/aNo6wyGlmS8vbNtX2vCyaM2Lf2td41dPlphWubSDXC73myK6lhrv/q
	 /gQLkUAdmVkqi/RaaWpwb8zWQb40jsMIgcwsCkUJ0rhljvTT2u0STYdPOs9Hw10UKo
	 aUh1OEwQXZwAuQwbWKoiV7x1ho9S9G7yKYFEyPNuoPUo2xPZqU1qgWeQULpCrUn72u
	 CfCs7psabqCGV7lfO0IUd2ID6Kh+COdKk3dWwwvKY8iqj2/YntmJNKCug1kf3nsOP+
	 61LRfW7hbaNyw2jKA+qzEkLwaOazphLwX7SEgRPEIoj0rABZLuSUTADHANY41FLW4L
	 O3WCIQvZCwfdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45E2740587;
	Thu,  9 Jul 2026 15:05:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B3AEF315
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 15:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EA0E8221C
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 15:05:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z5ls46-WVRZu for <buildroot@buildroot.org>;
 Thu,  9 Jul 2026 15:05:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5E6288221A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E6288221A
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E6288221A
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 15:05:25 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-493e8d4f4dcso11777835e9.0
 for <buildroot@buildroot.org>; Thu, 09 Jul 2026 08:05:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783609524; x=1784214324;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=v0SeXOdAjpnLs8LR+L/rebQ4Y4f7VngDy1HeCv/4vaE=;
 b=miJ5rCem5liWnOqYTSrmgzhA8bekX7NWP+VX7GgMRYWZYTqn3hk/pCf69zuHBnN9IZ
 AGYNnc3lg6XG+t8CaK4UCaf/GInfQiZyiEC95xPVc5+DFY/sMNTLgciO0j/8USupojCG
 wyQhGEJbqN54lRBycmuLXK9sglE7k7pfCwUQxZUv87PVeSRx8m6VKH17z4rAuqhcKn20
 /MbcBoVHeg7HXiGUpiPt9KxtjUYt5Xmb3DeLSC4Jv4gBv1w9Y0dHUodsW6X5eDfL/U71
 MTTDUMp7pywU8O3dqAysjY4WnBPVoIhHU0Pdq9lHa6CCVeGD7xdfFPXYb0/vFInIIT+i
 /Q1g==
X-Gm-Message-State: AOJu0Yw0HPu3wmTNdq/UrfvVUCY1MStPfU4n/jLnFc1QSQr39dUYqWFg
 7/32g12w1TeMY3zMI4cVdIjm/0L4kGVn0ARbricVUQmVAxdEee5bxoJUwyPlyzFZ7mZTgSr7ubY
 FNhOblXQ=
X-Gm-Gg: AfdE7cmsfZ209uKyH2LGk4Dq0jRrYvy3ZsyuhuAh9Vdit37PGVUE9XtLg5VvEXsHVq/
 c7BEadiG8cOmSDzplAjDf5hoB8gZbmDHueOmBdTFW6Fq9XfW7QcpyQiKZcmH5xC1c8aQpURCxHT
 0lHDhXaPkm1RbSbhobcOgaGIJqe7b0AFaEpuSTJjojUK+9ri0F8kOUhCfxUYnYkbtYimiszkjgr
 TVQU7sxQ6a3IsGD2t1GkhfYNutwTj4+DAvs+4k5SFW4T3hHhbKV7/vBbNcT1re0/ovV8o7c2hl0
 RHN3M3QtJfIV5WFbhw5CIeyt7HRW9D+WFWdHvMFOB17degpfhiWoI9/cFKJcr63yZ1zGkwfLm1v
 3Qr9XHX63Q6KC0iplWWaHOOwiAdHW5ZK8XsJO8LR6f8WuG++3RHJgFNX7b/rMCtzFm7QzoOkVni
 g+WI3J44Kgbf2JxaApGqlsxivtA2Dhsug53K+PqTIvb66u9wit0w0TTTxw+sX005WYYCJAMR2i5
 rTLUDHXsg==
X-Received: by 2002:a05:600c:4753:b0:493:dad1:e46a with SMTP id
 5b1f17b1804b1-493e6891fb8mr75970365e9.21.1783609524030; 
 Thu, 09 Jul 2026 08:05:24 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6df417sm68581495e9.8.2026.07.09.08.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 08:05:23 -0700 (PDT)
To: buildroot@buildroot.org
Cc: romain.naour@smile.fr,
	Dowan Gullient <dowan.gullient@smile.fr>
Date: Thu,  9 Jul 2026 17:05:18 +0200
Message-ID: <20260709150518.1501506-1-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1783609524; x=1784214324; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=v0SeXOdAjpnLs8LR+L/rebQ4Y4f7VngDy1HeCv/4vaE=;
 b=oW42IS04b4x0XqwVUMoNcknwZdTReuI3NYNJZ9mRvRx5W9SVnuSFDTNIY37yfcvRlK
 OUplmJkPDQE9hAMBCwKFNzMBKiz5i/j1/LmZx1hwwBHycbhS9HatF2/zsE9GUwAU3XAt
 kAZEhLJG/V+2V4aQ/Qw8Ig80mixpvuw7WGXwM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=oW42IS04
Subject: [Buildroot] [PATCH] support/docker: automate image generation via
 GitLab CI
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

This patch injects automation into our pipeline to stop relying on
manual local builds, which often cause user ID conflicts and require
heavy CPU resources for multi-arch cross-compilation.

We introduce a new `.buildroot_docker_image` job in gitlab-ci.yml.in
that handles the full buildx and push sequence directly on GitLab CI.

Technical details of the CI job:
- Docker-in-Docker (DinD): Uses the `docker:24.0.5-dind` service with
  `DOCKER_TLS_CERTDIR="/certs"` to allow the Docker client to securely
  communicate with the daemon inside the isolated GitLab CI runner. [1]
- Multi-arch emulation: Since standard CI runners are AMD64 and do not
  run Docker Desktop, they lack native QEMU emulation. We use the
  `tonistiigi/binfmt --install all` image to register QEMU emulators
  into the runner's kernel via binfmt_misc. This is mandatory to prevent
  `exec format error` when building the `linux/arm64/v8` layer. [2]
- Buildx: Compiles for both AMD64 and ARM64 in a single pass and pushes
  the `YYYYMMDD.HHMM` to the Container Registry.

Triggers are implemented in generate-gitlab-ci-yml:
1. Automatic: If a commit merged into `master` modifies the `Dockerfile`
   or `debian.sources`, the script detects it via `git show` and
   automatically appends the docker build job.
2. Manual: Maintainers can trigger the job on-demand by setting the
   `BR_BUILD_DOCKER_IMAGE` variable in a manual pipeline.

[1] https://about.gitlab.com/blog/docker-in-docker-with-docker-19-dot-03/
[2] https://docs.docker.com/build/building/multi-platform/#qemu

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 support/misc/gitlab-ci.yml.in          | 35 ++++++++++++++++++++++++++
 support/scripts/generate-gitlab-ci-yml | 16 +++++++++++-
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index 81c380a4ed..21edf84a51 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -176,3 +176,38 @@ before_script:
             - br-test-pkg/*/defconfig
             - br-test-pkg/*/build/build-time.log
             - br-test-pkg/*/build/packages-file-list*.txt
+
+.buildroot_docker_image:
+    stage: test
+    # Compilation of the docker image based on configurations in the support/docker folder of the project
+    image: docker:29.6.1
+    services:
+        - docker:29.6.1-dind
+    variables:
+        DOCKER_TLS_CERTDIR: "/certs"
+    script:
+        - echo "Authentification ..."
+        - echo "${CI_REGISTRY_PASSWORD}" | docker login ${CI_REGISTRY} -u "${CI_REGISTRY_USER}" --password-stdin
+
+        - echo "Configure QEMU to enable ARM64 cross-compilation on an AMD64 runner..."
+        - docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
+        - docker run --privileged --rm tonistiigi/binfmt --install all
+
+        - echo "Creating buildx instance..."
+        - docker buildx create --use
+
+        - |
+            # Use YYYYMMDD.HHMM format as required by the Dockerfile
+            IMAGE_DATE=$(date +%Y%m%d.%H%M)
+            IMAGE_TAG="${CI_REGISTRY_IMAGE}/base:${IMAGE_DATE}"
+    
+        - echo "Multi-architecture build and push to registry (Use values written in the Dockerfile)..."
+        - |
+            docker buildx build --platform linux/amd64,linux/arm64/v8 \
+                    -t ${IMAGE_TAG} \
+                    --push support/docker/
+    retry:
+        max: 2
+        when:
+            - runner_system_failure
+            - stuck_or_timeout_failure
diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 48c272e6f5..9adaf026da 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -23,7 +23,7 @@ _EOF_
 
 gen_tests() {
     local -a basics defconfigs runtimes
-    local do_basics do_defconfigs do_runtime do_testpkg
+    local do_basics do_defconfigs do_runtime do_testpkg do_docker_image
     local defconfigs_ext cfg runner tst
 
     basics=( check-package check-symbol DEVELOPERS package symbol )
@@ -42,6 +42,12 @@ gen_tests() {
         do_basics=true
         do_defconfigs=base
         do_runtime=true
+        # Verify if last commit on master branch has modified the Dockerfile or debian.sources file
+        if [ "${CI_COMMIT_REF_NAME}" = "master" ]; then
+            if git show --name-only --format="" HEAD 2>/dev/null | grep -qE '^support/docker/(Dockerfile|debian\.sources)$'; then
+                do_docker_image=true
+            fi
+        fi
     elif [ -n "${BR_SCHEDULE_JOBS}" ]; then
         case "${BR_SCHEDULE_JOBS}" in
           (basic)
@@ -56,6 +62,8 @@ gen_tests() {
             do_runtime=true
             ;;
         esac
+    elif [ -n "${BR_BUILD_DOCKER_IMAGE}" ]; then
+        do_docker_image=true
     else
         case "${CI_COMMIT_REF_NAME}" in
           (*-basics)
@@ -113,6 +121,7 @@ gen_tests() {
     if [    -z "${do_defconfigs}" \
          -a -z "${do_runtime}" \
          -a -z "${do_testpkg}" \
+         -a -z "${do_docker_image}" \
        ]
     then
         do_basics=true
@@ -147,6 +156,11 @@ gen_tests() {
     if [ -n "${do_testpkg}" ]; then
         printf '%s: { extends: .test_pkg }\n' "${do_testpkg[@]}"
     fi
+
+    if [ -n "${do_docker_image}" ]; then
+        printf 'build-docker-image: { extends: .buildroot_docker_image }\n'
+    fi
+
 }
 
 main "${@}"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
