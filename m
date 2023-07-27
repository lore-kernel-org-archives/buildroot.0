Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0828FC001DC
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 22:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A17BB41FF9;
	Thu, 27 Jul 2023 22:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A17BB41FF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 71ObADMHPYSc; Thu, 27 Jul 2023 22:31:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57D8342007;
	Thu, 27 Jul 2023 22:31:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57D8342007
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 223551BF3D4
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 22:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0616542007
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 22:31:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0616542007
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EFLMaQsg6Ji4 for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 22:31:54 +0000 (UTC)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 971B241FF9
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 22:31:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 971B241FF9
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1b8ad907ba4so9879255ad.0
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 15:31:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690497114; x=1691101914;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b60QLku8T/aRcmxvlZaAfSu1V3EW43VrFujZa988S/o=;
 b=ftU2wl0kxMXMefIyRSMgOG/ppU8QkGX2FnZxKa8gmwk1LkDTLaVY3XCu0Gt0ZUyorS
 8Ol9vlJvbq3jd1RjCVPwjfj+mncyV4OmLUu6+JLD+5YUXuIKAYJTeqFCcXrLTYUNOZtJ
 qZR6shyJ/hiYMYR1D+t13Ea9ZjzCxNUaC331QFE0Qgzr2mnPeTIZCZztPQeq+8OhCiBX
 VZ2fMRIqdvwtNOmW8K+OnRHszgXmPEa/vK/nkXcpwxEY0XdTZx6Rbw0wXH6FckBSM4Bw
 TyfTfDRIFmX3HVppdd3lCQggk6cR5DoYBpXMkcYPHQjOAIjgsGbWzYaqHQKDyauwOIBm
 ZfCw==
X-Gm-Message-State: ABy/qLa+TnJiwY9ngjoQ4xqtLR8cfsYCWWec/dDsL3aIrYOrNVpGExk4
 0jqbhicAobV/2TjHtntHUwhvJeubY5LsWMBEFswsIv4YRQeJRg==
X-Google-Smtp-Source: APBJJlHCYt1HPTxCsbQ8Mn1NoM2v1rJ4pt6vDZ7GwOH8LEirs7vjt4/cMivAMOQ/Bj0wvX6XM5PHOg==
X-Received: by 2002:a17:903:2783:b0:1b9:ea60:cd91 with SMTP id
 jw3-20020a170903278300b001b9ea60cd91mr556737plb.7.1690497113786; 
 Thu, 27 Jul 2023 15:31:53 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 u5-20020a17090282c500b001b66a71a4a0sm2142298plz.32.2023.07.27.15.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 15:31:53 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 15:31:51 -0700
Message-ID: <20230727223151.106019-1-christian@aperture.us>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1690497114; x=1691101914;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b60QLku8T/aRcmxvlZaAfSu1V3EW43VrFujZa988S/o=;
 b=AqnqBuqSINxJEyPoIp7od+pR6/swPnmkZLlfbi9u895N5mZe0e4YHZWZRHuBs0L5LZ
 GjQNqyWD5VqYks8hTJmXBD60+HIUK1oFFLycM5jDbet9tNuiM6yIOsUyhT3Ld9ckqHLA
 cK6E9l7sSEJpd2YnU7F2RNMrC6KItDc8G62Vn69tiNSfDanjHyxlN8GLPxuag3aR8mtp
 Kijp/12ZmlQOdsEBHLgeKfjI69b/CPzN8zZUh9dmtTwtDxa+Bgk5BEuqvpo/mvReydxP
 gs+nDdd6OhgYeTzp59ufDCzA8ZjmPWhgNR1l3+HHMKGqYKw3h3Zoon8WRp89s/edlBlI
 YZ1g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=AqnqBuqS
Subject: [Buildroot] [PATCH v1 1/1] package/go: fix compilation without a
 Git directory
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When compiling without a Git repository, "go install" returns an error:

error obtaining VCS status: exit status 128
	Use -buildvcs=false to disable VCS stamping.

Set -buildvcs=false in go install when isGitDir() returns false.

Set GOBOOTSTRAP_BUILDVCS=0 to force isGitDir() to return false and thereby set
buildvcs=false in "go install" within make.bash (which runs cmd/dist).

Report: https://lists.buildroot.org/pipermail/buildroot/2023-July/671344.html
Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186525
Upstream: https://github.com/golang/go/pull/61621

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 ...ldvcs-false-if-not-within-a-git-repo.patch | 44 +++++++++++++++
 ...OOTSTRAP_BUILDVCS-environment-variab.patch | 54 +++++++++++++++++++
 package/go/go.mk                              |  1 +
 3 files changed, 99 insertions(+)
 create mode 100644 package/go/0002-cmd-dist-set-buildvcs-false-if-not-within-a-git-repo.patch
 create mode 100644 package/go/0003-cmd-dist-add-GOBOOTSTRAP_BUILDVCS-environment-variab.patch

