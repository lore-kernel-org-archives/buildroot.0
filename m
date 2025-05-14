Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD3BC3ABDD
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 16:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A06B1839B8;
	Wed, 14 May 2025 16:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mccAYR2coVHx; Wed, 14 May 2025 16:58:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B65208399E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B65208399E;
	Wed, 14 May 2025 16:58:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CF71212A
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B550F60A8A
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KZs-J_dLwzRl for <buildroot@buildroot.org>;
 Wed, 14 May 2025 16:58:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BFB6E606CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFB6E606CB
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BFB6E606CB
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:33 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-441c99459e9so253695e9.3
 for <buildroot@buildroot.org>; Wed, 14 May 2025 09:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747241912; x=1747846712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=I2xgW0SNB7BEY52SslHQxoKZkvkm/7PhKsNbO6ZwN8w=;
 b=FYp3avoqEsJnnHBM7rNiZZlyUVLGNbQSeKDrmPtYunv8QvqjijPWag7FCxqNvRSWSF
 ccOwcf89wG+zTXQkqwFM2+exlf5BBeIxz4Ixcz0drjgKXfxlHsbQg06BXMOobH8lBVX5
 2c4ON5nwG6bQSPhaiJwQUTjpoD0zokCjg0cH1EEKt8Lxc0mzE7UlIVrzY1HwareHmYAe
 OX2VjDQB0HvwsQF22i0doUVYXi3wbcBMkcg5Y0WagA2ieO3w9O18vPEI7XnXxg5QgRhM
 yG/IO2dDrzKikzkO9v38y/B0SlSIo+SoZDDQqx05Sg7l1GvRQIFJd99o4c1DN7o9t0Sb
 iTNQ==
X-Gm-Message-State: AOJu0YyjiC3GdxGcIH/QYE2otRtXNoctbs5ZPzAe8WvwrPnQSzlbXx0J
 +hVT9R4UwE8Rac28sED5+FixhU3a7nQ5RtVRYL5tQlXsdSadBj1cSPbcwg==
X-Gm-Gg: ASbGncusSEuJnO/r2if40Yax6KwSBu7gjsQXprHfz2VOyOV/bFOdOH0V79jgpzCcJZl
 NqP5HxGUgJBJXfaSQmAC/VqTQTabQWVMlCFRPnAXi9VluHRyrDxIv3Y09yeyFYg0TB3jlQSxFW+
 kbq3VuR7jhKWmJWyvXAp5YDLMcwoqF22+WRh+18cWptHsrarvP/Zd24qas1VzhWYCfVvy/zgV1U
 Cr3JAOiAJ8o+T2cGLIBObHtBW5BucLmgGyLw5oLI0jRiqfvbccplhBdR+eVDWUSCpQf6kePDpL2
 H8PlXVC005D5CWjWtnFhoNcIeTBZszgm+C/Eg3k6piRbXcf21wABx10xUE+DXA==
X-Google-Smtp-Source: AGHT+IEKDjbM3grkg7nOET+7lWOnKqVZBc+O4nsP4tQ83ITfHAtBvMpNP5lhx1142eUjp7QNneziDQ==
X-Received: by 2002:a05:600c:524c:b0:43b:c95f:fd9 with SMTP id
 5b1f17b1804b1-442f20baa38mr37338575e9.5.1747241911495; 
 Wed, 14 May 2025 09:58:31 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3951494sm39815585e9.22.2025.05.14.09.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 09:58:31 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed, 14 May 2025 18:58:20 +0200
Message-ID: <200097a3e73767c60f2633b2f46fccb22c161698.1747241900.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1747241900.git.yann.morin.1998@free.fr>
References: <cover.1747241900.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747241912; x=1747846712; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I2xgW0SNB7BEY52SslHQxoKZkvkm/7PhKsNbO6ZwN8w=;
 b=bXIymIo5NDDuaAs3ZEoop/yKJicNCxYyz1Nr38pZpgyXyBWsuMNWNYCpYUq+wnTN0b
 DkaL4Pm81b5l3TzeFaWpYWeNj9+7VI0IBq5F+YK+GbWT+CQC96305g2M/RBZAqiepZtP
 DW0qapYUtGIMOFts2zpMdhwMOt6PHnrLQ3QHpoTiWJ3d8XGQ1dm2R7oeaReSBKMRriB9
 PtBGUYUD8h/qao/kUwEXsqfk3zLSHyHqnvhOfnK/Sy5/hzVMrtvvIA3jU1dIwheZJjwR
 p4rxwwhk5eiU3smWk7vqNHwFph6EpMYoJrSLhSG8yOjelSU13n8pgtk9c/e3/YUf/Lfb
 Ka8w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bXIymIo5
Subject: [Buildroot] [PATCH 08/13] system: add support for merged /usr/sbin
 (aka merged-bin)
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

Starting with version 256 [0], systemd warns when /usr/bin and /usr/sbin
are different directories; in the future, it may even refuse to boot in
such a situation.

Add support for merged-bin, not unlike we have support for merged-usr;
we also make merged-bin a sub-case of merged-usr (i.e. it is not
possible to do merged-bin without merged-usr).

[0] https://github.com/systemd/systemd/blob/v256/NEWS#L265

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Makefile                                   |  1 +
 package/skeleton-custom/skeleton-custom.mk |  3 ++-
 support/scripts/check-merged               |  5 ++++-
 system/Config.in                           | 11 +++++++++++
 system/skeleton/usr/sbin/.empty            |  0
 system/system.mk                           | 11 +++++++++++
 6 files changed, 29 insertions(+), 2 deletions(-)
 delete mode 100644 system/skeleton/usr/sbin/.empty

