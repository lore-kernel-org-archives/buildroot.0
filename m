Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F58C433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 23:47:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAA9C60E94
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 23:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AAA9C60E94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 824AE82444;
	Sun, 10 Oct 2021 23:47:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SzuGOm6ncnks; Sun, 10 Oct 2021 23:47:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C368182435;
	Sun, 10 Oct 2021 23:47:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 17C0A1BF3E8
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 23:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04238401B6
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 23:47:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b9UzOEwusJS2 for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 23:47:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 26C524013D
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 23:47:02 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id k26so13287417pfi.5
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 16:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8N1OL0DDlwxw2ra2oKT9NVyIBRTXtyS5bGDjNOYHtyg=;
 b=VKlIkRgaMhPV8yEy2uj6xaXfPJhXOmQMwhnIoaPN1qHDHSF046mUL/85XccWxkn2Xl
 ToRAGdqnscD0Wh/Sh5vxNC5ktUmrd1GogROLDBvjwP4+zr2GM3ks4iP6QFH2eQNLbNaD
 DYfje6vVRjjXEJFaXNPU/0T8/Cd6uOgfJCj5WU7EB5lolCKzkjjazD7QW9GnW9RvjXE9
 dnFUeJHm7WJ3zdJP9oeCfpiKeyOq6jPDAygXaP3PvFOIkK9FxL/rRFRmGn57js7nJLYA
 kP2yB70dBXcdEkIhAQQ5dRZ3s018WMgGTpxEiJHjh6lmrkPAy8mb35U6L68lXhA9rvgv
 N3rg==
X-Gm-Message-State: AOAM532bHaakDpBHN8WRJM2wnr8q5d21UpTVpUW/Po/dGY33hrTeesKg
 htIfbdXdchFXmT8mtHid/7bQNdyXvDz7wQ==
X-Google-Smtp-Source: ABdhPJzYdgd61gX8G3Sr61C4t4qc7Y/ov2QnAsrrIYjsC2ZwjHsS872qkVT6opj313KNkaJ/RhXLCg==
X-Received: by 2002:a05:6a00:a:b0:44d:249e:18ca with SMTP id
 h10-20020a056a00000a00b0044d249e18camr821467pfk.46.1633909621285; 
 Sun, 10 Oct 2021 16:47:01 -0700 (PDT)
Received: from localhost.localdomain (ip68-111-8-11.sb.sd.cox.net.
 [68.111.8.11])
 by smtp.gmail.com with ESMTPSA id t6sm5662547pfh.63.2021.10.10.16.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 16:47:00 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 10 Oct 2021 16:46:53 -0700
Message-Id: <20211010234655.585526-4-christian@paral.in>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211010234655.585526-1-christian@paral.in>
References: <20211010234655.585526-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH-NEXT v3 4/6] support/download/go-post-process:
 implement Go vendoring support
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
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

This commit introduces the download post-process script
support/download/go-post-process, and hooks it into the Go package
infrastructure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Christian Stewart <christian@paral.in>

v1 -> v2:

 - re-submitting Thomas's series with adjustments:
 - run "go mod init" just before "go mod vendor"
 - this fixes the case when go.mod does not exist
 - use -modcacherw to fix "make clean" permissions errors
 - use the mk_tar_gz helper in the post-process step

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/pkg-download.mk          |  1 +
 package/pkg-golang.mk            |  8 +++++++-
 support/download/dl-wrapper      |  6 ++++--
 support/download/go-post-process | 35 ++++++++++++++++++++++++++++++++
 4 files changed, 47 insertions(+), 3 deletions(-)
 create mode 100755 support/download/go-post-process

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 66a415cce0..378b2c66f0 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -119,6 +119,7 @@ define DOWNLOAD
 		-o '$($(2)_DL_DIR)/$(notdir $(1))' \
 		$(if $($(2)_DOWNLOAD_POST_PROCESS),-p '$($(2)_DOWNLOAD_POST_PROCESS)') \
 		$(if $($(2)_GIT_SUBMODULES),-r) \
+		$(if $($(2)_GOMOD),-g '$($(2)_GOMOD)') \
 		$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(2)),-u $(uri)) \
 		$(QUIET) \
 		-- \
diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index d07242310d..3d2c45fa09 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -42,12 +42,13 @@ define inner-golang-package
 
 $(2)_BUILD_OPTS += \
 	-ldflags "$$($(2)_LDFLAGS)" \
+	-modcacherw \
 	-tags "$$($(2)_TAGS)" \
 	-trimpath \
 	-p $(PARALLEL_JOBS)
 
 # Target packages need the Go compiler on the host.
-$(2)_DEPENDENCIES += host-go
+$(2)_DOWNLOAD_DEPENDENCIES += host-go
 
 $(2)_BUILD_TARGETS ?= .
 
@@ -72,6 +73,11 @@ $(2)_SRC_SOFTWARE = $$(word 2,$$(subst /, ,$$(call notdomain,$$($(2)_SITE))))
 # If the go.mod file does not exist, one is written with this root path.
 $(2)_GOMOD ?= $$($(2)_SRC_DOMAIN)/$$($(2)_SRC_VENDOR)/$$($(2)_SRC_SOFTWARE)
 
+$(2)_DOWNLOAD_POST_PROCESS = go
+$(2)_DL_ENV = \
+	$(HOST_GO_COMMON_ENV) \
+	GOPROXY=direct
+
 # Generate a go.mod file if it doesn't exist. Note: Go is configured
 # to use the "vendor" dir and not make network calls.
 define $(2)_GEN_GOMOD
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 2d74554213..2fc530f24f 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -17,7 +17,7 @@
 # We want to catch any unexpected failure, and exit immediately.
 set -e
 
-export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:ru:qf:e"
+export BR_BACKEND_DL_GETOPTS=":hc:d:g:o:n:N:H:ru:qf:e"
 
 main() {
     local OPT OPTARG
@@ -25,11 +25,12 @@ main() {
     local -a uris
 
     # Parse our options; anything after '--' is for the backend
-    while getopts ":c:d:D:o:n:N:H:rf:u:qp:" OPT; do
+    while getopts ":c:d:D:g:o:n:N:H:rf:u:qp:" OPT; do
         case "${OPT}" in
         c)  cset="${OPTARG}";;
         d)  dl_dir="${OPTARG}";;
         D)  old_dl_dir="${OPTARG}";;
+        g)  gomod_init="${OPTARG}";;
         o)  output="${OPTARG}";;
         n)  raw_base_name="${OPTARG}";;
         N)  base_name="${OPTARG}";;
@@ -138,6 +139,7 @@ main() {
 
         if [ -n "${post_process}" ] ; then
                 ${OLDPWD}/support/download/${post_process}-post-process \
+                         -g "${gomod_init}" \
                          -o "${tmpf}" \
                          -n "${raw_base_name}"
         fi
diff --git a/support/download/go-post-process b/support/download/go-post-process
new file mode 100755
index 0000000000..b7f05b37c1
--- /dev/null
+++ b/support/download/go-post-process
@@ -0,0 +1,35 @@
+#!/usr/bin/env bash
+
+set -e
+
+. "${0%/*}/post-process-helpers"
+
+# Parse our options
+while getopts "n:g:o:" OPT; do
+        case "${OPT}" in
+        g)  gomod_init="${OPTARG}";;
+        o)  output="${OPTARG}";;
+        n)  base_name="${OPTARG}";;
+        :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
+        \?) error "unknown option '%s'\n" "${OPTARG}";;
+        esac
+done
+
+# Already vendored tarball, nothing to do
+if tar tf ${output} | grep -q "^[^/]*/vendor" ; then
+	exit 0
+fi
+
+unpack ${base_name} ${output}
+
+# Do the Go vendoring
+pushd ${base_name} > /dev/null
+# modcacherw option leaves directories in the module cache at their default
+# permissions rather than making them read-only.
+if [ ! -f go.mod ] && [ -n "${gomod_init}" ]; then
+    go mod init -modcacherw ${gomod_init}
+fi
+go mod vendor -modcacherw -v
+popd > /dev/null
+
+repack $(pwd) ${base_name} ${output}
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
