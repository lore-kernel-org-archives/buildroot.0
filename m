Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C25C77B61
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 14:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 190F9415F4;
	Mon, 27 Mar 2023 14:00:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 190F9415F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KroxidU1yiQP; Mon, 27 Mar 2023 14:00:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD90C41729;
	Mon, 27 Mar 2023 14:00:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD90C41729
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 235811BF37B
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 14:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB6B8814B6
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 14:00:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB6B8814B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wr1iaLGFQNZG for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 14:00:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DB2881699
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6DB2881699
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 14:00:05 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id B204FC000F;
 Mon, 27 Mar 2023 14:00:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 27 Mar 2023 15:59:48 +0200
Message-Id: <20230327135948.90710-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679925601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=CiEwwoj9tL+Zy2rpLKQb/BQiBD6XTL5zrbPER2rZn+I=;
 b=eqUmpaLLU8odtMNfUxTOEu4GmtZ0ULTADiG+cSHjUMj+NXZDFik8bCXNWJHE+WvtmrLh7C
 DkCO/pk8taCODG9NZqqM7NTBGeAEpo9wr9n+NG5pbQUTcIdKBbm0rJoEmA0stvwxnkSZXh
 2mQCfEw3kbBNN5j/yESZuaQ0SntbcJDEezZ9Tci05GPoB1EugsBWofLHyxyxtdegtNQP1T
 Ad4x2nnlvVBs0qDPKZOZCRAlM3NcjB5H4BGkIOyFiNB7XsR70oFZ0eaWk+VvxL9y5CynNB
 NHj1bxdHGZgmMIoc5KXjdTDTL65ouT57hM4WvPSOf9d5xMU+woB3WbzUej5eUQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eqUmpaLL
Subject: [Buildroot] [PATCH v2] package/linux-tools: add USB tools (testusb
 and ffs-test)
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Extend the linux-tools package to also build the userspace USB tools, which
currently include testusb and ffs-test.

These tools are in the kernel tree since a long time, but a Makefile was
added only in 5.9 to allow building in the same way as other tools provided
with the kernel. Here we use the Makefile and thus version >= 5.9 is
required. Support for older kernels may be added later if needed.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v2:

 - Use ALL_TARGETS to select tools to build and install instead of the ugly
   removal logic
---
 DEVELOPERS                                    |  1 +
 package/linux-tools/Config.in                 | 26 ++++++++++++++
 package/linux-tools/linux-tool-usbtools.mk.in | 34 +++++++++++++++++++
 3 files changed, 61 insertions(+)
 create mode 100644 package/linux-tools/linux-tool-usbtools.mk.in

diff --git a/DEVELOPERS b/DEVELOPERS
index b6d288c54fa9..67c6004ddf2e 100644
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
index 8a0b6d5802cc..451b0eeff5bb 100644
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
index 000000000000..797758adce51
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
