Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F894C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 22:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 347EF61381;
	Wed, 22 Feb 2023 22:31:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 347EF61381
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hlQsuw3hS43A; Wed, 22 Feb 2023 22:31:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F6276175E;
	Wed, 22 Feb 2023 22:31:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F6276175E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B64981BF3D2
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CF9582052
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:31:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CF9582052
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vyky6U-R1ays for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 22:31:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BBE48204B
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BBE48204B
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 22:31:04 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id y12so9725574qvt.8
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 14:31:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=InFi48cPlI7PCEJAuW1tqb9Rbb7BrqWUQPZjI2PtYEE=;
 b=YDIRTawsTI6jA89CfTRVUrxqqO6oiFcl4U0Dt0/tBXYt583kDXgnKoK+qFeVt/tyWK
 pcgPYmgkFYaDK4wIHgNU9cxW6Hv9VAaQw2nTPCdxTiucP8gdFw8xyGri7grGTKefTVq+
 2ZAzGh7pMPcXm5qmUVT/RjG5zdpkh/UToe1C9HepsaAZMkHPONYTomRf+iKBzO595sI+
 ZHlBzIvIAx4HoyTE+EFPnGG8OivlVRWSGNVIWSWT1/iCx2WZYbJv2sMLRM/LrLk9vifj
 5lKoIWjgT0eNN16m6uIsjqKzV6oOBr7iwXtkUa6RmmX96jRTTPVCdXrWsxA2+wPkhgXR
 M1Ew==
X-Gm-Message-State: AO0yUKWviWPS2qliVsSO+yxxPuX7RFwui3D1Q+EM7rn6sIoWVUnoWCPB
 okkdI/Z5VwXTY3S6XB4u0pFzPuDOCyg=
X-Google-Smtp-Source: AK7set9mMKT07X9gsiZ949VdMl/rQ1zk8lwKFGZOM7xLldAeECyEiYhhfOdZuguRnmEtWO6OdVBVEw==
X-Received: by 2002:a05:6214:5096:b0:56b:b33d:c668 with SMTP id
 kk22-20020a056214509600b0056bb33dc668mr15396155qvb.18.1677105062652; 
 Wed, 22 Feb 2023 14:31:02 -0800 (PST)
Received: from abyss.attlocal.net
 (108-193-1-150.lightspeed.sntcca.sbcglobal.net. [108.193.1.150])
 by smtp.gmail.com with ESMTPSA id
 d191-20020a3768c8000000b0073b4d8cb4a5sm3538837qkc.60.2023.02.22.14.31.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Feb 2023 14:31:02 -0800 (PST)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 14:30:51 -0800
Message-Id: <cf471549729217bc79a9fc16bd74d3eb5918389e.1677104777.git.ckhardin@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1677104777.git.ckhardin@gmail.com>
References: <20230209231518.9458-1-ckhardin@gmail.com>
 <cover.1677104777.git.ckhardin@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=InFi48cPlI7PCEJAuW1tqb9Rbb7BrqWUQPZjI2PtYEE=;
 b=WkrakgIrRpstMYWCwdXN9o5ZSKtcchefk2Sfw1f1Pxh2EmKYNwbNOuEBEmlBDR7hFZ
 JxFODfjgJFDNnWQ2uHiqByHGjX5Ra2/U6QrCSlfmIK7rHpvuNlUDykzYEesrUi3KSmXB
 CY0BuuxeBgwMUdO0KyHVmPmgRplyDtrQWWsY5nyidw1Rt2ptfHBNdsP4Y3KFkG2NGaiG
 lqeeUTYmNF/OR/h9yqOjmjdABaQVLoSFjWKsbMY0Fgsm1jKmnTH3eTU7ds39cvBnlTl3
 PdmCXQNXubyNPcct4ubK74pacfmLqmRMH9P3eF+lAoJ0kinyena7IOYn2G/++5DN86aG
 nXDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WkrakgIr
Subject: [Buildroot] [PATCH v2 1/3] support/download: add a helper scipt to
 generate scmversions
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
Cc: Charles Hardin <ckhardin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Primarily focused on uboot and linux, getting the scmversion from
the custom repository references is required for change control
tracking off of different builds and pipelines. So, extend the
download framework to generate these files while the locks are
being held for the generation to avoid the git information from
changes during the download process.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>

