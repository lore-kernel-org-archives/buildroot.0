Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB09C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 21:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4825260AEE;
	Tue,  7 Feb 2023 21:33:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4825260AEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lBTh86NOJPtX; Tue,  7 Feb 2023 21:33:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B66261042;
	Tue,  7 Feb 2023 21:33:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B66261042
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 97C5D1BF377
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 712B140242
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 712B140242
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8r3RUqkM0Z3Z for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 21:33:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 035EC40219
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 035EC40219
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 21:33:15 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id o18so14926704wrj.3
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 13:33:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AoQ7eUweAdNfQ7ljAK/dKyQg8IKOj6M3ik2G+mtBZAQ=;
 b=JJ5Mvy0xNeXYnFl65SuRFq7LGx2wTKc0rz3IrkeWaT90Epm+kEeGtYeSpZBY2D9a6W
 84cnr/wuTjh2bcPnpc0EhYcJJ5tQ+4mYXRZEpiNj+KDpw2jbOFbQmSNK8NoPzlrlBP8M
 D8lfYkpuoenGyCog6ClAqVC5pWjfY/906OdVOmxh560UMbE5cxbXi+D1pFzoD8lTa4ON
 /zFIQwcb1Edne7Fv31o3ilWDu5BXAAaw9LYYr32HrQyMNCbMr3/OJ5p4U0HgxAxtmEaC
 L0039B5U/NVZXTzxT+fswAqGq6VN8uzzJ61yBmg0qW7PJ+/rLQ8eMg+PdzPXSPaH+JdP
 33dw==
X-Gm-Message-State: AO0yUKWs5Jtovetfk+OCWq3suP4UqaR86Pk39iB4roxE1YAy+nMDSQXU
 cM1NuX8cEp7Om88p2HUnpGIIhe76PUtyAg==
X-Google-Smtp-Source: AK7set8vq3UCEMa4Q8/DuynIokS9uYthnh1MOn4kPYXryPgcT1MEa0vuPcGkElKvuKMDXhzv1oXy+Q==
X-Received: by 2002:adf:f084:0:b0:2bf:d1a1:ff5d with SMTP id
 n4-20020adff084000000b002bfd1a1ff5dmr3831783wro.32.1675805594245; 
 Tue, 07 Feb 2023 13:33:14 -0800 (PST)
Received: from localhost.localdomain (pop.92-184-112-98.mobile.abo.orange.fr.
 [92.184.112.98]) by smtp.gmail.com with ESMTPSA id
 p12-20020a5d48cc000000b00241fab5a296sm11987085wrs.40.2023.02.07.13.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 13:33:13 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 22:33:11 +0100
Message-Id: <3c87e90584519c73eeb1ae2dd5c52fe60d1572a2.1675805584.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675805584.git.yann.morin.1998@free.fr>
References: <cover.1675805584.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AoQ7eUweAdNfQ7ljAK/dKyQg8IKOj6M3ik2G+mtBZAQ=;
 b=GWRAfKrFKphNFbhVS/C0iTUt7Tq/CazEW8IMAqOhxrBkeOkxE7bCBBLxvzauXTh2nU
 idmflyGS+5AxZeOOPxICcjdhXcKsvo+HsqGPn7joF/TzRRmfHWurYNFOmi04mISuTSCi
 gXLuioFqB9uXIaTZo/D8r03hpJbHCC3Aa8ut8pjbUq800rkAqEMGgFU+RYCguAM6H4Ff
 /s35ISMSQustT3THrMeS1ZaIPT+CsxWmh7QCTZrBBjtkGlf0sqDku9zDGpIKRjp0YVr/
 +/ph0FGn6EmUpFY86GseXZTFydGv+509eazbw7/NpmknydRBhEOAgUyLrNF/8XjikOea
 BDcw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GWRAfKrF
Subject: [Buildroot] [PATCH 1/2] gitlab-ci: don't use before_script in job
 templates
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When gitlab prepares a job to run, it checks out the repository with a
non-root user, and spawns a container that runs as root, with some UID
mapping that makes the files be owned by root in the container. However,
our pipelines run as a nont-root user.

Commit bde165f7ad (.gitlab-ci.yml: update Docker image to use) updated
the docker image that is used to run in our pipelines.

That new image includes a git version that is stricter about the
ownership of the git tree it is acting in: git aborts in error when the
user running it does not own the repository.

We use `git ls-tree` quite a lot in our check-{flake8,package,symbols}
rules, so they all fail (in various ways).

To fix this, we either need to fix the ownership or tell git to ignore
the situation. In either case, we'll need to run a scriptlet before all
our jobs.

Gitlab-ci allows to provide a global before_script, that is inherited by
all jobs. However, some of our jobs already declare a before_script, and
that would shadow the global before_Scrikpt.

There is no technical reason to do our before_script separately from
the actual script, so we move the code from the before_scripts to the
corresponding scripts.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/misc/gitlab-ci.yml.in | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index 0ccf36665e..9c1faf0d5f 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -23,9 +23,8 @@
         - utils/check-symbols
 
 .defconfig_check:
-    before_script:
+    script:
         - DEFCONFIG_NAME=$(echo ${CI_JOB_NAME} | sed -e 's,_check$,,g')
-    script:
         - echo "Configure Buildroot for ${DEFCONFIG_NAME}"
         - make ${DEFCONFIG_NAME}
         - support/scripts/check-dotconfig.py .config configs/${DEFCONFIG_NAME}
@@ -44,10 +43,9 @@
       }
 
 .defconfig_base:
-    before_script:
+    script:
         - DEFCONFIG_NAME=${CI_JOB_NAME}
         - OUTPUT_DIR=output
-    script:
         - echo "Configure Buildroot for ${DEFCONFIG_NAME}"
         - make ${DEFCONFIG_NAME}
         - ./support/scripts/check-dotconfig.py .config ./configs/${DEFCONFIG_NAME}
@@ -72,13 +70,12 @@
             - runtime-test.log
 
 .runtime_test_base:
-    before_script:
-        - TEST_CASE_NAME=${CI_JOB_NAME}
     # Keep build directories so the rootfs can be an artifact of the job. The
     # runner will clean up those files for us.
     # Multiply every emulator timeout by 10 to avoid sporadic failures in
     # elastic runners.
     script:
+        - TEST_CASE_NAME=${CI_JOB_NAME}
         - echo "Starting runtime test ${TEST_CASE_NAME}"
         - ./support/testing/run-tests -o test-output/ -d test-dl/ -k --timeout-multiplier 10 ${TEST_CASE_NAME}
     artifacts:
@@ -91,9 +88,8 @@
 
 .test_pkg:
     stage: build
-    before_script:
+    script:
         - OUTPUT_DIR=${CI_JOB_NAME}
-    script:
         - echo "Configure Buildroot for ${OUTPUT_DIR}"
         - make O=${OUTPUT_DIR} syncconfig
         - make O=${OUTPUT_DIR} savedefconfig
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
