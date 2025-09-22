Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A344CAC5A7
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 07:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F23988451D;
	Mon, 22 Sep 2025 07:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AdXmQaUlyZHZ; Mon, 22 Sep 2025 07:13:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24BD784517
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24BD784517;
	Mon, 22 Sep 2025 07:13:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 41671E7
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 07:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 272D48451A
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 07:13:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S1lAl4amuzc0 for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 07:13:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.47;
 helo=mail-wr1-f47.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ECFFC83265
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECFFC83265
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECFFC83265
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 07:13:51 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3ece1102998so2477292f8f.2
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 00:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758525230; x=1759130030;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L6lBtsNIrk/NxOMPfORrG1UBnoMpieawTy2oPXcFOBA=;
 b=thFQXvItzSe5HawgKmpXZf/xulXdV3ixsIVh50UyC6M9ilBcuDvRUW4ZBK3pLqppnQ
 JPUBvH0CcP9D3E3+ldIB6rCuMt7xDLJQrvZ4A/eiHeNxAd6PV61GOZmUkvDxQU4UlkS1
 Nf2/mvL4bJYprO5cZ04y3n1vWcIt48L4F95ozXbEpNAxL0y5aZfw1QMbYGFidDhsUqnL
 khyB+C45KnKmZ6CCyLB6ouzORbrU7a1UQaKZ1BqUJVHDo6E/1Tcb+FlvEprObcQgsqOi
 p765Fmf00cYjQrUB1XLVgm+6X0UZoH60o7/ELGe7j9s03HjREa5odqd7fSpAbznw0p1q
 ssHA==
X-Gm-Message-State: AOJu0YxVMdKOaZ01Oxu4ASLrxaFRJ19wVJlRbMjV1x6QgJLXEAef1DZ3
 FOWtFAOZWR1avE0cJouIgyURBlB/ZYUH0tDcKhDAy/fvR8e1m7Gb/gZzNH7zE7wU
X-Gm-Gg: ASbGnct7Kw/X2YbaKGL2KlCnXQlC5W0e3pEXNmwUYjuuZYGH9Nn1sExlIN72NiVlG+P
 HyxFQo0jLlbSQHhUy40dtcR/sqc0Gl47bxPuKfMw2Ck4UV6rgdDQkfGLR28CZJrgnaf+ACqgIge
 tNmkUT0YM0BdDqacZAtlkFtjvgjdMdpk5x+iWj/1IK2g6MuxE7jIy+8EyeB8uho4EKDh7REAcL2
 egYZNdJRkyXFF/TSQIhWJHOF3mZrpw3Nmmsc3dg8Uu283j2RmTuQATnusIJM2Dj7WV4cvVZJOK/
 wWXwR+hoKCfe3T0FDbz3i+K6phB93D3Eqc/Md4djD8F2R9cjlgxT2LcVcq+k2Y8u6IYug9/CREa
 hIXLNZ+JdAuD6Fkn9sT+WBa3lotmjRgyki1+Ogx5oT3bhYkK0AhlF6S7cc2THNJi7HZIqE8eouK
 w8P3bS/jp0IpzBimqXVoI/aP2u1meQzvOHSaMJ3i08Fppr13ZrcmukCxBucw==
X-Google-Smtp-Source: AGHT+IE5UHGAfBoWYzJKCdoDBFeA59D0IJGpUC5MZI3NuoPqIiIWtDY89tF0ehPPKrSYyIIQcltL+g==
X-Received: by 2002:a5d:5f82:0:b0:3fe:709b:9d83 with SMTP id
 ffacd0b85a97d-3fe709ba193mr1513274f8f.13.1758525229304; 
 Mon, 22 Sep 2025 00:13:49 -0700 (PDT)
Received: from KORLIN44614.barco.com (d528f5fde.static.telenet.be.
 [82.143.95.222]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3ee073f3d8csm17746771f8f.9.2025.09.22.00.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 00:13:48 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Guillaume Chaye <guillaume.chaye@zeetim.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Mon, 22 Sep 2025 09:13:42 +0200
Message-ID: <20250922071344.3864120-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1 1/3] package/pkg-cargo: add support to bundle
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
