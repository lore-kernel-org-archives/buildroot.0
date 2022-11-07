Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECB1C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4122042A65;
	Mon, 20 Feb 2023 21:06:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4122042A65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xGS55993JF3R; Mon, 20 Feb 2023 21:06:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B833E42A60;
	Mon, 20 Feb 2023 21:06:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B833E42A60
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 13BB01BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A332841151
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A332841151
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zoYX68ognxOO for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36A1B40C19
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36A1B40C19
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2163186494; Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Nov 2022 23:08:55 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a38682dd54dde976836c37dcc30ec24baa474690
X-Git-Newrev: a29e7fb6765c0a08a3276a11a4da54dfdbdca703
X-Patchwork-Hint: ignore
Message-Id: <20230220205149.2163186494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/linux-tools: fix
 static build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a29e7fb6765c0a08a3276a11a4da54dfdbdca703
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Pass TARGET_LDFLAGS (which contains -static) to fix the following static
build failures with gpio, iio and pci:

  LINK     lsgpio
/home/autobuild/autobuild/instance-8/output-1/host/lib/gcc/arm-buildroot-linux-musleabi/10.4.0/../../../../arm-buildroot-linux-musleabi/bin/ld: /home/autobuild/autobuild/instance-8/output-1/host/lib/gcc/arm-buildroot-linux-musleabi/10.4.0/libgcc.a(_dvmd_lnx.o): in function `__aeabi_ldiv0':
/home/autobuild/autobuild/instance-8/output-1/build/host-gcc-final-10.4.0/build/arm-buildroot-linux-musleabi/libgcc/../../../libgcc/config/arm/lib1funcs.S:1499: undefined reference to `raise'

[...]

  LINK    iio_event_monitor
/home/thomas/autobuild/instance-2/output-1/host/lib/gcc/microblazeel-buildroot-linux-musl/11.3.0/../../../../microblazeel-buildroot-linux-musl/bin/ld: /home/thomas/autobuild/instance-2/output-1/host/lib/gcc/microblazeel-buildroot-linux-musl/11.3.0/libgcc.a(unwind-dw2.o): in function `size_of_encoded_value':
/home/thomas/autobuild/instance-2/output-1/build/host-gcc-final-11.3.0/build/microblazeel-buildroot-linux-musl/libgcc/../../../libgcc/unwind-pe.h:88: undefined reference to `abort'

Fixes:
 - http://autobuild.buildroot.org/results/f202eb843ef331939f5f12325bdbf2d0d664a7ce
 - http://autobuild.buildroot.org/results/504ec8be1ebd15c5da09f8b90bb723a58d4c58c5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-tools/linux-tool-gpio.mk.in | 2 +-
 package/linux-tools/linux-tool-iio.mk.in  | 2 +-
 package/linux-tools/linux-tool-pci.mk.in  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-tools/linux-tool-gpio.mk.in b/package/linux-tools/linux-tool-gpio.mk.in
index d5a0dbda38..e825db1b11 100644
--- a/package/linux-tools/linux-tool-gpio.mk.in
+++ b/package/linux-tools/linux-tool-gpio.mk.in
@@ -6,7 +6,7 @@
 
 LINUX_TOOLS += gpio
 
-GPIO_MAKE_OPTS = $(LINUX_MAKE_FLAGS)
+GPIO_MAKE_OPTS = $(LINUX_MAKE_FLAGS) LDFLAGS="$(TARGET_LDFLAGS)"
 
 define GPIO_BUILD_CMDS
 	$(Q)if ! grep install $(LINUX_DIR)/tools/gpio/Makefile >/dev/null 2>&1 ; then \
diff --git a/package/linux-tools/linux-tool-iio.mk.in b/package/linux-tools/linux-tool-iio.mk.in
index a8cc89e830..27ab0ed7ed 100644
--- a/package/linux-tools/linux-tool-iio.mk.in
+++ b/package/linux-tools/linux-tool-iio.mk.in
@@ -6,7 +6,7 @@
 
 LINUX_TOOLS += iio
 
-IIO_MAKE_OPTS = $(LINUX_MAKE_FLAGS)
+IIO_MAKE_OPTS = $(LINUX_MAKE_FLAGS) LDFLAGS="$(TARGET_LDFLAGS)"
 
 define IIO_BUILD_CMDS
 	$(Q)if ! grep install $(LINUX_DIR)/tools/iio/Makefile >/dev/null 2>&1 ; then \
diff --git a/package/linux-tools/linux-tool-pci.mk.in b/package/linux-tools/linux-tool-pci.mk.in
index 4ef0368a32..17246f5d7e 100644
--- a/package/linux-tools/linux-tool-pci.mk.in
+++ b/package/linux-tools/linux-tool-pci.mk.in
@@ -6,7 +6,7 @@
 
 LINUX_TOOLS += pci
 
-PCI_MAKE_OPTS = $(LINUX_MAKE_FLAGS)
+PCI_MAKE_OPTS = $(LINUX_MAKE_FLAGS) LDFLAGS="$(TARGET_LDFLAGS)"
 
 define PCI_BUILD_CMDS
 	$(Q)if ! grep install $(LINUX_DIR)/tools/pci/Makefile >/dev/null 2>&1 ; then \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
