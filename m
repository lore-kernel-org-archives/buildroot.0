Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1563BC3F6B0
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 22:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8204C415D8;
	Wed, 27 Jul 2022 22:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8204C415D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FbZmNMk0N-t3; Wed, 27 Jul 2022 22:11:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C2B3414C0;
	Wed, 27 Jul 2022 22:11:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C2B3414C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5FF5B1BF47F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 22:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AC6D409DA
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 22:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AC6D409DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jQCM490d1Axg for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 22:11:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01E2D40469
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01E2D40469
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 22:11:00 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id j70so387371oih.10
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DZ5a7bslJA+i5DJQoNii2kYpCieRCLvT4wfpkw8fE3o=;
 b=YdR7hDbIf7DjlKMDDPXxcpXG/InSSWPp++IK/qz8Zjuudg/M/x6UUCMGaMov5dKTZg
 Lof+hSpZhXiQ5kPyYXqOsZvr2jsbo65tMsr9zAUfvD18k9TWo2rkB1TSxHcsu41LeAdc
 VHbKu6NEoe2bCkmfW8GXfRIchoJEkBoR+IR70cvjJwmtqOdqIOowvaVuvECiLVgKzSYE
 t9N5euRLyMzAQDGy8xonNt7zYqZ72DBS1Yd+PLQINB27h7CkJTVW/bqRERv26OQKaHMv
 F5UY1eVhOwapA/SVyg9z5mN3jpStnJeaoWcy2i89hvWfDjawmYh3DcR5TOcOzClSrU0X
 RQfQ==
X-Gm-Message-State: AJIora9ag9GQ+8bBdf6YOyZeyTLB4jwt44mdVwAAJbszz/e5W5N1bWw0
 0BLyRLDE3IKyF5yMOjCIOdD8cW39a8bz7w==
X-Google-Smtp-Source: AGRyM1u02HTXKyn0PH4628yXbFkPQxkJy0+frB/fKX5uRNfB93/UX1FYDW70l9PwZxPIfq+KnaylnQ==
X-Received: by 2002:a54:4188:0:b0:33a:7b18:6eb8 with SMTP id
 8-20020a544188000000b0033a7b186eb8mr2948884oiy.234.1658959859698; 
 Wed, 27 Jul 2022 15:10:59 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 q8-20020a4ae648000000b0043540f7701esm7676969oot.31.2022.07.27.15.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 15:10:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 16:10:55 -0600
Message-Id: <20220727221055.1838031-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DZ5a7bslJA+i5DJQoNii2kYpCieRCLvT4wfpkw8fE3o=;
 b=OKb40FkCR1oz93ZQO8PFv34R9mAQUpy0QYzY5MeZO4zZG0UySwyTlu+IMuaxib+f3O
 FSfyUWEoji5fIHHj7iMktGOIdWlEubK32+6GNf7z6EqdlL0PY/de80ghTNr7zByCM9Ir
 qUv2qvgeqtZyUg1P1x/gZ9O4EqzkBW49q5Tx0DvjTMK1Jl9rxaXWKqv+grcahMAH24Kh
 m6bGYOTt29L198jSyibj14O4AXuzKI6+rzprfq3wtYgvnPW9oRYceKm3Uz9ZgE15HULg
 BgiQ/TcgvxA1fVBMFekTUd+HyETNFLPswrt1wJFB9Td+zqNmXahonh5RDlI1gu2w8686
 2ZVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OKb40FkC
Subject: [Buildroot] [PATCH 1/1] package/systemd: use statically linked host
 tools
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
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This lets us remove the HOST_SYSTEMD_FIX_RPATH hack.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...nalctl-allow-statically-linked-build.patch | 68 +++++++++++++++++++
 package/systemd/systemd.mk                    | 28 +++-----
 2 files changed, 76 insertions(+), 20 deletions(-)
 create mode 100644 package/systemd/0002-journalctl-allow-statically-linked-build.patch

