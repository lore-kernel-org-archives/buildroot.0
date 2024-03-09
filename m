Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D145C54791
	for <buildroot@archiver.kernel.org>; Sat,  9 Mar 2024 21:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C242A40474;
	Sat,  9 Mar 2024 21:34:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SdAyNMuz5LX2; Sat,  9 Mar 2024 21:34:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37EE74042A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37EE74042A;
	Sat,  9 Mar 2024 21:34:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 788901BF2FD
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 21:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FB41407AD
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 21:34:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A0NUkr34hswk for <buildroot@lists.busybox.net>;
 Sat,  9 Mar 2024 21:34:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AD3034079F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD3034079F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD3034079F
 for <buildroot@buildroot.org>; Sat,  9 Mar 2024 21:34:03 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id A22DBB00565;
 Sat,  9 Mar 2024 22:34:00 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat,  9 Mar 2024 22:33:48 +0100
Message-ID: <20240309213348.1646094-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1710020041;
 bh=jT+lQRTRTvLRgtkKK5zj0ckUKUPcZd/1xSq3uJ5MQ2w=;
 h=From:To:Cc:Subject:Date:From;
 b=SFWROK4EDK3JRiDhy7xXp1IIA5X+zck/Ggg6ClT4uNak5siGybrxGTU2g00dEaTUl
 vD1zW2G7JaBWDEVCT7uMxeVcQxJRkiN1NF6wexiZK4Ip9oheJIgA+feRPm0YNYZUCr
 lfd4BRMSh0S0D2ZZ+b95+/it9jbKOuqliQHpdaD6i/aOOeMSOJGQO7BlSQqWCSVKTi
 Mq7q0RxnvLkzEEU6NrJtTgMkXy/zlXdoIDq1HcJBAcsbfJMS6BEFWWYIX3/RuLuzMQ
 qRJsp/WL5XRAK3210JaztGhfe5iOzzrD8jEP5fRVlPD3Zphb8HI11NjshhgnNI+PJn
 1maFayG8LMCiw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SFWROK4E
Subject: [Buildroot] [PATCH v2 1/1] support/testing: add python-pyqt5 test
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v1 -> v2:
- Bump test kernel to 6.1.81
- Solve missing font issue by adding
  - BR2_PACKAGE_DEJAVU=y
  - BR2_PACKAGE_QT5BASE_FONTCONFIG=y
- Add a comment for debugging commands with Qt KMS/DRM and virtio-gpu

Note: this runtime test is expected to fail, if applied alone.
It needs a fix for pyqt5 to succeed, such as:
https://patchwork.ozlabs.org/project/buildroot/patch/20231123174024.2435683-1-hypnotoad@lindra.de/
---
 DEVELOPERS                                    |  2 +
 .../tests/package/test_python_pyqt5.py        | 79 +++++++++++++++++++
 .../test_python_pyqt5/linux-vkms.fragment     |  1 +
 .../rootfs-overlay/root/pyqt5test.py          | 60 ++++++++++++++
 4 files changed, 142 insertions(+)
 create mode 100644 support/testing/tests/package/test_python_pyqt5.py
 create mode 100644 support/testing/tests/package/test_python_pyqt5/linux-vkms.fragment
 create mode 100755 support/testing/tests/package/test_python_pyqt5/rootfs-overlay/root/pyqt5test.py

diff --git a/DEVELOPERS b/DEVELOPERS
index a6364cdd441..1bf737842a2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1844,6 +1844,8 @@ F:	support/testing/tests/package/test_python_magic_wormhole.py
 F:	support/testing/tests/package/test_python_midiutil.py
 F:	support/testing/tests/package/test_python_ml_dtypes.py
 F:	support/testing/tests/package/test_python_pyalsa.py
+F:	support/testing/tests/package/test_python_pyqt5.py
+F:	support/testing/tests/package/test_python_pyqt5/
 F:	support/testing/tests/package/test_python_spake2.py
 F:	support/testing/tests/package/test_rdma_core.py
 F:	support/testing/tests/package/test_rdma_core/
