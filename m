Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F099CD4F3D
	for <buildroot@archiver.kernel.org>; Sun, 17 May 2026 21:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 821BA42945;
	Sun, 17 May 2026 21:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7TSU7e5Wgxx1; Sun, 17 May 2026 21:36:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4928C4293F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779053796;
	bh=FairCSgaJFsBDil18JSlql0ICc2QgLdLXPh5k7Ph5Lk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Dxjna4fcjUgULzfeLZyOgKr6VSVfPJciuiy+FXgTnIy7TX8vWDbNWloxySD/Q8+Y2
	 T6Q1kDzbNZWlIg/Ec2zD5YPUXnXzHJD7bfLwF6NIwsMIhZ6lc3WrvHZE29qFzE4IXs
	 oz6XRrOzZ9aEKo2MayW8of6CxEAVgyXF7LKir040DewT+kuKjpmjAAqNg7dwNbSosd
	 r6toFIGvtTvbGuCkMeSTd1VFKAj0EM88Nxyx9p3pMfAFGlu+cimQKCrXbm5jvVNtpM
	 qYEs/t4VEWBB5WAdmIjGVS/ubNixBt+5K5lM/RdKAs6bpyUlzLNdFs5UbWYCUqicTv
	 nbsk9Vp9xxfbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4928C4293F;
	Sun, 17 May 2026 21:36:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 22427265
 for <buildroot@buildroot.org>; Sun, 17 May 2026 21:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CD3385879
 for <buildroot@buildroot.org>; Sun, 17 May 2026 21:36:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DSm6VhVoFCqr for <buildroot@buildroot.org>;
 Sun, 17 May 2026 21:36:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3025785878
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3025785878
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3025785878
 for <buildroot@buildroot.org>; Sun, 17 May 2026 21:36:33 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-459bf19e87bso792285f8f.1
 for <buildroot@buildroot.org>; Sun, 17 May 2026 14:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779053792; x=1779658592;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=G479VzfNTmlBoEGkO0KLhi1E0TZ0yHol3unxF46tXnU=;
 b=PHfXbnVbDPX5SYu2NkYAm2q1VIdWMXJgo+ih3g7OwP0B4WFoOiFsDQ2djLLp7S+vsh
 9X2OcU5n3qpL3dq1+ZpPJOucHpycgF5PvCwtKUj/yLgcFl2EHKStLILZZzUXsONKQVCL
 qazT78A3YYLN2/BqH01Qem/t+cGGgnPMTzggbAMOecRVFTeBXw8DZuXKBx/E/Ea0axav
 N9VgG8PEey5tbzDUJ70lgBmUaj657y/7waQnki1HNciUaMBB1+eI4h9EQKRx4U3Euq06
 a3w9rV4VgLTCWQ5C3lidAbwOoRDLnuUaODUyTh7ADQSI+4V/Rh9YOyWniMzr0qAV1nA0
 npEQ==
X-Gm-Message-State: AOJu0YyT5dtmT/h3jBDT4aNFYrd+2fSSWhVjGcELQxEg1ZkgusE1JTBd
 KjeSm2/fBGw0O/VZFiyDH8a/YNKwj+1onNWhC7BoQ2cR11efNkTKNgrB1o8vuU7ZWWnrGEHss8W
 M/jvCfAQ=
X-Gm-Gg: Acq92OE8hJ6H6f7b1sECsYncgQBPlING0D+pVanzYQ5sY78ni91ShksjBlJrBuJ3iO4
 w7G/x9sWn2FTMAHD/mZx7fw9xPeaFnbY9IkbiFnpQfXkxjt0FLeY4LRajEfVVFSjn3sLNdPZ0lz
 uklFbaom/uuySxgNcQEvanjdvIzKD+PogNvT6xeNA/E2nRngmr4W+LiuM7FqkF9DXmwGXEaCuTL
 BJ50ohZRxCtOjxAQAAr0SFssWB802bucPJT+g1JDroEc51Wj2J6QcyLfnRA58l+MqWuWcHhfiED
 fONFVN6rFFRk+/WIw1whUdIGseJYL+fi9WiuOHfKu8rjVvfx38y6mdkX6O+ciwxI5mUaBugTrb8
 88oSLg3Eev8RvUkCbTwdvey0Zp2KatUTAiYHiSrtMDvTD0LDw2zvm7m3ow0UOwOYrurBvhrncE0
 gvTwwhlPkK9mgWOghFmA1q5iHSv6BNh+AEEnV43wFQ/jDDbqnudh4iOjOSiirGEa3pCr9iyBR8J
 uY5wIBkzopIEdEUYtvvxBX4CIQ5c/IKkIBq
