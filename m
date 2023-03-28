Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A212BC76196
	for <buildroot@archiver.kernel.org>; Tue, 28 Mar 2023 19:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48218400D9;
	Tue, 28 Mar 2023 19:56:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48218400D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fWBLaQFLtxVX; Tue, 28 Mar 2023 19:56:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EDF440439;
	Tue, 28 Mar 2023 19:56:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EDF440439
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B2CA11BF23C
 for <buildroot@lists.busybox.net>; Tue, 28 Mar 2023 19:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C17340439
 for <buildroot@lists.busybox.net>; Tue, 28 Mar 2023 19:56:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C17340439
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mEXQ9pt17Eo6 for <buildroot@lists.busybox.net>;
 Tue, 28 Mar 2023 19:56:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE40B400D9
 for <buildroot@buildroot.org>; Tue, 28 Mar 2023 19:56:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE40B400D9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99C2E835F7; Tue, 28 Mar 2023 19:56:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 28 Mar 2023 21:54:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a3d4e38183e7c7ade63588519796005f43efe78
X-Git-Newrev: fb515a4b284228935a0afb65d73a563f2b2c902c
X-Patchwork-Hint: ignore
Message-Id: <20230328195613.99C2E835F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-tools: add USB tools
 (testusb and ffs-test)
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb515a4b284228935a0afb65d73a563f2b2c902c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Extend the linux-tools package to also build the userspace USB tools,
which currently include testusb and ffs-test.

These tools are in the kernel tree since a long time, and althogh a
Makefile had been present since kernel 2.6.39, it has been entirely
rewritten (with an install rule) back with kernel 5.9, to allow building
the same way as other tools provided with the kernel.

We make use of the Makefile install rule, thus version >= 5.9 is
required. Support for older kernels may be added later if needed, and
is left as an exercise for the motivated party.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Herve Codina <herve.codina@bootlin.com>
[yann.morin.1998@free.fr: fix history of Makefile]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                    |  1 +
 package/linux-tools/Config.in                 | 26 ++++++++++++++++++++
 package/linux-tools/linux-tool-usbtools.mk.in | 34 +++++++++++++++++++++++++++
 3 files changed, 61 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b6d288c54f..67c6004ddf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1874,6 +1874,7 @@ F:	configs/zynqmp_zcu106_defconfig
 F:	package/agentpp/
 F:	package/exim/
 F:	package/libpjsip/
+F:	package/linux-tools/linux-tool-usbtools.mk.in
 F:	package/qpid-proton/
 F:	package/rtl8188eu/
 F:	package/snmppp/
diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 8a0b6d5802..451b0eeff5 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -135,6 +135,32 @@ comment "selftests needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS and a toolchain w/ dyna
 	depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS || \
 		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 
+config BR2_PACKAGE_LINUX_TOOLS_USBTOOLS
+	bool "USB test programs"
+	select BR2_PACKAGE_LINUX_TOOLS
+	help
+	  Build and install the USB test tools.
+
+	  These tools exist since Linux 2.6.35, but Buildroot can build
+	  them only with kernel versions 5.9 and later.
+
+if BR2_PACKAGE_LINUX_TOOLS_USBTOOLS
+
+config BR2_PACKAGE_LINUX_TOOLS_USBTOOLS_TESTUSB
+	bool "testusb"
+	help
+	  testusb issues ioctls to perform the tests implemented by the
+	  kernel driver.  It can generate a variety of transfer
+	  patterns.
+
+	  See http://www.linux-usb.org/usbtest/
+
+config BR2_PACKAGE_LINUX_TOOLS_USBTOOLS_FFSTEST
+	bool "ffs-test"
+	help
+	  User mode filesystem api for usb composite function
+endif
+
 config BR2_PACKAGE_LINUX_TOOLS_TMON
 	bool "tmon"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/linux-tools/linux-tool-usbtools.mk.in b/package/linux-tools/linux-tool-usbtools.mk.in
new file mode 100644
index 0000000000..797758adce
--- /dev/null
+++ b/package/linux-tools/linux-tool-usbtools.mk.in
@@ -0,0 +1,34 @@
+################################################################################
+#
+# usbtools
+#
+################################################################################
+
+LINUX_TOOLS += usbtools
+
+USBTOOLS_MAKE_OPTS = $(LINUX_MAKE_FLAGS) LDFLAGS="$(TARGET_LDFLAGS)"
+
+LINUX_TOOLS_USBTOOLS_LIST = \
+	$(if $(BR2_PACKAGE_LINUX_TOOLS_USBTOOLS_TESTUSB),testusb) \
+	$(if $(BR2_PACKAGE_LINUX_TOOLS_USBTOOLS_FFSTEST),ffs-test)
+
+define USBTOOLS_BUILD_CMDS
+	$(Q)if ! grep install $(LINUX_DIR)/tools/usb/Makefile >/dev/null 2>&1 ; then \
+		echo "Your kernel version is too old to build the USB tools." ; \
+		echo "At least kernel 5.9 must be used." ; \
+		exit 1 ; \
+	fi
+
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/usb \
+		ALL_TARGETS="$(LINUX_TOOLS_USBTOOLS_LIST)" \
+		$(USBTOOLS_MAKE_OPTS) \
+		all
+endef
+
+define USBTOOLS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/usb \
+		ALL_TARGETS="$(LINUX_TOOLS_USBTOOLS_LIST)" \
+		$(USBTOOLS_MAKE_OPTS) \
+		DESTDIR=$(TARGET_DIR) \
+		install
+endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
