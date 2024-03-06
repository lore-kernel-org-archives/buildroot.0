Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FCDC5475B
	for <buildroot@archiver.kernel.org>; Wed,  6 Mar 2024 18:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4C17418C4;
	Wed,  6 Mar 2024 18:41:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tZxIpTpf1YSs; Wed,  6 Mar 2024 18:41:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AFFE41902
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AFFE41902;
	Wed,  6 Mar 2024 18:41:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 293421BF5A3
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 18:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 162B941902
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 18:41:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JJeDAYGBjdBK for <buildroot@lists.busybox.net>;
 Wed,  6 Mar 2024 18:41:32 +0000 (UTC)
X-Greylist: delayed 601 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 06 Mar 2024 18:41:31 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 556BC418C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 556BC418C4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.241.56.172;
 helo=mout-p-202.mailbox.org; envelope-from=hypnotoad@lindra.de;
 receiver=<UNKNOWN> 
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 556BC418C4
 for <buildroot@buildroot.org>; Wed,  6 Mar 2024 18:41:30 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4TqgnN1M71z9t7F;
 Wed,  6 Mar 2024 19:24:24 +0100 (CET)
Message-ID: <a1dde2bc-9c22-45ae-91f4-352eba887169@lindra.de>
Date: Wed, 6 Mar 2024 19:24:22 +0100
MIME-Version: 1.0
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240110202319.139004-1-ju.o@free.fr>
Content-Language: en-US
From: Ralf Dragon <hypnotoad@lindra.de>
In-Reply-To: <20240110202319.139004-1-ju.o@free.fr>
X-Rspamd-Queue-Id: 4TqgnN1M71z9t7F
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lindra.de; s=MBO0001; t=1709749464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JBuLzMNj6ZSw404AHEA8/2fIdvC/BJI6p0XR7tzq3i0=;
 b=lg3zfOMwg7lXd5X0aW+7o2/0LZZ0miJZ5AYbFihz0s5suk546zDBev55dNrLGbpLKixtMq
 CFiNngzT0xCOv4vnMA9Dt6aii/OzJc1pYmyVR/eQd6Il++lTwcZZ0NR3sc0j5UCJBgQs+C
 0lihdpcyOjwiTe/tA9VKkZVLTZ7AdDnHogl436hf8WYkKilmnaDNrB2ig4AejyYvgYrxw4
 7eEGgZ6XjM9V/ZF9FcG02kmuNoHX7JJq+q18dCv0waoINJpvuYtx6KAdRw4V4a51yWV0WH
 zlzXzT5fvKDjcbvByn9wDxlV0/8sWTmIy6CXKXpKvnJ3lfWaNxApNkrt4HvjSw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=lindra.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=lindra.de header.i=@lindra.de header.a=rsa-sha256
 header.s=MBO0001 header.b=lg3zfOMw
Subject: Re: [Buildroot] [PATCH RFC 1/1] support/testing: add python-pyqt5
 test
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============5081993782983209601=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============5081993782983209601==
Content-Type: multipart/alternative;
 boundary="------------lUb5RkXv3fxGzAcXYti4hxhL"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------lUb5RkXv3fxGzAcXYti4hxhL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I think this thread got forgotten and nothing has been merged yet.

To summarize

- there is a nice test now which confirms that my patch 
https://patchwork.ozlabs.org/project/buildroot/patch/20231212160112.94272-2-hypnotoad@lindra.de/ 
seems to be needed for the runtime

- the test uncovered 2 problems, one direct dependency and another 
runtime dependency (fonts)

What would be the next step to get this integrated?

Best,

Ralf



