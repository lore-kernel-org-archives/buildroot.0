Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC6AE668A4
	for <buildroot@archiver.kernel.org>; Sun, 24 Nov 2024 10:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A180680D1D;
	Sun, 24 Nov 2024 10:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id txFCRplEfhrE; Sun, 24 Nov 2024 10:50:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1C4380D29
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1C4380D29;
	Sun, 24 Nov 2024 10:50:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E18231
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 10:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E371180D1D
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 10:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hQEp9mwBG7ky for <buildroot@buildroot.org>;
 Sun, 24 Nov 2024 10:50:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7F50680D29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F50680D29
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F50680D29
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 10:50:08 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43497839b80so5454145e9.2
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 02:50:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732445406; x=1733050206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gomyoMGDruhf+6ikZdDp/SAg3DZ4dSY0Yp34ul6vc0s=;
 b=AEbI0SiUuLq815UhMhHGBmxeHYF1gQJWbjov0gx7Tt5EcZXvM/3OAhVB4sGtti/B5V
 bXDMKrPfwNaWFRgGA0p3jaOJYjfWKr2PYavo52x8SHBe4XRU7CHqnhLqx2q8Ryu+YLRV
 QzAjd/ehuKqLuB+ZbeG0HNAlUJqUBHhP0Cf2f18RoRmYSVQm8P3+Xs4bZBgfVZXpfgAc
 A5RRY/3BQy4gYt/FEkn2q9MySgELhcastTehHXwrSil9SZTRBMhQVpjMKHKHporOBSED
 C+ub/M65OiA/vPVYH+eyLC4Q8phXtL+jQOR6B1C7o3UgYYtdqD3TOnxhgzpmSn5Wyh9k
 5eBg==
X-Gm-Message-State: AOJu0YzID7tqdmdG0GSZzjXFyf1S0T7lpCSJqIaUvSmnJzPm/mY5wVpw
 HfmyI6zwsNRhV3UVDwRoIokJ63reF+lndfWId29Csr5waRSiAZV0fBsJKA9v
X-Gm-Gg: ASbGnctCiOUJeWF4AYn2lQ4G1vqiQbWWGjuwGHDBtX1IR0B/bcAanFn4KDutbw/Osmn
 PzPXqDjTW6qh8r03IutRByiZ+4D7QgXpK0atxlDiy810aUM5klW028WKRvYOGCsFrKlroIVETpq
 ppmbUlu3ptGnImPiQ+LOftqxXdxUyMhJLFtZahzx8Xbk5Fc5pZ15VQ0zaHTI13i/1p/e/Gc7Vv1
 e+YUFoWk2MvJ6/LxSHU5XDF2RKGFDk3DJ5tn5RfW8KBKfVLNP3whUgY
X-Google-Smtp-Source: AGHT+IHSPnTDlsYe/ohyr9cMHYx4FUBRhzpIjigxfcGCo4d3QiSHnsg8QznsMF3aPbavNKuOGfDPIQ==
X-Received: by 2002:a05:600c:458a:b0:431:55af:a230 with SMTP id
 5b1f17b1804b1-433ce4e23b5mr66941935e9.33.1732445406389; 
 Sun, 24 Nov 2024 02:50:06 -0800 (PST)
Received: from localhost.localdomain ([2a02:8070:2483:7e00::478])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433cde110cfsm88665515e9.11.2024.11.24.02.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Nov 2024 02:50:05 -0800 (PST)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Nov 2024 11:49:05 +0000
Message-ID: <20241124114907.16924-3-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241124114907.16924-1-raphael.pavlidis@gmail.com>
References: <20241124114907.16924-1-raphael.pavlidis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732445406; x=1733050206; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gomyoMGDruhf+6ikZdDp/SAg3DZ4dSY0Yp34ul6vc0s=;
 b=I2BMx1N9y7GfVUYitHN7t+F2u16+yoFy3sAB5phi+BPg00/IpDJvmb7VOkLiUQltsb
 9A6x/8hyHhp5dupWg1GCkRNVjtFijfFOXclz0Uu+q0v29bIe+f1VkTrYqkM7IBdM6vG9
 4kC8VUdhoMJ1r7XQbXEb0iieMji+ZthcGBINNtJRVNDjnS+/iBI9OmzmIstWwBOlTfHb
 YKG1xcx4yDbl4W9gY1fLRx2IVbAdSOZ1kDrgnzPgJsfpJc020yQV+aUI6vBna+yXPjOU
 rq7/sh5ug73xwGGxymk/zEFKZuO2Race8J5/lITNMiEecAYSuTsSrRYhdSGOkKoyM9+D
 JZTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=I2BMx1N9
Subject: [Buildroot] [PATCH 2/4] package/wlroots: bump to version 0.18.1
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

