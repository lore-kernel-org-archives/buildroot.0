Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B411DC6FD20
	for <buildroot@archiver.kernel.org>; Fri, 24 Mar 2023 09:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17DAF80C1A;
	Fri, 24 Mar 2023 09:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17DAF80C1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ZVf95AT6ZUZ; Fri, 24 Mar 2023 09:33:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 329558084B;
	Fri, 24 Mar 2023 09:33:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 329558084B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB5911BF5AA
 for <buildroot@lists.busybox.net>; Fri, 24 Mar 2023 09:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7212040461
 for <buildroot@lists.busybox.net>; Fri, 24 Mar 2023 09:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7212040461
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JUqgF43xtKrL for <buildroot@lists.busybox.net>;
 Fri, 24 Mar 2023 09:33:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2BA340286
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C2BA340286
 for <buildroot@buildroot.org>; Fri, 24 Mar 2023 09:33:20 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 568B7E000B;
 Fri, 24 Mar 2023 09:33:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Mar 2023 10:33:07 +0100
Message-Id: <20230324093307.1255640-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679650397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=nL4Y5cKJfL9n7BCLpnxrYClvwXvPQXIxYD1OblqX6ns=;
 b=h7Qqn/YI1HCRgBTlG/wmKxtvE/eqk/23TGh7CSMmy7tqYZSGsMivmztUc+43xbVxhTzwit
 yVGLThasyfOQ8XaxnKW9fNNQCIgV4Adf30T4urkD76CcqZCGThHrks7xhrIJB5pR8BurQ+
 fg+nASgwy90ZiiWCQZE/9fcTdK6Rc5lZyaJ2LZ2vT+YrA2raBAI35mOJwGSag9Q4Pe/j7Y
 pJu+s9u1fs0Q86pEuplFoRl9tlin3NcY5dSJAYSdzXi+kcXwvNOG+n0jQ2kbCyFjTQV+Y7
 sNyK0urn1vEP5kkndE6kOG87xB1lwny4Fqvm/GN5pTbyiuC34gxQCVVFVDEVEw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h7Qqn/YI
Subject: [Buildroot] [PATCH] package/linux-tools: add USB tools (testusb and
 ffs-test)
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
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
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
 DEVELOPERS                                    |  1 +
 package/linux-tools/Config.in                 | 26 ++++++++++++
 package/linux-tools/linux-tool-usbtools.mk.in | 42 +++++++++++++++++++
 3 files changed, 69 insertions(+)
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
index 000000000000..28b3aff25cc2
--- /dev/null
+++ b/package/linux-tools/linux-tool-usbtools.mk.in
@@ -0,0 +1,42 @@
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
+define USBTOOLS_BUILD_CMDS
+	$(Q)if ! grep install $(LINUX_DIR)/tools/usb/Makefile >/dev/null 2>&1 ; then \
+		echo "Your kernel version is too old to build the USB tools." ; \
+		echo "At least kernel 5.9 must be used." ; \
+		exit 1 ; \
+	fi
+
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/usb \
+		$(USBTOOLS_MAKE_OPTS) \
+		all
+endef
+
+ifeq ($(BR2_PACKAGE_LINUX_TOOLS_USBTOOLS_TESTUSB),)
+define USBTOOLS_INSTALL_REMOVE_TESTUSB
+	$(RM) -rf $(TARGET_DIR)/usr/bin/testusb
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_LINUX_TOOLS_USBTOOLS_FFSTEST),)
+define USBTOOLS_INSTALL_REMOVE_FFSTEST
+	$(RM) -rf $(TARGET_DIR)/usr/bin/ffs-test
+endef
+endif
+
+define USBTOOLS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/usb \
+		$(USBTOOLS_MAKE_OPTS) \
+		DESTDIR=$(TARGET_DIR) \
+		install
+	$(USBTOOLS_INSTALL_REMOVE_TESTUSB)
+	$(USBTOOLS_INSTALL_REMOVE_FFSTEST)
+endef
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
