Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1B9E9D3E0
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 14:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA09F405C9;
	Wed,  4 Feb 2026 14:10:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LFrppxOQ34Ym; Wed,  4 Feb 2026 14:10:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A03AD4062C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770214211;
	bh=sfenY89ZVv08NJgnXCKdd2Fyeg+oJA3s+LFfZ1D5Q+k=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QJTbjnqnpp/RDAXVc/irO1NDVFFWJnQwwKf8CKGoNzGypmbIQTHxsbGdG3+HWzQRb
	 X+Sr5rdpzIUspekPhNKSMrl805DV7fLS1PIECg/Ohx0z59FJf6EIs2L7sjf9DjVSQs
	 ZvW6nYxWIvsSfgd0utFQfGWpBYSTsK9Ux60zNrCq1O+R4Q3XdonmV9K2XsdLyn+A+0
	 HV2rYFQrCQX2jZMko+1GUurnWZ62LiGcv/lmdKHbwccnqmH1DE6DyqNMVLZEm5d8CM
	 y8aqDj8YIKiw0nfswWDe37IXfkWeum0xYEdn4+xgFdsJSoKfSMUCoMohvjUklYee7+
	 0dJv1ccPsh0qQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A03AD4062C;
	Wed,  4 Feb 2026 14:10:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C9C6173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6775481360
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4bbi5vsAEDdt for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 14:10:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.43;
 helo=mail-wm1-f43.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EDA898135D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDA898135D
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDA898135D
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:10:08 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-47ee76e8656so93063245e9.0
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 06:10:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770214207; x=1770819007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YSmPx5ZhQ9eA9Bn7GVd+YVHbcgVh8tqqbQzfeEwNcRs=;
 b=rZ4dACIyZvGy2Cb9dTAr2bwxKUfkC4v8LZ4xvGVKkvZ4HwrNSxLC2v7n/HPg3UY1YS
 XXLkvxtLrG9W4wyGdr3uuSqRhAQjl+9FsaSXSHYwUHGnPniCS4Yjuapb5hMkMcXfHCZD
 MH6TEPSDPiBXWP0OWEAtLd3kjfeI9g5m7LS8MSxBmMV+Hi3OK9DU7V5/iQgw7erVTt00
 OS555rXBzemuEfdbgeUyaweNLezzC6hZHzpUZ2Z2/kvuM1HbSAy4Uc38GxDC1zy9WseC
 rDdXt/cmwiVJtu0teWUC3TQI54CVf4hcVhLKRiT+Qf9jIMiriux39FatubxwBC5KsL4v
 B7uw==
X-Gm-Message-State: AOJu0Yw2HrmYBQMpAtQSOOZ5LKIXW0b7JUCg3Vf4FNS2dnJJUIwt8mdP
 6LcDzxaGIK35lNs4U9pwxZGQQVaOvBKWBkp6Jj3CkD0MFX+3gHpNSsjrkHgD0Oe9
X-Gm-Gg: AZuq6aJBhhfQAU/G4xeJZkRaZ3BLxb2jXNFu9kWiz0NZOaPC8aFj+vJSin3qIkyXLJL
 4YRhrpFDg30Qd59VpHrWvKwd25e9MFlDjoQypIdaDJT7CzO9EWER0ckI0Kv+T6TBcrz4CxFfeqh
 xWDXiQGHhAOmJrxRasNQyuyDhtLJuc1EgT7eKrpk/r1fr1+D9/8xRqVCHnyI5HZqYh3nlTzGRdT
 ZgwsWt3faIX8+kDqE28Xk8X2G5EJTUziBO95rSLN1bexZFc5ZKSQAIy6tZZiy7qdnNZ5FAyoetf
 WD2pnP36P+LuNiqwtMSTSvpuqqyRey9yngF2XwwoBUPddeuVrTGTpaRdPLYVG5h/5HN1aVm+aoE
 Mv29ngEFqweu4KzowpJ4oeW1lgB8YdLOn6znlvX3H1icS4FI7zidKT8JZywWi0Z3RwPID8XAozc
 B2AjXfwI39GH4b6TZ0anT/deA0k3lDhyr4h2LAdupKQpj3oqSbtYo/jYLafsGbPszQBE4QCrTI2
 e9BbLgRSLptC8ro6Q==