wip scmversion

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 package/pkg-download.mk     |  1 +
 support/download/dl-wrapper |  5 +--
 support/download/git        | 10 ++++++
 support/download/hg         | 10 ++++++
 support/download/scmversion | 63 +++++++++++++++++++++++++++++++++++++
 support/download/svn        | 10 ++++++
 6 files changed, 97 insertions(+), 2 deletions(-)
 create mode 100755 support/download/scmversion

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 0718f21aad..333a53ce7e 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -119,6 +119,7 @@ define DOWNLOAD
 		-n '$($(2)_BASENAME_RAW)' \
 		-N '$($(2)_RAWNAME)' \
 		-o '$($(2)_DL_DIR)/$(notdir $(1))' \
+		$(if $($(2)_SCMVERSION),-s) \
 		$(if $($(2)_GIT_SUBMODULES),-r) \
 		$(if $($(2)_GIT_LFS),-l) \
 		$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(2)),-u $(uri)) \
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 1e8d6058f6..dfb02f7fe8 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -25,7 +25,7 @@ main() {
     local -a uris
 
     # Parse our options; anything after '--' is for the backend
-    while getopts ":c:d:D:o:n:N:H:lrf:u:qp:" OPT; do
+    while getopts ":c:d:D:o:n:N:H:slrf:u:qp:" OPT; do
         case "${OPT}" in
         c)  cset="${OPTARG}";;
         d)  dl_dir="${OPTARG}";;
@@ -34,6 +34,7 @@ main() {
         n)  raw_base_name="${OPTARG}";;
         N)  base_name="${OPTARG}";;
         H)  hfile="${OPTARG}";;
+        s)  scmversion="-s";;
         l)  large_file="-l";;
         r)  recurse="-r";;
         f)  filename="${OPTARG}";;
@@ -129,7 +130,7 @@ main() {
                 -f "${filename}" \
                 -u "${uri}" \
                 -o "${tmpf}" \
-                ${quiet} ${large_file} ${recurse} -- "${@}"
+                ${quiet} ${scmversion} ${large_file} ${recurse} -- "${@}"
         then
             # cd back to keep path coherence
             cd "${OLDPWD}"
diff --git a/support/download/git b/support/download/git
index 1a1c315f73..277c412e26 100755
--- a/support/download/git
+++ b/support/download/git
@@ -12,6 +12,7 @@ set -E
 #
 # Options:
 #   -q          Be quiet.
+#   -s          Generate an scmversion file
 #   -r          Clone and archive sub-modules.
 #   -o FILE     Generate archive in FILE.
 #   -u URI      Clone from repository at URI.
@@ -51,11 +52,13 @@ _on_error() {
 }
 
 quiet=
+scmversion=0
 large_file=0
 recurse=0
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  quiet=-q; exec >/dev/null;;
+    s)  scmversion=1;;
     l)  large_file=1;;
     r)  recurse=1;;
     o)  output="${OPTARG}";;
@@ -229,3 +232,10 @@ popd >/dev/null
 # the state of the remote server. It also would generate large tarballs
 # (gigabytes for some linux trees) when a full clone took place.
 mk_tar_gz "${git_cache}" "${basename}" "${date}" "${output}" ".git/*"
+
+# If an scmversion is needed then generate the version information
+if [ ${scmversion} -eq 1 ]; then
+    post_process_unpack "${basename}" "${output}"
+    support/download/scmversion "${git_cache}" "${basename}/.scmversion"
+    post_process_repack "$(pwd)" "${basename}" "${output}"
+fi
diff --git a/support/download/hg b/support/download/hg
index 768a27e06f..dcf36e6e1f 100755
--- a/support/download/hg
+++ b/support/download/hg
@@ -7,6 +7,7 @@ set -e
 #
 # Options:
 #   -q          Be quiet.
+#   -s          Generate an scmversion file
 #   -o FILE     Generate archive in FILE.
 #   -u URI      Clone from repository at URI.
 #   -c CSET     Use changeset (or revision) CSET.
@@ -16,9 +17,11 @@ set -e
 #   HG       : the hg command to call
 
 quiet=
+scmversion=
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  quiet=-q;;
+    s)  scmversion=1;;
     o)  output="${OPTARG}";;
     u)  uri="${OPTARG}";;
     c)  cset="${OPTARG}";;
