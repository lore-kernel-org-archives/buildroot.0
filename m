Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0E9C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 19:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 401C960AE7;
	Mon,  6 Nov 2023 19:09:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 401C960AE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 89P3ukkKgQlg; Mon,  6 Nov 2023 19:09:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BB746123A;
	Mon,  6 Nov 2023 19:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BB746123A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 74FD11BF3A1
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EE736118B
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EE736118B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0jAFVpgnRWpk for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 19:09:18 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4168161187
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 19:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4168161187
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4083f61322fso35577715e9.1
 for <buildroot@buildroot.org>; Mon, 06 Nov 2023 11:09:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699297756; x=1699902556;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=F9FlBLjyPNUenP/PNIcTzf+AVr/sXbMt8NAXJOLyAyQ=;
 b=EEz4tSJrSsUO+evyeGRPvAG5cBHHCVBRx/nSUe4QqArlTDs2yX+9J7l9MPXGrFt7Hd
 qChOz6R968oECDbGE1+DUy9LgDE3W+5Hc/xMjGvkt3xpJWx6KfTExoAqEvsBG81AmrGP
 +j4wYvzxbK+lEait6MZADntkniMnPolFJ0xJAQUZHpWys7bxiNGmLh1vqxNCyhBflH/u
 sMZ1Gv66LSyZYk/dNmrWmyY2inr34+VteC2uy2yGgphXOPFgk985xCDr+XpCNtl42INN
 sIDq2PpHGObBZ1843PJSVDEHAFhH4n3XOJDkVCkmdv1YyUcpP9AXKJ7PQqdG0Rtpm2pN
 lSTQ==
X-Gm-Message-State: AOJu0Yw+XrPEQ9fjD9wkZ/lV6SLcTUQvupKnQvM+ZeWc7lgj3pVrQwh8
 aLscDc17wwP78BIp91aQjwc9NO4zGcc=
X-Google-Smtp-Source: AGHT+IGiA62OndPw7Yo/2pVFnt+HvmRwyoYcS5uDbhFhMs1F6C5nQJNndJBsOErF4WvLDxPUnQ5xoQ==
X-Received: by 2002:a05:6000:1a8b:b0:32f:8ace:f0b7 with SMTP id
 f11-20020a0560001a8b00b0032f8acef0b7mr18155763wry.12.1699297756083; 
 Mon, 06 Nov 2023 11:09:16 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8290:3800:5023:65e3:22e2:e1cc])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a056000108e00b0032dbf6bf7a2sm330900wrw.97.2023.11.06.11.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 11:09:15 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon,  6 Nov 2023 20:09:13 +0100
Message-Id: <31d36b28454ccf0134e74f2a4b9b11a41a6fc6e5.1699297749.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1699297749.git.yann.morin.1998@free.fr>
References: <cover.1699297749.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699297756; x=1699902556; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F9FlBLjyPNUenP/PNIcTzf+AVr/sXbMt8NAXJOLyAyQ=;
 b=a3QJndGaX/NkiZCoXUxsXoh4JPA1k1Jxx0r6OauAGh7chXWon2Mh86n0vipawKEFyd
 im2c4l7EPyz0iNvtctFcDEFHfD2mBe9hXp9K5TTP6//h+21+bVxQs+UCj6+tNeRDD1JN
 cCKPz5Ww9tr8KKBXrpp8HZO1ur5FI4SFgjvYC8dC2Sz3SEraEePbLjxKTzSP3CLF0DZm
 ZQj5q5aHP0t8SKzt9ZDPXTraFErTWEKjto8+OzAoU0YjWFq8CyOPLnwc8W35w92DJpBT
 dXWXMJ0ooo21B8HcqZSj3lG1FC/WBNcHziOU3+DX0iHSH5FGAdSBdc+XB7XC33sabUvp
 aaOw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=a3QJndGa
Subject: [Buildroot] [PATCH 2/3 v2] package/pkg-download: lookup hash files
 in global-patch-dir
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
directory, alongside the .mk file. Those hash files are thus bundled
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
files, and for each global patch directory <dir>, we use the first file
to exist among:
 1. look into <dir>/<package>/<version>/<package>.hash
 2. look into <dir>/<package>/<package>.hash

Reported-by: "Martin Zeiser (mzeiser)" <mzeiser@cisco.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
Changes v1 -> v2:
  - drop <dir>/all.hash
---
 Config.in                                  | 10 +++++----
 docs/manual/adding-packages-directory.adoc |  6 ++++++
 docs/manual/customize-patches.adoc         | 24 +++++++++++++++++++++-
 package/pkg-download.mk                    |  2 +-
 package/pkg-generic.mk                     | 14 ++++++++-----
 package/pkg-utils.mk                       |  2 +-
 6 files changed, 46 insertions(+), 12 deletions(-)

diff --git a/Config.in b/Config.in
index 7dd49567f6..b344d0e80a 100644
--- a/Config.in
+++ b/Config.in
@@ -674,12 +674,12 @@ config BR2_PACKAGE_OVERRIDE_FILE
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
@@ -693,6 +693,8 @@ config BR2_GLOBAL_PATCH_DIR
 	  exists, then all *.patch files in the directory will be
 	  applied.
 
+	  The hash files are looked up similarly to the patches.
+
 menu "Advanced"
 
 config BR2_FORCE_HOST_BUILD
