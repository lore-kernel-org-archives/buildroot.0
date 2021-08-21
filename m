Return-Path: <SRS0=Fkjy=NM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF6D6C4338F
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 13:47:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD09A6120E
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 13:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD09A6120E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D1E840129;
	Sat, 21 Aug 2021 13:47:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pSn9Y8F25RxS; Sat, 21 Aug 2021 13:47:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E509940273;
	Sat, 21 Aug 2021 13:47:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D5E91BF35E
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 13:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D32580F62
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 13:46:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SRGN0CpseRt8 for <buildroot@lists.busybox.net>;
 Sat, 21 Aug 2021 13:46:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13E0380F47
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 13:46:54 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id x12so18367606wrr.11
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 06:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gQK7jZuhkcfZrMM3/7q4APHACu8o7bWMVyx0GRazEoY=;
 b=h+1rO3Qc8Roa/DAj64Xdhk0/w0CYg5IDPm4wGv+o03kaJjbYGnOQIykJCLalvg25qS
 GMJHKIe9kh2Iphlcs/vqL6GyDGO0AmMeuC/WQSzKeTvd4w+FHBfMQoQ0PwJlJ14AHlIu
 87/z6FeBy2ECWePtShjJvqNZzG/b9TzzTGmC5D+zZ6PNUhraQBxGYP6sThR7FbHc5cgi
 0+uJsqECkJqIPQNoiqACDTGIa/tjvDey/B96qrBMXjvdWReW9Sh5g/69iHt8MsjgianC
 HQG8Zm7z6LA8DIcPaztpvTfx6JyZbAgj0m/vofM8mgpcMPfNW6cTMHhDw0wD5SP3SRtK
 L9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gQK7jZuhkcfZrMM3/7q4APHACu8o7bWMVyx0GRazEoY=;
 b=K1AKFTMgsrhZtjekA4i11JVXAi4Dh8V2KAprLNoOFDffugm1zfwXF8ebXZPYxD171Y
 PBNHFaz/A/S9QHi1/kf/MuMU4U6DJDKK/M/fYRYp2+zhnNBf1xeM9DErpKowuNuLnk13
 KcOplKW2Sp88Q5O0jENCv+z1C0dhRZYEDUknf1M3fH63tADkoMBHoGaaoRPKTuN5GsZw
 XjMIS2UzECfKKeg9aHKIpZLpnqU2FLjB8Oo//JtHvEXmKXlxKi/HVvyEMogAnSiVkn5k
 WQ5rPgV8XqVkh+Fqli4seh/OuDwQ1xjj45mlyR9ErekV/A54RNloB0BCbsS2bQN0j33V
 q3ow==
X-Gm-Message-State: AOAM530WzLEKjnpqq2qMGQ4sQTsAObOWRsyXLYS32PMZbjkh/osG97Xh
 XteAjJ4YsbJ8slLTESqxg/iv0sEwuW4=
X-Google-Smtp-Source: ABdhPJyPQTVU0rteR+OvukzijD3TuVycg7Il/8Jrry6RTgAXbday33CEQVer0l3G+LYCIPBhLBLQAw==
X-Received: by 2002:adf:f7c2:: with SMTP id a2mr2825345wrq.58.1629553613254;
 Sat, 21 Aug 2021 06:46:53 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id c14sm509923wrr.58.2021.08.21.06.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 06:46:52 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Aug 2021 15:46:46 +0200
Message-Id: <20210821134646.1163359-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210821134646.1163359-1-romain.naour@gmail.com>
References: <20210821134646.1163359-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 for-next 2/2] utils/test-pkg: add gitlab-ci
 support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

The gitlab-ci support in test-pkg allows to parallelize the test-pkg
work into several gitlab jobs. It's much faster than local serialized
testing.

To triger this, a developper will have to add, to the latest commit of
their branch, a token on its own line, followd by a configuration
fragment, e.g.:

    test-pkg config:
    SOME_OPTION=y
    # OTHER_OPTION is not set
    SOME_VARIABLE="some value"

This configuration fragment is used as input to test-pkg.

To be able to generate one job per test to run, we need the list of
tests in the parent pipeline, and the individual .config files (one per
test) in the child pipeline. We use the newly-introduce --prepare-only
mode to test-pkg, and collect all the generated .config files as
artefacts; those are inherited in the child pipeline via the
"needs::pipeline" and "needs::job" directives. This is a bit tricky,
and is best described by the Gitlab-CI documentation [0].

We also list those .config files to generate the actual list of jobs to
run in the child pipeline.

