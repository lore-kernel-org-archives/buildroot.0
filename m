Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F4AC27C5F
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 17:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84F2B427E5;
	Fri,  7 Jun 2024 17:06:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B6q_U3HW9AVC; Fri,  7 Jun 2024 17:06:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FA644282A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FA644282A;
	Fri,  7 Jun 2024 17:06:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA2E51BF479
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D498384C8D
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DDZ45jb7E2Gg for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 17:06:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 577DC84C2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 577DC84C2D
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 577DC84C2D
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 17:06:06 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-35f0f4746c2so128896f8f.3
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 10:06:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717779964; x=1718384764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=s20i9Dp1L4MxZpPmz2Ga2DDptaPCZsxe9U7ttZUhQhE=;
 b=l04JftowwXCvxGHs4EMQjIZUsNBrLwCKDWHl75TjxfRG4Kz+gMcj1EM/il+QMFUMJV
 m7dyDm+QXtbSGMzv5DCDILqZuMGTX0dWWnl62NsJ/wQ9X+YvdwRfLSKzj2Kwva4Cv0Ed
 aWlqzI5M+rK+6SJ+iDmZmcDYeD3Zk3y8IrSOze6AXZannRzDxpQcfIgolSEpaKmigwRt
 L958RyS9G140MajZRH6ig+j/EvntjeGtny8KOBH4Rp+kiiOJyF4gSxqyMvqJmakhJtM3
 5+1gcaXosYqGJOktx51LoIe9RdO7Co0N5Y7EkielS2ORbGWXD87ilezHPiJoRH295riF
 0QCQ==
X-Gm-Message-State: AOJu0Yzl91QFW2NZrfKkM+VjGA9TFPDwTkhvtdLfskviei7oD3O52qSm
 VGz5vnT78y7RA7i8uNOAc1tbColbom553wIu6B1Axn9PDmdouppT65aQ5g==
X-Google-Smtp-Source: AGHT+IHNY05u5Mm+TAzPPSy7f1lkD+gEk6Stk06sh7DPZdjxmoSCfm6rOwQq6eBqBMT+yCSwXei5IQ==
X-Received: by 2002:adf:e84c:0:b0:354:fc1a:239b with SMTP id
 ffacd0b85a97d-35efee07fc4mr2088538f8f.56.1717779964261; 
 Fri, 07 Jun 2024 10:06:04 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e989c9sm4355379f8f.73.2024.06.07.10.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 10:06:04 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri,  7 Jun 2024 19:05:46 +0200
Message-ID: <57e8d056681a50d2ae7dede9077ab58d2519bb14.1717779951.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717779951.git.yann.morin.1998@free.fr>
References: <cover.1717779951.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717779964; x=1718384764; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s20i9Dp1L4MxZpPmz2Ga2DDptaPCZsxe9U7ttZUhQhE=;
 b=E5zlKqt/FDoZOOIu6EwQmQwsq8IuczXhiNkrRAoV0gyhoQR05ixcxr38zhmeTS2vLU
 zjGmRuqY6t+oBr/FsZ9Jwi5H2Dq+WZSMwUDE0kEJy6elfSnijvbCv0hE+x/nzu86b4rx
 VgpOwM8+A/T5sNhwT3tiFvMI2fOO/LdpYuiRJcAsmJpQjN7wXWt+/SE1D+eJd6zG090M
 m+MAuIMi2gl5nNI3m4BLFjgrBlH9qFj/0kFWdk3yvT+GvOWTSQLj9C7KgyZQXGf4kImT
 qR5K2+dyZdfvkuKv0KqxJoiF+Rsmm+pkrMYccGfDN08P7zHcxydYXFk3jl/OyunBmero
 Cbow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=E5zlKqt/
