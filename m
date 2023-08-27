Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65A4C83F01
	for <buildroot@archiver.kernel.org>; Sun, 27 Aug 2023 17:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DFBD81E34;
	Sun, 27 Aug 2023 17:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DFBD81E34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p91LCg7-3Y0f; Sun, 27 Aug 2023 17:48:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83C2C81E79;
	Sun, 27 Aug 2023 17:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83C2C81E79
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 206211BF599
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 17:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05FF560E3B
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 17:48:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05FF560E3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0OJVcs-Vb09V for <buildroot@lists.busybox.net>;
 Sun, 27 Aug 2023 17:48:10 +0000 (UTC)
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E57BD60E31
 for <buildroot@buildroot.org>; Sun, 27 Aug 2023 17:48:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E57BD60E31
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-7927f84525dso70195039f.0
 for <buildroot@buildroot.org>; Sun, 27 Aug 2023 10:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693158488; x=1693763288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G14EKLFgmaIt6eQRzdayFqcIidvbrl5I32BCby0JGYk=;
 b=Ep0Nadvmu1WEYlB2GUat59a1GAXRKuDWmU2q4H1N2QMIWWePXOHX8URfE8KuAiF7Uh
 TQnp9dHZcB4cUYB/CFDo1YsfzqiT2bl/He+ULKdFh64LgMZSdq4wXkSx18Cx02NUV6Er
 fpCWhWpcPNwF3TckMkSoIAez8makukbVe+igb2SEUWnzlEjzPp/ttH9t2U8zK0VpHwLl
 0/MH6eM/RQ3f2/TU7yOaYwM/xXgrRRdGz3Ulv2ih62dhc8O3oe1Fs/KHEgGZt0E2FMdI
 bkWLZSTiUswvfFb6ciKNv4OG1ZI5xMbx8W86A8fFJJhvkTvqoIDEfrfYr+wS/SvM0PNl
 agYA==
X-Gm-Message-State: AOJu0YxZFTVVr2meC16pj5OoxVl5j4SAcWYRXJB0ytvCHpnVklFr41iU
 BoX9JYi83Aq9h9e1B7PMUMN8rxRN8VM=
X-Google-Smtp-Source: AGHT+IHIp2KOQ5SLDHRuOW+uhKyO+hVuk/WfJU03b2TVVXyzDihtF19Cjp28GlTz9RYMcHICzLleRQ==
X-Received: by 2002:a5e:d90a:0:b0:791:acd7:233f with SMTP id
 n10-20020a5ed90a000000b00791acd7233fmr14175092iop.15.1693158488012; 
 Sun, 27 Aug 2023 10:48:08 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-15.hlrn.qwest.net.
 [97.118.146.15]) by smtp.gmail.com with ESMTPSA id
 m5-20020a6bf305000000b0076c569c7a48sm1934525ioh.39.2023.08.27.10.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Aug 2023 10:48:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Aug 2023 11:48:01 -0600
Message-Id: <20230827174801.935111-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230827174801.935111-1-james.hilliard1@gmail.com>
References: <20230827174801.935111-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693158488; x=1693763288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G14EKLFgmaIt6eQRzdayFqcIidvbrl5I32BCby0JGYk=;
 b=XLgJLIiZsbH5UjmYjj/62kTZGorNIGAHd1/qwLBKgB2gcXypzzabkZ2wS7O3inWs+l
 GAVy/14psXWjGRUyCs5Ykwkm2/ajhAtczI/l+CUZnNzOmVzAGGkg/9TiesU0uJXki/k+
 VajU7Lygv9+0reJ0Y2cA4hNolmtDTmp/hpqqkvzWFkdOUROk5uFIhduA6g9j4vorVeDC
 gdn09FP1YfFoHQn6I0sEhum16PPhTdy42n1lQ4ETUkLZ5LyaxzWVleppqqEZvmzeBUrW
 ju2vOIZyPASQZ4OXVs+WyyzL/Cb7DkMdERhklCpZ8JRI6tOf1InAcKvY2vLdMxOu6Ga3
 Z9Mg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=XLgJLIiZ
Subject: [Buildroot] [PATCH v2 2/2] package/qemu: bump to version 8.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch which is now upstream.

Replace no longer supported --with-git-submodules config option with
new --disable-download option.

Replace no longer supported --meson config option with --python config
option. The configure script expects --python to point to the python
interpreter with the meson installation.

Add new recommended host-python-distlib dependency.

Add support for new optional pipewire feature.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - handle new pipewire config option
  - add host-python-distlib dependency
---
 ...tall-keyboard-maps-only-if-necessary.patch | 38 -------------------
 package/qemu/qemu.hash                        |  2 +-
 package/qemu/qemu.mk                          | 18 +++++++--
 3 files changed, 15 insertions(+), 43 deletions(-)
 delete mode 100644 package/qemu/0003-meson-install-keyboard-maps-only-if-necessary.patch

