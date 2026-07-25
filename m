Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C957C531D0
	for <buildroot@archiver.kernel.org>; Sat, 25 Jul 2026 21:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E858A80D7D;
	Sat, 25 Jul 2026 21:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ogSpJSdU-Y7C; Sat, 25 Jul 2026 21:57:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E297A80E16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785016669;
	bh=LBVsRxrkoBUVyQmH3UzTu+NXLmz6+gXciOI1Doldq5U=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=JrBAsG1sNTOHUqFfkrfMknaZD6bezqB9+NDyfBJHUtse2OZMJcZ+UYgYn121W+1/X
	 B1cOhvpwKWiyJ46mLok7rm4vunMjaIOcyED1w1LPSZI9BPgey+V/j/+b36dSb9KSmF
	 95EhR3Iw7MzFsj70WN2evXqGZVEFSh+HxMSnmXqW5pArfiUI/uBHRMb6HPoMnjSjKK
	 w3KAv7S9MULMONJYAttUuRZA1ho8a6pijf9tFrzh2F3ItCRT1oL3OdCTlpEE2oihXf
	 boZ4sk4q4wMvqp+nQmEp6KDQCfx6uZzqWRr+CnI1cQLNhQEe+918QkdlgHzgA7g5kK
	 HYA5NVeUWjTVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E297A80E16;
	Sat, 25 Jul 2026 21:57:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 769002E5
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 21:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C05480E16
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 21:57:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d3dFdABrSR9Q for <buildroot@buildroot.org>;
 Sat, 25 Jul 2026 21:57:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4D39080D7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D39080D7D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D39080D7D
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 21:57:46 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 370E05FFAF;
 Sat, 25 Jul 2026 23:57:43 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sat, 25 Jul 2026 23:57:37 +0200
Message-ID: <20260725215737.1555933-1-ju.o@free.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785016664;
 bh=w4mw6TH+TiFXQPI484vWdOjGfb+1BVaAPwkNfVjTfjI=;
 h=From:To:Cc:Subject:Date:From;
 b=DzbvRdDEZBrWxpNfU9WYCJmp6iDVJHwuCfvOJnnEdWAGkv/69MKKGRls6QJ1Isr2F
 2Wm3SQ1RHfCsAZEljZWoF93tvZZCuXizTSCuiINOwEkY6OJdAUTrh+YsZCHl+ofW7N
 ZLMjvk1MFnnvGiYdMEf7wwB2kzltNJduXwgMcDjtbQMRFkUzZetidiNSx4JEA01nc3
 AtI7P6p2CRPELaMY+ycrZ3luc/kZgAOj7t0VKIFMYzhppZAw8Axp0Xnh36KXe+NDkc
 J8p3DqiH7dYru6y+IC7PfdELoiNwaOyFfcsZqrwofMIYjzy49w6gWkWbfECfSTNPY5
 Ce5uR9WTLZJKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DzbvRdDE
Subject: [Buildroot] [PATCH 1/1] support/testing: libgpiod2: new runtime test
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/15535000430
---
 DEVELOPERS                                    |   2 +
 .../testing/tests/package/test_libgpiod2.py   | 127 ++++++++++++++++++
 .../test_libgpiod2/linux-gpio-sim.fragment    |   1 +
 3 files changed, 130 insertions(+)
 create mode 100644 support/testing/tests/package/test_libgpiod2.py
 create mode 100644 support/testing/tests/package/test_libgpiod2/linux-gpio-sim.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index f2713c7239..6e15030373 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1942,6 +1942,8 @@ F:	support/testing/tests/package/test_libcamera.py
 F:	support/testing/tests/package/test_libcamera/
 F:	support/testing/tests/package/test_libcurl.py
 F:	support/testing/tests/package/test_libgpgme.py
+F:	support/testing/tests/package/test_libgpiod2.py
+F:	support/testing/tests/package/test_libgpiod2/
 F:	support/testing/tests/package/test_libjxl.py
 F:	support/testing/tests/package/test_lighttpd.py
 F:	support/testing/tests/package/test_links.py
