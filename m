Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9ED1C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 19:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 704166118B;
	Mon,  6 Nov 2023 19:10:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 704166118B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M4oyT5zPLVzi; Mon,  6 Nov 2023 19:09:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A248611ED;
	Mon,  6 Nov 2023 19:09:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A248611ED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9BF1D1BF3A1
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54D51611ED
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54D51611ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E8P-C25rSbsk for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 19:09:18 +0000 (UTC)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B64260AE7
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 19:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B64260AE7
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-507a62d4788so6502990e87.0
 for <buildroot@buildroot.org>; Mon, 06 Nov 2023 11:09:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699297756; x=1699902556;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TZ3PQ4FnOAanL8tVZRSjnsovTMEneSDhp5MBXJEX5UA=;
 b=X+OiM5rpP1kTN5AwjDUkZefslPQDJNdINRCpqi+IY0GVxk0CYB35GcOnZTblveBmC2
 AdJ3x46dJ943av+c0561ymGKbkKyLaapRoxvcv0cBhAgm75FLGzdeoyADpJsmZtzPiSb
 Zjn5/NXRKI2VJ4gU72JdQKI4WA4oFS+GOu9hn+ZkCJlbZZzrJIvOzRmAzE7qzMiq6OZ1
 OuLr4etJaBHHYl0qSfZdPMlfNzeAXY6SGawrn+fTo2IrMvYs3DYKavnlo0Rx55KF4IG2
 ++rQi3V6iAXLJ+Ay5D4JezF31HVwoHh7io24GSfdDMkuwgKcFii/V8eB0pOIwvYNRjuV
 EF6A==
X-Gm-Message-State: AOJu0YwTZjDEhrsJy6gRfaKe0Cpx6ZLRsRsLG2YH+B+4kAAzqXAWvmv2
 W0QS3RMDOzwKmAYCP1Yvbtbk6KD5bKk=
X-Google-Smtp-Source: AGHT+IG+Yaig4fKGTff7U0NvWSKZ8wLeF4ac+MIe6YT47eMRvf9nRC7DSNxHOwfKqSvW3DY4HCtI2Q==
X-Received: by 2002:a19:f608:0:b0:503:1913:ed8e with SMTP id
 x8-20020a19f608000000b005031913ed8emr20723183lfe.61.1699297755575; 
 Mon, 06 Nov 2023 11:09:15 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8290:3800:5023:65e3:22e2:e1cc])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a056000108e00b0032dbf6bf7a2sm330900wrw.97.2023.11.06.11.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 11:09:15 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon,  6 Nov 2023 20:09:12 +0100
Message-Id: <e9097a9727dce27b9124e803a6c0a58091ec3e34.1699297749.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1699297749.git.yann.morin.1998@free.fr>
References: <cover.1699297749.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699297756; x=1699902556; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TZ3PQ4FnOAanL8tVZRSjnsovTMEneSDhp5MBXJEX5UA=;
 b=lhiZTO+A1VNqpaHUIeFs0aJ9s0IaWkhm/O2mRrrntrbS9qWNgp2YAlDZEbWdqYZn13
 NfxDeqambPnujy1o8JdmDVNSBkCVc1+ofJdjjFQMGlb5ynCGld5yZ2H1pb0Fhk2VzYE3
 e+fL7I/INpGGby7HIAKROoMXxekAI5b2IugG+ik3Zjh+39OnAZGA0Do25tpwLSgXKtVp
 NoXsTwWhhhJPJBCWXOgkcHf4utDPNbzUp03brr5yIHy1oaOVAWGFvoDBRWA0jGvMoq88
 F8osVdTiC5AOplTZR06NE6MTGSOh0vT8NtyY4uyNuimvVAHXwhsy1Zcjt2qtk51isknR
 rp0w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lhiZTO+A
Subject: [Buildroot] [PATCH 1/3 v2] support/download: teach dl-wrapper to
 handle more than one hash file
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "Martin Zeiser \(mzeiser\)" <mzeiser@cisco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, we expect and only use hash files that lie within the package
directory, alongside the .mk file. Those hash files are thus bundeld
with Buildroot.

This implies that only what's known to Buildroot can ever get into those
hash files. For packages where the version is fixed (or a static
choice), then we can carry hashes for those known versions.

However, we do have a few packages for which the version is a free-form
entry, where the user can provide a custom location and/or version. like
a custom VCS tree and revision, or a custom tarball URL. This means that
Buildroot has no way to be able to cary hashes for such custom versions.

This means that there is no integrity check that what was downloaded is
what was expected. For a sha1 in a git tree, this is a minor issue,
because the sha1 by itself is already a hash of the expected content.
But for custom tarballs URLs, or for a tag in a VCS, there is indeed no
integrity check.

Buildroot can't provide such hashes, but interested users may want to
provide those, and currently there is no (easy) way to do so.

