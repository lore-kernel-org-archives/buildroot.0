Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFEFCAC5A5
	for <buildroot@archiver.kernel.org>; Wed, 24 Sep 2025 04:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78ADC60715;
	Wed, 24 Sep 2025 04:18:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7gHcClIICeR; Wed, 24 Sep 2025 04:18:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F04D60666
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F04D60666;
	Wed, 24 Sep 2025 04:18:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 566FE199
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 04:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3312881951
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 04:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IB0evqBh-tAf for <buildroot@buildroot.org>;
 Wed, 24 Sep 2025 04:18:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.53;
 helo=mail-ej1-f53.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E306B815CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E306B815CA
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E306B815CA
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 04:18:06 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b2ef8e00becso387225466b.0
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 21:18:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758687485; x=1759292285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3L3ni7eEZImEVNG3bcJinS0HvFzIqd7H4vFpy9NilEk=;
 b=U5r750elS4w28Z4F88xPtuq/iP3ax4ZVm9KoYpVg5RwqDeXN43tH6d1hwoQTMan3ug
 tn98FcH4GE+lrmDEOew+V0l+6wYp7MI1iplwsiv7jurPNi88prSSWKWPWrZociNumzhH
 vnhnFOE5GlRvgDepRSJovDr/CEDE9DJ7oqiWlkKqabI0mguPrXC4tDqLA5q/5ATXowNO
 7IE6ePVBuDS+UfOmaVtvr+TNkuiUQ8Hds81NMuzbBk0wx2OfG8ub+9zg848jPp6uf+NP
 n2oBdMyrRTVtT+A4aoowX3ozc0mSF5r66nUkyZTnD4aAOqlOg44EHwkVBXCVH5VZo4yT
 pJ5Q==
X-Gm-Message-State: AOJu0Yy1l42Gtk82nhWoIJImZwdp9F/6Er14ZhFaL/giDsK9RKeu0D3S
 tLvf5oBapNf4KUTqoQrQ0Z19GCncCd5HXp92RzCAGsPiu/Pfz0yVSn6qyWeSFy5DGtg=
X-Gm-Gg: ASbGncu255pus9nYRHnuwFiM2Sas7HZiPHGd79TxMgP78HjRlGdKi89fTEEJQ3AvKF6
 IlcjLXOg+ZI3RLXeFhKtRuTZuBKuvKnXAs07Q8ItV56DipuB0JQBiKlbrubS6uFpQ+7F4UUYw8F
 Upr6Fcq2+OZ7SqsqQ8KBYONHYD2rVtwNoOe88xmLckFHRxWkdvm3stLlfh4E+YTNbD8ZVvW2lKp
 lB3FMH6RAEL2wOiPGuEbozlVyeTRNn1vQvsb68RDA4WYOzlBl4Yin8iHHJY4Ps9CWn7fKaYIVyf
 IT0beedwxE5imJULHVRklQbv60ZfekcPfZ/mtzeKlSxFF6qwq4KRueLk3sF2UsjwS1sg8eu4BhO
 pQhpPIVN3Z04zhrhXt/tvc00tEqsfL0BrKT/x2Q7fIXyw6EzAfweXqeIhuh6jDVByth9RRIbMow
 PIvGVRz78mmc2TXilYofZ41ZXG
X-Google-Smtp-Source: AGHT+IHaY4a6ijqIH0DvYQ7PpsqOhS1oi2ITH0sbK1JKyT8k9+CLB5z+YDO7LIsAl1NwOITr8r3MIQ==
X-Received: by 2002:a17:907:6092:b0:b08:99e2:39f5 with SMTP id
 a640c23a62f3a-b302ae30088mr500469566b.38.1758687484458; 
 Tue, 23 Sep 2025 21:18:04 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb6f:7900:d339:b5c0:6675:22c9])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b2928cd31c0sm862023066b.104.2025.09.23.21.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 21:18:03 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Guillaume Chaye <guillaume.chaye@zeetim.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Wed, 24 Sep 2025 06:17:56 +0200
Message-ID: <20250924041759.2449210-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922071344.3864120-3-thomas@devoogdt.com>
References: <20250922071344.3864120-3-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v2 1/3] package/pkg-cargo: add support to bundle
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