diff --git a/package/go/0002-cmd-dist-set-buildvcs-false-if-not-within-a-git-repo.patch b/package/go/0002-cmd-dist-set-buildvcs-false-if-not-within-a-git-repo.patch
new file mode 100644
index 0000000000..a9bd11600a
--- /dev/null
+++ b/package/go/0002-cmd-dist-set-buildvcs-false-if-not-within-a-git-repo.patch
@@ -0,0 +1,44 @@
+From 9b8532e7c59ba09ad499b0d84af6d89a8eefc9f1 Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@aperture.us>
+Date: Thu, 27 Jul 2023 14:59:09 -0700
+Subject: [PATCH] cmd/dist: set buildvcs=false if not within a git repository
+
+When compiling without a Git repository, "go install" returns an error:
+
+error obtaining VCS status: exit status 128
+	Use -buildvcs=false to disable VCS stamping.
+
+Set -buildvcs=false in go install when isGitDir() returns false.
+
+Fixes: #61620
+Related: #54852
+
+---
+
+Report: https://lists.buildroot.org/pipermail/buildroot/2023-July/671344.html
+Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186525
+Upstream: https://github.com/golang/go/pull/61621
+
+Signed-off-by: Christian Stewart <christian@aperture.us>
+
+---
+ src/cmd/dist/buildtool.go | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/cmd/dist/buildtool.go b/src/cmd/dist/buildtool.go
+index c4e366024c..1a33a45b23 100644
+--- a/src/cmd/dist/buildtool.go
++++ b/src/cmd/dist/buildtool.go
+@@ -213,6 +213,9 @@ func bootstrapBuildTools() {
+ 	if tool := os.Getenv("GOBOOTSTRAP_TOOLEXEC"); tool != "" {
+ 		cmd = append(cmd, "-toolexec="+tool)
+ 	}
++	if !isGitRepo() {
++		cmd = append(cmd, "-buildvcs=false")
++	}
+ 	cmd = append(cmd, "bootstrap/cmd/...")
+ 	run(base, ShowOutput|CheckExit, cmd...)
+ 
+-- 
+2.41.0
+
diff --git a/package/go/0003-cmd-dist-add-GOBOOTSTRAP_BUILDVCS-environment-variab.patch b/package/go/0003-cmd-dist-add-GOBOOTSTRAP_BUILDVCS-environment-variab.patch
new file mode 100644
index 0000000000..4f596b5f82
--- /dev/null
+++ b/package/go/0003-cmd-dist-add-GOBOOTSTRAP_BUILDVCS-environment-variab.patch
@@ -0,0 +1,54 @@
+From 15d3b81ebafb790495a31339881d1c32bd9ca1b9 Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@aperture.us>
+Date: Thu, 27 Jul 2023 15:00:49 -0700
+Subject: [PATCH] cmd/dist: add GOBOOTSTRAP_BUILDVCS environment variable
+
+Add an environment variable to bypass the isGitRepo() check and force it to
+return false, thereby also setting -buildvcs=false during "go install."
+
+This is useful in situations where the .git directory may be present but we
+still want to force cmd/dist to ignore it.
+
+Fixes: #61620
+Related: #54852
+
+---
+
+Report: https://lists.buildroot.org/pipermail/buildroot/2023-July/671344.html
+Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186525
+Upstream: https://github.com/golang/go/pull/61621
+
+Signed-off-by: Christian Stewart <christian@aperture.us>
+
+---
+ src/cmd/dist/build.go | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
+index 48c9beccce..892174d305 100644
+--- a/src/cmd/dist/build.go
++++ b/src/cmd/dist/build.go
+@@ -15,6 +15,7 @@ import (
+ 	"path/filepath"
+ 	"regexp"
+ 	"sort"
++	"strconv"
+ 	"strings"
+ 	"sync"
+ 	"time"
+@@ -405,6 +406,12 @@ func findgoversion() string {
+ 
+ // isGitRepo reports whether the working directory is inside a Git repository.
+ func isGitRepo() bool {
++	// Respect GOBOOTSTRAP_BUILDVCS=false if set to 0 or false.
++	// Otherwise check if the Git repo is present with "git rev-parse" as usual.
++	if val, err := strconv.ParseBool(os.Getenv("GOBOOTSTRAP_BUILDVCS")); err == nil && val == false {
++		return false
++	}
++
+ 	// NB: simply checking the exit code of `git rev-parse --git-dir` would
+ 	// suffice here, but that requires deviating from the infrastructure
+ 	// provided by `run`.
+-- 
+2.41.0
+
diff --git a/package/go/go.mk b/package/go/go.mk
index efa47e5781..ef876c4633 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -126,6 +126,7 @@ HOST_GO_HOST_ENV = \
 HOST_GO_MAKE_ENV = \
 	GO111MODULE=off \
 	GOCACHE=$(HOST_GO_HOST_CACHE) \
+	GOBOOTSTRAP_BUILDVCS=0 \
 	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE2_ROOT) \
 	GOROOT_FINAL=$(HOST_GO_ROOT) \
 	GOROOT="$(@D)" \
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