diff --git a/support/testing/tests/package/test_libgpiod2.py b/support/testing/tests/package/test_libgpiod2.py
new file mode 100644
index 0000000000..8bf471d516
--- /dev/null
+++ b/support/testing/tests/package/test_libgpiod2.py
@@ -0,0 +1,127 @@
+import os
+import time
+
+import infra.basetest
+
+
+class TestLibGpiod2(infra.basetest.BRTest):
+    # This test needs a Kernel with the GPIO simulator module.
+    kern_frag = \
+        infra.filepath("tests/package/test_libgpiod2/linux-gpio-sim.fragment")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.40"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
+        BR2_PACKAGE_LIBGPIOD2=y
+        BR2_PACKAGE_LIBGPIOD2_TOOLS=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def login(self):
+        img = os.path.join(self.builddir, "images", "rootfs.ext2")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(
+            arch="aarch64",
+            kernel=kern,
+            kernel_cmdline=[
+                "root=/dev/vda",
+                "console=ttyAMA0"],
+            options=[
+                "-M", "virt",
+                "-cpu", "cortex-a57",
+                "-m", "512",
+                "-drive", f"file={img},if=virtio,format=raw"
+            ]
+        )
+        self.emulator.login()
+
+    def setup_gpio_sim(self):
+        cfgfsdir = "/sys/kernel/config"
+        gpiodir = f"{cfgfsdir}/gpio-sim"
+        devname = "br-gpio"
+        devdir = f"{gpiodir}/{devname}"
+        banks = 2
+        lines = 2
+
+        # We need configfs mounted to use the gpio-sim module
+        self.assertRunOk(f"mount -t configfs none {cfgfsdir}")
+
+        # We setup a gpio device, with few banks and lines
+        self.assertRunOk(f"mkdir {devdir}")
+        for bank in range(banks):
+            bankdir = f"{devdir}/bank{bank}"
+            self.assertRunOk(f"mkdir {bankdir}")
+            for line in range(lines):
+                linedir = f"{devdir}/bank{bank}/line{line}"
+                cmd = f"mkdir {linedir}"
+                self.assertRunOk(cmd)
+
+                # Set a name to the line
+                name = f"br-b{bank}-l{line}"
+                cmd = f"echo {name} > {linedir}/name"
+                self.assertRunOk(cmd)
+
+            # We set the total number of lines
+            cmd = f"echo {lines} > {bankdir}/num_lines"
+            self.assertRunOk(cmd)
+
+        # Now our test device is configured, we can enable it.
+        self.assertRunOk(f"echo 1 > {devdir}/live")
+
+    def run_input_gpio_test(self):
+        # We get the gpio input value. We expect an inactive state.
+        gpioget_cmd = "gpioget --numeric br-b0-l0"
+        out, ret = self.emulator.run(gpioget_cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(int(out[0]), 0)
+
+        # We pull up the line.
+        cmd = "echo pull-up > /sys/devices/platform/gpio-sim.0/gpiochip0/sim_gpio0/pull"
+        self.assertRunOk(cmd)
+
+        # We query again the gpio. We now expect an active state.
+        out, ret = self.emulator.run(gpioget_cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(int(out[0]), 1)
+
+    def run_output_gpio_test(self):
+        # We query the output state, we expect an inactive state.
+        get_gpio1_cmd = "cat /sys/devices/platform/gpio-sim.0/gpiochip0/sim_gpio1/value"
+        out, ret = self.emulator.run(get_gpio1_cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(int(out[0]), 0)
+
+        # We run gpioset in background, so we are sure the gpio state
+        # is held to the desired state.
+        self.assertRunOk("gpioset br-b0-l1=1 &")
+        time.sleep(2)
+
+        # We query the output state again, we now expect an active state.
+        out, ret = self.emulator.run(get_gpio1_cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(int(out[0]), 1)
+
+    def test_run(self):
+        self.login()
+
+        # We check a binary can execute.
+        self.assertRunOk("gpiodetect --version")
+
+        self.setup_gpio_sim()
+
+        # We show the basic info reported by tools.
+        self.assertRunOk("gpiodetect")
+        self.assertRunOk("gpioinfo")
+
+        self.run_input_gpio_test()
+        self.run_output_gpio_test()
diff --git a/support/testing/tests/package/test_libgpiod2/linux-gpio-sim.fragment b/support/testing/tests/package/test_libgpiod2/linux-gpio-sim.fragment
new file mode 100644
index 0000000000..e7171af743
--- /dev/null
+++ b/support/testing/tests/package/test_libgpiod2/linux-gpio-sim.fragment
@@ -0,0 +1 @@
+CONFIG_GPIO_SIM=y
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
