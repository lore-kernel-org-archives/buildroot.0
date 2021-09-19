Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A125BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 07:11:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E388560F0F
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 07:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E388560F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.buildroot.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC41B6067F;
	Sun, 19 Sep 2021 07:11:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kZtX-K46tKpC; Sun, 19 Sep 2021 07:10:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBB4E60684;
	Sun, 19 Sep 2021 07:10:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8511A1BF314
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 07:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7443540182
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 07:10:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rh2Ke9bOSjOl for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 07:10:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93E02400D1
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 07:10:24 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id h3so14195245pgb.7
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 00:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NgFp1mYtahL43rdSmNFcsQwAzk1Wr5XONBO3UABfuxg=;
 b=MU9Htdcx5opqjU2GouMqYEcBX3lMiWnx01TLye0a5tSRvGtB17GbVBGBxXRqP/PHon
 XG/NSc3kaI7S0urNsV5BYvHlNs1lcvUT300XzCpIaRhgwiGgVbJNWqmTBwfY8EnK1cJ3
 Mekx67LVKFHJMN7USBiTGFXAdUG0gXNNT9hyrZk6BtFVUetlq3nOgpEkBsw47XXVTHcE
 37sR2gZBeYT7llhnieqU04oQJ3hSET935PEQttlGrtTQ3qvWla7z4Ddd+ADLiZig4oyz
 l87GSVvIJ0W3BGClTocNgy2gthFNtQ+KeQi7o71cxTrjmNPHRi2L7GdAY2oDrn6gUhSM
 3juw==
X-Gm-Message-State: AOAM532h9cfN3B8X7Ul4Kbea8Y1JGxkGmSNz5bnab4hN/3Dk3stFt+iz
 BAB3vwrgNa9YiHvdeEXY1GcVWhcCYcyrJA==
X-Google-Smtp-Source: ABdhPJymrRWNB2jiXo7vAhCA9aeR8ghHCr81VX5Qp/w4Wnc4aaqa6VvQ1nhrjx8nMVVq0t6zL/Dxrw==
X-Received: by 2002:a63:841:: with SMTP id 62mr17857663pgi.354.1632035423694; 
 Sun, 19 Sep 2021 00:10:23 -0700 (PDT)
Received: from localhost.localdomain (ip68-6-75-194.sb.sd.cox.net.
 [68.6.75.194])
 by smtp.gmail.com with ESMTPSA id g24sm10786458pfk.52.2021.09.19.00.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 00:10:23 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 00:10:15 -0700
Message-Id: <20210919071016.3339939-4-christian@paral.in>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210919071016.3339939-1-christian@paral.in>
References: <20210919071016.3339939-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH-NEXT v2 4/5] support/download/go-post-process:
 implement Go vendoring support
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
From: Christian Stewart via buildroot <buildroot@lists.buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

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
 package/pkg-download.mk               |  1 +
 package/pkg-golang.mk                 |  8 +++++-
 support/download/dl-wrapper           |  6 +++--
 support/download/go-post-process      | 35 ++++++++++++++++++++++++
 support/download/post-process-helpers | 38 ++++++++++++---------------
 5 files changed, 64 insertions(+), 24 deletions(-)
 create mode 100755 support/download/go-post-process
 mode change 100644 => 100755 support/download/post-process-helpers

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
diff --git a/support/download/post-process-helpers b/support/download/post-process-helpers
old mode 100644
new mode 100755
index bed8df2577..b3231207a6
--- a/support/download/post-process-helpers
+++ b/support/download/post-process-helpers
@@ -1,30 +1,26 @@
+# Helpers for the post-process step to re-pack vendored archives.
+
+. "${0%/*}/helpers"
 
 unpack() {
-        dest="$1"
-        tarball="$2"
+    dest="$1"
+    tarball="$2"
 
-        mkdir ${dest}
-        tar -C ${dest} --strip-components=1 -xf ${tarball}
+    mkdir ${dest}
+    tar -C ${dest} --strip-components=1 -xf ${tarball}
 }
 
 repack() {
-        src="$1"
-        tarball="$2"
-
-        # Generate the archive, sort with the C locale so that it is reproducible.
-        find "$(basename ${src})" -not -type d -print0 >files.list
-        LC_ALL=C sort -z <files.list >files.list.sorted
+    local in_dir="${1}"
+    local base_dir="${2}"
+    local out="${3}"
 
-        # let's use a fixed hardcoded date to be reproducible
-        date="2020-02-06 01:02:03 +0000"
+    # let's use a fixed hardcoded date to be reproducible
+    date="2020-02-06 01:02:03 +0000"
 
-        # Create GNU-format tarballs, since that's the format of the tarballs on
-        # sources.buildroot.org and used in the *.hash files
-        tar cf new.tar --null --verbatim-files-from --numeric-owner --format=gnu \
-            --owner=0 --group=0 --mtime="${date}" -T files.list.sorted
-        gzip -6 -n <new.tar >new.tar.gz
-        mv "${tarball}" "${tarball}".old
-        mv new.tar.gz "${tarball}"
-        rm "${tarball}".old
-        rm -rf ${src}
+    # use the helper to create a reproducible archive
+    mk_tar_gz "${in_dir}/${base_dir}" "${base_dir}" "${date}" "${out}"
 }
+
+# Keep this line and the following as last lines in this file.
+# vim: ft=bash
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
