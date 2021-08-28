Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28755C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 15:33:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7B6F604AC
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 15:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D7B6F604AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADC084025F;
	Sat, 28 Aug 2021 15:33:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qp_fUtPrYiGk; Sat, 28 Aug 2021 15:33:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B5C340234;
	Sat, 28 Aug 2021 15:33:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D3FB71BF33B
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 15:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2DFA83B27
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 15:33:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mxEIp6GiAND4 for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 15:32:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEFB883B28
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 15:32:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 21A338437C; Sat, 28 Aug 2021 15:31:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 17:03:13 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a30204b005f484937a8b0a6a8b58a514394bfcfb
X-Git-Newrev: 12c7a05da154f2056d0a2a1a72f5d066b8d7b87e
X-Patchwork-Hint: ignore
Message-Id: <20210828153150.21A338437C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] utils/test-pkg: add gitlab-ci
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=12c7a05da154f2056d0a2a1a72f5d066b8d7b87e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The gitlab-ci support in test-pkg allows to parallelize the test-pkg
work into several gitlab jobs. It's much faster than local serialized
testing.

To trigger this, a developer will have to add, in the latest commit of
their branch, a token on its own line, followed by a configuration
fragment, e.g.:

    test-pkg config:
    SOME_OPTION=y
    # OTHER_OPTION is not set
    SOME_VARIABLE="some value"

This configuration fragment is used as input to test-pkg.

To be able to generate one job per test to run, we need the list of
tests in the parent pipeline, and the individual .config files (one per
test) in the child pipeline. We use the newly-introduced --prepare-only
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
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml                         |  5 +++++
 support/misc/gitlab-ci.yml.in          | 22 ++++++++++++++++++++++
 support/scripts/generate-gitlab-ci-yml | 27 ++++++++++++++++++++++++++-
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
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
