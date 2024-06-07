Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDDDC27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 17:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 898DC42818;
	Fri,  7 Jun 2024 17:06:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ap7Qi8pIEAHR; Fri,  7 Jun 2024 17:06:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EB714285D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EB714285D;
	Fri,  7 Jun 2024 17:06:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B2661BF479
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D2A1427D8
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KWn5xkx1oHo9 for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 17:06:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3734D4277F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3734D4277F
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3734D4277F
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 17:06:11 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-35f0f4746c2so128959f8f.3
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 10:06:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717779969; x=1718384769;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tOYr6ukBtbRFTfBieK8VjPZlZyn77YQs5b0NV9QV+80=;
 b=mk8lVnMUn9MMWOhACDk4UizDXFAD3MeFwxCH5wEuMKFQBjHU51swgoEcQw3MLqpqek
 bRx8f7aKCYdcpCVdZfHdBn3dBOy/mYb63FHXuSMKotKI+xsv1VdjTqXlDvw8B/hs0ECW
 21BVSEjtEgxcClWS43SdV+l5RDrig37eBm6fnKBuB1IUDOblSfEH/Vj3EoTfzc0NG/eF
 GyERI/LjfOqw+IuqySBqKo2tZbjiAx07gJwJKrFn83CkZ83QakA7nJ5p5qGtnJUJNc1g
 SJjzGS8J1npolULgXW9acpwmlJaPvIBCOkaQXjfT7yHeZC/JaSQain6agKIccgWdflLP
 +U8w==
X-Gm-Message-State: AOJu0YwdH8IxiWZqShCdh99mm5OCmq87JaUbG20e+Xs4MYnfQ3QhK4tj
 4GVtCinBHyo6tytouUtsp2QHYStG+P0QWoh/hYaCFAeBhJ81KFUnU6YAEA==
X-Google-Smtp-Source: AGHT+IEeRNw4YbktNXo4fjzF5Gr+cjhR67XybBbz1XYAXVlaHF4mc2TfyD52j6v9Tqq8carVXGZhYA==
X-Received: by 2002:a5d:5482:0:b0:35f:e0f:69a6 with SMTP id
 ffacd0b85a97d-35f0e0f6d4cmr693012f8f.27.1717779969117; 
 Fri, 07 Jun 2024 10:06:09 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e989c9sm4355379f8f.73.2024.06.07.10.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 10:06:08 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri,  7 Jun 2024 19:05:56 +0200
Message-ID: <6f348a101c8ae327cc78e6bac6f9b54fc20c6e2e.1717779951.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717779951.git.yann.morin.1998@free.fr>
References: <cover.1717779951.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717779969; x=1718384769; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tOYr6ukBtbRFTfBieK8VjPZlZyn77YQs5b0NV9QV+80=;
 b=VoOV/de3UM6Hv2Qf1BLOB1i4Nb/PIpGNALOMoP9pagP0ZZARent+1OhFrhF5oGg7ye
 exnj2jIbUcXee/7WeBkHnakX/n9eqkQMUMR0EJcOt1l30nM7gyJqF0BXIKoyYB5N+cmR
 VtxCRL1BBiNScLL+zJAB4Zq0K8IuFuqzaJdgxHhD5O0viBoRPuXw1NEN3Lr9D66V0qhl
 /6VeWZfzEneh3k50z32dPsNKIeKvU1+CIV/LrNFhUydeIkgzhI28JE1ffzi3G4S9vMel
 gQP4CMaxf0mwm1yxpuxCl2cHtb6d2q+aTxu94GW7FuFxtjlVUgOntG5bucKOhDb8HTpc
 PtCg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VoOV/de3
Subject: [Buildroot] [PATCH 15/20 v2] package/pkg-cargo: add support for
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
 docs/manual/adding-packages-cargo.adoc | 22 ++++++++++++++++
 package/pkg-cargo.mk                   | 15 ++++++++++-
 support/download/cargo-post-process    | 35 ++++++++++++++++++++++----
 3 files changed, 66 insertions(+), 6 deletions(-)

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
index 12198051a4..90155a2fad 100755
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
@@ -26,19 +28,42 @@ if tar tf "${output}" | grep -q "^[^/]*/VENDOR" ; then
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
 
+# The lock file is somewhere from down next to the toml (when the rust
+# package is the top-level, only rust package), up to the root of the
+# source tree (when the rust package is part of a rust workspace, or
+# is part of an other-language package, like python).
+lock_dir="$(dirname "${manifest}")"
+while [ "${lock_dir}" != "." ]; do
+    if [ -e "${lock_dir}/Cargo.lock" ]; then break; fi
+    lock_dir="$(dirname "${lock_dir}")"
+done
+
+if [ -e "${lock_dir}/Cargo.lock" ] && ! ${locked}; then
+    printf 'Unlocked vendoring was requested, but source tree has %s/Cargo.lock\n' "${lock_dir}"
+    exit 1
+elif [ ! -e "${lock_dir}/Cargo.lock" ] && ${locked}; then
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