X-Received: by 2002:a05:600c:6290:b0:47e:e91d:73c0 with SMTP id
 5b1f17b1804b1-4830e9669b9mr43603715e9.19.1770214206389; 
 Wed, 04 Feb 2026 06:10:06 -0800 (PST)
Received: from KORLIN44614.. (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-48310858ffdsm49005625e9.7.2026.02.04.06.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 06:10:05 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: eric.le.bihan.dev@free.fr, fontaine.fabrice@gmail.com,
 guillaume.chaye@zeetim.com, ju.o@free.fr, romain.naour@smile.fr,
 thomas.petazzoni@bootlin.com, thomas@devoogdt.com
Date: Wed,  4 Feb 2026 15:10:00 +0100
Message-ID: <20260204141001.3962397-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260101173630.10079d1b@windsurf>
References: <20260101173630.10079d1b@windsurf>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v7 1/2] package/pkg-cargo: add support for
 prevendored Cargo.lock
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

Add support for using pre-vendored Cargo.lock files in Buildroot
packages. This allows package maintainers to provide a Cargo.lock file
directly in the package directory, which is useful when:

- The upstream package doesn't provide a Cargo.lock file
- Specific dependency versions need to be pinned

The implementation automatically detects if a Cargo.lock file exists in
the package directory (next to the .mk file) and uses it during the
vendoring process. The download helper searches upwards from the
manifest to find the top-most Cargo.toml and places the lockfile there.

To handle updates to the Cargo.lock file without bumping the package
version, a FOO_CARGO_LOCK_VERSION variable is introduced. This defaults
to 1 and should be incremented (to 2, 3, etc.) each time the Cargo.lock
is updated independently. When set to values greater than 1, it adds a
"-lockN" suffix to the tarball name to force re-downloading. When the
package version is bumped, this variable should be removed to reset to
the default.

This work is based on ideas from:
- Yann E. Morin's cargo-unchained branch:
  https://gitlab.com/ymorin/buildroot/-/tree/yem/cargo-unchained
- Thomas Devoogdt's patch series:
  https://patchwork.ozlabs.org/project/buildroot/patch/20251019064503.2583945-1-thomas@devoogdt.com/

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v7: reworked based on talks at DeveloperDaysFOSDEM2026
    https://mensuel.framapad.org/p/buildroot-fosdem-2026-ajdk?lang=en
---
 docs/manual/adding-packages-cargo.adoc | 35 ++++++++++++++++++++++----
 package/pkg-cargo.mk                   | 14 +++++++++++
 package/pkg-utils.mk                   |  3 ++-
 support/download/cargo-post-process    | 19 +++++++++++++-
 4 files changed, 64 insertions(+), 7 deletions(-)

diff --git a/docs/manual/adding-packages-cargo.adoc b/docs/manual/adding-packages-cargo.adoc
index 4df758537b4..3170406fa2f 100644
--- a/docs/manual/adding-packages-cargo.adoc
+++ b/docs/manual/adding-packages-cargo.adoc
@@ -77,6 +77,13 @@ typical packages will therefore only use a few of them.
   is not at the root of the tree extracted by the tarball. If
   +HOST_FOO_SUBDIR+ is not specified, it defaults to +FOO_SUBDIR+.
 
+* +FOO_CARGO_LOCK_VERSION+ defaults to +1+ when a +Cargo.lock+ file is
+  provided in the Buildroot package directory (next to the +.mk+ file).
+  Only set this explicitly if you need to increment it (to +2+, +3+,
+  etc.) when updating the +Cargo.lock+ without bumping +FOO_VERSION+.
+  When +FOO_VERSION+ is bumped, remove this variable to let it default
+  back to +1+.
+
 * +FOO_CARGO_ENV+ can be used to pass additional variables in the
   environment of +cargo+ invocations. It used at both build and
   installation time
@@ -94,8 +101,26 @@ step of packages that use the +cargo-package+ infrastructure. Such
 dependencies are then kept together with the package source code in
 the tarball cached in Buildroot's +DL_DIR+, and therefore the hash of
 the package's tarball doesn't only cover the source of the package
