Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B442CA6012
	for <buildroot@archiver.kernel.org>; Fri,  9 Oct 2026 07:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F5676087E;
	Fri,  9 Oct 2026 07:49:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hoBuWEHA631B; Fri,  9 Oct 2026 07:49:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 907FF6084A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791532191;
	b=ntVNVyEu0/+TDuqT32zzZF2X4MBUe9h5ifizKxL7daflYaXUk8RgExw1cN/+QRynAByj
	 y40/+2iqyFU05ygyzlUqU7Qb2XDa5n9vpxrit+pA854wxv3Sw1i2h/tmaCkpWblyWZ2+6
	 f6B2m4P3CfcVa6+Ha6zpkssbuIudni8oLIpZ4PxNzaKlg1T9Z1w0BnZkaJnuqXKPHfb5J
	 Nw/ZR47DyKAAFKUZbAoHuGRVLiNDpi5eduSL3f4FRmpoECHEPJXufgn+/5pQIf4tZ/FQX
	 CtvixiA+GMNCvtzXVJI0Em6paTWgaK1ImXq9vu3WbtCz2RhpvKIM85MXakUG2Tc6bsw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791532191;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=fbI6NUKYGj5Ch8xmTdOs5DihSr/DEqMlUfvNHRiwU/8=;
	b=N0XwmEGEZMPr/5+F8XeD94Py4dA084x/CNlIcR3tSFaAK+Uh0tEeL6xhPLOZSbS9+97Z
	 4DJeJc0fdq0YJWajXFLDZca8q2AaLEb6TzAjl1QwmEZKc1za3SmrqzQC6aMbAO19Frj1R
	 8fAFAVowUAQ56GNOTcVn5nLIBka2D6PayWrWy3OQp5cUznW/Y+X1laijBo48jyC2lq2VH
	 z4nAgIPPPKQQ7MRO1r4P1MFwnLoVWQzG5HR/+ZAsCMFNZf9FgGmcMsIpqZz25W0FB57vS
	 jnyRjc1BYLFZ5wrPQy6ayWb166C1Mfe3qvDerikhTclvJ1oGzojSEz3lJK+GNixvikQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791532191;
	bh=fbI6NUKYGj5Ch8xmTdOs5DihSr/DEqMlUfvNHRiwU/8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RAEuDZXjWfJOw0Sfdp7OUy9kve3DN1xjuiC+9WDq+Fti5pPdfJKq8xrpP4aLeHAI1
	 aOU7De/OjbXyfpZtJvk2Ux/KnIuKjx4RUL/RbJl7fschJJSWayeBETGVO/BXJ7d5KK
	 +nuSOv9U93RhK+WfVBGb6GrsKPFtbjzLVNHYBki4K4hqBUv92Cjmgp0+yZuOwdzG4H
	 wC/S7P81dZol/3QK/h6e/a2QPOAYaunug0KSp5UZ54yHM7N/0Y1PVpH0cOXxcIVetx
	 T8q+VSEJ7s2MGAWkzz4ML8YNiyshRoU2ALVddtyBdsUeedpwTl3yPu2puEidR2AT4H
	 46t7xFA6jdttQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 907FF6084A;
	Fri,  9 Oct 2026 07:49:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C078E356
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 07:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A682F813F9
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 07:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oy7DhL-QHeMW for <buildroot@buildroot.org>;
 Fri,  9 Oct 2026 07:49:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B047A813F3
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::629"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791532189;
 b=KYIFrkC/gaORaGcA6CrNYN2oAlnw8OPfKsnNnRnnNqghHfogCfiDEzGGp+KxqSoBCQvA
 R2w56g6KwJOWfGZPqS7NSejF/H+MHG5eL2239Ov+f/cDVHFLQ1CXtmuxvs//ljKY+gnb2
 BA3N+xgGcwAAO4arMK0N+xeVKKDL0bgtqyu1qERgd+obDTF2zUCEaY3PxLa2kDq4YDJNv
 /LWoR3n1zMgkP8wB1vkWdhCBlhVU6BDbwkiJRNnw/vRvsIbiulqAsjP5UP6sDt47+Ke/o
 xXikBDdWz3ojG6npSTuZlb5bYXNaUMS/32/6jHOWuJR/5x7MaVrp5TfkNZThga+ouBQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791532189;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=3twUPwvQIMd6D/EOdRs7xIZv0YWjrR4ObOAZeEhVQ/c=;
 b=WSRl0MeTYOJ5f9JR+69upFJzO/WDVUOdpDS5OqxTValzCuGvylVb+o4Hy/ILYkqinzl3
 wr0c+wG7uq5LfjZYODDwp4QGwK5TpGLAie4AhyxV3fExscrUX3GgB/ta8gSVaDWJ55Zfa
 i5gXAL0YffiiJth4pVQIGnam87Ia1yIIZN3iol3M6lf/54vnNPSo6xNp+nFsjewzUdaiT
 M9eWNVjTIHtbb8W6qflCSPCaEMt5MdRd2kohbW98dBA6/KT1Fkh42dGpAsYxQlDvdi0K9
 9dChdf8S7Yqw7MpPRWCtvqXYSX8JkMEhyBCXL99ECw4OCSZyVcbKnWVaovzw2pOOQyA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=RcCfDqh5; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::629"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=mr.zoltan.gyarmati@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=RcCfDqh5
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B047A813F3
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 07:49:48 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-c2e4df2e26fso508985766b.2
 for <buildroot@buildroot.org>; Fri, 09 Oct 2026 00:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791532186; x=1792136986; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3twUPwvQIMd6D/EOdRs7xIZv0YWjrR4ObOAZeEhVQ/c=;
 b=RcCfDqh5wGx3ejTmiH4YJVN2UdhEkG9++kGizDbX6eLoNByCEQhFncuRkb3l1wSfQV
 moUFpmhdL2aj/Iirq1ffz+J0M3V138DFYtZahcmYDgo8itdKplHVfHBLlYIKTeP1iTB7
 DwRt+QScp882MmKwkxWgIs71hrvM/lFTQ3Qk4Cij30tRuYvkhV9z6sG7pDzaSTWc278X
 ZH0/r3vcyvlhCJ1+Lf6NM0/qjO+gryLhNERaWsiV+YbAIwzOCStL5JSmJDlc8m7ykkMQ
 YE2frwl/vx8oyuMMgLWedC7ECpjJeXV0oKI2/EREeSf/oiB9TxaScPpUYyrdOodZlKOB
 U9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791532186; x=1792136986;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3twUPwvQIMd6D/EOdRs7xIZv0YWjrR4ObOAZeEhVQ/c=;
 b=RY9vzXclVe7BiMSke6xLEZhsbwLLD267Q3kgAQ8PDWVVMvtDHjrVBXqo1rivN0RGyf
 QVNFu/pWjdf9LfScPexm0d6ReXtoS5pWSCg0UNN7wCNULoVrkgm/O0t669foIZ5vZRnU
 G/4Dkyn1m3MHE1LzLkO1n3WLCzWW3yRpzHRlJkxK63FJIHnoJVVNimx/saZr+q+ABOeK
 mzJmK/Ed25SDmMiLoR0Am4dTXC1DRIiCCz392ippmhdEdGM4ywiIVWRYMqYr7xIcffIW
 uS5oehWOvo8c+7iET6WQnVTm2DvWzYmvwq8gkWEIwijTfUqG6V5jg9pZNlIzakQ+gs+i
 njJw==
