Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1A9CAC5AC
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 06:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E65B610E5;
	Fri, 26 Sep 2025 06:03:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Dz7MB91uDep; Fri, 26 Sep 2025 06:03:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29575613F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29575613F3;
	Fri, 26 Sep 2025 06:03:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B4B17198
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 06:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93C52418D8
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 06:03:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FnQWMmkFCiI6 for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 06:03:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.53;
 helo=mail-ej1-f53.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 95A5B418E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95A5B418E8
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95A5B418E8
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 06:03:08 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b2ef8e00becso361654166b.0
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 23:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758866586; x=1759471386;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dWhocvSxV01V2LyUsfE7aKcgwk3w7LBBxh+u4ICJozo=;
 b=XvfcAFPd5ousCtSbeHerzGMpDBQiVopKhqY01Z2WDzFkZlJOD0zUZj5cdeLcNRQlq2
 FOPcm7WLlUw0e+VD6ec8s9KdqbSJ0PAZ9UjqnZnuducHrAgK7gFZc4UUsNdcrD/38tvK
 XxRi3rbKKSpvVy56H0lhVrPl7nxX1+TqjwzEWbo82b0CH2enh0CWe7NRnBE0hNbRItfx
 L2zARfKC2mc9IBbedcIh2uxxAVCf6vRgG8v62VpEbcWZspOvgLUxqjTRfGwfOSh9G0qf
 9/jqKYAQFJhEC/2l2YwbP8vRTh3w9gzh5yaTKJm94735l1MsUu6F6yPhys2zlWieu7ev
 6JGg==
X-Gm-Message-State: AOJu0Yw1F7McKF/pUfyPgw1lCjmRNxGNH3MxqCz+ioiay2AFy8LMRTNO
 uKjKYtyMfePdRSnsuQoN2ESHCxPgcfZUwRcD3a+wi5ZpStAlZwQnQPVh296e0jSy
X-Gm-Gg: ASbGncuJtt9k5uDe77zx/Jlobc72ZHFtKs+deJsikVzP1+ZHVBiOGpQ1cVhAGxl37/m
 Zb5VMF+FHKUwiePwsoop+MkHI8DRu9T0TcERdOeO6hkdl6W3x/GDoRujcR4OkLA8aCfy/p6z8OK
 +YGXYpe7hxoqg3RuFT9tqV6TEvv5yw/I7pk6uU53CI9XUQ9NjNaUmyuXMV3jBQqpZsglUcFuzdK
 ya82WDYmG3NjId0QZGcFQ8+gG+G3fl5Ag9xyyXdEuCs4nQ3WHKZ7vdzRsEbcqhzRLsDTke3rTC4
 gIIDUeRtrCiYT0WTh0N0DVU6t1EqTDXIqpdWkQgNrQtHswT92XqICGZtuiS4Gez2BRe5mYJdTVX
 vaU7/N1EA0pYLIfZ5A/Hwa9peh/AAzsyvUjBMR64XH3JsQvgyMV6loJ4lJdp2kMIE4qa+7yhWAS
 AprfxfopxOpwfbERWXmg==
X-Google-Smtp-Source: AGHT+IGkxsC7cmBIhYWmW0yHvrNb8dAjEKywR9QiYsZn6pZubAnT9d0gnUbxR5rrDdt4Qo+gvs2wig==
X-Received: by 2002:a17:907:2d29:b0:b2b:8700:77d with SMTP id
 a640c23a62f3a-b34bef98f86mr645088866b.54.1758866586024; 
 Thu, 25 Sep 2025 23:03:06 -0700 (PDT)
Received: from KORLIN44614.home ([2a02:a03f:eb6f:7900:3020:9fd6:5911:46c8])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b3545a9c3e1sm298650466b.105.2025.09.25.23.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 23:03:05 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Guillaume Chaye <guillaume.chaye@zeetim.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Fri, 26 Sep 2025 08:03:00 +0200
Message-ID: <20250926060303.259618-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v4 1/3] package/pkg-cargo: add support to bundle
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
