Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85680C25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 20:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54855842FB;
	Sun,  2 Jun 2024 20:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wvGShPbaLSiG; Sun,  2 Jun 2024 20:41:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DD1F84325
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DD1F84325;
	Sun,  2 Jun 2024 20:41:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 182EF1BF315
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0ADB833A0
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:40:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tpt1JaVskxYN for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 20:40:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8F361833CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F361833CD
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F361833CD
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 20:40:01 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-35dc04717a1so2786291f8f.2
 for <buildroot@buildroot.org>; Sun, 02 Jun 2024 13:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717360799; x=1717965599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=W+IymF96HVOs/rclAQOzA+pHWogBWRJf95eDyfDe/hw=;
 b=dZsVcTsq/J0tzkQcPqUcvYRx+4s9rOPbUYR2KSDQc3dlvSwKD1Ik5gm6uvlJm7TRoq
 rTopfftQqm/WZ4Il5Yjm26/pL7hmbYzFul3oPjxJS6I+LzDONq9GwGKuqiFjZ4/3PQw0
 ym6HNkoBSyoiHBwwTOOSgrt31FnyYfw+xbxBdzQbjzO1mj8VVOfItzwm254xInPDE3xw
 YdYrrRolRAEmUxAgVkd7zQLX9mHY2AZts96SjlRNKi26g87M4WGruhFFVtCx6ZTb2B1T
 jy2URxQHOfeZBuEgbC7CZUTVGfvix+lhc67xYNQtl1NX0+NcDbcL2x+VAwYplP9z7m3X
 FFdQ==
X-Gm-Message-State: AOJu0YyaXzeuy3xjnYkdRYIEoqNe8bgOFiF+9otxO294jG4XjlvUEsFi
 ZSTFCcnLuyOxFltYigabPB1mlLgjEZaVNXKRHAz6gO57WF4jCn2ZmCKiWA==
X-Google-Smtp-Source: AGHT+IGbvlGf49Q1OTQ1ioTjYVF2k9x9LrId7xRkNty/68lZzruzEhetgcugHm3OHrsy7vpNhditKQ==
X-Received: by 2002:adf:fdcb:0:b0:354:f536:31d1 with SMTP id
 ffacd0b85a97d-35e0f27098cmr5903755f8f.25.1717360798833; 
 Sun, 02 Jun 2024 13:39:58 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e0f97ba3csm6460862f8f.73.2024.06.02.13.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 13:39:58 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  2 Jun 2024 22:39:50 +0200
Message-ID: <1f9ee4bc875b559abde9a4746ab55fa4ca62dc85.1717360788.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717360788.git.yann.morin.1998@free.fr>
References: <cover.1717360788.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717360799; x=1717965599; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W+IymF96HVOs/rclAQOzA+pHWogBWRJf95eDyfDe/hw=;
 b=U0ldrg6RalD+oxUCgP/dD8FXmxe4W7mWmpKefGV6fIeVwhgM6sYl9pZMkwG98sd84U
 fRLyMmk9oZptdYYvvLym/7V2TJxxANP6Okq1qMJrtrtve/YWa50f4LPNQuA+0+naCzWf
 tW874g08hlVDc7Q9wESaQShEVHMjgu7WZxrZqSTvy2hEtq3qrt8gwz7BZGRWVYUHg7Zq
 Rao8e2Jv6yiwXTqxiooERtBH13K8FfSBU68P9UN7YhpgoJUBhE31GYd3PmQ1NLzTV7Df
 L6c7ypQF7NNLEdJzcv9jGnoJAmAt25RYLhz13Z007IuBvQM24dts3cLaHpfkFPCkq2Cz
 Qp4Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=U0ldrg6R
Subject: [Buildroot] [PATCH 14/16] package/pkg-cargo: add support for
 unlocked packages
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

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-cargo.adoc | 22 ++++++++++++++++++++++
 package/pkg-cargo.mk                   | 15 ++++++++++++++-
 support/download/cargo-post-process    | 25 ++++++++++++++++++++-----
 3 files changed, 56 insertions(+), 6 deletions(-)

diff --git a/docs/manual/adding-packages-cargo.adoc b/docs/manual/adding-packages-cargo.adoc
index 8a2292e7b6..0ed529a770 100644
--- a/docs/manual/adding-packages-cargo.adoc
+++ b/docs/manual/adding-packages-cargo.adoc
@@ -82,12 +82,17 @@ typical packages will therefore only use a few of them.
   environment of +cargo+ invocations. It used at both build and
   installation time
 
+* +FOO_CARGO_LOCKED+ can be set to +YES+ (the default) or +NO+, to
+  specify whether the source tree has been cargo-locked or not. See
+  below for xref:cargo-vendoring[more details].
+
 * +FOO_CARGO_BUILD_OPTS+ can be used to pass additional options to
   +cargo+ at build time.
 
 * +FOO_CARGO_INSTALL_OPTS+ can be used to pass additional options to
   +cargo+ at install time.
 