X-Gm-Message-State: AFq9FYKbpXPC8X5fZ+zFg3nXRz8ztOAZtKaqhfWXnIacxoPHDjmsn4AV
 4FdQCVAM9X58mXvXfzw0z9fOGkHiQHdJSfAN+XY6Cbs1LaneVbSP/dxDsiGdLQ==
X-Gm-Gg: AYBFou2whFwJhEGoo4PJG9TbbV9ThXUpwBP8w9Xi3ag4lGARH/BtEFCKcbumblADg9k
 KCv4rGLYCHEiNXolyMy2sNRiLC2NhtTPbl8/ltkAO0W2X7PWRnfZMO/xQHsWM5ite6mmevHAmXw
 ZTMl7PNUj2YKQNX7KLUZQGRulpY7hBlLGh2isz3KxAuncfNRF8mS11X5gmoiZTirYdYYYivrV0Z
 2M7E8icwIf826jWwMcnOtL+7e/YVM4AgOaQGMDH+5GKqCyiw2qDdLQAyg75ljwz9ygJVN8SEHvD
 bw43xuHOEJbNVaUJIKveTCu1apFFrleaVhCxcV0fG/y6s9JWDKNZ4CB62MwAIKQ5dq9ZFBD2YId
 BYhFnWxwZWSUdAY78yWK+aeT+BWaEEuM/gzvs1k9eik7TzSKGKB4WY+hi6S6MIWb1g6IwXjYthW
 H0F8fMGxbs1G7CnwRbCy4iHWP/87n9kJefoV8sTZmW51gazkiLxj2XjUqUCyxPrLZPCQ1gT7dEo
 swXJuugSZue1fsRzsoBGqkpUJaapz4Wtyex0jN89t57nv2G6UszrWxclkby
