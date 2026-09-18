Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA988C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 22:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5103C4054E;
	Fri, 18 Sep 2026 22:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZcPBwffjGp4n; Fri, 18 Sep 2026 22:57:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3070C4054F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789772242;
	b=PFb7eBmWWLrr2GS7H8VWHU/yregkpM5Cn8oPfukNrdchoJY366uWnvUi1IAw/VRgaEFv
	 BMPa0tGlk0IzmPLVvwfph/6X7x9BrDmgn59tKTx5/w6XEjVZiALaQSpAGukblklIPItPz
	 5Ru8fXUQFjw1eZV4N7iJN5WhDsyvXQrhxnjTL4XkUz5hoxDCJ2kdcaWdfLGckIEOVUsgx
	 ZiRjUXKX6dnbvD3ODDnGibiyU7VH7GkouzufedTqr5/fuyTvHwsLWVAiGQX6L4ag6nsAX
	 fT+mmesgebDBQBINuQh37rpOckNI0zUtNtdO0qbTkf5mXA/UeeuWVdD62INylF2J1nQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789772242;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=b0g7+0iWSALN1no3yHbKIYT78d5eRJXzkwGtY6qcTe0=;
	b=nOdjDTjAqdNhr/TPYgZTtlfD6wht9BiWq39rf8Q8WYh4jLVDiMOsoGztRuiN85km64oD
	 uMWSs9JzEdg/R1ObmPQ5RD4xSyT9pT+2sKuOSiUVNljIkmIVKX6G3uPcFgyWKAPAdjzrV
	 FBghwT/9EClcGIz7F6oyKglpPswpVyEK2fRworRHk8kA7jLOp18oswSeLSakGQlqgGU0S
	 lmHUjAuCoudNXy4OW2k1gyK3oHOhrwbLWH5eu7zOAGGdulcJIB9Svk5EQtZUq0IVH1F+y
	 tWcsNyVSceRI11Q5lN3OnBdxiqvsQjqPExoWfciWVrQ/G3SdDTMrkPc6lPTA/Os+Nsg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=none header.from=devoogdt.com;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789772242;
	bh=b0g7+0iWSALN1no3yHbKIYT78d5eRJXzkwGtY6qcTe0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=craeeYzuNz3+i/AVhdMDGdP+KkmH4UJ5L5J1aCBQOoN9aHUPXweR87/LFPra8NR2P
	 Bil+ByCkoGBoP9p9OeY9bXgwZzsQHbTCtW//y5KRD+0FFx+baOT54bztycXdLHxBnP
	 w3lJfA3WdK418l+xKJ1jVgw6rjtZY7tXhRB+9ZuqP2fxRhZlruv/ifSGjoGv6Geai9
	 xrpf8pa78Sqq6j4LBGDbe77oIAaxuCyq5u4Hm3A+yFj7x0M+6ZwzTlKi1AAJ7ub28d
	 iR+PXAA71E+kZnDzq09Z+dJ871riHE5Pumovxx015H3K1C8/lS9vVa7GTag0tqeaOE
	 dBybFxXC/ZHDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3070C4054F;
	Fri, 18 Sep 2026 22:57:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F133529B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 22:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7502404EF
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 22:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IIqKfXhmw0cR for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 22:57:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 94A3D4028C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=74.125.225.76
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789772239;
 b=lSlTW9YFT2HSqX2reRGao3xK3r7FP5IdWaZx+mj7aWHZRTRVy8D+ZabKNsQu3JOzDonr
 gH3l5ghFhTB1evUR6XAsqjkuBF9zmkH0h6ktLsAQYWfmDWEtml0/MsKqMcsCmmaichdCb
 Dtkgy2ZB474v9NV4zBk3/C3JLv20DGsJwJPsuAjRg3JtPVg8B9SHYBQolaIS9y0uOX5Kl
 scwkzCvNr94ECbzczLfBrZ9RQCbIQRU+TjqNsvloLSFBqyg4oaZlYd4iK6licYm5oBUSr
 YzKqlJFj51VwiOmWOioF3ode1koqCfuewlM5L0tJFooupLQaWkQlEb7iev1hMN2i+9w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789772239;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
 X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=SiIgDOHuDmK/Y9vVMoJrDAMwgGBI5AvakEsFvqQo60g=;
 b=onyS7tkFmvs2RKOhbU0wNFuXNoXArhPkQxsaASbFRVF+UOnJI8BQQu+YkNx9micAUBRL
 cCxMo1tHEYvDgZYBU9tlNWXMjPZr3XBCpvFljfbDqVzN13imUzVGB1WTJ0RI+CvCotp68
 FeyV9RT+pFrOBF2WGmN0iTDYw1sDHL5AncilcXdK3v8hYaDepfnngHYe6MxxqZ7FIhAUj
 6MUIJ8mJZzvRxJf7aDaPP/0fEzAaUhHbO91We53xZ5Uk0WmsXQg5tZpESjQZ8BHvYBqGB
 4xDqgnaimW7oGwfFRMQ5TsHx2xf+CDV9X2UEyW9N/GRZjDsYv2OE9qgMI52gmOLWgdA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=none header.from=devoogdt.com; 
 arc=none smtp.remote-ip=74.125.225.76
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=74.125.225.76;
 helo=mail-wr2-f12.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com
 [74.125.225.76])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94A3D4028C
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 22:57:19 +0000 (UTC)
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-484366874b0so719368f8f.2
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 15:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789772237; x=1790377037;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SiIgDOHuDmK/Y9vVMoJrDAMwgGBI5AvakEsFvqQo60g=;
 b=X3QjI6HDW1b0Yu9ihllw/G2I7GwM+mSvjnXSOKqQCr0A5EqZ0eozOpQL3ujU49N8B3
 rQ23FbURcEIfGi0E/fQWZc5UX1R7fh1qpOzsZ/ypDYzjaO4nyELhTbF9sKp1RD02Qlpw
 S/JRoIRkc0nuS7bifFOSn0bls8gdPQIxOjrtnKeWuJduW3/hHeH1saG462tfXU9Q8phL
 z28saYhRt/6pE1apbOJVzmqKDbg8RWaIFhRhvtG4DA4zTkdtjtExGj1hi5I+oTuIfHkb
 gNJulWuMNGs0lGqRWhptxx+qqk9JZFjLlEqU9ZpiWaZECgk24FnZXvV7yc95L6nYIfEe
 mOVA==
