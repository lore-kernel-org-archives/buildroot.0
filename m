Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385EDC54E49
	for <buildroot@archiver.kernel.org>; Sat,  9 Mar 2024 23:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92D0B60A59;
	Sat,  9 Mar 2024 23:44:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AkqW4OPjtCYj; Sat,  9 Mar 2024 23:44:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EAA960B15
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EAA960B15;
	Sat,  9 Mar 2024 23:44:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E9DD21BF2A2
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 23:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 781A24012F
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 23:44:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L_ATKZnAcNpn for <buildroot@lists.busybox.net>;
 Sat,  9 Mar 2024 23:44:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4271C40135
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4271C40135
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4271C40135
 for <buildroot@buildroot.org>; Sat,  9 Mar 2024 23:44:33 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-413183f5e11so9813255e9.1
 for <buildroot@buildroot.org>; Sat, 09 Mar 2024 15:44:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710027872; x=1710632672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=14F32g3xEA6hC8F2moRd3cagFQs3PFyMv3/Ab3vPFuY=;
 b=h8CmNr2CFd0XAUJ6ZXGnhjJOoDDbzcU1FJWxg2sx44AYjRvHucdq1gyoBFJ1N6ZDCc
 9RXKM6kaXHEqlOtSvPidnaSst6eEG+Kk16HuvbfHfazCsp0NzCYNl1QPA2If7wyvASP3
 sHb7ZwXDKueEcYZe0zScAL617OCUc0BjHdDrMS/SnrJyA6O1YENpoq9VGteSqNFLtOBR
 DiBqE+zozFcPpuSP+vUktUypzp7J02gOBvAqNZevhq0vKZgybpp2+VmCid2DxWCqtWSQ
 iyYVaQ5yf5FktsEzx9XCgIDSCEM1W8G1psV98dmIiHJg9laopgQFyp1+DE1iOztwJI4W
 Z+5Q==
X-Gm-Message-State: AOJu0YyxAUANEHM9VUHd4uXG2IzQtBUcddW2leuKeDwjt76803aOlQcx
 Y7C/moVLTz8+0UOVor1P916LH2/l78I3jS10zuWLBGlw6q2ExwYEXTa4VVNI
X-Google-Smtp-Source: AGHT+IFg8bV5jOzoTvE+SmzMi3iOv4JFqushF9w+JRqcRAI77uls3KMHXjfLc9imv0ks87ujQwrhww==
X-Received: by 2002:a05:600c:3542:b0:412:c811:b6a3 with SMTP id
 i2-20020a05600c354200b00412c811b6a3mr3631142wmq.12.1710027871699; 
 Sat, 09 Mar 2024 15:44:31 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 fc19-20020a05600c525300b0041312855081sm4005123wmb.5.2024.03.09.15.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Mar 2024 15:44:31 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 10 Mar 2024 00:44:28 +0100
Message-ID: <0442347acee9bba11664bd51714905fc1c93e3a0.1710027863.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1710027863.git.yann.morin.1998@free.fr>
References: <cover.1710027863.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710027872; x=1710632672; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=14F32g3xEA6hC8F2moRd3cagFQs3PFyMv3/Ab3vPFuY=;
 b=TpENc89xcE3Ms7mW2QaH0uJrfCy+k4qic4J3ydFAkJ33n4Ms1L6sMQVKplQJ8lhFN3
 fhO9l1ZSsEz9nxnDA/LpRD2jYq5PGcVZm68k75kUR2AZX/znqhcKBn2TZY+GEAAD2fNQ
 AFOqSbjQ8MZXfo39LzlYQ2Iq6aaq8bPWb8EFRd9VFmKWWf5BE/1Ewg0RjxpcBbFS3WGL
 XCHKbwUHIYybMiBaN36RR4QbFKIOUwcoYt1xTeBthZ5i6o+vXi4yOD2LI48twzFi+tHN
 QGXSkj/S2oGkc7BHt15/QrxkSm+TMr3u4GnqCbzxTOcsRDzftOG7QQUmX0xrjIs1OIC9
 5qPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TpENc89x
Subject: [Buildroot] [PATCH 4/5] support/download/check-hash: fix shellcheck
 errors
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

The hash files do not use trailing backslash \ to continue lines, so
we don't want them to be interpreted thusly, so we use 'read -r'
(SC2162).

The h_file is used twice in the same loop, once for reading from it,
and once just to print it, so there is no conflict (SC2094).

Integrer variables need not be quoted (SC2086). In any case, should
there be an actual issue and they be set empty, that would cause a
runtime issue, wether they be quoted or not.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore         | 1 -
 support/download/check-hash | 8 ++++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index db09574463..e9dcc56d32 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1448,7 +1448,6 @@ support/dependencies/check-host-xzcat.sh Shellcheck
 support/dependencies/dependencies.sh Shellcheck
 support/download/bzr ConsecutiveEmptyLines Shellcheck
 support/download/cargo-post-process Shellcheck
-support/download/check-hash Shellcheck
 support/download/cvs Shellcheck
 support/download/dl-wrapper Shellcheck
 support/download/file Shellcheck
diff --git a/support/download/check-hash b/support/download/check-hash
index 03a6557187..9db647885a 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -57,7 +57,7 @@ check_one_hash() {
     esac
 
     # Do the hashes match?
-    _hash=$( ${_h}sum "${_file}" |cut -d ' ' -f 1 )
+    _hash="$( "${_h}sum" "${_file}" |cut -d ' ' -f 1 )"
     if [ "${_hash}" = "${_known}" ]; then
         printf "%s: OK (%s: %s)\n" "${base}" "${_h}" "${_hash}"
         return 0
@@ -78,7 +78,8 @@ nb_checks=0
 for h_file in "${h_files[@]}"; do
     [ -f "${h_file}" ] || continue
     : $((nb_h_files++))
-    while read t h f; do
+    # shellcheck disable=SC2094  # we're really reading it only once
+    while read -r t h f; do
         case "${t}" in
             ''|'#'*)
                 # Skip comments and empty lines
@@ -86,6 +87,7 @@ for h_file in "${h_files[@]}"; do
                 ;;
             *)
                 if [ "${f}" = "${base}" ]; then
+                    # shellcheck disable=SC2094  # we're only printing the h_file filename
                     check_one_hash "${t}" "${h}" "${file}" "${h_file}"
                     : $((nb_checks++))
                 fi
@@ -94,11 +96,13 @@ for h_file in "${h_files[@]}"; do
     done <"${h_file}"
 done
 
+# shellcheck disable=SC2086  # nb_h_files is a non-empty int
 if [ ${nb_h_files} -eq 0 ]; then
     printf "WARNING: no hash file for %s\n" "${base}" >&2
     exit 0
 fi
 
+# shellcheck disable=SC2086  # nb_checks is a non-empty int
 if [ ${nb_checks} -eq 0 ]; then
     case " ${BR_NO_CHECK_HASH_FOR} " in
     *" ${base} "*)
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
