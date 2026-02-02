Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECA9E7DEF0
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 14:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AF0640B7C;
	Mon,  2 Feb 2026 14:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5coGLYEGSWMQ; Mon,  2 Feb 2026 14:46:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15CB340BCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770043571;
	bh=qT9qzRnWRSOdVBPPPj6MCV8l9EkgEw4p++AcZQ9+dlk=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=KmtUG0iW/rSGm6r0KzJguQJcmecs+dyw8s94gjueo3M5fm4Fxvh3jojfJt+iMgTmX
	 D3POupD4UfkCb1Gk8mg1C/fr/vznDE3d3emfM4Gc0+UpxmPaWNK3UFf4L4ennNqrpN
	 re2SoeaNLDik3dIVFOpwoBhcL0BOCs1eN7YDRMTRG/0jfYG9fxkw1e+/nrs09u0rG0
	 SjutoLI8ho5sJdYZTPaS0bWWNZ0KjKZtQitTB5rpr+KY/Voy2lg41CulYJZ4IKEhON
	 8Ki94kzwYF9O6TDTUU3uvnJ4oXDP9VpbWt3mMbqDNIokkli39H9fBcqiNppPYPEzWN
	 I9+lgWOd+e+9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15CB340BCC;
	Mon,  2 Feb 2026 14:46:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B26023E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDE6640314
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4yK1zZYOQze0 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 14:46:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 33979402F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33979402F5
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33979402F5
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:46:04 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47ee937ecf2so38606685e9.0
 for <buildroot@buildroot.org>; Mon, 02 Feb 2026 06:46:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770043562; x=1770648362;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0psklSath3K992Hynm8Ce/fKHoYWRgNJ0ID9Db51Fbo=;
 b=F8mGcXHV2q4EZL2AACDKDZYRrzZ18Pe4jniBdPcsb2rYlGz2UDsQIZdmxd7fiIulyH
 gBqchMC1vp1OQ3/VSuqlBPtFO+jo4wvWhRtAFNjkoTBvMFM7O5imRxI5YO3EbwViR//L
 zwr+YVzQlMFmurGnO6gd/4xsdEBDXcBgYjt/AWIcRzAeeGVN/ri4jTXB37izy0ZX6WAY
 5nOfiGeXo46dS56Tk+PfK6hzgbnPfMJvzoVLnB6EEMkV2cs6cd1IGxlwvcFg5/QsASw7
 spk7BIBJv8mD6VAjXaEqdtRyaIq4aNC5wvNfUAWJrAdC8sjW6AnpSPwYEQzsFRn7Mn/T
 hCpw==
X-Gm-Message-State: AOJu0YyLgrTp4YnIiGtudqJnwUHDm9ywzkaysFcM7I/F68cBXy4TKpHY
 /K8xRL7q9tDGgwycxdmVhKz8HOdX3b8DIgkD6dcpPKd8bvqPfqfzM2F3CraqKt2W8207WRrLtMs
 ZkjM1AwY=
X-Gm-Gg: AZuq6aIggYLVf79onYGtbEKk+VZ71T/ijmlM8U9csMMc0RyIVhmXxhdH8EVjxGKoMee
 CkJKhlmPNQIc/yeG8s9pQ/RqUelNdgJf+H28aRDnt6IJAxoq/ZgP7lTeB+lehZCg/1EJuRSHuJH
 xPl50s87nDvGPP+pIX3sW+Etsw4yh6ByeTcykc1cdptIc3UXqwXTgnMEo/65c2lesekyW5vNCsb
 xV1HK0nyGYYed8/QE6I1/Ha0HU/C1xneNHNcQ2xxuqNRCVyFUQ3jL0CU6XoNFklAkJAJ+Ufc1sx
 9tfPL4qH/W8RSojZUxuYt70bbSfb4IuBaxnwq/csrlSr5LWN76xI7uaavbyx/7jyjLBtmw1tHHz
 vcPAFDXTVoS/Y/lUqi0ISX7i02qlG47pn4C8Dx/KJG5zIVjoJ3zjbcigReIjbECxgryjnM7Egwl
 JoHWijBJzaDOGMLkskXny80jnx9jJaXTIgCOPpqD9cFZUtFesi1Hlfh7AGYEU=