diff --git a/docs/manual/adding-packages-directory.adoc b/docs/manual/adding-packages-directory.adoc
index 7150018a3b..5a0f298eb1 100644
--- a/docs/manual/adding-packages-directory.adoc
+++ b/docs/manual/adding-packages-directory.adoc
@@ -540,6 +540,12 @@ mercurial) because Buildroot currently does not generate reproducible
 tarballs when source code is fetched from such version control
 systems.
 
+Additionally, for packages for which it is possible to specify a custom
+version (e.g. a custom version string, a remote tarball URL, or a VCS
+repository location and changeset), Buildroot can't carry hashes for
+those. It is however possible to xref:customize-hashes[provide a list of
+extra hashes] that can cover such cases.
+
 Hashes should only be added in +.hash+ files for files that are
 guaranteed to be stable. For example, patches auto-generated by Github
 are not guaranteed to be stable, and therefore their hashes can change
diff --git a/docs/manual/customize-patches.adoc b/docs/manual/customize-patches.adoc
index eb98d1bea2..72e87c3c04 100644
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
@@ -57,3 +59,23 @@ are available at a URL. *Note:* +BR2_LINUX_KERNEL_PATCH+ specifies kernel
 patches that are applied after patches available in +BR2_GLOBAL_PATCH_DIR+,
 as it is done from a post-patch hook of the Linux package.
 
+
+[[customize-hashes]]
+==== Providing extra hashes
+
+Buildroot bundles a xref:adding-packages-hash[list of hashes] against
+which it checks the integrity of the downloaded archives, or of those
+it generates locally from VCS checkouts. However, it can only do so
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
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index e5cd83d859..bf1c19e5ec 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -115,7 +115,7 @@ define DOWNLOAD
 		-d '$($(2)_DL_DIR)' \
 		-D '$(DL_DIR)' \
 		-f '$(notdir $(1))' \
-		-H '$($(2)_HASH_FILE)' \
+		$(foreach f,$($(2)_HASH_FILES),-H '$(f)') \
 		-n '$($(2)_BASENAME_RAW)' \
 		-N '$($(2)_RAWNAME)' \
 		-o '$($(2)_DL_DIR)/$(notdir $(1))' \
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6c24be7505..577a148c1e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -509,11 +509,15 @@ else
 endif
 $(2)_VERSION := $$(call sanitize,$$($(2)_DL_VERSION))
 
-$(2)_HASH_FILE = \
+$(2)_HASH_FILES = \
 	$$(strip \
-		$$(if $$(wildcard $$($(2)_PKGDIR)/$$($(2)_VERSION)/$$($(2)_RAWNAME).hash),\
-			$$($(2)_PKGDIR)/$$($(2)_VERSION)/$$($(2)_RAWNAME).hash,\
-			$$($(2)_PKGDIR)/$$($(2)_RAWNAME).hash))
+		$$(foreach d, $$($(2)_PKGDIR) $$(addsuffix /$$($(2)_RAWNAME), $$(call qstrip,$$(BR2_GLOBAL_PATCH_DIR))),\
+			$$(if $$(wildcard $$(d)/$$($(2)_VERSION)/$$($(2)_RAWNAME).hash),\
+				$$(d)/$$($(2)_VERSION)/$$($(2)_RAWNAME).hash,\
+				$$(d)/$$($(2)_RAWNAME).hash\
+			)\
+		)\
+	)
 
 ifdef $(3)_OVERRIDE_SRCDIR
   $(2)_OVERRIDE_SRCDIR ?= $$($(3)_OVERRIDE_SRCDIR)
@@ -1138,7 +1142,7 @@ ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 ifeq ($$(call qstrip,$$($(2)_LICENSE_FILES)),)
 	$(Q)$$(call legal-warning-pkg,$$($(2)_BASENAME_RAW),cannot save license ($(2)_LICENSE_FILES not defined))
 else
-	$(Q)$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$(call UPPERCASE,$(4)),$$($(2)_RAWNAME),$$($(2)_BASENAME_RAW),$$(F),$$($(2)_DIR)/$$(F),$$($(2)_HASH_FILE))$$(sep))
+	$(Q)$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$(call UPPERCASE,$(4)),$$($(2)_RAWNAME),$$($(2)_BASENAME_RAW),$$(F),$$($(2)_DIR)/$$(F),$$($(2)_HASH_FILES))$$(sep))
 endif # license files
 
 ifeq ($$($(2)_REDISTRIBUTE),YES)
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index b91061a572..059e86ae0a 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -280,7 +280,7 @@ define legal-manifest # {HOST|TARGET}, pkg, version, license, license-files, sou
 	echo '"$(2)","$(3)","$(4)","$(5)","$(6)","$(7)","$(8)"' >>$(LEGAL_MANIFEST_CSV_$(1))
 endef
 
-define legal-license-file # {HOST|TARGET}, pkgname, pkgname-pkgver, filename, file-fullpath, pkg-hashfile
+define legal-license-file # {HOST|TARGET}, pkgname, pkgname-pkgver, filename, file-fullpath, pkg-hashfiles
 	mkdir -p $(LICENSE_FILES_DIR_$(1))/$(3)/$(dir $(4)) && \
 	{ \
 		support/download/check-hash $(5) $(4) $(6); \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
