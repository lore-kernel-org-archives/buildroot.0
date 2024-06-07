Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23B9C27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 17:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F2A6428C9;
	Fri,  7 Jun 2024 17:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5PdikYSH_54J; Fri,  7 Jun 2024 17:07:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2408B428CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2408B428CE;
	Fri,  7 Jun 2024 17:07:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D7D351BF479
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA6FB6152F
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xdr9pSyaYbUA for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 17:06:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CFD526156D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFD526156D
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CFD526156D
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 17:06:12 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-354dfe54738so1797375f8f.3
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 10:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717779971; x=1718384771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=quIjhFLQ8vwmoBfl54WMMIyyStS7N4pIJXNOj8ezOqk=;
 b=HguJOz/8TvEEGL6SBoMHfYGs642lRNEuZJGPX3WkOWe96GNy+ruKg4eNg8p+Ws8AP1
 u8+o7Vb+vpCL/WcsE+xDt8pMPRrgFJEgiU3qmfrLZ4PLjnqT+P+ynnIRMVEQhtUh51OL
 UyvAYcptiribWBpYMb4wIR91eRDTSOVyDIDpvvulMrtPzb7sJeytfIF+ybgE1PycG9j9
 BEDSC0zWjN++tyCZmjyQPTZ0seWDLw+LvP8lbPxkvpvytsKBlJZRHhSN9JEwob7Qp7ms
 v9z8g4JKrC2+WyqNLH7PiBqwTor+I0QMEO5EGdP5tMuC27TynBmpE0TSkFCJ2GgIL/vc
 NGvg==
X-Gm-Message-State: AOJu0YzQr8RyX+89uhlRV1E+2tLXcS+KQF3HMFo0pLHt/QG7UT27VBiM
 PU4j4WEB3c+hV2Www/WsJwns4eVGhEfeN95Q0BkycjXGuRNq1glC5ffk8g==
X-Google-Smtp-Source: AGHT+IGO3AqAd9ILJVZWJLyD9I8wjbVR+9rDgazfeuzLtV6RjtevcK9jOb2UOKZ1dUe22ql86RYMPA==
X-Received: by 2002:a5d:47a5:0:b0:359:b737:68d9 with SMTP id
 ffacd0b85a97d-35efed2033amr2526469f8f.12.1717779970790; 
 Fri, 07 Jun 2024 10:06:10 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e989c9sm4355379f8f.73.2024.06.07.10.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 10:06:10 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri,  7 Jun 2024 19:06:00 +0200
Message-ID: <077431bc77b4c376129ceeb628367591bcd5e8ec.1717779951.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717779951.git.yann.morin.1998@free.fr>
References: <cover.1717779951.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717779971; x=1718384771; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=quIjhFLQ8vwmoBfl54WMMIyyStS7N4pIJXNOj8ezOqk=;
 b=diKvJq3Ac9MmDnCoqrq17/ysr6+EoZHqodT7tL+Blf0RW5dkEcMf3dSp4LtgPXDStF
 wvuN4oee7aLjXW96DXsm2f8Xj9TBagOTJWo7XuyeUZDYe6nCb5AIokjHHOLf+VEj7exO
 JW7TmDD/n+A67DnwZpTqrAmn4eANDAo6SdDv6G64xKmHQvebVGxSbjdGOi4w7BJUwmWY
 2dyyUNHFeVMOEDMCwnezwlYrIVjWd/YvJqNQRhWr7qhwSW24+0wdNazPR5odmgp4U7gZ
 ziOszDey26SO0FJ4et3L+FCwFJa+q0+a5GDmSPdnCLTuDMvwLSmsFZniv4XcGPxR+haX
 kRag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=diKvJq3A
Subject: [Buildroot] [PATCH 19/20 v2] package/pkg-cargo: allow unlocked
 packages to provide local Cargo.lock
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
 docs/manual/adding-packages-cargo.adoc | 27 ++++++++++++++++----------
 package/pkg-cargo.mk                   | 14 +++++++++++++
 support/download/cargo-post-process    | 21 +++++++++++++++++++-
 3 files changed, 51 insertions(+), 11 deletions(-)

diff --git a/docs/manual/adding-packages-cargo.adoc b/docs/manual/adding-packages-cargo.adoc
index 0ed529a770..e252c347ee 100644
--- a/docs/manual/adding-packages-cargo.adoc
+++ b/docs/manual/adding-packages-cargo.adoc
@@ -82,9 +82,23 @@ typical packages will therefore only use a few of them.
   environment of +cargo+ invocations. It used at both build and
   installation time
 