diff --git a/support/testing/tests/package/test_python_pyqt5.py b/support/testing/tests/package/test_python_pyqt5.py
new file mode 100644
index 00000000000..5f1952b5590
--- /dev/null
+++ b/support/testing/tests/package/test_python_pyqt5.py
@@ -0,0 +1,79 @@
+import os
+
+import infra.basetest
+
+
+class TestPythonPyQt5(infra.basetest.BRTest):
+    # We use a specific configuration for:
+    # - using Aarch64, to have more than 256MB memory,
+    # - using a kernel config fragment, to enable VKMS,
+    # - to have an ext4 rootfs image exposed as a virtio storage
+    #   (rather than cpio initrd). This will save some memory, as the
+    #   rootfs image is big.
+    kernel_fragment = \
+        infra.filepath("tests/package/test_python_pyqt5/linux-vkms.fragment")
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_python_pyqt5/rootfs-overlay")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.81"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kernel_fragment}"
+        BR2_PACKAGE_DEJAVU=y
+        BR2_PACKAGE_LIBDRM=y
+        BR2_PACKAGE_MESA3D=y
+        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
+        BR2_PACKAGE_MESA3D_LLVM=y
+        BR2_PACKAGE_MESA3D_OPENGL_EGL=y
+        BR2_PACKAGE_MESA3D_OPENGL_ES=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PYQT5=y
+        BR2_PACKAGE_QT5=y
+        BR2_PACKAGE_QT5BASE_EGLFS=y
+        BR2_PACKAGE_QT5BASE_FONTCONFIG=y
+        BR2_PACKAGE_QT5BASE_WIDGETS=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        drive = os.path.join(self.builddir, "images", "rootfs.ext4")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["root=/dev/vda console=ttyAMA0"],
+                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "512M",
+                                    "-drive", f"file={drive},if=virtio,format=raw"])
+        self.emulator.login()
+
+        # We run the test application with a customized message.
+        # NOTE: to manually debug this test, a Qemu emulator with
+        # virtio-gpu can be used by starting it the command line from
+        # the run log generated by this test, and by adding the
+        # arguments "-device virtio-gpu -display gtk". With this, the
+        # test application will be observable on the Qemu window. Once
+        # logged, we can use the "card1" DRM/KMS device (virtio-gpu,
+        # instead of card0, which is vkms on "card0") by using the
+        # command:
+        #     echo '{"device":"/dev/dri/card1"}' > cfg.json
+        #     export QT_QPA_EGLFS_KMS_CONFIG="$PWD/cfg.json"
+        # The Qt debug can also be enabled with the command:
+        #     export QT_LOGGING_RULES=*=true
+        # Then, run the /root/pyqt5test.py application.
+        msg = "Hello Buildroot."
+        cmd = f'/root/pyqt5test.py "{msg}"'
+        self.assertRunOk(cmd, timeout=30)
+
+        # We check the test message is present in the file created by
+        # the previous application execution.
+        cmd = f'grep -F "{msg}" /root/message.txt'
+        self.assertRunOk(cmd)
diff --git a/support/testing/tests/package/test_python_pyqt5/linux-vkms.fragment b/support/testing/tests/package/test_python_pyqt5/linux-vkms.fragment
new file mode 100644
index 00000000000..ec2ed4460c7
--- /dev/null
+++ b/support/testing/tests/package/test_python_pyqt5/linux-vkms.fragment
@@ -0,0 +1 @@
+CONFIG_DRM_VKMS=y
diff --git a/support/testing/tests/package/test_python_pyqt5/rootfs-overlay/root/pyqt5test.py b/support/testing/tests/package/test_python_pyqt5/rootfs-overlay/root/pyqt5test.py
new file mode 100755
index 00000000000..3efeed76876
--- /dev/null
+++ b/support/testing/tests/package/test_python_pyqt5/rootfs-overlay/root/pyqt5test.py
@@ -0,0 +1,60 @@
+#! /usr/bin/env python3
+#
+# This is a test application for PyQt5. It is showing a text label and
+# a "quit" button. The text of the label can be set with the first
+# (non-Qt) command line argument. A timer will send a click signal to
+# the quit button after 3 seconds. When quitting, the text of the
+# label is saved in a "message.txt" file in the current working
+# directory.
+
+import sys
+
+from PyQt5.QtCore import PYQT_VERSION_STR, QFile, QIODevice, QT_VERSION_STR, QTextStream, QTimer, Qt
+from PyQt5.QtWidgets import QApplication, QLabel, QPushButton, QVBoxLayout, QWidget
+
+
+class TestApp(QWidget):
+
+    def __init__(self, message, parent=None):
+        super(TestApp, self).__init__(parent)
+
+        self.label = QLabel(message)
+        self.label.setAlignment(Qt.AlignCenter)
+
+        self.button = QPushButton("Quit")
+        self.button.clicked.connect(self.on_button_clicked)
+
+        self.layout = QVBoxLayout()
+        self.layout.addWidget(self.label)
+        self.layout.addWidget(self.button)
+
+        self.setLayout(self.layout)
+
+        self.timer = QTimer()
+        self.timer.timeout.connect(self.button.click)
+
+    def on_button_clicked(self):
+        self.save_message()
+        app.quit()
+
+    def save_message(self):
+        f = QFile("message.txt")
+        if f.open(QIODevice.WriteOnly):
+            QTextStream(f) << (self.label.text() + '\n')
+        f.close()
+
+
+if __name__ == "__main__":
+    print("PyQt5 test for Buildroot")
+    print(f"Qt version {QT_VERSION_STR}")
+    print(f"PyQt version {PYQT_VERSION_STR}")
+
+    msg = "Hello World"
+    app = QApplication(sys.argv)
+    args = app.arguments()
+    if len(args) > 1:
+        msg = args[1]
+    testApp = TestApp(message=msg)
+    testApp.show()
+    testApp.timer.start(3000)
+    sys.exit(app.exec())
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