diff --git a/package/systemd/0002-journalctl-allow-statically-linked-build.patch b/package/systemd/0002-journalctl-allow-statically-linked-build.patch
new file mode 100644
index 0000000000..98ffb72cca
--- /dev/null
+++ b/package/systemd/0002-journalctl-allow-statically-linked-build.patch
@@ -0,0 +1,68 @@
+From d2dadbdc5618776e07e98baf8795cc8adebf05a1 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Wed, 27 Jul 2022 15:28:09 -0600
+Subject: [PATCH] journalctl: allow statically linked build
+
+The journalctl tool may be needed on cross compilation hosts in order
+to run --update-catalog against a target rootfs.
+
+To avoid reliability issues caused by shared linking allow journalctl
+to be linked statically.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/systemd/systemd/pull/24140]
+---
+ meson.build       | 11 ++++++++++-
+ meson_options.txt |  2 ++
+ 2 files changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 692ee1ed4d..8cce19dce6 100644
+--- a/meson.build
++++ b/meson.build
+@@ -2263,11 +2263,19 @@ public_programs += executable(
+         install_rpath : rootpkglibdir,
+         install : true)
+ 
++if get_option('link-journalctl-shared')
++        journalctl_link_with = [libshared]
++else
++        journalctl_link_with = [libsystemd_static,
++                                libshared_static,
++                                libbasic_gcrypt]
++endif
++
+ public_programs += executable(
+         'journalctl',
+         journalctl_sources,
+         include_directories : includes,
+-        link_with : [libshared],
++        link_with : [journalctl_link_with],
+         dependencies : [threads,
+                         libdl,
+                         libxz,
+@@ -4357,6 +4365,7 @@ foreach tuple : [
+         ['link-systemctl-shared', get_option('link-systemctl-shared')],
+         ['link-networkd-shared',  get_option('link-networkd-shared')],
+         ['link-timesyncd-shared', get_option('link-timesyncd-shared')],
++        ['link-journalctl-shared',get_option('link-journalctl-shared')],
+         ['link-boot-shared',      get_option('link-boot-shared')],
+         ['first-boot-full-preset'],
+         ['fexecve'],
+diff --git a/meson_options.txt b/meson_options.txt
+index 628ca1d797..d8c0c581c2 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -25,6 +25,8 @@ option('link-networkd-shared', type: 'boolean',
+        description : 'link systemd-networkd and its helpers to libsystemd-shared.so')
+ option('link-timesyncd-shared', type: 'boolean',
+        description : 'link systemd-timesyncd and its helpers to libsystemd-shared.so')
++option('link-journalctl-shared', type: 'boolean',
++       description : 'link journalctl against libsystemd-shared.so')
+ option('link-boot-shared', type: 'boolean',
+        description : 'link bootctl and systemd-bless-boot against libsystemd-shared.so')
+ option('first-boot-full-preset', type: 'boolean', value: false,
+-- 
+2.34.1
+
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 47aaddf849..13348f9358 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -738,7 +738,7 @@ endef
 SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_RM_CATALOG_UPDATE_SERVICE
 
 define SYSTEMD_CREATE_TMPFILES_HOOK
-	HOST_SYSTEMD_TMPFILES=$(HOST_DIR)/bin/systemd-tmpfiles \
+	HOST_SYSTEMD_TMPFILES=$(HOST_DIR)/bin/systemd-tmpfiles.standalone \
 		$(SYSTEMD_PKGDIR)/fakeroot_tmpfiles.sh $(TARGET_DIR)
 endef
 SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_CREATE_TMPFILES_HOOK
@@ -781,6 +781,13 @@ HOST_SYSTEMD_CONF_OPTS = \
 	--libdir=lib \
 	--sysconfdir=/etc \
 	--localstatedir=/var \
+	-Dlink-udev-shared=false \
+	-Dlink-systemctl-shared=false \
+	-Dlink-networkd-shared=false \
+	-Dlink-timesyncd-shared=false \
+	-Dlink-journalctl-shared=false \
+	-Dlink-boot-shared=false \
+	-Dstandalone-binaries=true \
 	-Dmode=release \
 	-Dutmp=false \
 	-Dhibernate=false \
@@ -854,24 +861,5 @@ HOST_SYSTEMD_DEPENDENCIES = \
 
 HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
 
-# Fix RPATH After installation
-# * systemd provides a install_rpath instruction to meson because the binaries
-#   need to link with libsystemd which is not in a standard path
-# * meson can only replace the RPATH, not append to it
-# * the original rpath is thus lost.
-# * the original path had been tweaked by buildroot via LDFLAGS to add
-#   $(HOST_DIR)/lib
-# * thus re-tweak rpath after the installation for all binaries that need it
-HOST_SYSTEMD_HOST_TOOLS = busctl journalctl systemctl systemd-* udevadm
-
-define HOST_SYSTEMD_FIX_RPATH
-	for f in $(addprefix $(HOST_DIR)/bin/,$(HOST_SYSTEMD_HOST_TOOLS)); do \
-		[ -e $$f ] || continue; \
-		$(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib:$(HOST_DIR)/lib/systemd $${f} \
-		|| exit 1; \
-	done
-endef
-HOST_SYSTEMD_POST_INSTALL_HOOKS += HOST_SYSTEMD_FIX_RPATH
-
 $(eval $(meson-package))
 $(eval $(host-meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