X-Gm-Message-State: AFuF++kJwmHWmtttNCPAU8S3Xk+EvcxP7k/7NxFJe+dvUgc1xpz2Rygq
 CuE46jYp5raDE20l85U1Px9fVxABShxITwni2pWM7SMk70BmzG9+GxLC
X-Gm-Gg: AYBFou0h9cH2cvV+xSanuEoy1HdWWDFD3ocxeNVVTI3O3HBmwYwLEqt3Cr/VVL0Kvve
 4AXawdZcK9TCsDDRIkCtzqwqzI/64WvOsG4xl4MFrU0KdPvg1Aq5c/n3vVrZDxlfjppM8vkOVJn
 h3WEFg1jYFP2L7ENRDsjyZiHYSqgAE0nBEXzjKsXiaYYFhxcSj9M3YKxozb6BTfL/eQ1D0y4AsC
 x3KvWALf/+tolBvsSsQOyKaNOEZPCiFyr1HOdZO7e6D7Chdycur9BU/g+XxJ0SG3ms8EZTPpjCw
 LHNmDosH3GXrfZ1qv15iH/tBb6QUtALYBbuU04gnQE/r5wqXFcsaMXFw77JFdyhOQhXDxTyq7sI
 rm8L9knBQdPvjbOPNSnmnoDSvrDx+rhze20yt6jif9gCH6OXxSsVc7QwBxf7IjXWYJQy0rUsy/o
 ZHSnPcXXTAfYRggbswu0Iy/RLLjPBZYr2UD8KNjQFiR7DHrOcgihnyLVGpbgwgyUAy7lxMkdHvD
 4Ki8pGt95/WVcUHXOAce/xLv7wQvYCIHJ45vN1gtK4SAU7CLl7jFdoxvGPuYczLo0uIpP+hvljF
 uTMad3hNv30/NHK6wp3G/cxqdJlEUAu95w==
X-Received: by 2002:a05:6000:4028:b0:487:40a:5ba8 with SMTP id
 ffacd0b85a97d-4871e25e2demr9971659f8f.15.1789772237076; 
 Fri, 18 Sep 2026 15:57:17 -0700 (PDT)
Received: from KORLIN44614.barco.com
 ([2a02:a03f:eb5f:fa00:7660:3f83:58b7:bd0f])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-487244229e0sm1901661f8f.4.2026.09.18.15.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 15:57:16 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: thomas@devoogdt.com
Cc: buildroot@buildroot.org, eric.le.bihan.dev@free.fr,
 fontaine.fabrice@gmail.com, guillaume.chaye@zeetim.com, ju.o@free.fr,
 romain.naour@smile.fr, thomas.petazzoni@bootlin.com
Date: Sat, 19 Sep 2026 00:57:12 +0200
Message-ID: <20260918225713.4013471-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204141001.3962397-2-thomas@devoogdt.com>
References: <20260204141001.3962397-2-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v8 1/2] package/pkg-cargo: add support for
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
v8: no change
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
index 17b0aa17604..165ccafd40d 100644
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