-* +FOO_CARGO_LOCKED+ can be set to +YES+ (the default) or +NO+, to
-  specify whether the source tree has been cargo-locked or not. See
-  below for xref:cargo-vendoring[more details].
+* +FOO_CARGO_LOCKED+ to specify how the source tree has been
+  xref:cargo-vendoring[cargo-locked] by its upstream:
++
+** +YES+ (the default if unset): the package has been cargo-locked; it
+   is an error to set +FOO_CARGO_LOCKED=YES+ (or leave it unset) for an
+   unlocked package;
+** +NO+: the package has not been cargo-locked, and no locking should
+   be attempted by Buildroot; it is an error to set +FOO_CARGO_LOCKED=NO+
+   for a cargo-locked package;
+** +buildroot+: the package has not been cargo-locked, but a `Cargo.lock`
+   is provided in the Buildroot package (next to the +.mk+ file); in that
+   situation, +FOO_CARGO_LOCK_VERSION+ must be set to a value that changes
+   everytime the +Cargo.lock+ in Buildroot is updated (e.g. by setting
+   +FOO_CARGO_LOCK_VERSION=1+ the first time, and incrementing it for
+   every change in +Cargo.lock+; reset it to +1+ when the package version
+   itself, +FOO_VERSION+, is updated); it is an error to set
+   +FOO_CARGO_LOCKED=buildroot+ for a cargo-locked package.
 
 * +FOO_CARGO_BUILD_OPTS+ can be used to pass additional options to
   +cargo+ at build time.
@@ -110,10 +124,3 @@ that archive. If a package was however not locked, then the versions for
 the dependencies are unknown, the dependency chain is not reproducible,
 and the archive is then not reproducible, which implies there can be no
 hash for that archive.
-
-Packages are normally locked, so Buildroot will by default instruct
-cargo to atttempt a locked vendoring; for a package that was not locked,
-this would fail; in that case, +FOO_CARGO_LOCKED+ must be set to +NO+ so
-Buildroot does not request cargo to attempt a locked vendoring. It is an
-error to set +FOO_CARGO_LOCKED+ to +NO+ for a locked package, as it is
-to set it to +YES+ (or not set it at all) on an unlocked package.
diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 90e4facf52..034402c20e 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -203,8 +203,22 @@ ifndef $(2)_CARGO_LOCKED
  endif
 endif
 
+ifndef $(2)_CARGO_LOCK_VERSION
+ ifdef $(3)_CARGO_LOCK_VERSION
+  $(2)_CARGO_LOCK_VERSION = $$($(3)_CARGO_LOCK_VERSION)
+ else
+  $(2)_CARGO_LOCK_VERSION = YES
+ endif
+endif
+
 ifeq ($$($(2)_CARGO_LOCKED),NO)
 $(2)_DOWNLOAD_POST_PROCESS_OPTS += -u
+else ifeq ($$($(2)_CARGO_LOCKED),buildroot)
+ifeq ($$($(2)_CARGO_LOCK_VERSION),)
+$$(error $(1) uses a Cargo.lock bundled with Buildroot, but does not define $(2)_CARGO_LOCK_VERSION)
+endif
+$(2)_EXTRA_FMT_VERSION = -lock$$($(2)_CARGO_LOCK_VERSION)
+$(2)_DOWNLOAD_POST_PROCESS_OPTS += -L $$(abspath $$($(2)_PKGDIR)/Cargo.lock)
 endif
 
 # Because we append vendored info, we can't rely on the values being empty
diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
index 90155a2fad..3431d04a72 100755
--- a/support/download/cargo-post-process
+++ b/support/download/cargo-post-process
@@ -12,12 +12,14 @@ fi
 
 manifest=Cargo.toml
 locked=true
-while getopts "n:o:m:u" OPT; do
+cargo_lock=
+while getopts "n:o:m:uL:" OPT; do
     case "${OPT}" in
     o)  output="${OPTARG}";;
     n)  base_name="${OPTARG}";;
     m)  manifest="${OPTARG}";;
     u)  locked=false;;
+    L)  cargo_lock="${OPTARG}";;
     :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
     \?) error "unknown option '%s'\n" "${OPTARG}";;
     esac
@@ -49,6 +51,23 @@ while [ "${lock_dir}" != "." ]; do
     lock_dir="$(dirname "${lock_dir}")"
 done
 
+if [ "${cargo_lock}" ]; then
+    if [ -e "${lock_dir}/Cargo.lock" ]; then
+        printf 'Cannot override %s/Cargo.lock with custom %s\n' "${lock_dir}" "${cargo_lock}"
+        exit 1
+    fi >&2
+    # When the package had no Cargo.lock, we need to
+    # copy ours next to the top-most manifest.
+    dir="${manifest}"
+    while [ "${dir}" != "." ]; do
+        dir="$(dirname "${dir}")"
+        if [ -e "${dir}/Cargo.lock" ]; then
+            lock_dir="${dir}"
+        fi
+    done
+    cp "${cargo_lock}" "${lock_dir}/Cargo.lock"
+fi
+
 if [ -e "${lock_dir}/Cargo.lock" ] && ! ${locked}; then
     printf 'Unlocked vendoring was requested, but source tree has %s/Cargo.lock\n' "${lock_dir}"
     exit 1
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
