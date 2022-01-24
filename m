Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B102AC4332F
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 21:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5196A415EF;
	Mon, 24 Jan 2022 21:06:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F-l0Mg6T8Qi8; Mon, 24 Jan 2022 21:06:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69803415A5;
	Mon, 24 Jan 2022 21:06:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2DBE91BF982
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 21:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CC0160AEF
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 21:06:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B3zS0M_BU5x4 for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 21:06:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4702D60B2B
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 21:06:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 53065822F6; Mon, 24 Jan 2022 20:59:11 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 22:05:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b23ef210299ca7f0eedf8fc898b0e5a0f3578293
X-Git-Newrev: c4f8b8968770ecbf6444a5921c6472f126717626
X-Patchwork-Hint: ignore
Message-Id: <20220124205911.53065822F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xvisor: bump to version 0.3.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c4f8b8968770ecbf6444a5921c6472f126717626
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop first patch (already in version)
- Send second patch upstream

http://xhypervisor.org/index.php?page=news/20211220

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xvisor/0001-fix-build-with-gcc-10.patch    | 64 ----------------------
 ...001-psmouse-back.c-fix-build-with-gcc-11.patch} |  1 +
 package/xvisor/xvisor.hash                         |  2 +-
 package/xvisor/xvisor.mk                           |  2 +-
 4 files changed, 3 insertions(+), 66 deletions(-)

diff --git a/package/xvisor/0001-fix-build-with-gcc-10.patch b/package/xvisor/0001-fix-build-with-gcc-10.patch
deleted file mode 100644
index a538558d86..0000000000
--- a/package/xvisor/0001-fix-build-with-gcc-10.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 8458abb357cd981f55d730ec2d74459a3042e571 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 6 Oct 2020 21:52:20 +0200
-Subject: [PATCH] fix build with gcc 10
-
-Define variables in header files as extern to avoid the following build failure
-with gcc 10 (which defaults to -fno-common):
-
-/home/giuliobenetti/autobuild/run/instance-3/output-1/host/bin/arm-buildroot-linux-gnueabihf-ld:
-/home/giuliobenetti/autobuild/run/instance-3/output-1/build/xvisor-0.3.0/build/drivers/mmc/core/mmc.o:/home/giuliobenetti/autobuild/run/instance-3/output-1/build/xvisor-0.3.0/drivers/mmc/core/core.h:67:
-multiple definition of `sdio_func_type';
-/home/giuliobenetti/autobuild/run/instance-3/output-1/build/xvisor-0.3.0/build/drivers/mmc/core/core.o:/home/giuliobenetti/autobuild/run/instance-3/output-1/build/xvisor-0.3.0/drivers/mmc/core/core.h:67:
-first defined here
-
-Fixes:
- - http://autobuild.buildroot.org/results/b6070c0721b33824e71833ce53423979980aa598
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/xvisor/xvisor/pull/125]
----
- drivers/mmc/core/core.h    |  2 +-
- emulators/display/drawfn.h | 10 +++++-----
- 2 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/drivers/mmc/core/core.h b/drivers/mmc/core/core.h
-index d75d135a..e2ca3141 100644
---- a/drivers/mmc/core/core.h
-+++ b/drivers/mmc/core/core.h
-@@ -64,7 +64,7 @@ int mmc_go_idle(struct mmc_host *host);
-  * Note: Must be called with host->lock held.
-  */
- extern struct vmm_bus sdio_bus_type;
--struct vmm_device_type sdio_func_type;
-+extern struct vmm_device_type sdio_func_type;
- 
- int __sdio_attach(struct mmc_host *host);
- 
-diff --git a/emulators/display/drawfn.h b/emulators/display/drawfn.h
-index f9163cff..385deaf6 100644
---- a/emulators/display/drawfn.h
-+++ b/emulators/display/drawfn.h
-@@ -69,14 +69,14 @@ typedef void (*drawfn)(struct vmm_surface *,
- 				 DRAWFN_ORDER_MAX * \
- 				 DRAWFN_FORMAT_MAX)
- 
--drawfn drawfn_surface_fntable_8[DRAWFN_FNTABLE_SIZE];
-+extern drawfn drawfn_surface_fntable_8[DRAWFN_FNTABLE_SIZE];
- 
--drawfn drawfn_surface_fntable_15[DRAWFN_FNTABLE_SIZE];
-+extern drawfn drawfn_surface_fntable_15[DRAWFN_FNTABLE_SIZE];
- 
--drawfn drawfn_surface_fntable_16[DRAWFN_FNTABLE_SIZE];
-+extern drawfn drawfn_surface_fntable_16[DRAWFN_FNTABLE_SIZE];
- 
--drawfn drawfn_surface_fntable_24[DRAWFN_FNTABLE_SIZE];
-+extern drawfn drawfn_surface_fntable_24[DRAWFN_FNTABLE_SIZE];
- 
--drawfn drawfn_surface_fntable_32[DRAWFN_FNTABLE_SIZE];
-+extern drawfn drawfn_surface_fntable_32[DRAWFN_FNTABLE_SIZE];
- 
- #endif
--- 
-2.28.0
-
diff --git a/package/xvisor/0002-psmouse-back.c-fix-build-with-gcc-11.patch b/package/xvisor/0001-psmouse-back.c-fix-build-with-gcc-11.patch
similarity index 98%
rename from package/xvisor/0002-psmouse-back.c-fix-build-with-gcc-11.patch
rename to package/xvisor/0001-psmouse-back.c-fix-build-with-gcc-11.patch
index 28010034d6..1c02f45c9d 100644
--- a/package/xvisor/0002-psmouse-back.c-fix-build-with-gcc-11.patch
+++ b/package/xvisor/0001-psmouse-back.c-fix-build-with-gcc-11.patch
@@ -17,6 +17,7 @@ Fixes:
  - http://autobuild.buildroot.org/results/69062b9c80567d135edd48890165e69881cf7295
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/xvisor/xvisor/pull/139]
 ---
  drivers/input/mouse/alps.h       | 4 ++--
  drivers/input/mouse/lifebook.h   | 6 +++---
diff --git a/package/xvisor/xvisor.hash b/package/xvisor/xvisor.hash
index 6938e20e7b..45b6fec49c 100644
--- a/package/xvisor/xvisor.hash
+++ b/package/xvisor/xvisor.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  81660d26a0bc63979ba40872f10511df777185712eba2d0e19e816438388de05  xvisor-0.3.0.tar.xz
+sha256  b1bb2ca09340e87a2f465c65196892cdd0f59b798794ae69e35d1f883cf9ba49  xvisor-0.3.1.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/xvisor/xvisor.mk b/package/xvisor/xvisor.mk
index 394ff7c80b..dc49258400 100644
--- a/package/xvisor/xvisor.mk
+++ b/package/xvisor/xvisor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XVISOR_VERSION = 0.3.0
+XVISOR_VERSION = 0.3.1
 XVISOR_SOURCE = xvisor-$(XVISOR_VERSION).tar.xz
 XVISOR_SITE = http://www.xhypervisor.org/tarball
 XVISOR_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
