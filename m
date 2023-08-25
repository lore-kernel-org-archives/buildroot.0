Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97714C83F04
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 22:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E243041D64;
	Fri, 25 Aug 2023 22:49:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E243041D64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3HpSu3cGLcLM; Fri, 25 Aug 2023 22:49:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A534442035;
	Fri, 25 Aug 2023 22:49:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A534442035
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6CE4C1BF36F
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 22:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44FD160BE9
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 22:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44FD160BE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8CFPAfsssxOo for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 22:49:36 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 227FD60BE8
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 22:49:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 227FD60BE8
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-34b4b2608e3so5019235ab.3
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 15:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693003775; x=1693608575;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g1z/cN/1mQpskzJtCU4sXIfG6Un6vLmKrUs88DOYZKM=;
 b=RIcyqZ5idQGndpC59dGIZYNhroftPb5JUR5cqpVJ8lnLugCF+gnTJGB0DRN+DFDf+y
 71f603VtVxlj/NSCWolgTVgeGfnHzu7qfHHSap968aaGgfClGilfYxW6AkuvirHIsg32
 MnB3eqgSLHPP+vDCR6DombSawmKOyfsBPgkx98B5WAPoFdXlzNUyeGFQkkRE1EHCxUeX
 vskqGrsIRe8Izz2sK1I6qUSvQYOmGqPWgGGz7PdRU86sKF3pUZJ7X49QqmxKqrgDBvm8
 HQrOrGaurXVxn/CbdCIhV5SYyjEJ7gxETfuQcfdHhgaY/ffm3uubg5ZVSUefGLkC8WlJ
 beTA==
X-Gm-Message-State: AOJu0YxQc+wPyxwNsA7IrX/9AJTHIrOO35oQc3NIsyFC7wONH/6MVaL/
 JYIcLpeKFD83UwVyGaYmmP5X9EaGtQE=
X-Google-Smtp-Source: AGHT+IHPjp8Ua9dPrQeFMaCR203J07bCpyA4zbSxvXB1DAEMNkPOVE1KZbciBBj6TycZXF45/ZaaDQ==
X-Received: by 2002:a92:ce01:0:b0:345:3378:4251 with SMTP id
 b1-20020a92ce01000000b0034533784251mr8870289ilo.23.1693003774700; 
 Fri, 25 Aug 2023 15:49:34 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-15.hlrn.qwest.net.
 [97.118.146.15]) by smtp.gmail.com with ESMTPSA id
 x12-20020a92d64c000000b00348abdfad8esm798224ilp.32.2023.08.25.15.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 15:49:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 16:49:11 -0600
Message-Id: <20230825224911.3336831-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693003775; x=1693608575;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g1z/cN/1mQpskzJtCU4sXIfG6Un6vLmKrUs88DOYZKM=;
 b=bUZgKQZP3Kg48V7+edORUG4M0KUDzO6+bGgGo5NuN0bWnIfc4AmE4V/pJlKEpmg+HO
 Uh60LM0hdt0DDZugKjnoDtHjdl1R7VLW6IbbQF8AegTn+cVQyzx7xn9lRqHt9+mLfKfU
 u91EjhghPqVUEV8tmWYzDUJtF7fXjCw6+OwHJ3xFSkYyZMw5YDXQtCwpiCQZVnHaPo6l
 MB1YvAuPuWArv4Zi6DsotCpREQoHoUE95lS+Rf0wcylH1xcNWkigDGCuRnPXZm1Xs/w3
 YaWoOInsYrqVmVz46clFZ7VMjdkUhRt8FV14wp7o/LIAmbJPE3/x6coDsTja8sFrS0UK
 Ws4g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=bUZgKQZP
Subject: [Buildroot] [PATCH 1/1] package/qemu: bump to version 8.1.0
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
Cc: Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...tall-keyboard-maps-only-if-necessary.patch | 38 -------------------
 package/qemu/qemu.hash                        |  2 +-
 package/qemu/qemu.mk                          |  8 ++--
 3 files changed, 5 insertions(+), 43 deletions(-)
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
index b341d0220d..84166958bb 100644
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
@@ -272,7 +272,7 @@ define QEMU_CONFIGURE_CMDS
 			--prefix=/usr \
 			--cross-prefix=$(TARGET_CROSS) \
 			--audio-drv-list= \
-			--meson=$(HOST_DIR)/bin/meson \
+			--python=$(HOST_DIR)/bin/python3 \
 			--ninja=$(HOST_DIR)/bin/ninja \
 			--disable-alsa \
 			--disable-bpf \
@@ -313,7 +313,7 @@ define QEMU_CONFIGURE_CMDS
 			--enable-attr \
 			--enable-kvm \
 			--enable-vhost-net \
-			--with-git-submodules=ignore \
+			--disable-download \
 			--disable-hexagon-idef-parser \
 			$(QEMU_OPTS)
 endef
@@ -458,7 +458,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--host-cc="$(HOSTCC)" \
 		--extra-cflags="$(HOST_QEMU_CFLAGS)" \
 		--extra-ldflags="$(HOST_LDFLAGS)" \
-		--meson=$(HOST_DIR)/bin/meson \
+		--python=$(HOST_DIR)/bin/python3 \
 		--ninja=$(HOST_DIR)/bin/ninja \
 		--disable-alsa \
 		--disable-bpf \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