Subject: [Buildroot] [PATCH 05/20 v2] support/download/dl-wrapper: fix
 shellcheck errors
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore         |  1 -
 support/download/dl-wrapper | 20 ++++++++++++++------
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 8a21b3f155..00eafcd839 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1648,7 +1648,6 @@ support/dependencies/check-host-xzcat.sh Shellcheck
 support/dependencies/dependencies.sh Shellcheck
 support/download/bzr Shellcheck lib_shellscript.ConsecutiveEmptyLines
 support/download/cargo-post-process Shellcheck
-support/download/dl-wrapper Shellcheck
 support/download/file Shellcheck
 support/download/go-post-process Shellcheck
 support/download/hg Shellcheck
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 35428faeef..67a9718d9d 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -22,7 +22,7 @@ export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:lru:qf:e"
 main() {
     local OPT OPTARG
     local backend output large_file recurse quiet rc
-    local -a uris hfiles
+    local -a uris hfiles backend_opts
 
     # Parse our options; anything after '--' is for the backend
     while getopts ":c:d:D:o:n:N:H:lrf:u:qp:" OPT; do
@@ -58,6 +58,7 @@ main() {
     # If we can neither link nor copy, fallback to doing a download.
     # NOTE! This is not atomic, is subject to TOCTTOU, but the whole
     # dl-wrapper runs under an flock, so we're safe.
+    # shellcheck disable=SC2166  # -a works in this case
     if [ ! -e "${output}" -a -e "${old_dl_dir}/${filename}" ]; then
         ln "${old_dl_dir}/${filename}" "${output}" || \
         cp "${old_dl_dir}/${filename}" "${output}" || \
@@ -111,6 +112,12 @@ main() {
         tmpd="$(mktemp -d "${BUILD_DIR}/.${output##*/}.XXXXXX")"
         tmpf="${tmpd}/output"
 
+        # shellcheck disable=SC2206  # all three are dash-options
+        backend_opts=( ${quiet} ${large_file} ${recurse} )
+        if [ "${urlencode}" ]; then
+            backend_opts+=( -e )
+        fi
+
         # Helpers expect to run in a directory that is *really* trashable, so
         # they are free to create whatever files and/or sub-dirs they might need.
         # Doing the 'cd' here rather than in all backends is easier.
@@ -121,7 +128,6 @@ main() {
         # the next URI until it succeeds. Once out of URI to try, we need to
         # cleanup and exit.
         if ! "${OLDPWD}/support/download/${backend}" \
-                $([ -n "${urlencode}" ] && printf %s '-e') \
                 -c "${cset}" \
                 -d "${dl_dir}" \
                 -n "${raw_base_name}" \
@@ -129,7 +135,9 @@ main() {
                 -f "${filename}" \
                 -u "${uri}" \
                 -o "${tmpf}" \
-                ${quiet} ${large_file} ${recurse} -- "${@}"
+                "${backend_opts[@]}" \
+                -- \
+                "${@}"
         then
             # cd back to keep path coherence
             cd "${OLDPWD}"
@@ -193,8 +201,8 @@ main() {
     # Some backends (cp and scp) may create executable files, so we need to
     # carry the executable bit if needed.
     [ -x "${tmpf}" ] && new_mode=755 || new_mode=644
-    new_mode=$(printf "%04o" $((0${new_mode} & ~0$(umask))))
-    chmod ${new_mode} "${tmp_output}"
+    new_mode="$(printf "%04o" $((0${new_mode} & ~0$(umask))))"
+    chmod "${new_mode}" "${tmp_output}"
 
     # We must *not* unlink tmp_output, otherwise there is a small window
     # during which another download process may create the same tmp_output
@@ -226,7 +234,7 @@ main() {
 
 trace()  { local msg="${1}"; shift; printf "%s: ${msg}" "${my_name}" "${@}"; }
 warn()   { trace "${@}" >&2; }
-errorN() { local ret="${1}"; shift; warn "${@}"; exit ${ret}; }
+errorN() { local ret="${1}"; shift; warn "${@}"; exit "${ret}"; }
 error()  { errorN 1 "${@}"; }
 
 my_name="${0##*/}"
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