diff --git a/package/qemu/0003-meson-install-keyboard-maps-only-if-necessary.patch b/package/qemu/0003-meson-install-keyboard-maps-only-if-necessary.patch
deleted file mode 100644
index 8ba7f3cf15..0000000000
--- a/package/qemu/0003-meson-install-keyboard-maps-only-if-necessary.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 9d9b74f806f5dbca53df6630c1a0591eaedd4500 Mon Sep 17 00:00:00 2001
-From: Carlos Santos <casantos@redhat.com>
-Date: Sun, 1 Jan 2023 21:00:57 -0300
-Subject: [PATCH] meson: install keyboard maps only if necessary
-
-They are required only for system emulation (i.e. have_system is true).
-
-Upstream: https://patchwork.kernel.org/project/qemu-devel/patch/20230327172147.196607-1-casantos@redhat.com/
-Signed-off-by: Carlos Santos <casantos@redhat.com>
-Signed-off-by: Carlos Santos <unixmania@gmail.com>
----
- pc-bios/keymaps/meson.build | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
-index 158a3b410c..bff3083313 100644
---- a/pc-bios/keymaps/meson.build
-+++ b/pc-bios/keymaps/meson.build
-@@ -47,7 +47,7 @@ if native_qemu_keymap.found()
-                        build_by_default: true,
-                        output: km,
-                        command: [native_qemu_keymap, '-f', '@OUTPUT@', args.split()],
--                       install: true,
-+                       install: have_system,
-                        install_dir: qemu_datadir / 'keymaps')
-   endforeach
- 
-@@ -56,4 +56,6 @@ else
-   install_data(keymaps.keys(), install_dir: qemu_datadir / 'keymaps')
- endif
- 
--install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
-+if have_system
-+  install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
-+endif
--- 
-2.31.1
-
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index e71742c243..506afa8bf3 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  ecf4d32cbef9d397bfc8cc50e4d1e92a1b30253bf32e8ee73c7a8dcf9a232b09  qemu-8.0.3.tar.xz
+sha256  710c101198e334d4762eef65f649bc43fa8a5dd75303554b8acfec3eb25f0e55  qemu-8.1.0.tar.xz
 sha256  6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index b341d0220d..47190a63d1 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, check whether the list of supported targets
 # needs to be updated.
-QEMU_VERSION = 8.0.3
+QEMU_VERSION = 8.1.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = https://download.qemu.org
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
@@ -26,6 +26,7 @@ QEMU_DEPENDENCIES = \
 	host-meson \
 	host-pkgconf \
 	host-python3 \
+	host-python-distlib \
 	libglib2 \
 	zlib
 
@@ -234,6 +235,13 @@ else
 QEMU_OPTS += --disable-numa
 endif
 
+ifeq ($(BR2_PACKAGE_PIPEWIRE),y)
+QEMU_OPTS += --enable-pipewire
+QEMU_DEPENDENCIES += pipewire
+else
+QEMU_OPTS += --disable-pipewire
+endif
+
 ifeq ($(BR2_PACKAGE_SPICE),y)
 QEMU_OPTS += --enable-spice
 QEMU_DEPENDENCIES += spice
@@ -272,7 +280,7 @@ define QEMU_CONFIGURE_CMDS
 			--prefix=/usr \
 			--cross-prefix=$(TARGET_CROSS) \
 			--audio-drv-list= \
-			--meson=$(HOST_DIR)/bin/meson \
+			--python=$(HOST_DIR)/bin/python3 \
 			--ninja=$(HOST_DIR)/bin/ninja \
 			--disable-alsa \
 			--disable-bpf \
@@ -313,7 +321,7 @@ define QEMU_CONFIGURE_CMDS
 			--enable-attr \
 			--enable-kvm \
 			--enable-vhost-net \
-			--with-git-submodules=ignore \
+			--disable-download \
 			--disable-hexagon-idef-parser \
 			$(QEMU_OPTS)
 endef
@@ -339,6 +347,7 @@ HOST_QEMU_DEPENDENCIES = \
 	host-pixman \
 	host-pkgconf \
 	host-python3 \
+	host-python-distlib \
 	host-slirp \
 	host-zlib
 
@@ -458,7 +467,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--host-cc="$(HOSTCC)" \
 		--extra-cflags="$(HOST_QEMU_CFLAGS)" \
 		--extra-ldflags="$(HOST_LDFLAGS)" \
-		--meson=$(HOST_DIR)/bin/meson \
+		--python=$(HOST_DIR)/bin/python3 \
 		--ninja=$(HOST_DIR)/bin/ninja \
 		--disable-alsa \
 		--disable-bpf \
@@ -476,6 +485,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--disable-netmap \
 		--disable-oss \
 		--disable-pa \
+		--disable-pipewire \
 		--disable-sdl \
 		--disable-selinux \
 		--disable-vde \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
