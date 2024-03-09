Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A52C54791
	for <buildroot@archiver.kernel.org>; Sat,  9 Mar 2024 23:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E74C360AF8;
	Sat,  9 Mar 2024 23:44:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g4w_stiPuQsu; Sat,  9 Mar 2024 23:44:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1B8760B15
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1B8760B15;
	Sat,  9 Mar 2024 23:44:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 19A8F1BF2A2
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 23:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0D05404C6
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 23:44:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WYqt3HKCIK8m for <buildroot@lists.busybox.net>;
 Sat,  9 Mar 2024 23:44:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8049E40135
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8049E40135
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8049E40135
 for <buildroot@buildroot.org>; Sat,  9 Mar 2024 23:44:34 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-412f1961101so26183935e9.0
 for <buildroot@buildroot.org>; Sat, 09 Mar 2024 15:44:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710027872; x=1710632672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Oid9jc3+40qbeYjYjoUCNTnbyXFDEL1yQJdj8kMX3Is=;
 b=DN3p4X5wOJna3WspA/OfVQmQW/m6NKNl76+Sa/yi+8r1cVmPIYWq9pJCUiJYLHz9GE
 fmBJnUQem8F7GlmMAEGCAVIgNNAaru0TCWqeui4N6nHxnbOjvmpN7BCzdNl6UdeOzcJ9
 71eHIzG0a32UQi/M/csEdOm5BLG1XS2MGmKVh8F/DEPyKqyASH3VYLRzN253DV4cMLyx
 iQuFT1Ou9pMbr+bOBwX7K39gkw8/M2yapPMdibYzSz9OOtIqkjcpm+AlV//Vb8SjJwOF
 pi1MGLnh0e7FJxlENNHtyOZMVVwOeTeUH2kZj1zisXKgX5d4K0/RoTK4nOCxpzaxoRg8
 Uq/w==
X-Gm-Message-State: AOJu0YwFqymm9xM1yxjOmVru01GEq2vkJDiiqZkmgBpz3zam+lODVZDE
 KAw5xTcckxExmHVmj2oRaVSxmbCnbns2yTeFarJPBMkpS7ZsaGmezcq8fm57
X-Google-Smtp-Source: AGHT+IHzvMTe7QEi5KBCls54r2CVU9N65/qiZ80RDmBOchMjST6fWb3OmkrJav8OE9XXUQZVbyJK+Q==
X-Received: by 2002:a05:600c:4591:b0:413:1e07:9dad with SMTP id
 r17-20020a05600c459100b004131e079dadmr2503830wmo.1.1710027872487; 
 Sat, 09 Mar 2024 15:44:32 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 fc19-20020a05600c525300b0041312855081sm4005123wmb.5.2024.03.09.15.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Mar 2024 15:44:32 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 10 Mar 2024 00:44:29 +0100
Message-ID: <7c4ef882367896d7d522301f04c742bc26df47aa.1710027863.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1710027863.git.yann.morin.1998@free.fr>
References: <cover.1710027863.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710027872; x=1710632672; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oid9jc3+40qbeYjYjoUCNTnbyXFDEL1yQJdj8kMX3Is=;
 b=TmQCtQVQoYQqYAkI69amGsal3WAWOCtAglaXk99ZWZzMV5Wh9BXpQNPBQL1c31lfqr
 61YSzL/y9y86jAnkucOfIM55YW4/mAcj1moDOHKtK+uPs9N34/MJpb1vIZjop0t2THe+
 pLNDUnx2UH4xOHQypXbySti8+7EYHgWWweMtpTxr2lIsQbdAAC9aYYTFfSSocZrZNbP2
 LhOzCWsXLkPzISPJL1AX80PlWPyWhgY8iDN7Z4xyBSkpPeHkAvFR/FNflBnhgWfq8q+C
 USPFPoEIJFTR5iyL3g8kTEkSEuKbGq4/TH1k67Cx6MoD6BtAYublBxJFZzGUmnEdasew
 O+1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TmQCtQVQ
Subject: [Buildroot] [PATCH 5/5] support/download/check-hash: accept hash
 files without terminating \n
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, masonwardle@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Lots of people are using broken text editors that 1. do not naturally
terminate text files with a final \n as is customary in UNIX text files,
and 2. do not respect our .editorconfig settings, which explicitly
require adding that final newline. See this nice summary of what a text
file is (with references to applicable standards):

    https://stackoverflow.com/questions/12916352/shell-script-read-missing-last-line/12916758#12916758

So, it is not surprising that read does not read the last "line" of a
file, when said "line" does not end with a newline, because it is thus
not really a line.

Even though we do mandate actual text files, let's be a little bit lax
in this respect, because people may write packages, and their hash
files, in a br2-external tree, and they may not have our .editorconfig
in the directory heierarchy (e.g. if buildroot is a submodule of their
br2-external tree, or whatever).

mapfile does not suffer from this limitation, though, and correctly
reads all lines from a file, even the final line-that-is-not-a-line.

mapfile was introduced in bash 4.0, released on 2009-01-20, more than
15 years ago. Debian squeeze, released in 2011 already had bash 4.1.
Those are really ancient. So, it means we can indeed expect bash
version 4.0 or later; which means mapfile is available.

"It should be fine!"

Fixes: #15976

Reported-by: masonwardle@gmail.com
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/download/check-hash | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/support/download/check-hash b/support/download/check-hash
index 9db647885a..d18ec8b134 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -78,8 +78,10 @@ nb_checks=0
 for h_file in "${h_files[@]}"; do
     [ -f "${h_file}" ] || continue
     : $((nb_h_files++))
-    # shellcheck disable=SC2094  # we're really reading it only once
-    while read -r t h f; do
+    # mapfile reads all lines, even the last one if it is missing a \n
+    mapfile -t hash_lines <"${h_file}"
+    for hash_line in "${hash_lines[@]}"; do
+        read -r t h f <<<"${hash_line}"
         case "${t}" in
             ''|'#'*)
                 # Skip comments and empty lines
@@ -87,13 +89,12 @@ for h_file in "${h_files[@]}"; do
                 ;;
             *)
                 if [ "${f}" = "${base}" ]; then
-                    # shellcheck disable=SC2094  # we're only printing the h_file filename
                     check_one_hash "${t}" "${h}" "${file}" "${h_file}"
                     : $((nb_checks++))
                 fi
                 ;;
         esac
-    done <"${h_file}"
+    done
 done
 
 # shellcheck disable=SC2086  # nb_h_files is a non-empty int
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
