Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D01CC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 19:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45FE1611ED;
	Mon,  6 Nov 2023 19:09:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45FE1611ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OXH2NKqXKkUD; Mon,  6 Nov 2023 19:09:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 580E761187;
	Mon,  6 Nov 2023 19:09:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 580E761187
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E9B551BF3A1
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0871820B7
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0871820B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sd8kSNs4CYgG for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 19:09:18 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A57C181EE4
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 19:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A57C181EE4
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-32dc9ff4a8fso2789716f8f.1
 for <buildroot@buildroot.org>; Mon, 06 Nov 2023 11:09:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699297756; x=1699902556;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=N+zmjGcHD4qJBHhCRa/ZrdwoERYoCuh0PWZkdy9VJLU=;
 b=UAWa42R1UWmk3J74I0hqDVq7o2VoDih11FqoU+kr8vHHIHYU03MXf88cjiqdnTlCBp
 86kujabLxa+e8c8yX3hq78O7zCXC9mnjqDRigKJoJmXYpSM4a50mxjDjWmJp80EAUugp
 TxANzlo9ym+kNZWKio8eK8BC+ZTS1jOmKBp89A/O0AbeZ/e2fCaYjWxhanRhb61kkctf
 kkELlHlAZUqdCOMWry0A0j+oP2jfEia+5vb00Yq6K1Vji43uH2lu05+ale725njSK1zd
 CGWD1HNnR9+dgvAO5KgLBaa0cSuRGvnH6T8qo3ka/7Kc2lr2movOoktfzEF5cMBcLGEQ
 FunA==
X-Gm-Message-State: AOJu0YztUyLu7v1LP6ZI4lxA/KaetQtpc3lSLZ7jbSeq5kfnexxW1+lk
 QTvusGiI7PC7OS/vp77rUVVdO5ck3f4=
X-Google-Smtp-Source: AGHT+IHJUH7E7PGOl4eq6Uo1EjWgEPWg1on6Hs+do8RXBcpHO0LkYYPsaytWWXMvoYy1YHunkCnHgg==
X-Received: by 2002:a5d:684e:0:b0:32f:b4ab:8cb with SMTP id
 o14-20020a5d684e000000b0032fb4ab08cbmr7041605wrw.34.1699297756555; 
 Mon, 06 Nov 2023 11:09:16 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8290:3800:5023:65e3:22e2:e1cc])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a056000108e00b0032dbf6bf7a2sm330900wrw.97.2023.11.06.11.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 11:09:16 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon,  6 Nov 2023 20:09:14 +0100
Message-Id: <c4cb742e3bd2d4c18b6a21338167c17b50fe4986.1699297749.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1699297749.git.yann.morin.1998@free.fr>
References: <cover.1699297749.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699297756; x=1699902556; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N+zmjGcHD4qJBHhCRa/ZrdwoERYoCuh0PWZkdy9VJLU=;
 b=g1zm8hQRUVq1q9ALwc2Vkv1+4cwBAnFcd69fF0tyAjmX0ikmXmYeaQxocpBtbQfvsE
 XRpLgplMOfEhTs82TZ6nK7OpcnP6UryKYwXK85YlpJKIoOa4Rv5ULG4n1hCsYeZHs9ng
 BHAVIMdhk7Zl0igIHYcSw84ql9gx2bSEkajgGWr86SKXP5Xrmx2TiNAij8PIME3xxBZH
 65rlB5DiQ9dhaWPpwy5edBYrd8fgcihEmDlKXavMdQEDsZaN4OwE7TQnke38rwMwRhto
 dL1PA2pjkdALpnTWe0HAAASrxkQcmIak/iUnbcWhuEJxxwq+psJcZbSphFSXWYSlFY2O
 ilow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g1zm8hQR
Subject: [Buildroot] [PATCH 3/3 v2] pkg-download: add option to enforce hash
 checking
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

Currently, when a pacakge is downloaded from a custom location or
version, Buildroot excludes such a package from the mandatory integrity
check with hashes, because it was until now not possible to have such
hashes.

We now have a mechanism which users can leverage to provide additional
hashes, and so custom versions or locations can now be checked too.

Buildroot has no way to know that hashes have indeed been provided for
a custom location/version, and so will still happilly ignore an
unchecked package.

However, users who do provide extra hashes most probably do expect that
no download is done without an integrity check, and thus expect that a
missing hash not be ignored.

Add an option that users can select to make Buildroot forcibly require
at least one valid hash, and no invalid hash, for all downloads.

Reported-by: "Martin Zeiser (mzeiser)" <mzeiser@cisco.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in               | 17 +++++++++++++++++
 package/pkg-download.mk |  5 ++---
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/Config.in b/Config.in
index b344d0e80a..27f5deb16a 100644
--- a/Config.in
+++ b/Config.in
@@ -709,6 +709,23 @@ config BR2_FORCE_HOST_BUILD
 
 	  This option will increase build time.
 
+config BR2_DOWNLOAD_FORCE_CHECK_HASHES
+	bool "Force all downloads to have a valid hash"
+	depends on BR2_GLOBAL_PATCH_DIR != ""
+	help
+	  For packages where a custom version or location can be set,
+	  Buildroot does not carry a hash for those custom versions or
+	  locations, so the integrity of such downloads is not verified.
+
+	  Say 'y' here to enforce downloads to have at least one valid
+	  hash (and of course, that all hashes be valid).
+
+	  Those hashes are looked in files in BR2_GLOBAL_PATCH_DIR,
+	  see above.
+
+comment "Forcing all downloads to have a valid hash needs a global patch and hash directory"
+	depends on BR2_GLOBAL_PATCH_DIR = ""
+
 config BR2_REPRODUCIBLE
 	bool "Make the build reproducible (experimental)"
 	# SOURCE_DATE_EPOCH support in toolchain-wrapper requires GCC 4.4
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index bf1c19e5ec..30eeb6b1fc 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -66,9 +66,7 @@ github = https://github.com/$(1)/$(2)/archive/$(3)
 gitlab = https://gitlab.com/$(1)/$(2)/-/archive/$(3)
 
 # Expressly do not check hashes for those files
-# Exported variables default to immediately expanded in some versions of
-# make, but we need it to be recursively-epxanded, so explicitly assign it.
-export BR_NO_CHECK_HASH_FOR =
+BR_NO_CHECK_HASH_FOR =
 
 ################################################################################
 # DOWNLOAD_URIS - List the candidates URIs where to get the package from:
@@ -110,6 +108,7 @@ endif
 define DOWNLOAD
 	$(Q)mkdir -p $($(2)_DL_DIR)
 	$(Q)$(EXTRA_ENV) $($(2)_DL_ENV) \
+	BR_NO_CHECK_HASH_FOR="$(if $(BR2_DOWNLOAD_FORCE_CHECK_HASHES),,$(BR_NO_CHECK_HASH_FOR))" \
 		flock $($(2)_DL_DIR)/.lock $(DL_WRAPPER) \
 		-c '$($(2)_DL_VERSION)' \
 		-d '$($(2)_DL_DIR)' \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