So, we need our download helpers to be able to accept more than one hash
file to lookup for hashes.

Extend the dl-wrapper and the check-hash helpers thusly, and update the
legal-info accordingly.

Note that, to be able to pass more than one hash file, we also need to
re-order the arguments passed to support/download/check-hash, which also
impies some shuffling in the three places it is called:
  - 2 in dl-wrapper
  - 1 in the legal-info infra

That in turn also requires that the legal-license-file macro args get
re-ordered to have the hash file last; we take the opportunity to also
move the HOST/TARGET arg to be first, like in the other legal-info
macros.

Reported-by: "Martin Zeiser (mzeiser)" <mzeiser@cisco.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>

---
Changes v1 -> v2:
  - restore legal-info  (Peter K.)
---
 Makefile                    |  2 +-
 package/pkg-generic.mk      |  2 +-
 package/pkg-utils.mk        |  8 ++---
 support/download/check-hash | 64 ++++++++++++++++++++-----------------
 support/download/dl-wrapper | 10 +++---
 5 files changed, 45 insertions(+), 41 deletions(-)

diff --git a/Makefile b/Makefile
index ada5b96f08..b9acd7e650 100644
--- a/Makefile
+++ b/Makefile
@@ -836,7 +836,7 @@ legal-info-clean:
 .PHONY: legal-info-prepare
 legal-info-prepare: $(LEGAL_INFO_DIR)
 	@$(call MESSAGE,"Buildroot $(BR2_VERSION_FULL) Collecting legal info")
-	@$(call legal-license-file,buildroot,buildroot,support/legal-info/buildroot.hash,COPYING,COPYING,HOST)
+	@$(call legal-license-file,HOST,buildroot,buildroot,COPYING,COPYING,support/legal-info/buildroot.hash)
 	@$(call legal-manifest,TARGET,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,DEPENDENCIES WITH LICENSES)
 	@$(call legal-manifest,HOST,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,DEPENDENCIES WITH LICENSES)
 	@$(call legal-manifest,HOST,buildroot,$(BR2_VERSION_FULL),GPL-2.0+,COPYING,not saved,not saved)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 943f8a08c0..6c24be7505 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1138,7 +1138,7 @@ ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 ifeq ($$(call qstrip,$$($(2)_LICENSE_FILES)),)
 	$(Q)$$(call legal-warning-pkg,$$($(2)_BASENAME_RAW),cannot save license ($(2)_LICENSE_FILES not defined))
 else
-	$(Q)$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$($(2)_BASENAME_RAW),$$($(2)_HASH_FILE),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
+	$(Q)$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$(call UPPERCASE,$(4)),$$($(2)_RAWNAME),$$($(2)_BASENAME_RAW),$$(F),$$($(2)_DIR)/$$(F),$$($(2)_HASH_FILE))$$(sep))
 endif # license files
 
 ifeq ($$($(2)_REDISTRIBUTE),YES)
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index dcab7d9b2a..b91061a572 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -280,13 +280,13 @@ define legal-manifest # {HOST|TARGET}, pkg, version, license, license-files, sou
 	echo '"$(2)","$(3)","$(4)","$(5)","$(6)","$(7)","$(8)"' >>$(LEGAL_MANIFEST_CSV_$(1))
 endef
 
-define legal-license-file # pkgname, pkgname-pkgver, pkg-hashfile, filename, file-fullpath, {HOST|TARGET}
-	mkdir -p $(LICENSE_FILES_DIR_$(6))/$(2)/$(dir $(4)) && \
+define legal-license-file # {HOST|TARGET}, pkgname, pkgname-pkgver, filename, file-fullpath, pkg-hashfile
+	mkdir -p $(LICENSE_FILES_DIR_$(1))/$(3)/$(dir $(4)) && \
 	{ \
-		support/download/check-hash $(3) $(5) $(4); \
+		support/download/check-hash $(5) $(4) $(6); \
 		case $${?} in (0|3) ;; (*) exit 1;; esac; \
 	} && \
-	cp $(5) $(LICENSE_FILES_DIR_$(6))/$(2)/$(4)
+	cp $(5) $(LICENSE_FILES_DIR_$(1))/$(3)/$(4)
 endef
 
 non-virtual-deps = $(foreach p,$(1),$(if $($(call UPPERCASE,$(p))_IS_VIRTUAL),,$(p)))
diff --git a/support/download/check-hash b/support/download/check-hash
index 5a47f49bc3..03a6557187 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -3,12 +3,12 @@ set -e
 
 # Helper to check a file matches its known hash
 # Call it with:
-#   $1: the path of the file containing all the expected hashes
-#   $2: the full path to the temporary file that was downloaded, and
+#   $1: the full path to the temporary file that was downloaded, and
 #       that is to be checked