Notes:
  - if the user provides an empty fragment, this is considered an error:
    indeed, without a fragment (and the package name), there is no way
    to know what to test;
  - if that fragment yields an empty list of tests, then there is
    nothing to test either, so that is also considered an error.

[0] https://docs.gitlab.com/ee/ci/yaml/README.html#artifact-downloads-to-child-pipelines

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[yann.morin.1998@free.fr:
  - split the change to test-pkg to its own patch
  - generate the actual yml snippet in support/scripts/generate-gitlab-ci-yml,
    listing the .config files created by test-pkg
  - some code-style-candies...
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .gitlab-ci.yml                         |  5 +++++
 support/misc/gitlab-ci.yml.in          | 22 +++++++++++++++++++++
 support/scripts/generate-gitlab-ci-yml | 27 +++++++++++++++++++++++++-
 3 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e85ac32033..bf9f2dca6c 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -11,8 +11,11 @@ generate-gitlab-ci-yml:
   stage: generate-gitlab-ci
   script: ./support/scripts/generate-gitlab-ci-yml support/misc/gitlab-ci.yml.in > generated-gitlab-ci.yml
   artifacts:
+    when: always
     paths:
       - generated-gitlab-ci.yml
+      - br-test-pkg/*/.config
+      - br-test-pkg/*/missing.config
 
 buildroot-pipeline:
   stage: build
@@ -21,3 +24,5 @@ buildroot-pipeline:
       - artifact: generated-gitlab-ci.yml
         job: generate-gitlab-ci-yml
     strategy: depend
+  variables:
+    PARENT_PIPELINE_ID: $CI_PIPELINE_ID
diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index 1ee3772154..be7951b3d2 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -80,3 +80,25 @@
             - test-output/*/.config
             - test-output/*/images/*
 
+.test_pkg:
+    stage: build
+    before_script:
+        - OUTPUT_DIR=${CI_JOB_NAME}
+    script:
+        - echo "Configure Buildroot for ${OUTPUT_DIR}"
+        - make O=${OUTPUT_DIR} syncconfig
+        - make O=${OUTPUT_DIR} savedefconfig
+        - echo 'Build buildroot'
+        - *run_make
+    needs:
+        - pipeline: $PARENT_PIPELINE_ID
+          job: generate-gitlab-ci-yml
+    artifacts:
+        when: always
+        expire_in: 2 weeks
+        paths:
+            - build.log
+            - br-test-pkg/*/.config
+            - br-test-pkg/*/defconfig
+            - br-test-pkg/*/build/build-time.log
+            - br-test-pkg/*/build/packages-file-list*.txt
diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 3f498e08fd..063c5081da 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -23,7 +23,7 @@ _EOF_
 
 gen_tests() {
     local -a basics defconfigs runtimes
-    local do_basics do_defconfigs do_runtime
+    local do_basics do_defconfigs do_runtime do_testpkg
     local defconfigs_ext cfg tst
 
     basics=( DEVELOPERS flake8 package )
@@ -77,9 +77,30 @@ gen_tests() {
         esac
     fi
 
+    # Retrieve defconfig for test-pkg from the git commit message (if any)
+    if grep -q -E '^test-pkg config:$' <<<"${CI_COMMIT_DESCRIPTION}"; then
+        sed -r -n -e '/^test-pkg config:$/{:a;n;p;ba;}' \
+            <<<"${CI_COMMIT_DESCRIPTION}" \
+            >defconfig.frag
+        if [ ! -s defconfig.frag ]; then
+            printf "Empty configuration fragment.\n" >&2; exit 1
+        fi
+        # Use --all since we expect the user having already pre-tested the
+        # new package with the default subset of toolchains.
+        ./utils/test-pkg \
+            --all --prepare-only \
+            --config-snippet defconfig.frag \
+            --build-dir br-test-pkg >&2
+        do_testpkg=( $(ls -1 br-test-pkg/*/.config 2>/dev/null |xargs -r dirname ) )
+        if [ "${#do_testpkg[@]}" -eq 0 ]; then
+            printf "Configuration fragment enables no test.\n" >&2; exit 1
+        fi
+    fi
+
     # If nothing else, at least do the basics to generate a valid pipeline
     if [    -z "${do_defconfigs}" \
          -a -z "${do_runtime}" \
+         -a -z "${do_testpkg}" \
        ]
     then
         do_basics=true
@@ -101,6 +122,10 @@ gen_tests() {
     if ${do_runtime:-false}; then
         printf '%s: { extends: .runtime_test_base }\n' "${runtimes[@]}"
     fi
+
+    if [ -n "${do_testpkg}" ]; then
+        printf '%s: { extends: .test_pkg }\n' "${do_testpkg[@]}"
+    fi
 }
 
 main "${@}"
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
