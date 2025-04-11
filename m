Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2FBC3601E
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 02:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A38E60721;
	Fri, 11 Apr 2025 02:35:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kol-Q_8VFnOV; Fri, 11 Apr 2025 02:35:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 949346072A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 949346072A;
	Fri, 11 Apr 2025 02:35:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A9BE6138
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 02:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6C004094F
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 02:35:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lXvSs-fEtE92 for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 02:35:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A14D40C1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A14D40C1D
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A14D40C1D
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 02:35:33 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-ad51f427054so1155664a12.1
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 19:35:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744338933; x=1744943733;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PzQOoXt9HsRILhvjZ+8mC5jPkHuZsTuT98Saj6Nse7E=;
 b=F+viHMv2vkIhZW1djd4bBR/eAFLfRIExAH54YlFMRkACYUDiGriBRo+W6RtTBmsL3X
 V+eGLE7D8BtMWbAAX1bvMoYNVsouD1CpCGjn4oKZ2SOUdnE+rJDfaPOfMh74U1Oz43lo
 +GhfWZKMVuNFOBFfenUqjaqTp09GWiVjF1dZb5a5D6AjfRIik7EZXeHNrzv2h66DtFEH
 KcbBne0sIyspmG2Y+XORvJFXJ600gQbb8kOe6cVLd47l1QjWkaqN4YJY6MzuSncqWuPg
 gJaPhQ6CU3WK/fwx3WF+DhI2pKANhyijUlx1qEhP8JHDowsjhwQHnmlc9fs5wJmXX5zo
 BKQw==
X-Gm-Message-State: AOJu0YzEdvnH79YHxQR7I0+q8jo5m7gLwcUrhnsHaimHDvBsSowT6frS
 JoA0eKF9P64IWsvAc93/PUuWrFzzsE5dGWwuGYc7YBRYLVT0h+gyiDbqFO/9bTU=
X-Gm-Gg: ASbGncsChaeIx9jb2aMBy1h9SuNNghRmglnQwiQ9xLyvNAu6UqDucSJKffIE63Z0feh
 ZGKfLPHO9QwStnZr8EtEVMzbQJPntcaVnPzyXgN6QbQSuwaftpZlsBa6kEkrWBrBWveXW6dZP2X
 i0Bap0I49yun2xqvbH/v1FoVFP7ryDTilypsIVjrCeqwGHHOhShJ3Trkw0FkcUoML5SDuwsc7VF
 nmva1b2JqvnOc/qAfIZ2x4cixXsJNHSFxsm11iCUevOTnpy8A1FTa+mgQUz4RBAPZxm8SAgU4vL
 8VVpsxJ0ih1HtsSeZKJXotpybpUkl7aqZ5fkz+lqLGr7y9fTTUK6rP57
X-Google-Smtp-Source: AGHT+IHRe8SA0qaNwkJBRYiLwd3ywxbnSuj4jotCZ8xk2hNHbCdGVonmcglxrQ3NyEqhOCmqUnjzPQ==
X-Received: by 2002:a17:90b:3806:b0:2ee:e113:815d with SMTP id
 98e67ed59e1d1-30823662bf6mr1979163a91.8.1744338933350; 
 Thu, 10 Apr 2025 19:35:33 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-308218fecf2sm900117a91.7.2025.04.10.19.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 19:35:32 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 10 Apr 2025 19:35:18 -0700
MIME-Version: 1.0
Message-Id: <20250410-improve_merge_config-v1-1-13805f34defd@rivosinc.com>
References: <20250410-improve_merge_config-v1-0-13805f34defd@rivosinc.com>
In-Reply-To: <20250410-improve_merge_config-v1-0-13805f34defd@rivosinc.com>
To: buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1607; i=charlie@rivosinc.com; 
 h=from:subject:message-id;
 bh=r40KIEG29vKO1cCpWbxZXsttja7Dk7zNcfDIH3SnYVI=; 
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qP+k/f98jsTMxZcfnzrNYniy6HRjV18kU3BacdFXZP2
 WzEeoijo5SFQYyLQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgIlcYGX4X3H03/HlNpbTkl0/
 7dKbKyxcxPjzBM/cJ/cfeLrPDrzzZQrD/9QH/dxWQRLVJu8v/7x6pklGp2qHz/z/JgkrjbbIsbH
 8YAAA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744338933; x=1744943733;
 darn=buildroot.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PzQOoXt9HsRILhvjZ+8mC5jPkHuZsTuT98Saj6Nse7E=;
 b=FO406uSvoI8U6sYbW+vjcfHamb3auprNG4+2O3ypCs7vG0tTVH17pSFjdgsTUCBVrP
 Jk72m/G9Lut5ASq/6UZqAKbi+yEKLmyiVsmvKaSxpEwjh8Wx2AMJlSVZLqmcvM2bqBYJ
 Nq/hInQEYHCS89mkfUAGa0qMEuXI7LofXSTLYGNENRhZZBjamemneUcTb8X7fCH2q4Me
 mE+GeEWD4gtGPhX95CW9Xnv1QXBd8r9NmpnT2QlDEwKAcg6ull0DrbK7T9STgRDglQR6
 zbfhCzTvxu7UaHUULUwu74RCL85xR/Np5vpO9se53O4P4Dknre3TJaQRn+OEoHsA+rPm
 h8Mw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=FO406uSv
Subject: [Buildroot] [PATCH 1/3] support/kconfig: Support running
 merge_config.sh from a different directory
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

Use the "-C" option to cd into a directory before merging, similar to
the "-C" option to make.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 support/kconfig/merge_config.sh | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/support/kconfig/merge_config.sh b/support/kconfig/merge_config.sh
index 14917806a391a386240b41f585baa68ca3bd99bc..daaa055b70dbe790578148255b490b6010815c30 100755
--- a/support/kconfig/merge_config.sh
+++ b/support/kconfig/merge_config.sh
@@ -34,6 +34,7 @@ usage() {
 	echo "  -r    list redundant entries when merging fragments"
 	echo "  -O    dir to put generated output files.  Consider setting \$KCONFIG_CONFIG instead."
 	echo "  -e    colon-separated list of br2-external trees to use (optional)"
+	echo "  -C    change to directory before doing anything else"
 	echo
 	echo "Used prefix: '$CONFIG_PREFIX'. You can redefine it with \$CONFIG_
 	environment variable."
@@ -81,6 +82,11 @@ while true; do
 		shift 2
 		continue
 		;;
+	"-C")
+		BASE_DIRECTORY=$2
+		shift 2
+		continue
+		;;
 	*)
 		break
 		;;
@@ -92,6 +98,12 @@ if [ "$#" -lt 1 ] ; then
 	exit
 fi
 
+ORIGINAL_DIR=$PWD
+
+if [ ! -z "$BASE_DIRECTORY" ]; then
+	cd "$BASE_DIRECTORY" || exit
+fi
+
 if [ -z "$KCONFIG_CONFIG" ]; then
 	if [ "$OUTPUT" != . ]; then
 		KCONFIG_CONFIG=$(readlink -m -- "$OUTPUT/.config")
@@ -179,4 +191,8 @@ for CFG in $(sed -n -e "$SED_CONFIG_EXP1" -e "$SED_CONFIG_EXP2" $TMP_FILE); do
 	fi
 done
 
+if [ -z "$BASE_DIRECTORY" ]; then
+	cd "$ORIGINAL_DIR" || clean_up
+fi
+
 clean_up

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
