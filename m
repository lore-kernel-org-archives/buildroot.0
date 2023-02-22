Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE7AC636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 22:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00C9C60A93;
	Wed, 22 Feb 2023 22:13:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00C9C60A93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b1nSQq6_BdPF; Wed, 22 Feb 2023 22:13:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E328A6175E;
	Wed, 22 Feb 2023 22:13:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E328A6175E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C0A51BF3D2
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84717403B3
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:12:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84717403B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fs-nI-v5J6HR for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 22:12:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E5CA40131
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E5CA40131
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 22:12:07 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id nv15so9874009qvb.7
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 14:12:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=05NmZssXarMHKf83Wq9mJ4d6vtHJ8Ja9NDGpHF5mLHc=;
 b=v9W5V5wgS1Esp9IQjqdx34g2ynJUPc69laLGKBasyo7/Zs2jJGfpxa6mP/EAM9nrzm
 A9EwA1m8FN69yanTAfGxEBWfyZaO/yPYjN8O24cSzH0KfQuw4vK4SJRQ0/JatKsbtSV+
 y3OgArCV5You7E0LvaaNSGah5sj24GJlEk6zmqYxk9NMvEW08RBW+UW9OpoHxeu0q0Fg
 aSjBtxWDWYnSljiZeLA9dFPKxIeIVpTcMFKRF/4ybZnuWkLpCZSIAIzYWWuVrmSgzd26
 64DMoUv9DCUx/5sT6RqIah7uB7vTaIRbXGIc3zN5lbtZeyJwpZRzpzBdx1i/ROmgjTS3
 Ihyg==
X-Gm-Message-State: AO0yUKUpqdE16E7aO/K0QoynSYgpOMLJqTIdni0M7xnQXMFGzRzFUbVa
 dZHkOoFpNKAG+dFJ1UGhvtwFiH/o8PQ=
X-Google-Smtp-Source: AK7set8xUaOlDT4iYpDPgR7IKBGoNeVfXnyvs+TKQ09W/XYnnCWQjBAUr+o+iB+FlRKIaZ7A7abU7Q==
X-Received: by 2002:ad4:5942:0:b0:56e:aeb3:52be with SMTP id
 eo2-20020ad45942000000b0056eaeb352bemr16415443qvb.8.1677103925818; 
 Wed, 22 Feb 2023 14:12:05 -0800 (PST)
Received: from abyss.attlocal.net
 (108-193-1-150.lightspeed.sntcca.sbcglobal.net. [108.193.1.150])
 by smtp.gmail.com with ESMTPSA id
 79-20020a370552000000b007422efb38fasm3042210qkf.39.2023.02.22.14.12.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Feb 2023 14:12:05 -0800 (PST)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 14:11:32 -0800
Message-Id: <20230222221134.25904-2-ckhardin@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230209231518.9458-1-ckhardin@gmail.com>
References: <20230209231518.9458-1-ckhardin@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=05NmZssXarMHKf83Wq9mJ4d6vtHJ8Ja9NDGpHF5mLHc=;
 b=AEpRVr9DQEjiVq4uT1bfUDP8en02q0M39Cqp4CKgZ+F5JmkaZKzCfi+EbcIIvfQxKj
 dHhWvlYk7HbpBMNFidOzliLpWgElaSM6czg/VrKSlR9jbGovLljyPgDbgv2WzGfPb/HO
 q+mqmo7er1zB6N7dzG+oL/Ddsmv7eqBXeUTW5PwCH6sPMNYURRkMuyKHuE5l9Jj3y+3e
 /lEif8i2sodt5wGwLuHkBAFykRd+jG0Tjs5bCteK2Zzg6vHMCNUXWMjGk9+baCsP/iZ9
 EvFcWtiuY/RhBzHYxvft55dP859A9P9EmrgPnZxP66jIi89dNt6KTc7f+HZnxHggP4kk
 kwbQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AEpRVr9D
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
Cc: Charles Hardin <ckhardin@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
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
index 1a1c315f73..0a640bbec9 100755
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
+    post_process_unpack "${base_name}" "${output}"
+    support/download/scmversion "${git_cache}" "${base_name}/.scmversion"
+    post_process_repack "$(pwd)" "${base_name}" "${output}"
+fi
diff --git a/support/download/hg b/support/download/hg
index 768a27e06f..6bf058f0a7 100755
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
+    post_process_unpack "${base_name}" "${output}"
+    support/download/scmversion "${git_cache}" "${base_name}/.scmversion"
+    post_process_repack "$(pwd)" "${base_name}" "${output}"
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
index b23b7773d3..89da736172 100755
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
+    post_process_unpack "${base_name}" "${output}"
+    support/download/scmversion "${git_cache}" "${base_name}/.scmversion"
+    post_process_repack "$(pwd)" "${base_name}" "${output}"
+fi
-- 
2.24.3 (Apple Git-128)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
