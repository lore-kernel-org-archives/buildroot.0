Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDB7E85375
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 14:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E843F40DA6;
	Fri,  3 Apr 2026 14:50:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O2mIXSWSMZfK; Fri,  3 Apr 2026 14:50:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17FD941148
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775227842;
	bh=IHDnyqGXLqtD2RVov4u/bC59+OWGt2G2VAsMjoSuOF4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=K8LCwzQRB+8Pm9S22ydlcDVivuS36sVsIhL1W14dk/jpR4g35KP9TKdwtvCCPczCb
	 FIemJmHE8uxhFQ6gYvMWaQ0Lr1AEl+i920+qVWjAZ3hmMHVxDYCldwC6UbzfkT6gi3
	 Td4Z1tiMrb9l5XyTtVHKRcB8wr+0bb+YYhAaz2ae696ZnFRPZKakCuF5QgYeySrkVQ
	 mM8Wbf2kaZHDTpCIwhthBt5YxFP0bxN2/D0pnB4Gm0BbuV26pDT8w8QPvzTq34nW4X
	 uAnIAj4/DH6hKsbYPZpNd+z/L1zmSAiq9NMzXwQmCqPhdB4TmAbglu6i27e2poKV2e
	 i1+Kb4v8bmAMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17FD941148;
	Fri,  3 Apr 2026 14:50:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B92AD1A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 14:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8CBF40DA6
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 14:50:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bn3gEFADkm9n for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 14:50:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BBBE941148
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBBE941148
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBBE941148
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 14:50:38 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-488971db0fdso9502605e9.0
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 07:50:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775227836; x=1775832636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/5EfDYgaRoI6swP1ytk4marn6judwKK8/RKJrnY9Mc0=;
 b=VoZUJvXIG+bKFhX1I1OmwTKe7RvskP0zyedjl7TB8rrjDz6+S3twJA73Lr7+bMi3Ap
 puv9XDs4493S8k5CMrXaWpTph61UvXdYIO7qIP9o7nGEX9yv0jnIDHrtMAAwLVqO0tWA
 UvVtQkrK4qqA0P8FdMKMwMmOYU+QJ2OUMSfimWVv9QGmyKLYAT30ePjwGryICu9O268v
 FAsTcSnzWjTfgB+RtzpAJ6wGKpPrK6uqmi2RnWETaUVoG4pPlZ6TotlrzrZDLXsjxxuQ
 0HprM2S9u4hnHa8MamHjWSZ72UyAxiIgxcdEV6f47aAX881ttsO4+4/QvLhwMUNkx0MA
 UtGg==
X-Gm-Message-State: AOJu0YwaRUtfPuDXlnU7ocVGRfpk0bhZyiamstbPjN1BW9GKJTr4ONiV
 KQwrmqhAFakAqhfSQaIyZ/RqDwvyi+LZl2FJi3E3S3ZEYwK8uHMHkqFh2z52Lek/6YnPA/wpPWD
 7KY7LCao=
X-Gm-Gg: ATEYQzx/YOGUGGtCzfxH+JHMA37mSX7zrbbNvwpABH1jBiiOZ+RllbKWXmtB5PPH9RW
 T92hen49yuONZ2EfAmm4SGTJALV9BMwYDpkrwBUivqTIqWFfM8JbakFIgEoT1fleL2+GuevAIa2
 6QweFJoftjR1G2hP+hPIT6kBAjWnDcXa749Xl1GmQ3alr1LW2ab/ppH9yAKgj6/mRqk9xVViuN0
 9Njgp1XXP3VDH4fH0GfCn1lMPTKXgtr0khxSQAdG89pNwJb6bozfGbouUAQPSPKUSvlWKT2c2+J
 5IbqrYkfcDslnpVS+6PnEbPgJ2GTB5IS3WwlExyqT2tLcRlopfoqsoaux9S1sIYu2DGX/2Goi8d
 KEiaAPR2Ik38MiFdz5jKRWr4stabOC65KKXbd3JBa7/iKlzfJiYEXQ4EIYNyFCk6PcWtzTVJN21
 UPKndsvWBMC9XfP3yr6xkLg1mks0oFPFVHPdr24ymOpy54sTuakVjl3RDKZkJdD5yX1dLTZHlCf
 cuZUIk/Ay4w1hpZ7NO5
X-Received: by 2002:a05:600c:a4a:b0:488:7f69:4abf with SMTP id
 5b1f17b1804b1-488997426f9mr49713995e9.12.1775227836277; 
 Fri, 03 Apr 2026 07:50:36 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488983db4fbsm22419265e9.13.2026.04.03.07.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 07:50:36 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri,  3 Apr 2026 16:50:22 +0200
