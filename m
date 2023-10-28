Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0DCC4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 21:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCD2E401CA;
	Sat, 28 Oct 2023 21:09:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCD2E401CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Wl1kcv01YbQ; Sat, 28 Oct 2023 21:09:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84F8640068;
	Sat, 28 Oct 2023 21:09:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84F8640068
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6FF9C1BF20B
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4909A61324
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:09:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4909A61324
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RtX6_6QSqJhF for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 21:09:11 +0000 (UTC)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E3CD61310
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 21:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E3CD61310
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-507ad511315so4668703e87.0
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 14:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698527349; x=1699132149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RLF1TEIFQrJzWXA1sZLRUow3SdC2I1xewSunEwxkqrA=;
 b=nbf/dj/yMprDYUTISsIe4jNEtGgahW1bLMpkgL6zxZOVJqw1W5F8X1e7Ubnus/dZVl
 t2c6Rr+FZf/fECcOK246G4vF3jK8Pp50zI+0xqFyHn5UguQimXh8QjIlxPbwtP4aCTrU
 3RE1t0rEgy/CUfGpphtjKEJicGTGjWYQ0e24gNXArSwOFd0uv1efXOAdwkc/0LJHz3+0
 CJVnA1JLaWjO3AYrATDp7m0+mjHHgtsyHCVKQ3zFknhJJLNdJ67aFlYbfT3c3ouBXSWG
 OqlA6zDz4YkiTvYQeiET3bmzIAy+umr7h4vIZ113d4ixcflhJU/CAAWotL5UKF9cnsEI
 E1+Q==
X-Gm-Message-State: AOJu0Yw47PgRoNLFnnixjz6jdhbW9GzDQXyCtLMhYcY25DBseUlk+PWa
 4yjak22Tb6DdFDQRW+Q08jUB+8FUhTw=
X-Google-Smtp-Source: AGHT+IG0RnKfW2Q0yqS/xhPtrMLiqQHLIYGEgI9IiruuypAr8z1J5CRs4ph1A/nM36NAJqyO8MCudQ==
X-Received: by 2002:ac2:5965:0:b0:507:998f:dc3e with SMTP id
 h5-20020ac25965000000b00507998fdc3emr4037221lfp.19.1698527348819; 
 Sat, 28 Oct 2023 14:09:08 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 by smtp.gmail.com with ESMTPSA id
 n17-20020adff091000000b0032da4c98ab2sm4604050wro.35.2023.10.28.14.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 14:09:08 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 23:09:06 +0200
Message-Id: <bf72febb99392ab028379b347667ebcf601116a2.1698527340.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1698527340.git.yann.morin.1998@free.fr>
References: <cover.1698527340.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698527349; x=1699132149; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RLF1TEIFQrJzWXA1sZLRUow3SdC2I1xewSunEwxkqrA=;
 b=VOwAW5Ea4XNKs0a7wzuHh9vC0APOBe0d1QJq5T8yQ0v5/uUMDEiLQ6iOWkS4/vKibE
 IKLu41meErVYprRdeFCHLJdl3iRJsbFsy+PTuzS8g3jftoh74DfoIsfiKITUOFJuaTHy
 eeIRjmTr9CukCa2Hm2yN1W0yDBl1xTTEGANXbgMmPvDtAod2xKusFmDNt3FmsJcYnZFn
 QToymjNg+dzcWcCPIiWcHLG7gcWQMpgohF35KHMVg4rFe4uWzvIyWsb8wfckhxaQ/9Eo
 glhisNccySK8hgpJCUYwO0ZiJn8nlFs3E8OtZw85Ce5wBLO9ADHbmBF3dPWFyib78Vf6
 gJKA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VOwAW5Ea
Subject: [Buildroot] [PATCH 3/4] package/pkg-download: lookup hash files in
 global-patch-dir
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "Martin Zeiser \(mzeiser\)" <mzeiser@cisco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, we expect and only use hash files that lie within the package
directory, alongside the .mk file. Those hash files are thus bundeld
with Buildroot.

This implies that only what's known to Buildroot can ever get into those
hash files. For packages where the version is fixed (or a static
choice), then we can carry hashes for those known versions.

However, we do have a few packages for which the version is a free-form
entry, where the user can provide a custom location and/or version.  like
a custom VCS tree and revision, or a custom tarball URL. This means that
Buildroot has no way to be able to cary hashes for such custom versions.

This means that there is no integrity check that what was downloaded is
what was expected. For a sha1 in a git tree, this is a minor issue,
because the sha1 by itself is already a hash of the expected content.
But for custom tarballs URLs, or for a tag in a VCS, there is indeed no
integrity check.

Buildroot can't provide such hashes, but interested users may want to
provide those, and currently there is no (easy) way to do so.

We leverage the existng global-patch-dir mechanism to look for extra
hash files. We use the same heuristic that is used for bundled hash
files, plus a simple way to provide hashes in bulk, and use the first to
exist:
 1. look into <dir>/<package>/<version>/<package>.hash
 2. look into <dir>/<package>/<package>.hash
 3. look into <dir>/all.hash

Note: we do not introduce the use of <dir>/<package>.hash on purpose, as
we believe it is better to provide and use a single all.hash file.

