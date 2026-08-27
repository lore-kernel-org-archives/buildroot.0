Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A123DC61DC6
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 03:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F20D4807A8;
	Thu, 27 Aug 2026 03:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KsNjSpGFyqKI; Thu, 27 Aug 2026 03:27:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787801243;
	bh=nMMlRDE44WylRE+8D2jnHucYcr1urpUfv/6Vf6919HY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nMCYwVndqRehTUAISjJcmA5iAnwsmhJiIdXIyZw9vmbiku/lJWyl40T2A6nwFgbMl
	 IngKGs2LK8hbKNu1QvfuRhQn6CbXXCrCrVIN8uClikb2ZRwplHFw90ND/e07dipYHo
	 duJTzut4ro1zF5my5o6LZKaVJM1eVTWvRzialoaQ8m1MpmN7FkupHMBBvOxlu2+TtT
	 CZI+2zKWpCa+858YoD+KrAwG70/96iz+hpReVFPBK2wEsIoVI2d6U82taiekTsMCxR
	 Sj4agzqb/A1RRBKdFYcwEX5zgOHvsTLx9nlmkIfX8nwEIh9VU+2VmMlw4iu5hTSmDx
	 9njR/cgxggZ1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C754807D7;
	Thu, 27 Aug 2026 03:27:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 435BD334
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 03:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 296E74009E
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 03:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1jvoThy_fOTX for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 03:27:20 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=umbiko.net header.i=@umbiko.net
 header.a=rsa-sha256 header.s=mail header.b=fLjr/15B
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B740240236
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 03:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1787801237; bh=R/qBqrnGJvEKrHPX4H1uHneRB7L9u2l4J8XyDGD3BuY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=fLjr/15B5sSGfxymn+gy9LmI9fDk5DTM5Cp1oCigPb6pbblJCVrbSIvkjUy0wMGjB
 fuNl6Sqv0BtxRtxnJdADOSCsmk/pzkJWKV/avHIk/KC9igjpY1G0oegiHR8RABEhz8
 Bp/4PdfC+gq0lnBBFO5AjNHuLnW5bkvDbB0Krpk4=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id AF57FBDE2AEF;
 Thu, 27 Aug 2026 05:27:16 +0200 (CEST)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Andreas Ziegler <br025@umbiko.net>
Date: Thu, 27 Aug 2026 05:26:39 +0200
Message-ID: <20260827032643.1940-3-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827032643.1940-1-br025@umbiko.net>
References: <20260827032643.1940-1-br025@umbiko.net>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH v3 2/2] support/testing: add runtime test for mpd
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

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
---
Changes v2 -> v3:
	simplify test to be used without test data
	remove mpd.conf rootfs overlay

 DEVELOPERS                                    |  2 +
 support/testing/tests/package/test_mpd.py     | 51 +++++++++++++++++++
 .../tests/package/test_mpd/busybox.fragment   |  4 ++
 .../test_mpd/rootfs-overlay/root/test_mpd.sh  | 35 +++++++++++++
 4 files changed, 92 insertions(+)
 create mode 100644 support/testing/tests/package/test_mpd.py
 create mode 100644 support/testing/tests/package/test_mpd/busybox.fragment
 create mode 100755 support/testing/tests/package/test_mpd/rootfs-overlay/root/test_mpd.sh

diff --git a/DEVELOPERS b/DEVELOPERS
index 5eb438906f..dae1d39ee1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -205,6 +205,8 @@ F:	package/qt6/qt6opcua/
 
 N:	Andreas Ziegler <br025@umbiko.net>
 F:	package/mpd/
+F:	support/testing/tests/package/test_mpd
+F:	support/testing/tests/package/test_mpd.py
 
 N:	Andrey Smirnov <andrew.smirnov@gmail.com>
 F:	package/python-decorator/
diff --git a/support/testing/tests/package/test_mpd.py b/support/testing/tests/package/test_mpd.py
new file mode 100644
index 0000000000..f93033260e
--- /dev/null
+++ b/support/testing/tests/package/test_mpd.py
@@ -0,0 +1,51 @@
+#!/bin/python
+
+import os
+import infra.basetest
+
+class TestMpd(infra.basetest.BRTest):
+
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_mpd/rootfs-overlay")
+    busybox_fragment = \
+        infra.filepath("tests/package/test_mpd/busybox.fragment")
+
+    # use a custom configuration
+    config = \
+        """
+        BR2_x86_64=y
+        BR2_x86_x86_64_v2=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_BLEEDING_EDGE=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+        BR2_ROOTFS_OVERLAY="{}"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_LATEST_VERSION=y
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+        BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="{}"
+        BR2_PACKAGE_MPD=y
+        # BR2_PACKAGE_MPD_MAD is not set
+        # BR2_PACKAGE_MPD_ALSA is not set
+        BR2_TARGET_ROOTFS_INITRAMFS=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(rootfs_overlay, busybox_fragment)
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        kern = os.path.join(self.builddir, "images", "bzImage")
+        self.emulator.boot(arch="x86_64",
+            kernel=kern,
+            kernel_cmdline=["console=ttyS0"],
+            options=[
+                "-M", "q35",
+                "-cpu", "Westmere",
+                "-smp", "2",
+                "-initrd", cpio_file,
+                ])
+
+        self.emulator.login()
+
+        self.assertRunOk("/root/test_mpd.sh", timeout=30)
diff --git a/support/testing/tests/package/test_mpd/busybox.fragment b/support/testing/tests/package/test_mpd/busybox.fragment
new file mode 100644
index 0000000000..0c92d86c49
--- /dev/null
+++ b/support/testing/tests/package/test_mpd/busybox.fragment
@@ -0,0 +1,4 @@
+#
+# Networking Utilities
+#
+CONFIG_NC=y
diff --git a/support/testing/tests/package/test_mpd/rootfs-overlay/root/test_mpd.sh b/support/testing/tests/package/test_mpd/rootfs-overlay/root/test_mpd.sh
new file mode 100755
index 0000000000..4cc6895602
--- /dev/null
+++ b/support/testing/tests/package/test_mpd/rootfs-overlay/root/test_mpd.sh
@@ -0,0 +1,35 @@
+#!/bin/sh
+
+mpd_command() {
+	mpd_result=""
+	mpd_state=""
+	printf "Execute %s" "$1"
+	while IFS= read -r line; do
+		case $line in
+			OK) 						mpd_result=$line ;;
+			OK\ MPD*)					mpd_protocol=${line##* } ;;
+			state:*)					mpd_state=${line##*: } ;;
+			ACK\ \[[0-9]*@[0-9]*\]*)	mpd_error=${line##*\} } ;;
+		esac
+	done <<- EOF
+	$( ( echo "$1"; echo "close" ) | nc localhost 6600 )
+EOF
+
+	if [ "$mpd_result" != "OK" ]; then
+		printf "\nmpd protocol error: %s\n" "$mpd_error"
+		return 1
+	else
+		printf " [OK]\n"
+	fi
+
+	export mpd_protocol
+	export mpd_state
+}
+
+test_mpd() {
+	mpd_command "status" || return 1
+	printf "MPD protocol version: %s\n" "$mpd_protocol"
+}
+
+# run main function if invoked from a subshell
+[ "$0" = "-sh" ] || test_mpd
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
