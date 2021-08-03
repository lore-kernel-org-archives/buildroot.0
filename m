Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA553C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:13:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D9F8601FD
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D9F8601FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49AED40357;
	Tue,  3 Aug 2021 20:13:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rF22zHe4r6pX; Tue,  3 Aug 2021 20:13:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51DB7400C7;
	Tue,  3 Aug 2021 20:13:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 76D3F1BF83C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6245B400C7
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:13:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rmlI2qqxSChm for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 20:13:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 773CC40001
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 20:13:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D26938B37E; Tue,  3 Aug 2021 20:12:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 22:10:02 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: d8887c5c5883907489626db477978ea5a02481fd
X-Git-Newrev: e0b7a279bddfdd22766d902058f4c3563c889532
X-Patchwork-Hint: ignore
Message-Id: <20210803201252.D26938B37E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] boot/uboot: fix uboot
 building host tools on x86 architecture
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=e0b7a279bddfdd22766d902058f4c3563c889532
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The make all command run the tools/makefile on the process.
This makefile use "pkg-config" command to support static link.
The issue is the use of pkg-config configured for crosscompiling
to build binaries tools for host architecture.
To fix it, I add pkg-config environment variable to configure it for host.

Add a test to avoid future regress on the build of U-boot.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[yann.morin.1998@free.fr:
  - fix mixed space-TAB indentation
  - fix check-package
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2eaa6d0f36291f49ab56a734a4851a6ffe8e8803)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/uboot.mk                                  |  5 +++++
 .../tests/package/test_uboot_openssl_pkgconfig.py    | 20 ++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index dbe82e65b1..a7eaedb06f 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -307,6 +307,11 @@ define UBOOT_BUILD_CMDS
 		cp -f $(UBOOT_CUSTOM_DTS_PATH) $(@D)/arch/$(UBOOT_ARCH)/dts/
 	)
 	$(TARGET_CONFIGURE_OPTS) \
+		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+		PKG_CONFIG_SYSROOT_DIR="/" \
+		PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
+		PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
+		PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig" \
 		$(UBOOT_MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) \
 		$(UBOOT_MAKE_TARGET)
 	$(if $(BR2_TARGET_UBOOT_FORMAT_SD),
diff --git a/support/testing/tests/package/test_uboot_openssl_pkgconfig.py b/support/testing/tests/package/test_uboot_openssl_pkgconfig.py
new file mode 100644
index 0000000000..de2d83f5b8
--- /dev/null
+++ b/support/testing/tests/package/test_uboot_openssl_pkgconfig.py
@@ -0,0 +1,20 @@
+import os
+
+import infra.basetest
+
+
+class TestUbootOpensslPkgConfig(infra.basetest.BRTest):
+    config = infra.basetest.MINIMAL_CONFIG + \
+        """
+        BR2_x86_64=y
+        BR2_x86_atom=y
+        BR2_PACKAGE_OPENSSL=y
+        BR2_TARGET_UBOOT=y
+        BR2_TARGET_UBOOT_BOARD_DEFCONFIG="efi-x86_payload64"
+        BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+        BR2_PACKAGE_HOST_PKGCONF=y
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "u-boot.bin")
+        self.assertTrue(os.path.exists(img))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