Am 10.01.24 um 21:23 schrieb Julien Olivain:
> Signed-off-by: Julien Olivain<ju.o@free.fr>
> ---
> Few notes:
>
> This runtime test was suggested by Thomas in:
> https://lists.buildroot.org/pipermail/buildroot/2023-December/681113.html
>
> In order to work, the patch
> https://patchwork.ozlabs.org/project/buildroot/patch/20231212160112.94272-2-hypnotoad@lindra.de/
> needs to be also applied.
>
> I tested this patch on branch master at commit 22393c9 with commands:
>
>      make check-package
>      ...
>      0 warnings generated
>
>      support/testing/run-tests \
>          -d dl -o output_folder \
>          tests.package.test_python_pyqt5
>      ...
>      OK
>
> Doing this test, I've spotted few issues:
>
> The test needs to select BR2_PACKAGE_QT5BASE_WIDGETS=y
> otherwise, the build fails. I believe this is a missing build
> dependency in python-pyqt5 (to be confirmed).
>
> Also, Qt5 no longer ships fonts. So the test application runs
> without any text. It shows a warning on the console:
>
>      QFontDatabase: Cannot find font directory /usr/lib/fonts.
>      Note that Qt no longer ships fonts. Deploy some (fromhttps://dejavu-fonts.github.io/  for example) or switch to fontconfig.
>
> It's not a real problem for the test. But using
> (Py)Qt5 with EGLFS directly on KMS/DRM (i.e. without X11 nor Weston)
> seems a valid use-case. I was not able to install fonts without X11.
> ---
>   DEVELOPERS                                    |  2 +
>   .../tests/package/test_python_pyqt5.py        | 61 +++++++++++++++++++
>   .../test_python_pyqt5/linux-vkms.fragment     |  1 +
>   .../rootfs-overlay/root/pyqt5test.py          | 60 ++++++++++++++++++
>   4 files changed, 124 insertions(+)
>   create mode 100644 support/testing/tests/package/test_python_pyqt5.py
>   create mode 100644 support/testing/tests/package/test_python_pyqt5/linux-vkms.fragment
>   create mode 100755 support/testing/tests/package/test_python_pyqt5/rootfs-overlay/root/pyqt5test.py
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d7543247f2..7aecb828e4 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1806,6 +1806,8 @@ F:	support/testing/tests/package/test_python_magic_wormhole.py
>   F:	support/testing/tests/package/test_python_midiutil.py
>   F:	support/testing/tests/package/test_python_ml_dtypes.py
>   F:	support/testing/tests/package/test_python_pyalsa.py
> +F:	support/testing/tests/package/test_python_pyqt5.py
> +F:	support/testing/tests/package/test_python_pyqt5/
>   F:	support/testing/tests/package/test_python_spake2.py
>   F:	support/testing/tests/package/test_rdma_core.py
>   F:	support/testing/tests/package/test_rdma_core/
> diff --git a/support/testing/tests/package/test_python_pyqt5.py b/support/testing/tests/package/test_python_pyqt5.py
> new file mode 100644
> index 0000000000..6ef0577878
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_pyqt5.py
> @@ -0,0 +1,61 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestPythonPyQt5(infra.basetest.BRTest):
> +    # We use a specific configuration for:
> +    # - using Aarch64, to have more than 256MB memory,
> +    # - using a kernel config fragment, to enable VKMS,
> +    # - to have an ext4 rootfs image exposed as a virtio storage
> +    #   (rather than cpio initrd). This will save some memory, as the
> +    #   rootfs image is big.
> +    config = \
> +        f"""
> +        BR2_aarch64=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.72"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> +        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{infra.filepath("tests/package/test_python_pyqt5/linux-vkms.fragment")}"
> +        BR2_PACKAGE_LIBDRM=y
> +        BR2_PACKAGE_MESA3D=y
> +        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
> +        BR2_PACKAGE_MESA3D_LLVM=y
> +        BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> +        BR2_PACKAGE_MESA3D_OPENGL_ES=y
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_PYQT5=y
> +        BR2_PACKAGE_QT5=y
> +        BR2_PACKAGE_QT5BASE_EGLFS=y
> +        BR2_PACKAGE_QT5BASE_WIDGETS=y
> +        BR2_ROOTFS_OVERLAY="{infra.filepath("tests/package/test_python_pyqt5/rootfs-overlay")}"
> +        BR2_TARGET_ROOTFS_EXT2=y
> +        BR2_TARGET_ROOTFS_EXT2_4=y
> +        BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """.format(
> +            )
> +
> +    def test_run(self):
> +        drive = os.path.join(self.builddir, "images", "rootfs.ext4")
> +        kern = os.path.join(self.builddir, "images", "Image")
> +        self.emulator.boot(arch="aarch64",
> +                           kernel=kern,
> +                           kernel_cmdline=["root=/dev/vda console=ttyAMA0"],
> +                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "512M",
> +                                    "-drive", f"file={drive},if=virtio,format=raw"])
> +        self.emulator.login()
> +
> +        # We run the test application with a customized message.
> +        msg = "Hello Buildroot."
> +        cmd = f'/root/pyqt5test.py "{msg}"'
> +        self.assertRunOk(cmd, timeout=30)
> +
> +        # We check the test message is present in the file created by
> +        # the previous application execution.
> +        cmd = f'grep -F "{msg}" /root/message.txt'
> +        self.assertRunOk(cmd)
> diff --git a/support/testing/tests/package/test_python_pyqt5/linux-vkms.fragment b/support/testing/tests/package/test_python_pyqt5/linux-vkms.fragment
> new file mode 100644
> index 0000000000..ec2ed4460c
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_pyqt5/linux-vkms.fragment
> @@ -0,0 +1 @@
> +CONFIG_DRM_VKMS=y
> diff --git a/support/testing/tests/package/test_python_pyqt5/rootfs-overlay/root/pyqt5test.py b/support/testing/tests/package/test_python_pyqt5/rootfs-overlay/root/pyqt5test.py
> new file mode 100755
> index 0000000000..3efeed7687
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_pyqt5/rootfs-overlay/root/pyqt5test.py
> @@ -0,0 +1,60 @@
> +#! /usr/bin/env python3
> +#
> +# This is a test application for PyQt5. It is showing a text label and
> +# a "quit" button. The text of the label can be set with the first
> +# (non-Qt) command line argument. A timer will send a click signal to
> +# the quit button after 3 seconds. When quitting, the text of the
> +# label is saved in a "message.txt" file in the current working
> +# directory.
> +
> +import sys
> +
> +from PyQt5.QtCore import PYQT_VERSION_STR, QFile, QIODevice, QT_VERSION_STR, QTextStream, QTimer, Qt
> +from PyQt5.QtWidgets import QApplication, QLabel, QPushButton, QVBoxLayout, QWidget
> +
> +
> +class TestApp(QWidget):
> +
> +    def __init__(self, message, parent=None):
> +        super(TestApp, self).__init__(parent)
> +
> +        self.label = QLabel(message)
> +        self.label.setAlignment(Qt.AlignCenter)
> +
> +        self.button = QPushButton("Quit")
> +        self.button.clicked.connect(self.on_button_clicked)
> +
> +        self.layout = QVBoxLayout()
> +        self.layout.addWidget(self.label)
> +        self.layout.addWidget(self.button)
> +
> +        self.setLayout(self.layout)
> +
> +        self.timer = QTimer()
> +        self.timer.timeout.connect(self.button.click)
> +
> +    def on_button_clicked(self):
> +        self.save_message()
> +        app.quit()
> +
> +    def save_message(self):
> +        f = QFile("message.txt")
> +        if f.open(QIODevice.WriteOnly):
> +            QTextStream(f) << (self.label.text() + '\n')
> +        f.close()
> +
> +
> +if __name__ == "__main__":
> +    print("PyQt5 test for Buildroot")
> +    print(f"Qt version {QT_VERSION_STR}")
> +    print(f"PyQt version {PYQT_VERSION_STR}")
> +
> +    msg = "Hello World"
> +    app = QApplication(sys.argv)
> +    args = app.arguments()
> +    if len(args) > 1:
> +        msg = args[1]
> +    testApp = TestApp(message=msg)
> +    testApp.show()
> +    testApp.timer.start(3000)
> +    sys.exit(app.exec())
--------------lUb5RkXv3fxGzAcXYti4hxhL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi all,</p>
    <p>I think this thread got forgotten and nothing has been merged
      yet.<br>
    </p>
    <p>To summarize</p>
    <p>- there is a nice test now which confirms that my patch <span
      style="white-space: pre-wrap"><a class="moz-txt-link-freetext" href="https://patchwork.ozlabs.org/project/buildroot/patch/20231212160112.94272-2-hypnotoad@lindra.de/">https://patchwork.ozlabs.org/project/buildroot/patch/20231212160112.94272-2-hypnotoad@lindra.de/</a> seems to be needed for the runtime</span></p>
    <p><span style="white-space: pre-wrap">- the test uncovered 2 problems, one direct dependency and another runtime dependency (fonts)
