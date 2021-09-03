Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D6FC433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 19:18:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D159760EBA
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 19:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D159760EBA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A129426FB;
	Fri,  3 Sep 2021 19:18:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a9JmEglxn0ty; Fri,  3 Sep 2021 19:18:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E696402C1;
	Fri,  3 Sep 2021 19:18:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 28D881C115D
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 19:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 243E8615B3
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 19:18:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nDuW_ZWlvHn9 for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 19:18:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40960605DE
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 19:18:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4339B88216; Fri,  3 Sep 2021 19:17:08 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 3 Sep 2021 20:59:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 050be3ad358b7824b3fe9f832bc1ee494edd37d8
X-Git-Newrev: 301502b7f7e3d1c7b99bab8addbbcdc794bf8d50
X-Patchwork-Hint: ignore
Message-Id: <20210903191708.4339B88216@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wlroots: fix uclibc build
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=301502b7f7e3d1c7b99bab8addbbcdc794bf8d50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following uclibc build failure raised since at least bump to
version 0.11.0 in commit 0bc9c89612cc1f41f9a64f6e889f8bcd8a871e30:

In file included from ../include/wlr/types/wlr_data_device.h:13,
                 from ../types/data_device/wlr_drag.c:7:
../include/wlr/types/wlr_seat.h:221:18: error: field 'last_event' has incomplete type
  221 |  struct timespec last_event;
      |                  ^~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/3501ceb4290638b2f6d70aaa4d8ce74feec3a525

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Add-feature-macros-to-more-C-files-.patch | 174 +++++++++++++++++++++
 1 file changed, 174 insertions(+)

