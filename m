Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A56C0218D
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 22:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE60580EF1;
	Sun, 26 Jan 2025 22:54:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d6mbSWTEzHyE; Sun, 26 Jan 2025 22:54:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B85A280EFD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B85A280EFD;
	Sun, 26 Jan 2025 22:54:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EF9AAF7
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 22:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F182880EFD
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 22:54:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SR09lRHQ3TID for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 22:54:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=tobias@waldekranz.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7655980EF1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7655980EF1
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7655980EF1
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 22:54:55 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-540215984f0so4008953e87.1
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 14:54:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737932092; x=1738536892;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pkA+hW1CB3Xx+BxbR5wF4GPwN6QZOE7ahIxcDtTCHZ4=;
 b=GcIsJw7XVlqGF7rrW6LPOuLZFxNY34iHvvJlNxrTJdOeoEIWwsy9oPcvayT9JaEvqH
 WjxOutvz3enelSavVDwr5pILstIeciMujs5G99/p0UX4Icm6LWT5uUE5fw1Kd1VlVllT
 Mq5apW2Xhwii8/OI9cPdqmb89gDwz3NoEeryhT4wM2RKOzmDG2WqYo9QYXtxX8u1jkpY
 62Bm0hnHIb+6+88Ffq04C/NTufEPDjI+uUzNWam66p2nE5mJUneMLywcVu5Gsy3oppdw
 N+oixmhTdA/1uX8E1NWviFVDxIvwe5Zi5fh46Fpas6e23h/L6XBoE97Rx8LCuo6dXwng
 AVDw==
X-Gm-Message-State: AOJu0Yxg4W6OASlflqCrkwB/czAF0XpNsu3u3xbBUEqFWGfDhaCN9kb9
 +N+E6uvf4A4nhUv8uzHCV4G1OGysY9AJ86c/KXt0v4LK+jXOsuJvA1c+0oqA/eUwk283mK8TcaZ
 C
X-Gm-Gg: ASbGncvnt1/I9SCG5HUVVtsPcZZkLfu1PP93sRGjwXv/lVmJTp869VY7WIxQ6vKQWCr
 7USEd8oxk1FZqyx7EKsh9wtLyNysKbtfLCDzUA/Mm5OchHRSrGjCK7B45Zz/aio/Fu9L5giliih
 c9f6qm2/AVE/ygcUS8ymvvobWgRErlpD2pxFdO0PnQ6SfRpuF/IXz1wcu807xNfCVOfNN94Q0VS
 wyP9CEEX7ZBPHdpxKiRjIKANV5sGPywth2yna6YtEtO8ommZixi+Nw9KH0ywRaP3RuK8YbpfPcv
 /kMngQDjSSQwoivsZgEtdAQ8f+k2Bq3wD57CblOGv5FlgtMuggU=
X-Google-Smtp-Source: AGHT+IFhYJ2aM4o8TWL7HqeuoLZwD3MXFTHXd9ox+I4JDrp7naM2YCj7waOjXTSVMeQZPymeL6n8sA==
X-Received: by 2002:a05:651c:1199:b0:300:33b1:f0d4 with SMTP id
 38308e7fff4ca-3072ca7a33fmr103978221fa.15.1737932092383; 
 Sun, 26 Jan 2025 14:54:52 -0800 (PST)
Received: from wkz-x13.. (h-176-10-159-15.NA.cust.bahnhof.se. [176.10.159.15])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3076baed131sm11387921fa.49.2025.01.26.14.54.49
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 14:54:50 -0800 (PST)
From: Tobias Waldekranz <tobias@waldekranz.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jan 2025 23:53:52 +0100
Message-ID: <20250126225438.856283-1-tobias@waldekranz.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=waldekranz-com.20230601.gappssmtp.com; s=20230601; t=1737932092; x=1738536892;
 darn=buildroot.org; 
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pkA+hW1CB3Xx+BxbR5wF4GPwN6QZOE7ahIxcDtTCHZ4=;
 b=RooJqWrZ315k6aKiLd77KYsVYlf8qlKv6APGOs8w6i3IlQZ13XqxQNx1QQ/I8164Uy
 PnKyQpIM3KzUvATZifUHZBKkZlQTbTRHeihQR3UfijOUuCdy6ZfX7nPDpARI4Xw+DfyM
 6RfYW/ggz0Aw4/jf0yvCYzo4fJuT2/SS56GPGXepD1rcpcZRz2D3iy8igdw2Hh0BMEl0
 tS6ck2zJaxJrXNzwlTVp00ysfOFU8qlOsy+pPgaW2PEbx2bzhGe7itOJUdHIe9zL2LGJ
 YIWs1bQajb6PZZSoSrMUpt93vZoJbozkMgzpexdPhXSEI4HbjSfP8BS7uzW4U+WdwNrz
 mC4Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=waldekranz.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=waldekranz-com.20230601.gappssmtp.com
 header.i=@waldekranz-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=RooJqWrZ