</span></p>
    <p>What would be the next step to get this integrated?<br>
    </p>
    <p>Best,</p>
    <p>Ralf<br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">Am 10.01.24 um 21:23 schrieb Julien
      Olivain:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240110202319.139004-1-ju.o@free.fr">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Julien Olivain <a class="moz-txt-link-rfc2396E" href="mailto:ju.o@free.fr">&lt;ju.o@free.fr&gt;</a>
---
Few notes:

This runtime test was suggested by Thomas in:
<a class="moz-txt-link-freetext" href="https://lists.buildroot.org/pipermail/buildroot/2023-December/681113.html">https://lists.buildroot.org/pipermail/buildroot/2023-December/681113.html</a>

In order to work, the patch
<a class="moz-txt-link-freetext" href="https://patchwork.ozlabs.org/project/buildroot/patch/20231212160112.94272-2-hypnotoad@lindra.de/">https://patchwork.ozlabs.org/project/buildroot/patch/20231212160112.94272-2-hypnotoad@lindra.de/</a>
needs to be also applied.

I tested this patch on branch master at commit 22393c9 with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_python_pyqt5
    ...
    OK

Doing this test, I've spotted few issues:

The test needs to select BR2_PACKAGE_QT5BASE_WIDGETS=y
otherwise, the build fails. I believe this is a missing build
dependency in python-pyqt5 (to be confirmed).