-itself, but also covers the sources of the dependencies. Thus, a change
-injected into one of the dependencies will also be discovered by the
-hash check. In addition,  this mechanism allows the build to be
-performed completely offline since cargo will not do any downloads
-during the build. This mechanism is called vendoring the dependencies.
+itself, but also covers the sources of the dependencies. In addition,
+this mechanism allows the build to be performed completely offline
+since cargo will not do any downloads during the build. This mechanism
+is called vendoring the dependencies.
+
+==== Pre-vendoring with +Cargo.lock+
+
+In some cases, you may need to provide a custom +Cargo.lock+ file in
+Buildroot (e.g., when the upstream package doesn't provide one, or you
+need to pin specific dependency versions). To do this, place a
++Cargo.lock+ file in the package directory (next to the +.mk+ file).
+Buildroot will automatically detect and use it during vendoring.
+
+When you update the +Cargo.lock+ without bumping +FOO_VERSION+, you must
+increment +FOO_CARGO_LOCK_VERSION+:
+
+----
+FOO_CARGO_LOCK_VERSION = 2
+----
+
+Increment it for each subsequent +Cargo.lock+ change (+3+, +4+, etc.).
+When +FOO_VERSION+ is bumped, remove this variable to let it default
+back to +1+.
diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 47a6353f259..78f1561476c 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -195,6 +195,20 @@ ifneq ($$($(2)_SUBDIR),)
 $(2)_DOWNLOAD_POST_PROCESS_OPTS += -m$$($(2)_SUBDIR)/Cargo.toml
 endif
 
+# Automatically detect if a Cargo.lock file exists in the package directory
+# and use it for vendoring if present
+ifneq ($$(wildcard $(pkgdir)/Cargo.lock),)
+# Set the lock version if not already set, defaulting to 1
+ifndef $(3)_CARGO_LOCK_VERSION
+ $(3)_CARGO_LOCK_VERSION = 1
+endif
+# Only set EXTRA_FMT_VERSION if lock version is greater than 1
+ifneq ($$($(3)_CARGO_LOCK_VERSION),1)
+$(2)_EXTRA_FMT_VERSION = -lock$$($(3)_CARGO_LOCK_VERSION)
+endif
+$(2)_DOWNLOAD_POST_PROCESS_OPTS += -l $$(abspath $(pkgdir)/Cargo.lock)
+endif
+
 # Because we append vendored info, we can't rely on the values being empty
 # once we eventually get into the generic-package infra. So, we duplicate
 # the heuristics here
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 211e681e8f5..5b2334b5f61 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -47,8 +47,9 @@ pkgname = $(lastword $(subst /, ,$(pkgdir)))
 
 # Helper to build the extension for a package archive, based on various
 # conditions.
+# NOTE! _EXTRA_FMT_VERSION should only be set by the infra, not individual packages!
 # $(1): upper-case package name
-pkg_source_ext = $(BR_FMT_VERSION_$($(1)_SITE_METHOD))$(BR_FMT_VERSION_$($(1)_DOWNLOAD_POST_PROCESS)).tar.gz
+pkg_source_ext = $(BR_FMT_VERSION_$($(1)_SITE_METHOD))$(BR_FMT_VERSION_$($(1)_DOWNLOAD_POST_PROCESS))$($(1)_EXTRA_FMT_VERSION).tar.gz
 
 # Define extractors for different archive suffixes
 INFLATE.bz2  = $(BZCAT)
diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
index b0e59ad74d8..c328002530f 100755
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
@@ -31,6 +32,22 @@ post_process_unpack "${base_name}" "${output}"
 # Do the Cargo vendoring
 pushd "${base_name}" > /dev/null
 
+# If a lockfile was explicitly provided via -l option, use it
+if [ -n "${lockfile}" ]; then
+    # Search upwards from the manifest to find the top-most Cargo.toml
+    dir="${manifest}"
+    lock_dir="$(dirname "${manifest}")"
+    while [ "${dir}" != "." ]; do
+        dir="$(dirname "${dir}")"
+        if [ -e "${dir}/Cargo.toml" ]; then
+            lock_dir="${dir}"
+        fi
+    done
+
+    cp "${lockfile}" "${lock_dir}/Cargo.lock"
+    printf 'Using provided Cargo.lock from %s\n' "${lockfile}"
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