Subject: [Buildroot] [PATCH] support/scripts/fix-rpath: Reduce overhead of
 parallelization
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rather than fork+exec:ing a whole bash process for every file of
interest, split up the work into ${PARALLEL_JOBS} separate file lists,
and then fork off a single worker per list.

Since workers now run in a fork, we also don't have to re-parse the
arguments on every call to patch_file().

In the worker, we also add a low-overhead check for the ELF magic,
which allows us to skip all non-ELFs without having to fork off
additional processes. In the event that we encounter an invalid ELF,
that is still taken care of by the existing exitcode-test in
patch_file().

On a 4-core/8-thread box, this cuts down the time it takes to fix the
RPATHS in the host directory from around 25s to 1.5s.

Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>
---
 support/scripts/fix-rpath | 44 +++++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
index d3421504a5..06a3637440 100755
--- a/support/scripts/fix-rpath
+++ b/support/scripts/fix-rpath
@@ -60,15 +60,11 @@ HOST_EXCLUDEPATHS="/share/terminfo"
 STAGING_EXCLUDEPATHS="/usr/include /usr/share/terminfo"
 TARGET_EXCLUDEPATHS="/lib/firmware"
 
-patch_file() {
-    local PATCHELF rootdir file
-    local -a sanitize_extra_args
+declare -a sanitize_extra_args
+rootdir=
 
-    PATCHELF="${1}"
-    rootdir="${2}"
-    file="${3}"
-    shift 3
-    sanitize_extra_args=("${@}")
+patch_file() {
+    local file="${1}"
 
     # check if it's an ELF file
     rpath="$("${PATCHELF}" --print-rpath "${file}" 2>&1)"
@@ -97,9 +93,21 @@ patch_file() {
     test "${changed}" != "" && chmod u-w "${file}"
 }
 
+patch_files() {
+    while read -d $'\0' file; do
+	# for performance reasons, we want to do as little work as
+	# possible on non-ELF files. therefore, make sure that the
+	# file at least starts with the ELF magic before handing it of
+	# to patchelf, which will then perform the proper validation.
+	read -n4 magic <"${file}" && test "${magic}" != $'\x7fELF' && continue
+
+	patch_file "${file}"
+    done
+}
+
 main() {
-    local rootdir tree
-    local -a find_args sanitize_extra_args
+    local tree
+    local -a find_args
 
     tree="${1}"
 
@@ -162,14 +170,18 @@ main() {
             ;;
     esac
 
-    find_args+=( "-type" "f" "-print0" )
+    work=$(mktemp --tmpdir -d fix-rpath.XXXXXXXX)
 
-    export -f patch_file
-    # Limit the number of cores used
-    # shellcheck disable=SC2016  # ${@} has to be expanded in the sub-shell.
+    find_args+=( "-type" "f" "-print0" )
     find "${rootdir}" "${find_args[@]}" \
-    | xargs -0 -r -P "${PARALLEL_JOBS:-1}" -I {} \
-            bash -c 'patch_file "${@}"' _ "${PATCHELF}" "${rootdir}" {} "${sanitize_extra_args[@]}"
+    | split -t '\0' -a4 -d -n "r/${PARALLEL_JOBS:-1}" "-" "${work}/part"
+
+    for part in "${work}/part"*; do
+	patch_files <"${part}" &
+    done
+    wait
+
+    rm -rf "${work}"
 
     # Restore patched patchelf utility
     test "${tree}" = "host" && mv "${PATCHELF}.__to_be_patched" "${PATCHELF}"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