X-Received: by 2002:a17:907:3d4d:b0:c26:1649:47b2 with SMTP id
 a640c23a62f3a-c31a9fd82bcmr101460366b.40.1791532186211; 
 Fri, 09 Oct 2026 00:49:46 -0700 (PDT)
Received: from PECS-93BMLD4.foss.net (254C249B.nat.pool.telekom.hu.
 [37.76.36.155]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c31a9a38050sm56277966b.24.2026.10.09.00.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2026 00:49:45 -0700 (PDT)
From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
To: buildroot@buildroot.org
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Fri,  9 Oct 2026 09:49:37 +0200
Message-ID: <20261009074937.992939-3-mr.zoltan.gyarmati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009074937.992939-1-mr.zoltan.gyarmati@gmail.com>
References: <20261009074937.992939-1-mr.zoltan.gyarmati@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3]
 support/testing/tests/package/test_libusb_compat: new runtime test
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

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 DEVELOPERS                                    |  2 +
 .../tests/package/test_libusb_compat.py       | 58 +++++++++++++++++++
 .../test_libusb_compat/linux-usb.fragment     |  2 +
 3 files changed, 62 insertions(+)
 create mode 100644 support/testing/tests/package/test_libusb_compat.py
 create mode 100644 support/testing/tests/package/test_libusb_compat/linux-usb.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index 32ac338dc8..c850878e57 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3628,4 +3628,6 @@ F:	package/quazip/
 F:	package/shapelib/
 F:	package/simple-mail/
 F:	package/tinc/
+F:	support/testing/tests/package/test_libusb_compat.py
+F:	support/testing/tests/package/test_libusb_compat/
 F:	support/testing/tests/package/test_quazip.py
diff --git a/support/testing/tests/package/test_libusb_compat.py b/support/testing/tests/package/test_libusb_compat.py
new file mode 100644
index 0000000000..d0bb57d4cc
--- /dev/null
+++ b/support/testing/tests/package/test_libusb_compat.py
@@ -0,0 +1,58 @@
+import os
+
+import infra.basetest
+
+
+class TestLibusbCompat(infra.basetest.BRTest):
+    # enable USB 2.0 support so we can test the USB enumeration in qemu
+    linux_fragment = \
+        infra.filepath("tests/package/test_libusb_compat/linux-usb.fragment")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.73"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{linux_fragment}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_LIBUSB=y
+        BR2_PACKAGE_LIBUSB_COMPAT=y
+        BR2_PACKAGE_LIBUSB_COMPAT_EXAMPLES=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    examples_dir = "/usr/libexec/libusb-compat/examples"
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        # We add a USB keyboard device for the test.
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "256M",
+                                    "-initrd", img,
+                                    "-device", "usb-ehci,id=ehci",
+                                    "-device", "usb-kbd,bus=ehci.0"])
+        self.emulator.login()
+
+        # The lsusb example prints "idVendor:idProduct" for every
+        # device. We expect the Linux Foundation 2.0 root hub
+        # (1d6b:0002) and the QEMU USB keyboard (0627:0001).
+        output, exit_code = self.emulator.run(f"{self.examples_dir}/lsusb")
+        self.assertEqual(exit_code, 0)
+        self.assertIn("1d6b:0002", output)
+        self.assertIn("0627:0001", output)
+
+        # The testlibusb example opens every device and prints its
+        # descriptors. The keyboard should show up as a HID
+        # (bInterfaceClass 3) device.
+        output, exit_code = self.emulator.run(f"{self.examples_dir}/testlibusb -v")
+        self.assertEqual(exit_code, 0)
+        self.assertIn("bInterfaceClass:    3", "\n".join(output))
diff --git a/support/testing/tests/package/test_libusb_compat/linux-usb.fragment b/support/testing/tests/package/test_libusb_compat/linux-usb.fragment
new file mode 100644
index 0000000000..d9abd2821e
--- /dev/null
+++ b/support/testing/tests/package/test_libusb_compat/linux-usb.fragment
@@ -0,0 +1,2 @@
+CONFIG_USB=y
+CONFIG_USB_EHCI_HCD=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