X-Received: by 2002:a05:600c:8b65:b0:46e:59bd:f7e2 with SMTP id
 5b1f17b1804b1-482db476bdemr185294945e9.11.1770043562095; 
 Mon, 02 Feb 2026 06:46:02 -0800 (PST)
Received: from P-NTS-Evian (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e474csm43416476f8f.2.2026.02.02.06.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 06:46:01 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Mon,  2 Feb 2026 15:45:50 +0100
Message-ID: <20260202144550.1877480-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770043562; x=1770648362; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0psklSath3K992Hynm8Ce/fKHoYWRgNJ0ID9Db51Fbo=;
 b=ruaLpzQBjAgju6vg6IyN9NsJoWexbYNOrEOWn7l2EZ9gITNZ9W2p0MwhCsZjbpp4pL
 SuuRv+Mwc7O0GmXRtacSnZtHASOkLw1rmYM9mt73jESILs+xuo7wnnv2RMPOe7Ymtv2A
 q8h0u691hCdg5qmyHBPSnnLqANOll91/8yRe4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=ruaLpzQB
Subject: [Buildroot] [PATCH] support/testing/tests/package/test_firewalld:
 use ext2 instead of cpio
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CPIO filesystem generated by the test_firewalld test is too
large, and doesn't fit as an initramfs in the 256MB of RAM available
in the versatilepb machine. This causes a "Initramfs unpacking failed:
write error" when booting, and many files being missing from the root
filesystem, ultimately causing the test to fail.

The test_firewalld test initially started to fail following a systemd
update [1][3]:

  [BRTEST# systemctl is-active firewalld
  failed

But really started to crash at boot following a python 3.14 update
[2][4]:

  Run /init as init process
  /init: exec: line 15: /sbin/init: not found

Also, update TestFirewalldSysVInit to use ext2 instead of cpio.

[1] 926e0504d06b5d61d7affb24b94b133b916b71f7
[2] a0a6abc8b193e5bdab5326324d7299c19d5d8c67

Fixes:
[3] https://gitlab.com/buildroot.org/buildroot/-/jobs/12944797059
[4] https://gitlab.com/buildroot.org/buildroot/-/jobs/11856840940

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../testing/tests/package/test_firewalld.py   | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/support/testing/tests/package/test_firewalld.py b/support/testing/tests/package/test_firewalld.py
index 700337f637..1093873b38 100644
--- a/support/testing/tests/package/test_firewalld.py
+++ b/support/testing/tests/package/test_firewalld.py
@@ -23,19 +23,21 @@ class TestFirewalldSystemd(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_FIREWALLD=y
-        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
         # BR2_TARGET_ROOTFS_TAR is not set
         """
 
     def test_run(self):
-        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        ext2_file = os.path.join(self.builddir, "images", "rootfs.ext2")
         kernel_file = os.path.join(self.builddir, "images", "zImage")
         dtb_file = os.path.join(self.builddir, "images", "vexpress-v2p-ca9.dtb")
         self.emulator.boot(arch="armv7",
                            kernel=kernel_file,
-                           kernel_cmdline=["console=ttyAMA0,115200"],
+                           kernel_cmdline=["console=ttyAMA0,115200",
+                                           "rootwait", "root=/dev/mmcblk0"],
                            options=[
-                               "-initrd", cpio_file,
+                               '-drive', f'file={ext2_file},if=sd,format=raw',
                                "-dtb", dtb_file,
                                "-M", "vexpress-a9"
                            ])
@@ -78,19 +80,21 @@ class TestFirewalldSysVInit(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_FIREWALLD=y
-        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
         # BR2_TARGET_ROOTFS_TAR is not set
         """
 
     def test_run(self):
-        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        ext2_file = os.path.join(self.builddir, "images", "rootfs.ext2")
         kernel_file = os.path.join(self.builddir, "images", "zImage")
         dtb_file = os.path.join(self.builddir, "images", "vexpress-v2p-ca9.dtb")
         self.emulator.boot(arch="armv7",
                            kernel=kernel_file,
-                           kernel_cmdline=["console=ttyAMA0,115200"],
+                           kernel_cmdline=["console=ttyAMA0,115200",
+                                           "rootwait", "root=/dev/mmcblk0"],
                            options=[
-                               "-initrd", cpio_file,
+                               '-drive', f'file={ext2_file},if=sd,format=raw',
                                "-dtb", dtb_file,
                                "-M", "vexpress-a9"
                            ])
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