@@ -48,3 +51,10 @@ _hg clone ${quiet} "${@}" --noupdate "'${uri}'" "'${basename}'"
 _plain_hg archive ${quiet} --repository "'${basename}'" --type tgz \
             --prefix "'${basename}'" --rev "'${cset}'" \
             - >"${output}"
+
+# If an scmversion is needed then generate the version information
+if [ ${scmversion} -eq 1 ]; then
+    post_process_unpack "${basename}" "${output}"
+    support/download/scmversion "${@}" "${basename}/.scmversion"
+    post_process_repack "$(pwd)" "${basename}" "${output}"
+fi
diff --git a/support/download/scmversion b/support/download/scmversion
new file mode 100755
index 0000000000..16868a11e5
--- /dev/null
+++ b/support/download/scmversion
@@ -0,0 +1,63 @@
+#!/usr/bin/env bash
+set -x
+set -e
+
+# Helper to generate an scmversion in a dowload script before
+# the tarball is created. Because the tarball has to exclude
+# repository directories like .git and .hg to make reproducible
+# archives on subsequent downloads the version information is
+# not available during the builds for a script like setlocalversion
+# to run.
+#
+# So, this is hook to call right before the make tarball gz that
+# will generate a .scmversion file that will be included in an
+# archive and then available during the build steps.
+#
+# Call it with:
+#   $1: the path to the srctree (see mk_tar_gz in helpers)
+#   $2: output file
+#
+# Because this can fail for a variety of reason, there is no exit
+# code to avoid build breakage. It is assumed the scripts will be
+# reproducible because they are based on the contents that get generated
+
+while getopts :q OPT; do
+    case "${OPT}" in
+    q)  exec >/dev/null;;
+    \?) exit 1;;
+    esac
+done
+shift $((OPTIND-1))
+
+srctree="${1}"
+scmversion="${2}"
+
+# Bail early if no srctree or scmversion
+if [ -z "${srctree}" -o -z "${scmversion}" ]; then
+    exit 0
+fi
+
+# Does the scmversion exist and readonly
+if [ -f "${scmversion}" -a ! -w "${scmversion}" ]; then
+    printf "WARNING: scmversion %s is readonly\n" "${scmversion}" >&2
+    exit 0
+fi
+
+#
+# Generate the scmversion from some expected locations in srctree
+# and fallback to the buildroot version of setlocalversion another
+# script is not used
+#
+if [ -x "${srctree}/setlocalversion" ]; then
+    res=$(cd "${srctree}"; ./setlocalversion)
+elif [ -x "${srctree}/scripts/setlocalversion" ]; then
+    res=$(cd "${srctree}"; ./scripts/setlocalversion)
+elif [ -x "${srctree}/tools/setlocalversion" ]; then
+    res=$(cd "${srctree}"; ./tools/setlocalversion)
+fi
+if [ -z "${res}" ]; then
+    res=$("${0%/*}/../scripts/setlocalversion" "${srctree}")
+fi
+
+[ -n "${res}" ] && (echo "${res}" > "${scmversion}")
+exit 0
diff --git a/support/download/svn b/support/download/svn
index b23b7773d3..b0e9f69a6b 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -12,6 +12,7 @@ set -e
 #
 # Options:
 #   -q          Be quiet.
+#   -s          Generate an scmversion file
 #   -o FILE     Generate archive in FILE.
 #   -u URI      Checkout from repository at URI.
 #   -c REV      Use revision REV.
@@ -23,9 +24,11 @@ set -e
 . "${0%/*}/helpers"
 
 quiet=
+scmversion=0
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  quiet=-q;;
+    s)  scmversion=1;;
     o)  output="${OPTARG}";;
     u)  uri="${OPTARG}";;
     c)  rev="${OPTARG}";;
@@ -65,3 +68,10 @@ date="$( _plain_svn info "'${uri}@${rev}'" \
 # We did a 'svn export' above, so it's not a working copy (there is no .svn
 # directory or file to ignore).
 mk_tar_gz "${basename}" "${basename}" "${date}" "${output}"
+
+# If an scmversion is needed then generate the version information
+if [ ${scmversion} -eq 1 ]; then
+    post_process_unpack "${basename}" "${output}"
+    support/download/scmversion "${basename}" "${basename}/.scmversion"
+    post_process_repack "$(pwd)" "${basename}" "${output}"
+fi
-- 
2.24.3 (Apple Git-128)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
