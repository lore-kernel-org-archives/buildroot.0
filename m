Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B608C001DE
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 04:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 983FA42011;
	Fri, 28 Jul 2023 04:54:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 983FA42011
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SSfo7gJflybL; Fri, 28 Jul 2023 04:54:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2774242014;
	Fri, 28 Jul 2023 04:54:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2774242014
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A6661BF3ED
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 04:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50A5A60E89
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 04:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50A5A60E89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7-aG-gGqEIjI for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 04:54:16 +0000 (UTC)
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1237760D95
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 04:54:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1237760D95
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-76714caf466so140154785a.1
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 21:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690520054; x=1691124854;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZTLOUckMbWLzFA/cUlsHGCH15NzUTsxhrPiIPEi0L4g=;
 b=a9ii7QO1qDskF8TNzZKvdyPelbQo+RFpS9qLpwEIOCDR8PamVJ6djyAIOk9n1JjSEd
 flf/JpqdbcQfackHf05WOK9rMM62q37H5hwof3iujLTAsLUI7Q3PGgWzaNfzmWoZ3UVj
 itzxRWEi3LYrRBjw6zlSjxaXQx6Cc3U+XFaxe1h4zZ21k6jvHuKLOXK0l/yDeKGdPYXO
 rZe925jQoDewq078JZX0pfoCSHn3DxHXnxLoftyyFi0WWLLM1bN0ZjHTm4/L1dtSLnTl
 1zTUA5KtPqGJvb92OB8+kX3BYIr1iTgwYcac6uo85OvAmFYS3qhJsVlMCgFQuK088NEa
 TgTg==
X-Gm-Message-State: ABy/qLZ4ilUsSvfsLsqhYoMQ37fmMRz0dnty+aPFX/lFj75+je4mQUon
 hMaDfUVS0lqIRMmfjsVivkxABzVRZx0rfLteDrGnLOIizyMtWw==
X-Google-Smtp-Source: APBJJlGEiA+xXWe64yxR/bqsMnCDrg9F1C7GNHsDpx3vxZROx5iFT/sPpKHLH4Zwt2CrxO+DnHGizA==
X-Received: by 2002:a05:620a:3199:b0:765:a678:977c with SMTP id
 bi25-20020a05620a319900b00765a678977cmr1613773qkb.67.1690520054453; 
 Thu, 27 Jul 2023 21:54:14 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 b12-20020aa7810c000000b0066ebaeb149dsm2283453pfi.88.2023.07.27.21.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 21:54:13 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 21:54:11 -0700
Message-ID: <20230728045411.1023408-1-christian@aperture.us>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1690520054; x=1691124854;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZTLOUckMbWLzFA/cUlsHGCH15NzUTsxhrPiIPEi0L4g=;
 b=eXsme+oMvI1z6Bz/mQLN08jIpIx7j2lRayixKevRUiSodkOJvAnRCHRAv4+4vi7i0h
 hU5Rhhj0IUUvYik4zTLWKR1t9AKpSpNOpuplNzOraKfxpwNQCcMecii8+iT1proPzoHh
 UStCgbcvS6TWITXz1tXp17QOy04ir3RFgoKNWpMIFu5ti2OzIH6cMZHgLhVxgnoLDg16
 a0DhkxsbF8BWH1hMTgUbkkQbu2gucKPv8wcgEtE2wKQ7B5lso5/hQbRj7PeKbeswUqT+
 Nbxi5HoqmwuvZzPByv0DBDKUyIF6UL4/B8FJpCIxVC+5krQPPE+pNCK8IiH3DsFP5eqh
 L2pQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=eXsme+oM
Subject: [Buildroot] [PATCH v2 1/1] package/go: fix go-bootstrap when parent
 dir contains invalid .git
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

Building host-go within docker fails:

error obtaining VCS status: exit status 128
	Use -buildvcs=false to disable VCS stamping.

Reproduction of the issue:

mkdir go-issue-61620
cd ./go-issue-61620
wget https://go.dev/dl/go1.19.11.src.tar.gz
mkdir go-bootstrap
tar -xf go1.19.11.src.tar.gz -C ./go-bootstrap --strip-components=1
cd ./go-bootstrap/src/
bash make.bash
cd ../../
wget https://go.dev/dl/go1.20.6.src.tar.gz
mkdir go
tar -xf go1.20.6.src.tar.gz -C ./go/ --strip-components=1
printf "gitdir: ../../does/not/exist/.git" > ./.git
cd ./go/src/
GOROOT_BOOTSTRAP=$(pwd)/../../go-bootstrap/ bash make.bash

The error only occurs when the .git that git detects in the parent directory of
the GOROOT_BOOTSTRAP is invalid or not present causing errors when running `git`
commands within GOROOT_BOOTSTRAP.

Report: https://lists.buildroot.org/pipermail/buildroot/2023-July/671344.html
Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186525
Upstream issue: https://github.com/golang/go/issues/61620
Upstream PR: https://github.com/golang/go/pull/61621

Signed-off-by: Christian Stewart <christian@aperture.us>

---

v1 -> v2:

 - sort HOST_GO_MAKE_ENV alphabetically
 - simplify the patch to set buildvcs=false unconditionally for go-bootstrap
 - create a minimal reproduction of the issue
 - simplify the commit message with the minimal reproduction

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 ...ldvcs-false-when-building-go-bootstr.patch | 73 +++++++++++++++++++
 package/go/go.mk                              |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 package/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch

diff --git a/package/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch b/package/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
new file mode 100644
index 0000000000..e7158a2b3f
--- /dev/null
+++ b/package/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
@@ -0,0 +1,73 @@
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
+---
+
+Upstream PR: https://github.com/golang/go/pull/61621
+
+Signed-off-by: Christian Stewart <christian@aperture.us>
+
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
diff --git a/package/go/go.mk b/package/go/go.mk
index efa47e5781..aef8ab2240 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -125,6 +125,7 @@ HOST_GO_HOST_ENV = \
 # HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
 HOST_GO_MAKE_ENV = \
 	GO111MODULE=off \
+	GOBOOTSTRAP_BUILDVCS=0 \
 	GOCACHE=$(HOST_GO_HOST_CACHE) \
 	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE2_ROOT) \
 	GOROOT_FINAL=$(HOST_GO_ROOT) \
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