Message-ID: <20260403145022.1532257-4-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403145022.1532257-1-dowan.gullient@smile.fr>
References: <20260403145022.1532257-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1775227836; x=1775832636; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/5EfDYgaRoI6swP1ytk4marn6judwKK8/RKJrnY9Mc0=;
 b=g0oUsFZOIMQWaLBTPX/dFsVBkM680XHyFko/Fg/VQUYAda9BrlUkZa5l/lQ7ZuIhVX
 IAzmk414opRrmbtjTxlCLEEINgP7CuJDV0Kl2k3Pn9zJXqoZPUpwc2uKFjlSF3C4KqxB
 TxGz4wbOT2mzXWtsDFJlII3TID3jG62Kx/ZRo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=g0oUsFZO
Subject: [Buildroot] [PATCH v1 3/3] support/scripts: add manual trigger for
 pre-built kernels in GitLab CI
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

This patch adds a manual trigger in GitLab CI to generate the pre-built
kernels for ARMv5 Versatile and ARMv7 Vexpress platforms, using the builtin
configurations added in the previous patches by creating a .runtime_prebuilt_kernels
job that can be triggered with the variable ARCH_NAME = all , arm5 or arm7.

support/scripts/generate-gitlab-ci-yml:
    - add a new condition that checks if the variable ARCH_NAME is set to "all",
        "arm5" or "arm7" to include the .runtime_prebuilt_kernels job in the
        generated gitlab-ci.yml file. The value of the variable is set in the
        GitLab CI interface when creating a manual pipeline.
    - There is three options for the ARCH_NAME variable:
        - all: generates pre-built kernels for both ARMv5 and ARMv7 platforms
        - arm5: generates pre-built kernels only for ARMv5 Versatile platform
        - arm7: generates pre-built kernels only for ARMv7 Vexpress platform

support/misc/gitlab-ci.yml.in:
    - add .runtime_prebuilt_kernels job with manual trigger that generates
        ARMv5 and ARMv7 pre-built kernels
    - This job uses a buildroot .config file, linux .config and .fragment files
        to build the kernels for testing.
    - It also creates an output directory, rename the generated binaries with
        the format <kernel_name>-<board_name>-<kernel_version> and upload them as
        artifacts to download them for later.
    - for debug purposes a build-time.log file is included in the artifacts to
        check the build output and errors.

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 support/misc/gitlab-ci.yml.in          | 39 ++++++++++++++++++++++++++
 support/scripts/generate-gitlab-ci-yml | 22 +++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index ada36d0d60..8bd6d5efd5 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -152,3 +152,42 @@ before_script:
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
+                (armv5)
+                    DEFCONFIG_NAME="support/testing/builtin-kernels/arm5-versatile/buildroot_arm5_versatile.config"
+                    ;;
+                (armv7)
+                    DEFCONFIG_NAME="support/testing/builtin-kernels/arm7-vexpress/buildroot_arm7_vexpress.config"
+                esac
+            }
+        - OUTPUT_DIR=output
+        - mkdir -p ${OUTPUT_DIR}
+        - echo "Configure Buildroot for ${DEFCONFIG_NAME}"
+        - make defconfig BR2_DEFCONFIG=${DEFCONFIG_NAME}
+        - echo "Build ${CI_JOB_NAME} kernel"
+        - |
+            make O=${OUTPUT_DIR} linux > >(tee build.log |grep '>>>') 2>&1 || {
+                echo 'Failed build last output'
+                tail -200 build.log
+                exit 1
+            }
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
+            - output/images/
+            - output/build/build-time.log
+            - output/build/packages-file-list.txt
diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 2d922b9eb2..922392485c 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -56,6 +56,19 @@ gen_tests() {
             do_runtime=true
             ;;
         esac
+    elif [ -n "${ARCH_NAME}" ]; then
+        do_prebuilt_kernels=true
+        case "${ARCH_NAME}" in
+            (all)
+                prebuilt_kernels=( "armv5" "armv7" )
+                ;;
+            (armv5|armv7)
+                prebuilt_kernels=( "${ARCH_NAME}" )
+                ;;
+            (*)
+                do_prebuilt_kernels=false
+                ;;
+        esac
     else
         case "${CI_COMMIT_REF_NAME}" in
           (*-basics)
@@ -113,6 +126,7 @@ gen_tests() {
     if [    -z "${do_defconfigs}" \
          -a -z "${do_runtime}" \
          -a -z "${do_testpkg}" \
+         -a -z "${do_prebuilt_kernels}" \
        ]
     then
         do_basics=true
@@ -139,6 +153,14 @@ gen_tests() {
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
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
