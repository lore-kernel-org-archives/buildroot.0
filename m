Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3938FC433EF
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 19:45:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B594860F55
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 19:45:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B594860F55
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43BDA4078A;
	Fri,  5 Nov 2021 19:45:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wqHY5hh6dcKv; Fri,  5 Nov 2021 19:45:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69C964078D;
	Fri,  5 Nov 2021 19:45:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3EA5A1BF580
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 19:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CD1B40190
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 19:45:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Q7FbaThOnZ1 for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 19:45:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77E8C40151
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 19:45:46 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id 71so7928910wma.4
 for <buildroot@buildroot.org>; Fri, 05 Nov 2021 12:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nx0TVQvlwu/mPFR30j5n/Mb4UE9Gx0nkY7NtHWkOPis=;
 b=mQFfYDghjvte+pX853OSV7NZms9Sq3F2SW534ZO53PW4BhsMVBHqCgpXpPkO8kW5PW
 j4ZZEgwtWKQxyp0TJwrOiOcUywmrz/CHyjOGpUedjQHGye29HEpSVXy/rDSAQzIfdxGW
 YILADXqCKUG25W1hR/5hvIWihjCw9AgP1K2Q16QjsovZ3/3W4eTWduk4mERIK9wyET0O
 Memnx8GrJNBX7NvJywYi3cQvWg+7QYaFFupwmWNvPWg1aLHRE3XR2SxkjemToLH4sDF+
 cCDFJeg3ogq3Kq8u56mTktSU3oyEKqOoqI0RowsWxIaIQCPHBFCN7FaLb4hVzL7ZMfkw
 z+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nx0TVQvlwu/mPFR30j5n/Mb4UE9Gx0nkY7NtHWkOPis=;
 b=ndII7yDUUUE2nFHx23Lg9OEg7ndg0nIsMVPcGQTEkmv1DAjSgvbbnwtvsmSPS3h6bh
 M/Tm6SIFQV3vDPaNT8SMcAVfsUNi8bMQXvIFHAlgit4CuST6qwfs9m7sXqLy2IeWsaQb
 iYO3lZCIP8Dtss1RzqqXPYGCR1UQ7eSwBCCUJuQPUtS9qGkDoKQPjDequZS7VBlbObB7
 zlz3S+po4Ih8HuTXDhLXkD6CizZiuuBwUdzutcG6GzH5pS0lO1PTjIXU6imlEZHO8YvG
 dG/CswfmnzUSR8ctriiNMSITnTPP1aBxNkcMofkt1Y9+TKZ17F8c8dwn4an/rzofyroy
 DeAw==
X-Gm-Message-State: AOAM5324Z5pgjk6/f2mKNkkNZX22FMNlFOUtLhPcIvnhP2sP7mldAiFn
 w/9QnnsxJlwb2hqX6hrC2StN0bhvfQk=
X-Google-Smtp-Source: ABdhPJxgWvLASwaRxuM1tZxWNNw0ulDjjbZRY70IWSRR0NyP8HLAIzlOf2IXcTHcL+vVzAGkJwnymA==
X-Received: by 2002:a05:600c:4982:: with SMTP id
 h2mr32639864wmp.4.1636141544476; 
 Fri, 05 Nov 2021 12:45:44 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id t8sm6526140wmq.32.2021.11.05.12.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 12:45:43 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Nov 2021 20:45:33 +0100
Message-Id: <20211105194536.940253-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/4] board/qemu/mips*-malta: switch from IDE
 disk to SCSI disk
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A following patch will switch to the kernel 5.15 for all qemu
defconfigs but the IDE support (used by mips malta) has been
removed from the Linux kernel since 5.14 release [1].