Also, Qt5 no longer ships fonts. So the test application runs
without any text. It shows a warning on the console:

    QFontDatabase: Cannot find font directory /usr/lib/fonts.
    Note that Qt no longer ships fonts. Deploy some (from <a class="moz-txt-link-freetext" href="https://dejavu-fonts.github.io/">https://dejavu-fonts.github.io/</a> for example) or switch to fontconfig.

It's not a real problem for the test. But using
(Py)Qt5 with EGLFS directly on KMS/DRM (i.e. without X11 nor Weston)
seems a valid use-case. I was not able to install fonts without X11.
---
 DEVELOPERS                                    |  2 +
 .../tests/package/test_python_pyqt5.py        | 61 +++++++++++++++++++
 .../test_python_pyqt5/linux-vkms.fragment     |  1 +
 .../rootfs-overlay/root/pyqt5test.py          | 60 ++++++++++++++++++
 4 files changed, 124 insertions(+)
 create mode 100644 support/testing/tests/package/test_python_pyqt5.py
 create mode 100644 support/testing/tests/package/test_python_pyqt5/linux-vkms.fragment
 create mode 100755 support/testing/tests/package/test_python_pyqt5/rootfs-overlay/root/pyqt5test.py

diff --git a/DEVELOPERS b/DEVELOPERS
index d7543247f2..7aecb828e4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1806,6 +1806,8 @@ F:	support/testing/tests/package/test_python_magic_wormhole.py
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
index 0000000000..6ef0577878
--- /dev/null
+++ b/support/testing/tests/package/test_python_pyqt5.py
@@ -0,0 +1,61 @@
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
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.72"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{infra.filepath("tests/package/test_python_pyqt5/linux-vkms.fragment")}"
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
+        BR2_PACKAGE_QT5BASE_WIDGETS=y
+        BR2_ROOTFS_OVERLAY="{infra.filepath("tests/package/test_python_pyqt5/rootfs-overlay")}"
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+            )
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
index 0000000000..ec2ed4460c
--- /dev/null
+++ b/support/testing/tests/package/test_python_pyqt5/linux-vkms.fragment
@@ -0,0 +1 @@
+CONFIG_DRM_VKMS=y
diff --git a/support/testing/tests/package/test_python_pyqt5/rootfs-overlay/root/pyqt5test.py b/support/testing/tests/package/test_python_pyqt5/rootfs-overlay/root/pyqt5test.py
new file mode 100755
index 0000000000..3efeed7687
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
+            QTextStream(f) &lt;&lt; (self.label.text() + '\n')
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
+    if len(args) &gt; 1:
+        msg = args[1]
+    testApp = TestApp(message=msg)
+    testApp.show()
+    testApp.timer.start(3000)
+    sys.exit(app.exec())
</pre>
    </blockquote>
  </body>
</html>

--------------lUb5RkXv3fxGzAcXYti4hxhL--

--===============5081993782983209601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5081993782983209601==--