X-Received: by 2002:a05:6000:4007:b0:43d:1cec:4766 with SMTP id
 ffacd0b85a97d-45e5c5bf971mr19329399f8f.23.1779053792001; 
 Sun, 17 May 2026 14:36:32 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e767d0bsm30811870f8f.3.2026.05.17.14.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2026 14:36:31 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun, 17 May 2026 23:36:25 +0200
Message-ID: <20260517213626.3730308-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517213626.3730308-1-romain.naour@smile.fr>
References: <20260517213626.3730308-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1779053792; x=1779658592; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G479VzfNTmlBoEGkO0KLhi1E0TZ0yHol3unxF46tXnU=;
 b=lLKj5Xnak4SYwAPGVFYj8cizfAerb8VJHxFSHYEgBDK8O0tLAZGXOzMzo41YMtfV9q
 66KhPjefCphjcTrVGOeQg8HrOdBZ9rqZqAblDj07/HO0/YXlEaxjY5wJvvHX8f8U8jBy
 8fCYvH7pa3vy3DCT9jW/ML2DA17hSyJEJ2Rk4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=lLKj5Xna
Subject: [Buildroot] [PATCH 2/3] support/misc/gitlab-ci.yml.in: generate
 runtime test jobs with runner tags
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

Retrieve the runner tier from the gitlab-runner.json previously added
and create the runtime test job using .runtime_test_base and the
corresponding .runner-<tier> tamplate.

Don't use Gitlab shared runners if we can't find the runner tier.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/misc/gitlab-ci.yml.in          | 29 ++++++++++++++++++++++++++
 support/scripts/generate-gitlab-ci-yml | 11 ++++++++--
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index ada36d0d60..1dcc83e58c 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -5,6 +5,35 @@ stages:
 before_script:
   - git config --global --add safe.directory ${CI_PROJECT_DIR}
 
+.runner-tier1:
+    tags:
+        - buildroot-runner
+        - saas-linux-small-amd64
+
+.runner-tier2:
+    tags:
+        - buildroot-runner
+        - saas-linux-medium-amd64
+
+.runner-tier3:
+    tags:
+        - buildroot-runner
+        - saas-linux-large-amd64
+
+.runner-tier4:
+    tags:
+        - buildroot-runner
+        - saas-linux-xlarge-amd64
+
+.runner-tier5:
+    tags:
+        - buildroot-runner
+        - saas-linux-2xlarge-amd64
+
+.runner-buildroot-runner-only:
+    tags:
+        - buildroot-runner
+
 .check-check-package_base:
     stage: test
     script:
diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 2d922b9eb2..37b927f142 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -24,7 +24,7 @@ _EOF_
 gen_tests() {
     local -a basics defconfigs runtimes
     local do_basics do_defconfigs do_runtime do_testpkg
-    local defconfigs_ext cfg tst
+    local defconfigs_ext cfg runner tst
 
     basics=( check-package check-symbol DEVELOPERS package symbol )
 
@@ -133,7 +133,14 @@ gen_tests() {
 
     if ${do_runtime:-false}; then
         printf 'runtime_test_download: { extends: .runtime_test_download }\n'
-        printf '%s: { extends: .runtime_test_base }\n' "${runtimes[@]}"
+        for test in "${runtimes[@]}"; do
+            runner=($(jq -r -c ".tests[\"${test}\"] | .runner" ./support/testing/gitlab-runner.json))
+            runner=${runner,,}
+            if [ -z "${runner}" ]; then
+                runner="buildroot-runner-only"
+            fi
+            printf '%s: { extends: [ .runtime_test_base, .runner-%s ]}\n' "${test}" "${runner}"
+        done
     fi
 
     if [ -n "${do_testpkg}" ]; then
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