Reported-by: "Martin Zeiser (mzeiser)" <mzeiser@cisco.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in                                  | 11 ++++++----
 docs/manual/adding-packages-directory.adoc |  6 ++++++
 docs/manual/customize-patches.adoc         | 25 +++++++++++++++++++++-
 package/pkg-download.mk                    | 10 +++++++++
 4 files changed, 47 insertions(+), 5 deletions(-)

diff --git a/Config.in b/Config.in
index 556b6c2575..a808e51a68 100644
--- a/Config.in
+++ b/Config.in
@@ -664,12 +664,12 @@ config BR2_PACKAGE_OVERRIDE_FILE
 	  documentation for more details on this feature.
 
 config BR2_GLOBAL_PATCH_DIR
-	string "global patch directories"
+	string "global patch and hash directories"
 	help
 	  You may specify a space separated list of one or more
-	  directories containing global package patches. For a specific
-	  version <packageversion> of a specific package <packagename>,
-	  patches are applied as follows:
+	  directories containing global package patches and/or hashes.
+	  For a specific version <packageversion> of a specific package
+	  <packagename>, patches are looked up as follows:
 
 	  First, the default Buildroot patch set for the package is
 	  applied from the package's directory in Buildroot.
@@ -683,6 +683,9 @@ config BR2_GLOBAL_PATCH_DIR
 	  exists, then all *.patch files in the directory will be
 	  applied.
 
+	  The hash files are looked up similarly to the patches, with
+	  an additional fallback in <global-patch-dir>/all.hash.
+
 menu "Advanced"
 
 config BR2_FORCE_HOST_BUILD
diff --git a/docs/manual/adding-packages-directory.adoc b/docs/manual/adding-packages-directory.adoc
index 7150018a3b..da7aa4640e 100644
--- a/docs/manual/adding-packages-directory.adoc
+++ b/docs/manual/adding-packages-directory.adoc
@@ -540,6 +540,12 @@ mercurial) because Buildroot currently does not generate reproducible
 tarballs when source code is fetched from such version control
 systems.
 
+Additionally, for packages for which it is possible to specify a custom
+version (e.g. a custom version string, a remote tarball URL, or a VCS
+repository location and changeset, Buildroot can't carry hashes for
+those. It is however possible to xref:customize-hashes[provide a list of
+extra hashes] that can cover such cases.
+
 Hashes should only be added in +.hash+ files for files that are
 guaranteed to be stable. For example, patches auto-generated by Github
 are not guaranteed to be stable, and therefore their hashes can change
diff --git a/docs/manual/customize-patches.adoc b/docs/manual/customize-patches.adoc
index eb98d1bea2..925ea09d8e 100644
--- a/docs/manual/customize-patches.adoc
+++ b/docs/manual/customize-patches.adoc
@@ -1,8 +1,10 @@
 // -*- mode:doc -*- ;
 // vim: set syntax=asciidoc:
 
+=== Adding project-specific patches and hashes
+
 [[customize-patches]]
-=== Adding project-specific patches
+==== Providing extra patches
 
 It is sometimes useful to apply 'extra' patches to packages - on top of
 those provided in Buildroot. This might be used to support custom
@@ -57,3 +59,24 @@ are available at a URL. *Note:* +BR2_LINUX_KERNEL_PATCH+ specifies kernel
 patches that are applied after patches available in +BR2_GLOBAL_PATCH_DIR+,
 as it is done from a post-patch hook of the Linux package.
 
+
+[[customize-hashes]]
+==== Providing extra hashes
+
+Buildroot bundles a xref:adding-packages-hash[list of hashes] against
+which it checks the integrity of the downloaded archives, or of those
+it generates locally from VCS checkouts). However, it can only do so
+for the known versions; for packages where it is possible to specify
+a custom version (e.g. a custom version string, a remote tarball URL,
+or a VCS repository location and changeset), Buildroot can't carry
+hashes for those.
+
+For users concerned with the integrity of such downloads, it is possible
+to provide a list of hashes that Buildroot can use to check arbitrary
+downloaded files. Those extra hashes are looked up similarly to the
+extra patches (above); for each directory in +BR2_GLOBAL_PATCH_DIR+,
+the first file to exist is used to check a package download:
+
+* +<global-patch-dir>/<packagename>/<packageversion>/<packagename>.hash+
+* +<global-patch-dir>/<packagename>/<packagename>.hash+
+* +<global-patch-dir>/all.hash+
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index e5cd83d859..0d38ff7a5f 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -116,6 +116,16 @@ define DOWNLOAD
 		-D '$(DL_DIR)' \
 		-f '$(notdir $(1))' \
 		-H '$($(2)_HASH_FILE)' \
+		$(foreach d, $(call qstrip,$(BR2_GLOBAL_PATCH_DIR)), \
+			-H \
+			$(if $(wildcard $(d)/$($(2)_RAWNAME)/$($(2)_VERSION)/$($(2)_RAWNAME).hash), \
+				'$(d)/$($(2)_RAWNAME)/$($(2)_VERSION)/$($(2)_RAWNAME).hash', \
+				$(if $(wildcard $(d)/$($(2)_RAWNAME)/$($(2)_RAWNAME).hash), \
+					'$(d)/$($(2)_RAWNAME)/$($(2)_RAWNAME).hash', \
+					'$(d)/all.hash' \
+				) \
+			) \
+		) \
 		-n '$($(2)_BASENAME_RAW)' \
 		-N '$($(2)_RAWNAME)' \
 		-o '$($(2)_DL_DIR)/$(notdir $(1))' \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
