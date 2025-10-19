Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05BBCCD184
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 06:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BDB961088;
	Sun, 19 Oct 2025 06:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7jNXyCEfjBD1; Sun, 19 Oct 2025 06:45:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 884FF61089
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 884FF61089;
	Sun, 19 Oct 2025 06:45:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D1A5543F
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 06:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B53BE40988
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 06:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dieupz9hSg40 for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 06:45:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.51;
 helo=mail-ej1-f51.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A98B14097F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A98B14097F
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A98B14097F
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 06:45:11 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-b3d5088259eso499221166b.1
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 23:45:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760856309; x=1761461109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v3HQVEmRXn+wlBROFgwXsjob+7ppL//KmEllbkB5lUM=;
 b=VP2r5imLYVqgGDATwSDosaLZhW1LoDwuWLW+rC3QNNMgNWbgBUtvhYlzD1ESVqUhNG
 C0IOuyqMqmL7iDA8aYKkNa2ib9nyQNX/n3MZCa/hM2bZ+/JjnPAnW5aos3C1e0ChPP8A
 VTj5ZFqadmiD5+GOh8rIibfRjdB6fcC7a31vPXqRzo/EfLwJvXTUcvLeDVeZsEkvaWDE
 BinH1237eNTo0sqzVvS4t+xelZb4DurPFQXpzcwWAJW+YwmdvM0zF+Dzsaql7sVDnugE
 FrPC7gBpGPHorBbgTskif5d164MVFcoZ0LsLS3J++lrAlKM1qQA3Kx0hWq2AX4HnzJZa
 QdOg==
X-Gm-Message-State: AOJu0YwUNDDhLZ1zfNw1XlTQWPCCliK1iRWfZzonToKoOLAmf+v9IuDH
 hZGaV4sK0ZzNA/mEfskW0kM6o0CqC1355lANK7prWY9b/L2vmbiacCp1
X-Gm-Gg: ASbGncuLI3Z8WOT1gLHRidGCDRGSZbIONY+5MiYdKQt28uAnjBzI7rIPjgip7pEsL04
 wdZfvtVD/gyd2Qmlw+SJ+hn4iOVEzTVWXd70wIgLyYYiPjLOlbjrZthzK4cWK37AVqvwrwK/SS4
 StwR0ST+90SEDd2J5Ur+69fYpgf9C4SE5b5/5W7dnw+cNy2HncUN+qoeGgw29IeuxgNAgRTg4Sk
 GhkZFMMWeCnaZp3j12XTrmk9L9CA83gbuaQ844Es7IH02G2fGZ0+iRQh2o8oQwe8+JNvKjfW3De
 umXZyZrq/MpotEdf2PceToRgRKImslwfzuewx690q1j5NQ9SH62T1REMQpJHbFIF0Xh2U+/Q/UK
 eEEnF2YbbDyzcsmqq9rMkYEWRIXvY59XSOwdxSfJjsA54VeDDaIMqQDX+945X3epTyvWLIXoppo
 2txZNakyoE28rmW+ayutwACzb1nEHUIPoa7Qwfkj6i5vCkV27OWNs65DV7H9O3IKMuqejACg==
X-Google-Smtp-Source: AGHT+IHuvA0OPayHQTAoL3WvgrBPUFH2xlQaymtfquEQcGvoSgI5AjltkRMZJE6kaxxauJXe0hMueA==
X-Received: by 2002:a17:907:3d87:b0:b3f:b7ca:26c5 with SMTP id
 a640c23a62f3a-b647570a3d9mr1005730166b.59.1760856309114; 
 Sat, 18 Oct 2025 23:45:09 -0700 (PDT)
Received: from KORLIN44614.home ([2a02:a03f:eb6f:7900:c79:d46a:26fa:5c6e])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b65eb525f48sm434706466b.60.2025.10.18.23.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Oct 2025 23:45:08 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: thomas@devoogdt.com
Cc: buildroot@buildroot.org, eric.le.bihan.dev@free.fr,
 fontaine.fabrice@gmail.com, guillaume.chaye@zeetim.com
Date: Sun, 19 Oct 2025 08:45:01 +0200
Message-ID: <20251019064503.2583945-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACXRmJitiNM=oBYeGc2C40vP=wRYaaYJjiGMN7siwTWJ=vWPwQ@mail.gmail.com>
References: <CACXRmJitiNM=oBYeGc2C40vP=wRYaaYJjiGMN7siwTWJ=vWPwQ@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v6 1/3] package/pkg-cargo: add support to bundle
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
Superseeds https://patchwork.ozlabs.org/project/buildroot/patch/20250324173246.100112-1-guillaume.chaye@zeetim.com/.
v2: no change
v3: no change
v4: no change
v5: no change
v6: fixed 'rm -f Cargo.lock'
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
index b0e59ad74d..f7e0d8b73b 100755
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
+    rm -f Cargo.lock
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