-#   $3: the final basename of the file, to which it will be ultimately
+#   $2: the final basename of the file, to which it will be ultimately
 #       saved as, to be able to match it to the corresponding hashes
 #       in the .hash file
+#   $*: the paths of the files containing all the expected hashes
 #
 # Exit codes:
 #   0:  the hash file exists and the file to check matches all its hashes,
@@ -27,28 +27,21 @@ while getopts :q OPT; do
 done
 shift $((OPTIND-1))
 
-h_file="${1}"
-file="${2}"
-base="${3}"
-
-# Bail early if no hash to check
-if [ -z "${h_file}" ]; then
-    exit 0
-fi
-# Does the hash-file exist?
-if [ ! -f "${h_file}" ]; then
-    printf "WARNING: no hash file for %s\n" "${base}" >&2
-    exit 0
-fi
+file="${1}"
+base="${2}"
+shift 2
+declare -a h_files=( "${@}" )
 
 # Check one hash for a file
 # $1: algo hash
 # $2: known hash
 # $3: file (full path)
+# $4: hash file (full path)
 check_one_hash() {
     _h="${1}"
     _known="${2}"
     _file="${3}"
+    _h_file="${4}"
 
     # Note: md5 is supported, but undocumented on purpose.
     # Note: sha3 is not supported, since there is currently no implementation
@@ -70,6 +63,7 @@ check_one_hash() {
         return 0
     fi
 
+    printf "ERROR: while checking hashes from %s\n" "${_h_file}" >&2
     printf "ERROR: %s has wrong %s hash:\n" "${base}" "${_h}" >&2
     printf "ERROR: expected: %s\n" "${_known}" >&2
     printf "ERROR: got     : %s\n" "${_hash}" >&2
@@ -79,21 +73,31 @@ check_one_hash() {
 }
 
 # Do we know one or more hashes for that file?
+nb_h_files=0
 nb_checks=0
-while read t h f; do
-    case "${t}" in
-        ''|'#'*)
-            # Skip comments and empty lines
-            continue
-            ;;
-        *)
-            if [ "${f}" = "${base}" ]; then
-                check_one_hash "${t}" "${h}" "${file}"
-                : $((nb_checks++))
-            fi
-            ;;
-    esac
-done <"${h_file}"
+for h_file in "${h_files[@]}"; do
+    [ -f "${h_file}" ] || continue
+    : $((nb_h_files++))
+    while read t h f; do
+        case "${t}" in
+            ''|'#'*)
+                # Skip comments and empty lines
+                continue
+                ;;
+            *)
+                if [ "${f}" = "${base}" ]; then
+                    check_one_hash "${t}" "${h}" "${file}" "${h_file}"
+                    : $((nb_checks++))
+                fi
+                ;;
+        esac
+    done <"${h_file}"
+done
+
+if [ ${nb_h_files} -eq 0 ]; then
+    printf "WARNING: no hash file for %s\n" "${base}" >&2
+    exit 0
+fi
 
 if [ ${nb_checks} -eq 0 ]; then
     case " ${BR_NO_CHECK_HASH_FOR} " in
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 1e8d6058f6..35428faeef 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -21,8 +21,8 @@ export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:lru:qf:e"
 
 main() {
     local OPT OPTARG
-    local backend output hfile large_file recurse quiet rc
-    local -a uris
+    local backend output large_file recurse quiet rc
+    local -a uris hfiles
 
     # Parse our options; anything after '--' is for the backend
     while getopts ":c:d:D:o:n:N:H:lrf:u:qp:" OPT; do
@@ -33,7 +33,7 @@ main() {
         o)  output="${OPTARG}";;
         n)  raw_base_name="${OPTARG}";;
         N)  base_name="${OPTARG}";;
-        H)  hfile="${OPTARG}";;
+        H)  hfiles+=( "${OPTARG}" );;
         l)  large_file="-l";;
         r)  recurse="-r";;
         f)  filename="${OPTARG}";;
@@ -70,7 +70,7 @@ main() {
     # - fails at least one of its hashes: force a re-download
     # - there's no hash (but a .hash file): consider it a hard error
     if [ -e "${output}" ]; then
-        if support/download/check-hash ${quiet} "${hfile}" "${output}" "${output##*/}"; then
+        if support/download/check-hash ${quiet} "${output}" "${output##*/}" "${hfiles[@]}"; then
             exit 0
         elif [ ${?} -ne 2 ]; then
             # Do not remove the file, otherwise it might get re-downloaded
@@ -154,7 +154,7 @@ main() {
 
         # Check if the downloaded file is sane, and matches the stored hashes
         # for that file
-        if support/download/check-hash ${quiet} "${hfile}" "${tmpf}" "${output##*/}"; then
+        if support/download/check-hash ${quiet} "${tmpf}" "${output##*/}" "${hfiles[@]}"; then
             rc=0
         else
             if [ ${?} -ne 3 ]; then
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