diff --git a/Makefile b/Makefile
index 1248dfb9e0..477179dd64 100644
--- a/Makefile
+++ b/Makefile
@@ -786,6 +786,7 @@ endif
 			support/scripts/check-merged \
 			$(d) \
 			$(if $(BR2_ROOTFS_MERGED_USR),merged-usr) \
+			$(if $(BR2_ROOTFS_MERGED_SBIN),merged-bin) \
 		)"; \
 		test -n "$$not_merged_dirs" && { \
 			echo "ERROR: The overlay in $(d) is not" \
diff --git a/package/skeleton-custom/skeleton-custom.mk b/package/skeleton-custom/skeleton-custom.mk
index e583d2d731..7f9f10b81d 100644
--- a/package/skeleton-custom/skeleton-custom.mk
+++ b/package/skeleton-custom/skeleton-custom.mk
@@ -29,12 +29,13 @@ SKELETON_CUSTOM_NOT_MERGED_USR_DIRS = \
 	$(shell support/scripts/check-merged \
 		$(SKELETON_CUSTOM_PATH) \
 		$(if $(BR2_ROOTFS_MERGED_USR),merged-usr) \
+		$(if $(BR2_ROOTFS_MERGED_SBIN),merged-bin) \
 	)
 
 ifeq ($(BR2_PACKAGE_SKELETON_CUSTOM)$(BR_BUILDING),yy)
 ifneq ($(SKELETON_CUSTOM_NOT_MERGED_USR_DIRS),)
 $(error The custom skeleton in $(SKELETON_CUSTOM_PATH) is not \
-	using a merged /usr for the following directories: \
+	using a merged structuren for the following directories: \
 	$(SKELETON_CUSTOM_NOT_MERGED_USR_DIRS))
 endif
 endif
diff --git a/support/scripts/check-merged b/support/scripts/check-merged
index 7fea4e1dea..0e51c032c5 100755
--- a/support/scripts/check-merged
+++ b/support/scripts/check-merged
@@ -11,7 +11,7 @@
 #
 # Input:
 #   $1:     the root directory (skeleton, overlay) to check
-#   $*:     the list of merged checks to perform: merged-usr
+#   $*:     the list of merged checks to perform: merged-usr, merged-bin
 # Output:
 #   stdout: the list of non-compliant paths (empty if compliant).
 #
@@ -55,6 +55,9 @@ for what; do
 			test_merged "${root}" "/bin" "/usr/bin"
 			test_merged "${root}" "/sbin" "/usr/sbin"
 		;;
+		(merged-bin)
+			test_merged "${root}" "/usr/sbin" "/usr/bin"
+		;;
 		(*)
 			printf 'Error: unknown type of test %s\n' "${what}"
 		;;
diff --git a/system/Config.in b/system/Config.in
index 2f42e5ddf9..5007f101e2 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -342,6 +342,16 @@ config BR2_ROOTFS_MERGED_USR
 	  symlinks to their counterparts in /usr. In this case, /usr can
 	  not be a separate filesystem.
 
+config BR2_ROOTFS_MERGED_SBIN
+	bool "Merged /usr/sbin"
+	depends on BR2_ROOTFS_MERGED_USR
+	help
+	  If you say 'n' here, then /usr/bin and /usr/sbin will be
+	  separate directories; this is the historical UNIX way.
+
+	  If you say 'y' here, then /usr/sbin will be a relative
+	  symlink to /usr/bin.
+
 if BR2_ROOTFS_SKELETON_DEFAULT
 
 config BR2_TARGET_ENABLE_ROOT_LOGIN
@@ -528,6 +538,7 @@ endif # BR2_ROOTFS_SKELETON_DEFAULT
 
 config BR2_SYSTEM_DEFAULT_PATH
 	string "Set the system's default PATH"
+	default "/usr/bin" if BR2_ROOTFS_MERGED_SBIN
 	default "/usr/bin:/usr/sbin" if BR2_ROOTFS_MERGED_USR
 	default "/bin:/sbin:/usr/bin:/usr/sbin"
 	help
diff --git a/system/skeleton/usr/sbin/.empty b/system/skeleton/usr/sbin/.empty
deleted file mode 100644
index e69de29bb2..0000000000
diff --git a/system/system.mk b/system/system.mk
index 8fe2c138b0..530b26c162 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -34,16 +34,27 @@
 
 # This function handles the merged or non-merged /usr cases
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
+ifeq ($(BR2_ROOTFS_MERGED_SBIN),y)
+define SYSTEM_SBIN_SYMLINKS_OR_DIRS
+	ln -snf bin $(1)/usr/sbin
+endef
+else
+define SYSTEM_SBIN_SYMLINKS_OR_DIRS
+	$(INSTALL) -d -m 0755 $(1)/usr/sbin
+endef
+endif
 define SYSTEM_USR_SYMLINKS_OR_DIRS
 	ln -snf usr/bin $(1)/bin
 	ln -snf usr/sbin $(1)/sbin
 	ln -snf usr/lib $(1)/lib
+	$(SYSTEM_SBIN_SYMLINKS_OR_DIRS)
 endef
 else
 define SYSTEM_USR_SYMLINKS_OR_DIRS
 	$(INSTALL) -d -m 0755 $(1)/bin
 	$(INSTALL) -d -m 0755 $(1)/sbin
 	$(INSTALL) -d -m 0755 $(1)/lib
+	$(INSTALL) -d -m 0755 $(1)/usr/sbin
 endef
 endif
 
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