Changelog:
https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.18.1
https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.18.0
https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.17.4
https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.17.2
https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.17.1
https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.17.0
Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 ...1-Add-feature-macros-to-more-C-files.patch | 181 ------------------
 package/wlroots/Config.in                     |   1 +
 package/wlroots/wlroots.hash                  |   6 +-
 package/wlroots/wlroots.mk                    |   3 +-
 4 files changed, 7 insertions(+), 184 deletions(-)
 delete mode 100644 package/wlroots/0001-Add-feature-macros-to-more-C-files.patch

diff --git a/package/wlroots/0001-Add-feature-macros-to-more-C-files.patch b/package/wlroots/0001-Add-feature-macros-to-more-C-files.patch
deleted file mode 100644
index 9467318b31..0000000000
--- a/package/wlroots/0001-Add-feature-macros-to-more-C-files.patch
+++ /dev/null
@@ -1,181 +0,0 @@
-From 7854cd141f6f4c896afdc86229671d443ca7ba10 Mon Sep 17 00:00:00 2001
-From: Paul Cercueil <paul@crapouillou.net>
-Date: Thu, 18 Feb 2021 22:31:39 +0000
-Subject: [PATCH] Add feature macros to more C files
-
-These source files use "struct timespec", which is POSIX 1993.09.
-
-Upstream: Rejected (Upstream does not want these workarounds)
-see: https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/2493
-
-Signed-off-by: Paul Cercueil <paul@crapouillou.net>
-[Retrieved from: https://github.com/swaywm/wlroots/pull/2493]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Julien: refreshed the patch to be applied with fuzz factor 0]
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- backend/wayland/output.c                  | 1 +
- types/data_device/wlr_data_device.c       | 1 +
- types/data_device/wlr_drag.c              | 1 +
- types/wlr_export_dmabuf_v1.c              | 1 +
- types/wlr_idle.c                          | 1 +
- types/wlr_keyboard_shortcuts_inhibit_v1.c | 1 +
- types/wlr_pointer_constraints_v1.c        | 1 +
- types/wlr_primary_selection.c             | 1 +
- types/wlr_relative_pointer_v1.c           | 1 +
- types/wlr_screencopy_v1.c                 | 1 +
- types/wlr_virtual_pointer_v1.c            | 1 +
- types/wlr_xdg_decoration_v1.c             | 1 +
- types/xdg_shell/wlr_xdg_popup.c           | 1 +
- types/xdg_shell/wlr_xdg_positioner.c      | 1 +
- types/xdg_shell/wlr_xdg_shell.c           | 1 +
- types/xdg_shell/wlr_xdg_surface.c         | 1 +
- 16 files changed, 16 insertions(+)
-
-diff --git a/backend/wayland/output.c b/backend/wayland/output.c
-index c4b95e1..d5699d3 100644
---- a/backend/wayland/output.c
-+++ b/backend/wayland/output.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <stdint.h>
- #include <stdio.h>
-diff --git a/types/data_device/wlr_data_device.c b/types/data_device/wlr_data_device.c
-index 7e67479..2db13a6 100644
---- a/types/data_device/wlr_data_device.c
-+++ b/types/data_device/wlr_data_device.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <stdlib.h>
- #include <string.h>
-diff --git a/types/data_device/wlr_drag.c b/types/data_device/wlr_drag.c
-index c1fa801..8981ea0 100644
---- a/types/data_device/wlr_drag.c
-+++ b/types/data_device/wlr_drag.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <stdlib.h>
- #include <string.h>
-diff --git a/types/wlr_export_dmabuf_v1.c b/types/wlr_export_dmabuf_v1.c
-index c1d26e6..cd06615 100644
---- a/types/wlr_export_dmabuf_v1.c
-+++ b/types/wlr_export_dmabuf_v1.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <stdlib.h>
- #include <unistd.h>
-diff --git a/types/wlr_idle.c b/types/wlr_idle.c
-index cb3a1cc..5f1fa95 100644
---- a/types/wlr_idle.c
-+++ b/types/wlr_idle.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <stdlib.h>
- #include <string.h>
-diff --git a/types/wlr_keyboard_shortcuts_inhibit_v1.c b/types/wlr_keyboard_shortcuts_inhibit_v1.c
-index cc9bac1..3924893 100644
---- a/types/wlr_keyboard_shortcuts_inhibit_v1.c
-+++ b/types/wlr_keyboard_shortcuts_inhibit_v1.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <stdlib.h>
- #include <wlr/types/wlr_compositor.h>
-diff --git a/types/wlr_pointer_constraints_v1.c b/types/wlr_pointer_constraints_v1.c
-index 7a8d209..70b0984 100644
---- a/types/wlr_pointer_constraints_v1.c
-+++ b/types/wlr_pointer_constraints_v1.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <limits.h>
- #include <pixman.h>
-diff --git a/types/wlr_primary_selection.c b/types/wlr_primary_selection.c
-index d576bf0..bac4daa 100644
---- a/types/wlr_primary_selection.c
-+++ b/types/wlr_primary_selection.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <stdlib.h>
- #include <wlr/types/wlr_primary_selection.h>
-diff --git a/types/wlr_relative_pointer_v1.c b/types/wlr_relative_pointer_v1.c
-index 44da791..f6925b8 100644
---- a/types/wlr_relative_pointer_v1.c
-+++ b/types/wlr_relative_pointer_v1.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <inttypes.h>
- #include <stdlib.h>
-diff --git a/types/wlr_screencopy_v1.c b/types/wlr_screencopy_v1.c
-index 4ca659a..76c582e 100644
---- a/types/wlr_screencopy_v1.c
-+++ b/types/wlr_screencopy_v1.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <stdlib.h>
- #include <drm_fourcc.h>
-diff --git a/types/wlr_virtual_pointer_v1.c b/types/wlr_virtual_pointer_v1.c
-index b452ff5..661e613 100644
---- a/types/wlr_virtual_pointer_v1.c
-+++ b/types/wlr_virtual_pointer_v1.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <stdlib.h>
- #include <wlr/interfaces/wlr_pointer.h>
-diff --git a/types/wlr_xdg_decoration_v1.c b/types/wlr_xdg_decoration_v1.c
-index fcd97a5..1850665 100644
---- a/types/wlr_xdg_decoration_v1.c
-+++ b/types/wlr_xdg_decoration_v1.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <stdbool.h>
- #include <stdlib.h>
-diff --git a/types/xdg_shell/wlr_xdg_popup.c b/types/xdg_shell/wlr_xdg_popup.c
-index fa99acd..8361eef 100644
---- a/types/xdg_shell/wlr_xdg_popup.c
-+++ b/types/xdg_shell/wlr_xdg_popup.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <stdlib.h>
- #include <string.h>
-diff --git a/types/xdg_shell/wlr_xdg_positioner.c b/types/xdg_shell/wlr_xdg_positioner.c
-index 6a991bb..dae879b 100644
---- a/types/xdg_shell/wlr_xdg_positioner.c
-+++ b/types/xdg_shell/wlr_xdg_positioner.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <stdlib.h>
- #include <wlr/util/edges.h>
-diff --git a/types/xdg_shell/wlr_xdg_shell.c b/types/xdg_shell/wlr_xdg_shell.c
-index 70b777d..16d275a 100644
---- a/types/xdg_shell/wlr_xdg_shell.c
-+++ b/types/xdg_shell/wlr_xdg_shell.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <stdlib.h>
- #include "types/wlr_xdg_shell.h"
-diff --git a/types/xdg_shell/wlr_xdg_surface.c b/types/xdg_shell/wlr_xdg_surface.c
-index a03b90a..a6267cf 100644
---- a/types/xdg_shell/wlr_xdg_surface.c
-+++ b/types/xdg_shell/wlr_xdg_surface.c
-@@ -1,3 +1,4 @@
-+#define _POSIX_C_SOURCE 199309L
- #include <assert.h>
- #include <stdlib.h>
- #include <string.h>
--- 
-2.45.2
-
diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
index d81506c375..b29176480b 100644
--- a/package/wlroots/Config.in
+++ b/package/wlroots/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_WLROOTS
 	select BR2_PACKAGE_HWDATA
 	select BR2_PACKAGE_HWDATA_PNP_IDS
 	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBDISPLAY_INFO
 	select BR2_PACKAGE_LIBINPUT
 	select BR2_PACKAGE_LIBXKBCOMMON
 	select BR2_PACKAGE_PIXMAN
diff --git a/package/wlroots/wlroots.hash b/package/wlroots/wlroots.hash
index 8ab05393b1..2e1736c0ea 100644
--- a/package/wlroots/wlroots.hash
+++ b/package/wlroots/wlroots.hash
@@ -1,5 +1,7 @@
-# Generated locally, after checking https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.16.2/downloads/wlroots-0.16.2.tar.gz.sig
-sha256  83e9a11605f23d4bf781ab1947089483d9ec3f7e9ba65398e0609593b77d44aa  wlroots-0.16.2.tar.gz
+# Locally calculated after checking pgp signature
+# https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.18.1/downloads/wlroots-0.18.1.tar.gz.sig
+# with key 34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48 "emersion <contact@emersion.fr>"
+sha256  b9c4bfef4123fe9f8662280b851e3c5741927457174315826827bfbb70612878  wlroots-0.18.1.tar.gz
 
 # Hashes for license files:
 sha256  ffd3737a478b83a8b51b42757d3bf909ef36694508355879722e11fc1fa6736b  LICENSE
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index fdd2fb8250..8fa7408717 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WLROOTS_VERSION = 0.16.2
+WLROOTS_VERSION = 0.18.1
 WLROOTS_SITE = https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/$(WLROOTS_VERSION)/downloads
 WLROOTS_LICENSE = MIT
 WLROOTS_LICENSE_FILES = LICENSE
@@ -14,6 +14,7 @@ WLROOTS_DEPENDENCIES = \
 	host-pkgconf \
 	host-wayland \
 	hwdata \
+	libdisplay-info \
 	libinput \
 	libxkbcommon \
 	libegl \
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
