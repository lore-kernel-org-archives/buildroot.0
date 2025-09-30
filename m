Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45DDCAC5B8
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 08:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AE2960E72;
	Tue, 30 Sep 2025 08:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dgbj-iI69Roi; Tue, 30 Sep 2025 08:07:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F5AA605C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F5AA605C8;
	Tue, 30 Sep 2025 08:07:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C105B30
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 08:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB530409E8
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 08:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1b-2LPIze45 for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 08:07:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.54;
 helo=mail-wr1-f54.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7E3EB40876
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E3EB40876
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E3EB40876
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 08:07:56 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3f99ac9acc4so665558f8f.3
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 01:07:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759219674; x=1759824474;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U2yn0q/ANont9w0aNGpzHDpoAWiHpg0LrOFE4Devg7E=;
 b=c0Bk+gl7p1EOSjduDvn+mUROXzwu71OxZzelTxoFzRCxvDUgV12aEaqw+e+OEUKnxv
 nSUqNVLzhziGSDWwEsZoP8pT8gb6NxVBbkjr4+PCVTkNTfIPZpCxCvOFopFR9lpYV0Kp
 bubN/Tu5l1+6G3BsoI+B8FFinSXpmXBKiShzeMRIYwOGU1aBk+HDi+5dIInR4EJ5XeDF
 Z/XnBe2+cWiv10ffNm9hkHldNXCXt9qMNNT3PWSUsk9EOvQRR9t+Es7+/KnxOV8bF5YT
 odxIu3/0rzye47vifLs4P7wLChHIvTA3IcApsR3LOOyHocF1hlZ5/ijwzau0Dzji19nE
 R6KA==
X-Gm-Message-State: AOJu0YwWmkL3VJL5zOPy3mEPurAjQhkJzICme24rCw3rCFbwOD8y6LG9
 xTTa3y3b9t95m3sRw9DTOM9dhRdL0f/YLChVL8gO3ysCBjb1iQPPI/UTYvajSYuirs0=
X-Gm-Gg: ASbGncu0kGi1uMXBMr8fV3QMCqqKneRGCm9Ar5ULJ4bgsPuOK1rD9IdhpiHFZjC/JcB
 kWOL/CnQHravuDHC6rhk4vSx5xAvqWv8fh3jNr075N+cLa8H+eEAq3Uyk1Q+k30lYo3PsUHPV8T
 Xp2GRSjfos7EahU4tyIlCR7MokHylA+xxmOlZUAQ1BXZE42DHnhEqHyQNzsYjqeBokbu0oGXdy5
 2cnsxqaHjrKuDfgHR4QW97aNUsAIPREE2a2FqGsdjNBMZg7UG/QX8pH3jsspauUHyd4Pyr1zM/4
 Cv9qlcX3qNwZOA0ZQPO0pnqUfTIPSpkkayTmWlw4z3VDuDZUdh+bmEyTn2CdcWbKZEqcLD3wuI0
 Ar95PXBRMxa62byPTsuHicx/5LA+Bt2xcckWkL9jU0Me2WG+NA4FwNvQGjyUMEqroERRqkKWDSi
 mgO2lKlDH0pTJd78twnNTIF1c4Llc6IlxxVXn5H7FVDEJnHIz6yUBJE8v/TQBP9sabIsBL7UhAc
 p5D41u8PQ==
X-Google-Smtp-Source: AGHT+IHyZ5np+uGCJNMcWTT12fNmG8poLfGuwfGv831j/ktxNXM6jDcFmBs3LjsHIvhriafJH/1kiQ==
X-Received: by 2002:a05:6000:615:b0:3f1:2d30:cb5c with SMTP id
 ffacd0b85a97d-40e451f8c69mr18158479f8f.23.1759219673839; 
 Tue, 30 Sep 2025 01:07:53 -0700 (PDT)
Received: from KORLIN44614.barco.com (d528f5fde.static.telenet.be.
 [82.143.95.222]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-40fc5602f15sm21558362f8f.39.2025.09.30.01.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 01:07:53 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Guillaume Chaye <guillaume.chaye@zeetim.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Tue, 30 Sep 2025 10:07:48 +0200
Message-ID: <20250930080750.353542-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v5 1/3] package/pkg-cargo: add support to bundle
 a custom Cargo.lock file
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

E.g. https://github.com/lu-zero/cargo-c/releases/tag/v0.10.15

Cargo-c releases a separate Cargo.lock file, but doesn't bundle
one in its normal .tar.gz code source target.

We can't use extra downloads/patches/... as cargo is a vendored
package, which is done quite early in the chain.

This patch allows us to define a custom Cargo.lock source.
Both a local bundled file and remote (only wget) file can be linked.

Usage:

<PKG>_CARGO_LOCK_FILE = <PKG>_PKGDIR/Cargo.lock

<PKG>_CARGO_LOCK_FILE = https://.../Cargo.lock

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
Superseeds https://patchwork.ozlabs.org/project/buildroot/patch/20250324173246.100112-1-guillaume.chaye@zeetim.com/.
v2: no change
v3: no change
v4: no change
v4: no change
---
 package/pkg-cargo.mk                |  5 +++++
 support/download/cargo-post-process | 14 +++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 47a6353f25..626e5ea472 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -195,6 +195,11 @@ ifneq ($$($(2)_SUBDIR),)
 $(2)_DOWNLOAD_POST_PROCESS_OPTS += -m$$($(2)_SUBDIR)/Cargo.toml
 endif
 
+# Allow to download a custom Cargo.lock file.
+ifneq ($$($(3)_CARGO_LOCK_FILE),)
+$(2)_DOWNLOAD_POST_PROCESS_OPTS += -l$$($(3)_CARGO_LOCK_FILE)
+endif
+
 # Because we append vendored info, we can't rely on the values being empty
 # once we eventually get into the generic-package infra. So, we duplicate
 # the heuristics here
diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
index b0e59ad74d..7913724fe2 100755
--- a/support/download/cargo-post-process
+++ b/support/download/cargo-post-process
@@ -11,11 +11,12 @@ if [ "${BR_CARGO_MANIFEST_PATH}" ]; then
 fi
 
 manifest=Cargo.toml
-while getopts "n:o:m:" OPT; do
+while getopts "n:o:m:l:" OPT; do
     case "${OPT}" in
     o)  output="${OPTARG}";;
     n)  base_name="${OPTARG}";;
     m)  manifest="${OPTARG}";;
+    l)  lockfile="${OPTARG}";;
     :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
     \?) error "unknown option '%s'\n" "${OPTARG}";;
     esac
@@ -31,6 +32,17 @@ post_process_unpack "${base_name}" "${output}"
 # Do the Cargo vendoring
 pushd "${base_name}" > /dev/null
 
+# Copy the custom lockfile path if given
+# TODO: use --lockfile-path once stable
+if [ -n "${lockfile}" ] ; then
+    rm -f "${lockfile}"
+    if [ -f "${lockfile}" ] ; then
+        cp "${lockfile}" Cargo.lock
+    else
+        ${WGET} "${lockfile}" -O Cargo.lock
+    fi
+fi
+
 # Create the local .cargo/config.toml with vendor info
 mkdir -p .cargo/
 mkdir -p "${CARGO_HOME}"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