diff --git a/package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch b/package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch
new file mode 100644
index 0000000000..0ba078708a
--- /dev/null
+++ b/package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch
@@ -0,0 +1,174 @@
+From cf37ba4c0bf31316b698ba23015f91903766871d Mon Sep 17 00:00:00 2001
+From: Paul Cercueil <paul@crapouillou.net>
+Date: Thu, 18 Feb 2021 22:31:39 +0000
+Subject: [PATCH] Add feature macros to more C files
+
+These source files use "struct timespec", which is POSIX 1993.09.
+
+Signed-off-by: Paul Cercueil <paul@crapouillou.net>
+
+[Retrieved from: https://github.com/swaywm/wlroots/pull/2493]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ backend/wayland/output.c                  | 1 +
+ types/data_device/wlr_data_device.c       | 1 +
+ types/data_device/wlr_drag.c              | 1 +
+ types/wlr_export_dmabuf_v1.c              | 1 +
+ types/wlr_idle.c                          | 1 +
+ types/wlr_keyboard_shortcuts_inhibit_v1.c | 1 +
+ types/wlr_pointer_constraints_v1.c        | 1 +
+ types/wlr_primary_selection.c             | 1 +
+ types/wlr_relative_pointer_v1.c           | 1 +
+ types/wlr_screencopy_v1.c                 | 1 +
+ types/wlr_virtual_pointer_v1.c            | 1 +
+ types/wlr_xdg_decoration_v1.c             | 1 +
+ types/xdg_shell/wlr_xdg_popup.c           | 1 +
+ types/xdg_shell/wlr_xdg_positioner.c      | 1 +
+ types/xdg_shell/wlr_xdg_shell.c           | 1 +
+ types/xdg_shell/wlr_xdg_surface.c         | 1 +
+ 16 files changed, 16 insertions(+)
+
+diff --git a/backend/wayland/output.c b/backend/wayland/output.c
+index d5410e0d32..8ff8fa2a00 100644
+--- a/backend/wayland/output.c
++++ b/backend/wayland/output.c
+@@ -1,3 +1,4 @@
++#define _POSIX_C_SOURCE 199309L
+ #include <assert.h>
+ #include <stdint.h>
+ #include <stdio.h>
+diff --git a/types/data_device/wlr_data_device.c b/types/data_device/wlr_data_device.c
+index 6cd84ec0ab..beac496124 100644
+--- a/types/data_device/wlr_data_device.c
++++ b/types/data_device/wlr_data_device.c
+@@ -1,3 +1,4 @@
++#define _POSIX_C_SOURCE 199309L
+ #include <assert.h>
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/types/data_device/wlr_drag.c b/types/data_device/wlr_drag.c
+index 53bf4066a1..e3c1e249b4 100644
+--- a/types/data_device/wlr_drag.c
++++ b/types/data_device/wlr_drag.c
+@@ -1,3 +1,4 @@
++#define _POSIX_C_SOURCE 199309L
+ #include <assert.h>
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/types/wlr_export_dmabuf_v1.c b/types/wlr_export_dmabuf_v1.c
+index a8e2a4bde3..98ceae68f1 100644
+--- a/types/wlr_export_dmabuf_v1.c
++++ b/types/wlr_export_dmabuf_v1.c
+@@ -1,3 +1,4 @@
++#define _POSIX_C_SOURCE 199309L
+ #include <assert.h>
+ #include <stdlib.h>
+ #include <unistd.h>
+diff --git a/types/wlr_idle.c b/types/wlr_idle.c
+index 4c338931cc..80fd871fab 100644
+--- a/types/wlr_idle.c
++++ b/types/wlr_idle.c
+@@ -1,3 +1,4 @@
++#define _POSIX_C_SOURCE 199309L
+ #include <assert.h>
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/types/wlr_keyboard_shortcuts_inhibit_v1.c b/types/wlr_keyboard_shortcuts_inhibit_v1.c
+index fe4e64b04e..8360a9c21c 100644
+--- a/types/wlr_keyboard_shortcuts_inhibit_v1.c
++++ b/types/wlr_keyboard_shortcuts_inhibit_v1.c
+@@ -1,3 +1,4 @@
++#define _POSIX_C_SOURCE 199309L
+ #include <assert.h>
+ #include <stdlib.h>
+ #include <util/signal.h>
+diff --git a/types/wlr_pointer_constraints_v1.c b/types/wlr_pointer_constraints_v1.c
+index eca45984c4..f1db8e3415 100644
+--- a/types/wlr_pointer_constraints_v1.c
++++ b/types/wlr_pointer_constraints_v1.c
+@@ -1,3 +1,4 @@
++#define _POSIX_C_SOURCE 199309L
+ #include <assert.h>
+ #include <limits.h>
+ #include <pixman.h>
+diff --git a/types/wlr_primary_selection.c b/types/wlr_primary_selection.c
+index 0875462c8c..7e0e11ddaa 100644
+--- a/types/wlr_primary_selection.c
++++ b/types/wlr_primary_selection.c
+@@ -1,3 +1,4 @@
++#define _POSIX_C_SOURCE 199309L
+ #include <assert.h>
+ #include <stdlib.h>
+ #include <wlr/types/wlr_primary_selection.h>
+diff --git a/types/wlr_relative_pointer_v1.c b/types/wlr_relative_pointer_v1.c
+index 8613f2b91c..3f8dd8b72a 100644
+--- a/types/wlr_relative_pointer_v1.c
++++ b/types/wlr_relative_pointer_v1.c
+@@ -1,3 +1,4 @@
++#define _POSIX_C_SOURCE 199309L
+ #include <assert.h>
+ #include <inttypes.h>
+ #include <stdlib.h>
+diff --git a/types/wlr_screencopy_v1.c b/types/wlr_screencopy_v1.c
+index 6feb074274..29864c2364 100644
+--- a/types/wlr_screencopy_v1.c
++++ b/types/wlr_screencopy_v1.c
+@@ -1,3 +1,4 @@
++#define _POSIX_C_SOURCE 199309L
+ #include <assert.h>
+ #include <stdlib.h>
+ #include <drm_fourcc.h>
+diff --git a/types/wlr_virtual_pointer_v1.c b/types/wlr_virtual_pointer_v1.c
+index a9d1fd7bc4..5566e9e013 100644
+--- a/types/wlr_virtual_pointer_v1.c
++++ b/types/wlr_virtual_pointer_v1.c
+@@ -1,3 +1,4 @@
++#define _POSIX_C_SOURCE 199309L
+ #include <assert.h>
+ #include <stdlib.h>
+ #include <wlr/types/wlr_seat.h>
+diff --git a/types/wlr_xdg_decoration_v1.c b/types/wlr_xdg_decoration_v1.c
+index 544035b7b8..904474c088 100644
+--- a/types/wlr_xdg_decoration_v1.c
++++ b/types/wlr_xdg_decoration_v1.c
+@@ -1,3 +1,4 @@
++#define _POSIX_C_SOURCE 199309L
+ #include <assert.h>
+ #include <stdbool.h>
+ #include <stdlib.h>
+diff --git a/types/xdg_shell/wlr_xdg_popup.c b/types/xdg_shell/wlr_xdg_popup.c
+index 69b4cfe19f..05d6551fc8 100644
+--- a/types/xdg_shell/wlr_xdg_popup.c
++++ b/types/xdg_shell/wlr_xdg_popup.c
+@@ -1,3 +1,4 @@
++#define _POSIX_C_SOURCE 199309L
+ #include <assert.h>
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/types/xdg_shell/wlr_xdg_positioner.c b/types/xdg_shell/wlr_xdg_positioner.c
+index f88bf323b8..8881c49916 100644
+--- a/types/xdg_shell/wlr_xdg_positioner.c
++++ b/types/xdg_shell/wlr_xdg_positioner.c
+@@ -1,3 +1,4 @@
++#define _POSIX_C_SOURCE 199309L
+ #include <assert.h>
+ #include <stdlib.h>
+ #include "types/wlr_xdg_shell.h"
+diff --git a/types/xdg_shell/wlr_xdg_shell.c b/types/xdg_shell/wlr_xdg_shell.c
+index 0480d5f354..c93fe7c3fb 100644
+--- a/types/xdg_shell/wlr_xdg_shell.c
++++ b/types/xdg_shell/wlr_xdg_shell.c
+@@ -1,3 +1,4 @@
++#define _POSIX_C_SOURCE 199309L
+ #include <assert.h>
+ #include <stdlib.h>
+ #include "types/wlr_xdg_shell.h"
+diff --git a/types/xdg_shell/wlr_xdg_surface.c b/types/xdg_shell/wlr_xdg_surface.c
+index edf562abcd..c1dfbfba7e 100644
+--- a/types/xdg_shell/wlr_xdg_surface.c
++++ b/types/xdg_shell/wlr_xdg_surface.c
+@@ -1,3 +1,4 @@
++#define _POSIX_C_SOURCE 199309L
+ #include <assert.h>
+ #include <stdlib.h>
+ #include <string.h>
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