Enable the SCSI support and update the kernel command line.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=b7fb14d3ac63117e0e8beabe75f4ea52051fbe3a

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 board/qemu/mips32r2-malta/linux.config   | 8 +++-----
 board/qemu/mips32r2-malta/readme.txt     | 2 +-
 board/qemu/mips32r2el-malta/linux.config | 8 +++-----
 board/qemu/mips32r2el-malta/readme.txt   | 2 +-
 board/qemu/mips32r6-malta/linux.config   | 8 +++-----
 board/qemu/mips32r6-malta/readme.txt     | 2 +-
 board/qemu/mips32r6el-malta/linux.config | 8 +++-----
 board/qemu/mips32r6el-malta/readme.txt   | 2 +-
 board/qemu/mips64-malta/linux.config     | 8 +++-----
 board/qemu/mips64-malta/readme.txt       | 2 +-
 board/qemu/mips64el-malta/linux.config   | 8 +++-----
 board/qemu/mips64el-malta/readme.txt     | 2 +-
 board/qemu/mips64r6-malta/linux.config   | 8 +++-----
 board/qemu/mips64r6-malta/readme.txt     | 2 +-
 board/qemu/mips64r6el-malta/readme.txt   | 2 +-
 15 files changed, 29 insertions(+), 43 deletions(-)

diff --git a/board/qemu/mips32r2-malta/linux.config b/board/qemu/mips32r2-malta/linux.config
index 3a26ac830f..db8ad1760e 100644
--- a/board/qemu/mips32r2-malta/linux.config
+++ b/board/qemu/mips32r2-malta/linux.config
@@ -11,11 +11,9 @@ CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_PIIX=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
 CONFIG_NETDEVICES=y
 CONFIG_PCNET32=y
 CONFIG_INPUT_EVDEV=y
diff --git a/board/qemu/mips32r2-malta/readme.txt b/board/qemu/mips32r2-malta/readme.txt
index db1db65b1e..77518ccec9 100644
--- a/board/qemu/mips32r2-malta/readme.txt
+++ b/board/qemu/mips32r2-malta/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-mips -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -net nic,model=pcnet -net user # qemu_mips32r2_malta_defconfig
+ qemu-system-mips -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/sda" -net nic,model=pcnet -net user # qemu_mips32r2_malta_defconfig
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
diff --git a/board/qemu/mips32r2el-malta/linux.config b/board/qemu/mips32r2el-malta/linux.config
index 79d7352474..916e522292 100644
--- a/board/qemu/mips32r2el-malta/linux.config
+++ b/board/qemu/mips32r2el-malta/linux.config
@@ -12,11 +12,9 @@ CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_PIIX=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
 CONFIG_NETDEVICES=y
 CONFIG_PCNET32=y
 CONFIG_INPUT_EVDEV=y
diff --git a/board/qemu/mips32r2el-malta/readme.txt b/board/qemu/mips32r2el-malta/readme.txt
index 4dc0e64e02..2a1e84a0fb 100644
--- a/board/qemu/mips32r2el-malta/readme.txt
+++ b/board/qemu/mips32r2el-malta/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-mipsel -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -net nic,model=pcnet -net user # qemu_mips32r2el_malta_defconfig
+ qemu-system-mipsel -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/sda" -net nic,model=pcnet -net user # qemu_mips32r2el_malta_defconfig
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
diff --git a/board/qemu/mips32r6-malta/linux.config b/board/qemu/mips32r6-malta/linux.config
index d559676615..fbfffe2065 100644
--- a/board/qemu/mips32r6-malta/linux.config
+++ b/board/qemu/mips32r6-malta/linux.config
@@ -11,11 +11,9 @@ CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_PIIX=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
 CONFIG_NETDEVICES=y
 CONFIG_PCNET32=y
 CONFIG_INPUT_EVDEV=y
diff --git a/board/qemu/mips32r6-malta/readme.txt b/board/qemu/mips32r6-malta/readme.txt
index 9ad4959f09..ff5f1e36be 100644
--- a/board/qemu/mips32r6-malta/readme.txt
+++ b/board/qemu/mips32r6-malta/readme.txt
@@ -1,5 +1,5 @@
 Run the emulation with:
 
- qemu-system-mips -M malta -cpu mips32r6-generic -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -nographic # qemu_mips32r6_malta_defconfig
+ qemu-system-mips -M malta -cpu mips32r6-generic -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/sda" -nographic # qemu_mips32r6_malta_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
diff --git a/board/qemu/mips32r6el-malta/linux.config b/board/qemu/mips32r6el-malta/linux.config
index d559676615..fbfffe2065 100644
--- a/board/qemu/mips32r6el-malta/linux.config
+++ b/board/qemu/mips32r6el-malta/linux.config
@@ -11,11 +11,9 @@ CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_PIIX=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
 CONFIG_NETDEVICES=y
 CONFIG_PCNET32=y
 CONFIG_INPUT_EVDEV=y
