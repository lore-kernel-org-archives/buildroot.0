Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C5DC25B7A
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 14:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA5636067E;
	Fri, 17 May 2024 14:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 56qtw9a7I9e5; Fri, 17 May 2024 14:53:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4210606B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4210606B9;
	Fri, 17 May 2024 14:53:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 828A41BF2B6
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 14:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C4CD400B9
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 14:53:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1ouPsnRvX0T for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 14:53:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 65C3140025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65C3140025
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65C3140025
 for <buildroot@buildroot.org>; Fri, 17 May 2024 14:53:52 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2e4939c5323so26325231fa.2
 for <buildroot@buildroot.org>; Fri, 17 May 2024 07:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715957630; x=1716562430;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jDkbc71RnRCU9JTpGqRwgUtBjhzPTGTPMh8Kz5bGFtI=;
 b=NMLz5KZioy8sXs5zwjhzJmCLUBJb6QS4ueJ1gBDSLbIgE6qi7ZJ5yfgarpiuR6WUE+
 5FDchafbpHGFw5AU611w9hV+ix13/yufeVeOKlNc2w90hr6b+CyTwDOp2ldwUGF0fwUA
 /o0xV6+CWGqz5A48riJvEoMzgIg53wb47Rp6H4K4F6MmAI+FPIY4VBMgX5KNPegNj7xS
 gKr5obOM/OfObNG3+vvnO9vcdffTlZTLinbXxX6q0OG+jGfyi39qiVRKl16Y9eZ88iMF
 6glVUvpHGMlQT/KM+ikDqQ1CBpsaKcZrUwk0S416U+StQ+XUTuGWnOgKp4llhgtTHPoy
 8WZw==
X-Gm-Message-State: AOJu0Yy7XujRqBsMHEb9ImJt3bSEqtiFS9Uq/aKEn0dMN5FHB9J826uq
 FquCyfDO/KD0BayV90FlMHtFN1yqOZ/8g7Aw6DMWBJsnjaPo3sUXIxQ67j1zjFlr9g0IdPW237s
 a
X-Google-Smtp-Source: AGHT+IEWHMH0jQQMH2ANijgLs2QvBua1U+PirJzNRhMbBs12bCa5Pxdy8Ifu5erUIPhiKSsskIUTlg==
X-Received: by 2002:a05:651c:b13:b0:2e1:a8ca:6166 with SMTP id
 38308e7fff4ca-2e5205c37a2mr244336351fa.43.1715957629925; 
 Fri, 17 May 2024 07:53:49 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fd97e842csm300179705e9.24.2024.05.17.07.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 07:53:49 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Fri, 17 May 2024 16:53:47 +0200
Message-ID: <20240517145347.269607-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1715957630; x=1716562430;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jDkbc71RnRCU9JTpGqRwgUtBjhzPTGTPMh8Kz5bGFtI=;
 b=WRj8456HXxQmWZOndyHQhqzB007jXWIgB6B/lghA37yQh4NKXPPYBMmASl4gRaATra
 PF4/ZHXKcW6Et5pGoq0dO1dv+OAoEOoJNsrjUhe1lW13I0REcZksGZenP/zDSoa8BoY8
 JX6pN8D1qd7Ai+nIXFBUMSafiNWGHQ539G0sYZoPha8FiKuEIm43B/DPha91Jxx5YkyR
 lEeG9t08XNvDM0lex9sBp7P6+O+hXvS2yi7eKGqX1RIhjdYcOocKbaCyWOZEmREmS4+b
 BVTogk8du2J9h4els8ujHUtTkGTJ8tIFZPr47KMVnyn+EzHEPblCktQmaCNIGAXCpzAf
 iHnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=WRj8456H
Subject: [Buildroot] [PATCH]
 package/go-bootstrap-stage3/go-bootstrap-stage3: fix go-bootstrap when
 parent dir contains invalid .git
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since go-bootstrap-stage3 package has been added to Buildroot [1], all
tests using go are failing only on Gitlab-ci jobs. The build succeed
if we use docker-run script.

Since the issue is only trigged by Gitlab-ci environment, the issue
is related to the ownership of the (buildroot) git tree, see [2].
go seems to ignore the .gitconfig set by before_script.

Anyway, go should not try to use git to retrieve some info since we
are not building it from the go repository.

go package was already patched for a similar issue when building
host-go within docker [3]. Apply the same patch to go-bootstrap-stage3
to disable VCS support.

See
http://lists.busybox.net/pipermail/buildroot/2024-May/691273.html

