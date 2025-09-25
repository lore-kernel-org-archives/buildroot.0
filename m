Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC16CAC5B0
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0637261513;
	Thu, 25 Sep 2025 20:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1mVnmJPDIFkE; Thu, 25 Sep 2025 20:06:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F5806151F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F5806151F;
	Thu, 25 Sep 2025 20:06:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 92D72177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8446A61516
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:06:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xdXXwPu7mVdt for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:06:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.52;
 helo=mail-ed1-f52.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A194B61513
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A194B61513
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A194B61513
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:06:18 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-634b6f67742so230714a12.3
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:06:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758830776; x=1759435576;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yBMu5/WB41Z6xp7K37mMeIIV+1AqCcGNul/an7BQuHM=;
 b=aenCQ2xmzUncuK5YYM5H/zprUQ0BSJYjiZR/5Zo/fkQOcYdSQvQ4ODc3VV1KZoeuyu
 u8Cl31wk3iZLNjarJsgUrms42+TaI/9iKmc1fmI1e83BTaxTQdfDPmwXTCFuRs8hnv4+
 UjiL8Sn7ysPHZn4e1ZOJBo8975WrZ5qxomUQKn9oFqKy5uTIShbA5w8sfaDrlPA1FTxh
 4k4LDY8wHQGzQLKuytFczloxkAx2W7mu2CDdGOV+VVDJw0X423NoTAtR/ZjqpQRL858F
 JFOgmaX8MP7XHddHg7skPTrc7mYp2KXHPrwxjSZwk8dhQxkDbL7cQtlDN6nbBMN3ptpM
 9lWQ==
X-Gm-Message-State: AOJu0Yw6kZdmB2t7nH0K1M//VvD4T1EgTT9B0egF16l6IY+LVkbM/xbR
 4u94iXxdqwUwb+nQFMB6oSMq9u797x5lC+xsJhH1snKuCHPUq6lb35eVpOtW1gsQcDY=
X-Gm-Gg: ASbGncsGjStMFlhjoeu1N8bNJ+S27RLd3TgUdVm49rtMdCXE0ErCwYdKL+SAs+mLgyi
 St28cYLHFdEXMQV02g6LMGO2rjjeqPJzQC87bBh9UxhwHZZHAvxFjGzvKP/Mm3PjuXIyfaOt4HX
 6TWKVkWxgpPD+m2mR8onzTVuXOQQ+KuxWJ7lkCdL1YAUooITvdpjBDAdfRd9nvLXwSFoOg2YglV
 YY+V9w/vyApI7DZ963lBdv1xZxANBBkoYuWqXfgCNP6kecxiT76fvGTiKKDwUIXe3drEa4Owzrm
 chd6/UnKsR+oO98iAELmSIOG78mkLc4O/MquERB1P0VXAvBuSLz8W66hktImNZr22uDflFmc/JB
 q7TC6z4JS4Uc/8+HKgc2JC4PF1IIpz/hah7lfkX064j/3pwmxii4RRLeKkc0BMkLCl0AcUNNIMf
 E1SbDe6ANIsbZ60ujRBy0HAsF+A1oGlvSbbto=
X-Google-Smtp-Source: AGHT+IHVoCKHJ30ca2cv01mvh5VPbMCVBgU5B78C5SjC3tw6QbHuXkqAiHIxHuKzYdz5VYHcdUl/5g==
X-Received: by 2002:a17:907:9719:b0:af9:414d:9c2 with SMTP id
 a640c23a62f3a-b34ba04f77amr492702966b.3.1758830776021; 
 Thu, 25 Sep 2025 13:06:16 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb6f:7900:e15d:6e8b:7a28:901f])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b35446f7806sm234272166b.70.2025.09.25.13.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:06:15 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Guillaume Chaye <guillaume.chaye@zeetim.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Thu, 25 Sep 2025 22:06:09 +0200
Message-ID: <20250925200611.206010-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v3 1/3] package/pkg-cargo: add support to bundle
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