+[[cargo-vendoring]]
 A crate can depend on other libraries from crates.io or git
 repositories, listed in its +Cargo.toml+ file. Buildroot automatically
 takes care of downloading such dependencies as part of the download
@@ -95,3 +100,20 @@ step of packages that use the +cargo-package+ infrastructure. Such
 dependencies are then kept together with the package source code in
 the tarball cached in Buildroot's +DL_DIR+. This is referred to as
 _vendoring_. Vendoring allows for a completely off-line build.
+
+When a package source tree contains a +Cargo.lock+ file, the package has
+been _locked_: cargo did store the versions for the complete dependency
+chain in the +Cargo.lock+ file; that is then reused by cargo during the
+vendoring, which yields a reproducible dependency chain, and thus a
+reproducible tarball; therefore, it is possible to compute a hash for
+that archive. If a package was however not locked, then the versions for
+the dependencies are unknown, the dependency chain is not reproducible,
+and the archive is then not reproducible, which implies there can be no
+hash for that archive.
+
+Packages are normally locked, so Buildroot will by default instruct
+cargo to atttempt a locked vendoring; for a package that was not locked,
+this would fail; in that case, +FOO_CARGO_LOCKED+ must be set to +NO+ so
+Buildroot does not request cargo to attempt a locked vendoring. It is an
+error to set +FOO_CARGO_LOCKED+ to +NO+ for a locked package, as it is
+to set it to +YES+ (or not set it at all) on an unlocked package.
diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 41dfcbd096..90e4facf52 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -195,6 +195,18 @@ ifneq ($$($(2)_SUBDIR),)
 $(2)_DOWNLOAD_POST_PROCESS_OPTS += -m$$($(2)_SUBDIR)/Cargo.toml
 endif
 
+ifndef $(2)_CARGO_LOCKED
+ ifdef $(3)_CARGO_LOCKED
+  $(2)_CARGO_LOCKED = $$($(3)_CARGO_LOCKED)
+ else
+  $(2)_CARGO_LOCKED = YES
+ endif
+endif
+
+ifeq ($$($(2)_CARGO_LOCKED),NO)
+$(2)_DOWNLOAD_POST_PROCESS_OPTS += -u
+endif
+
 # Because we append vendored info, we can't rely on the values being empty
 # once we eventually get into the generic-package infra. So, we duplicate
 # the heuristics here
@@ -225,7 +237,8 @@ endif
 #    dependencies should have been built by the download post
 #    process logic
 #  * --locked to force cargo to use the Cargo.lock file, which ensures
-#    that a fixed set of dependency versions is used
+#    that cargo does not update the dependencies we got during the
+#    vendoring, at download time
 
 #
 # Build step. Only define it if not already defined by the package .mk
diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
index 12198051a4..880a800600 100755
--- a/support/download/cargo-post-process
+++ b/support/download/cargo-post-process
@@ -11,11 +11,13 @@ if [ "${BR_CARGO_MANIFEST_PATH}" ]; then
 fi
 
 manifest=Cargo.toml
-while getopts "n:o:m:" OPT; do
+locked=true
+while getopts "n:o:m:u" OPT; do
     case "${OPT}" in
     o)  output="${OPTARG}";;
     n)  base_name="${OPTARG}";;
     m)  manifest="${OPTARG}";;
+    u)  locked=false;;
     :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
     \?) error "unknown option '%s'\n" "${OPTARG}";;
     esac
@@ -26,19 +28,32 @@ if tar tf "${output}" | grep -q "^[^/]*/VENDOR" ; then
     exit 0
 fi
 
+declare -a vendor_opts
+vendor_opts=( --manifest-path "${manifest}" )
+if ${locked}; then
+    vendor_opts+=( --locked )
+fi
+
 post_process_unpack "${base_name}" "${output}"
 
 # Do the Cargo vendoring
 pushd "${base_name}" > /dev/null
 
+if [ -e Cargo.lock ] && ! ${locked}; then
+    printf 'Unlocked vendoring was requested, but source tree has a Cargo.lock\n'
+    exit 1
+elif [ ! -e Cargo.lock ] && ${locked}; then
+    # Although cargo itself would check for that, and error out in such
+    # a case, the error message can be confusing, so do it ourselves
+    printf 'Locked vendoring was requested, but source tree has no Cargo.lock\n'
+    exit 1
+fi >&2
+
 # Create the local .cargo/config with vendor info
 mkdir -p .cargo/
 mkdir -p "${CARGO_HOME}"
 flock "${CARGO_HOME}"/.br-lock \
-cargo vendor \
-    --manifest-path "${manifest}" \
-    --locked VENDOR \
-    > .cargo/config
+cargo vendor "${vendor_opts[@]}" VENDOR > .cargo/config
 
 # "cargo vendor' outputs on stderr a message directing to add some data
 # to the project's .cargo/config.toml, data that it outputs on stdout.
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