[1] f00eb37de9b4b0ddbdeb5c7ebae48c883c27e132
[2] a016b693f7830f3c8ae815851d3204b8b6e99821
[3] bc8e70a08ba083d978c828e31442a7645c9099d7

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6833307649 (tests.fs.test_oci.TestOci)
https://gitlab.com/buildroot.org/buildroot/-/jobs/6833307823 (tests.package.test_docker_compose.TestDockerCompose)
https://gitlab.com/buildroot.org/buildroot/-/jobs/6833308175 (tests.package.test_mender.TestMender)

Runtime tested:
https://gitlab.com/kubu93/buildroot/-/jobs/6860670292

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Christian Stewart <christian@aperture.us>
---
 ...ldvcs-false-when-building-go-bootstr.patch | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 package/go-bootstrap-stage3/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch

diff --git a/package/go-bootstrap-stage3/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch b/package/go-bootstrap-stage3/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
new file mode 100644
index 0000000000..58f4581b02
--- /dev/null
+++ b/package/go-bootstrap-stage3/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
@@ -0,0 +1,71 @@
+From 6b05378097c6a386ed9912d2471976dc39504e86 Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@aperture.us>
+Date: Thu, 27 Jul 2023 21:28:47 -0700
+Subject: [PATCH] cmd/dist: set buildvcs=false when building go-bootstrap
+
+When building go-bootstrap as part of the make.bash process, the cmd/dist
+invokes the bootstrap Go compiler to build the go_bootstrap tool:
+
+${GOROOT_BOOTSTRAP}/bin/go install -tags=math_big_pure_go compiler_bootstrap purego bootstrap/cmd/...
+
+If there is an invalid .git directory in a parent of ${GOROOT_BOOTSTRAP},
+make.bash will fail. Reproduction of the issue:
+
+  mkdir go-issue-61620
+  cd ./go-issue-61620
+  wget https://go.dev/dl/go1.19.11.src.tar.gz
+  mkdir go-bootstrap
+  tar -xf go1.19.11.src.tar.gz -C ./go-bootstrap --strip-components=1
+  cd ./go-bootstrap/src/
+  bash make.bash
+  cd ../../
+  wget https://go.dev/dl/go1.20.6.src.tar.gz
+  mkdir go
+  tar -xf go1.20.6.src.tar.gz -C ./go/ --strip-components=1
+  printf "gitdir: ../../does/not/exist/.git" > ./.git
+  cd ./go/src/
+  GOROOT_BOOTSTRAP=$(pwd)/../../go-bootstrap/ bash make.bash
+
+The build fails with the following error:
+
+  Building Go toolchain1 using [snip]/go-1.19.10.
+  error obtaining VCS status: exit status 128
+    Use -buildvcs=false to disable VCS stamping.
+  go tool dist: FAILED: [snip]/go-1.19.10/bin/go install -tags=math_big_pure_go \
+    compiler_bootstrap purego bootstrap/cmd/...: exit status 1
+
+This change unconditionally sets -buildvcs=false when compiling go-bootstrap. We
+don't need the revision information in those binaries anyway. Setting this flag
+was previously not done as we were unsure if the go-bootstrap compiler would be
+new enough to support the buildvcs build flag. Since Go 1.20.x, Go 1.19.x is the
+minimum version for go-bootstrap, and supports -buildvcs=false. We can now set
+-buildvcs=false without worrying about compatibility.
+
+Related: https://github.com/golang/go/issues/54852
+Fixes: https://github.com/golang/go/issues/61620
+
+Upstream: https://github.com/golang/go/pull/61621
+
+Signed-off-by: Christian Stewart <christian@aperture.us>
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ src/cmd/dist/buildtool.go | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/cmd/dist/buildtool.go b/src/cmd/dist/buildtool.go
+index a528d7aa76..3b411d6ebb 100644
+--- a/src/cmd/dist/buildtool.go
++++ b/src/cmd/dist/buildtool.go
+@@ -221,6 +221,9 @@ func bootstrapBuildTools() {
+ 	cmd := []string{
+ 		pathf("%s/bin/go", goroot_bootstrap),
+ 		"install",
++		// Fixes cases where an invalid .git is present in a parent of GOROOT_BOOTSTRAP.
++		// See: https://github.com/golang/go/issues/61620
++		"-buildvcs=false",
+ 		"-tags=math_big_pure_go compiler_bootstrap purego",
+ 	}
+ 	if vflag > 0 {
+--
+2.41.0
+
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