diff --git a/board/qemu/mips32r6el-malta/readme.txt b/board/qemu/mips32r6el-malta/readme.txt
index 96c9dc88bf..29a5a1e02b 100644
--- a/board/qemu/mips32r6el-malta/readme.txt
+++ b/board/qemu/mips32r6el-malta/readme.txt
@@ -1,5 +1,5 @@
 Run the emulation with:
 
- qemu-system-mipsel -M malta -cpu mips32r6-generic -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -net nic,model=pcnet -net user -nographic # qemu_mips32r6el_malta_defconfig
+ qemu-system-mipsel -M malta -cpu mips32r6-generic -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/sda" -net nic,model=pcnet -net user -nographic # qemu_mips32r6el_malta_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
diff --git a/board/qemu/mips64-malta/linux.config b/board/qemu/mips64-malta/linux.config
index cd0b560634..66932fb3db 100644
--- a/board/qemu/mips64-malta/linux.config
+++ b/board/qemu/mips64-malta/linux.config
@@ -15,11 +15,9 @@ CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_PIIX=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
 CONFIG_NETDEVICES=y
 CONFIG_PCNET32=y
 CONFIG_INPUT_EVDEV=y
diff --git a/board/qemu/mips64-malta/readme.txt b/board/qemu/mips64-malta/readme.txt
index 7432dac1a1..d148a1394a 100644
--- a/board/qemu/mips64-malta/readme.txt
+++ b/board/qemu/mips64-malta/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-mips64 -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" # qemu_mips64_malta_defconfig
+ qemu-system-mips64 -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/sda" # qemu_mips64_malta_defconfig
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
diff --git a/board/qemu/mips64el-malta/linux.config b/board/qemu/mips64el-malta/linux.config
index c6b46d4d7f..516b05b5c6 100644
--- a/board/qemu/mips64el-malta/linux.config
+++ b/board/qemu/mips64el-malta/linux.config
@@ -16,11 +16,9 @@ CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_PIIX=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
 CONFIG_NETDEVICES=y
 CONFIG_PCNET32=y
 CONFIG_INPUT_EVDEV=y
diff --git a/board/qemu/mips64el-malta/readme.txt b/board/qemu/mips64el-malta/readme.txt
index f67ac91ac4..4545fcd9df 100644
--- a/board/qemu/mips64el-malta/readme.txt
+++ b/board/qemu/mips64el-malta/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-mips64el -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" # qemu_mips64el_malta_defconfig
+ qemu-system-mips64el -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/sda" # qemu_mips64el_malta_defconfig
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
diff --git a/board/qemu/mips64r6-malta/linux.config b/board/qemu/mips64r6-malta/linux.config
index 0ebfdbdb05..020e02f1d1 100644
--- a/board/qemu/mips64r6-malta/linux.config
+++ b/board/qemu/mips64r6-malta/linux.config
@@ -15,11 +15,9 @@ CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_PIIX=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
 CONFIG_NETDEVICES=y
 CONFIG_PCNET32=y
 CONFIG_INPUT_EVDEV=y
diff --git a/board/qemu/mips64r6-malta/readme.txt b/board/qemu/mips64r6-malta/readme.txt
index 252a543192..6712d668cc 100644
--- a/board/qemu/mips64r6-malta/readme.txt
+++ b/board/qemu/mips64r6-malta/readme.txt
@@ -1,5 +1,5 @@
 Run the emulation with:
 
- qemu-system-mips64 -M malta -cpu I6400 -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -nographic # qemu_mips64r6_malta_defconfig
+ qemu-system-mips64 -M malta -cpu I6400 -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/sda" -nographic # qemu_mips64r6_malta_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
diff --git a/board/qemu/mips64r6el-malta/readme.txt b/board/qemu/mips64r6el-malta/readme.txt
index e9d02e772a..150ce75228 100644
--- a/board/qemu/mips64r6el-malta/readme.txt
+++ b/board/qemu/mips64r6el-malta/readme.txt
@@ -1,5 +1,5 @@
 Run the emulation with:
 
- qemu-system-mips64el -M malta -cpu I6400 -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -nographic # qemu_mips64r6el_malta_defconfig
+ qemu-system-mips64el -M malta -cpu I6400 -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/sda" -nographic # qemu_mips64r6el_malta_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
