Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBFEC25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 20:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D718883131;
	Sun,  2 Jun 2024 20:40:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7f-I4zXrx3Ot; Sun,  2 Jun 2024 20:40:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2018783498
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2018783498;
	Sun,  2 Jun 2024 20:40:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5BDFC1BF315
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56452402F6
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rpZU5F_tViDN for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 20:39:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2CC1C4013B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CC1C4013B
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2CC1C4013B
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 20:39:57 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42134bb9677so17538675e9.2
 for <buildroot@buildroot.org>; Sun, 02 Jun 2024 13:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717360795; x=1717965595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bdt/j3LdWzzvziKlM95F7xsR++s75dw33l4cLt4E4Ko=;
 b=V4vYhgWG1ZnvXojLy+iLzyNGOn7FAD4LmKlgeJ+rvkKjvvDKMFBv5Lm2OKftohlV5A
 jHwEG50WuoGXmxzLQjBnx2AsglZrZXWUeAteqFsGMa+a8s8ZTR75H0wnMZddYkJee8YV
 AHJxcqDoxV4XvG5uWPtpnowJwPPmanCGElr+kksHC4oX341VZNSMhGLlnkb8CdenKD/K
 R2gLWcmN2y7se+Gldel8qdcS0RtR48AvaocP4dExXpllL7s6g2K32k6YltKUoW8eEzkh
 A5h0yPJf5ZE5uvNQaWCa6iM/Swgha7kARBUk3XUcz+Y81twaIrgrx/Iuf8WpSblFHoQ1
 BX6A==
X-Gm-Message-State: AOJu0Ywgq8e/E44aMWYKyQf/idk1elEoz3hhhyuwGAGWmm5iLLJ4Vnd3
 8I/JIki3ndcJCdj3NgJ646U+EGo8ldrgkJFx4bS28nRLMydaQUBAtu2soQ==
X-Google-Smtp-Source: AGHT+IH7h70tAdw9eum0n7E+A2t1zOUTMFJQVzNNS/Wa5rze285TOE4xzsb0F4JClhQmGXyrWZob8g==
X-Received: by 2002:a05:600c:3584:b0:421:2bf5:2362 with SMTP id
 5b1f17b1804b1-4212e0c0597mr77079665e9.39.1717360795110; 
 Sun, 02 Jun 2024 13:39:55 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e0f97ba3csm6460862f8f.73.2024.06.02.13.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 13:39:54 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  2 Jun 2024 22:39:41 +0200
Message-ID: <3ea7b2b70a9cd08c0145a73a55e16cc162315a1f.1717360788.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717360788.git.yann.morin.1998@free.fr>
References: <cover.1717360788.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717360795; x=1717965595; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bdt/j3LdWzzvziKlM95F7xsR++s75dw33l4cLt4E4Ko=;
 b=AxEcTRTgsE+X3sZ3aHib9wryUiPAbV8Wt+QBlfNOGy0H5M87K9sq/SUOOyaNoNN2oJ
 T2UP7C1KeJfMEmKAGDnc6MM/InEcrdBHW9ZQX0qJvpSCR7KCfwBrsqadQj5fstMU08AR
 84aIkuWKoI8CIDMEvXoLscz+5wXB8k0Se9zXnHFgbWPO4ot4OGUQUk7oh3zCTVwhXvKG
 4xj6KNuggObL67+K62z794PFrUSdrJITI2BcdmclHIosszV5ZTuIGDR25IJgDZ9wr+cv
 u1lk/kixR/bjrHPETj8clcI4gKWf+lwSlP5rAa+e0KRWBJ9Cf7VSNhfiTl7p5QwMJd4m
 mCoA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AxEcTRTg
Subject: [Buildroot] [PATCH 05/16] support/download/dl-wrapper: fix
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
index 1c5ab08f5f..e7180718c7 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1661,7 +1661,6 @@ support/dependencies/dependencies.sh Shellcheck
 support/download/bzr Shellcheck lib_shellscript.ConsecutiveEmptyLines
 support/download/cargo-post-process Shellcheck
 support/download/cvs Shellcheck
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
