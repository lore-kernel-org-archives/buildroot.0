Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0401EC982D9
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 20:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76B798114E;
	Thu, 17 Sep 2026 20:43:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id chpAIZbFA5al; Thu, 17 Sep 2026 20:43:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B539E81109
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789677786;
	b=eFubHsOhzE0siHhiEaLVTfjK9iWuKsYtowlxbOs6Lx1UF1P566gRSZNu8WMldW6Q8AVe
	 GLPBWKtx+j+gTqYFlati+7d9zfm7118DDZHMMCliDSe6vPqCJyMvruVNTOF9MpMJdNT/R
	 c63bgXA7yOxpxOw8yMI7GDRli3PhMxyAqtjpgXw6tW3E1rJj7QssphBHsua5NsFWBiM6X
	 1uNS/9nVxpL4I/zGmkx/G313iGLh0JbUkADWRxqpyQnO2lgb3rsl4C+eyt5rRrqeGm+lk
	 1lkwbArKyWvLjaYm7tK+ZeCueVN4m6mMK1mMHCqdNdR6X+oQvYz5IIs2FZGbolHSI7A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789677786;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:Date:MIME-Version:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=LX7hA22Gsf6Rt61yJbW8cxHif8M/+Bf9jrREjq3qmfc=;
	b=AL1k4oWgdULV5Tugqmq+KK8pBQaOvcmLp0xd9/YnIbbIJEveAGonWILMQf+Pkp6LnqcM
	 ysFute/TzwKfP7L4fVTQI3Ry+uwB8U78nJYXfSMn6Q6IfgeOu6YWaI5jEHdhSzingiVXu
	 bsvn9nDy3cl0dOJcfxHOVNMzaB/H+x4gCNXsebfD6Zm6EQ6thpEd00bS+IaXHHHTBF0D7
	 SDVLEuYJTchciJA/eWUmZO/PvmT2f2JAZ2omzbkduMGRzVa0ZugxapTjESeuWZ4tmHVw9
	 wcJn69iTRenHIh1x6CgcnMj7T+MZHaFm3IjKxfwaBr9GGDdvUj4dspsS17SQDvqWzAQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789677786;
	bh=LX7hA22Gsf6Rt61yJbW8cxHif8M/+Bf9jrREjq3qmfc=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T/GQ8CC6g1l5RXGU4CXwesdDM0wFG0PgSTbbzn0Hv50poIleswaRyKUAfXkMDq9Vu
	 oSXg2agnca3S3522i94pzT+SdkIdcsUE+byQfbygLjY42Llrj1+kJnX8KeZIM3Ics8
	 yRZ8V7qdmmvedlnzkuyeYFZ1wR5gbREf7DQu2RjRL5frRXopnaTnn96JqmFjXXkHH3
	 u0/CvA41x6ALn7jXi/NrIvTJd52MiT+usJ3qffYAVIkVouSc0sKov2xqP9XFlMfSeP
	 /xSh0ep2v7n0NYUR6WCVK/eyVZzoSMYVZ0qmMeWlVw61gBe0pgh7cuXtlQNDoCc3qM
	 wkcspuIktkmpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B539E81109;
	Thu, 17 Sep 2026 20:43:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04A81362
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 20:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAB6B40849
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 20:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hEFoWwVdwMfY for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 20:43:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0101840839
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789677783;
 b=cKy6HsanYdhjpcZPVBExBlLNBALWXvQAraQ2EUoEkN5uHb/PC0NWdM5mYosFvY7oECTC
 s0CHmuqSJgVf4XQhLDdkBFwPSFDPAjzDdTKWVYbwfYWl3ONCSWAmYIVaGYMbVha3FgeD6
 Wmvyg+DwBmEuohXOCixMjQs7dqEeUGF8NsIZd4Qe6NJofno38DLbuo1OEfQTlh7kHqmIx
 TEv/SfZtZ0gBxzj7y3qO7p7Ju9XtvVQtckwaAdklpKV+tR79MigzPIHBy9hJD0HE8TuAg
 urFifasrMd7RBm05KDi93kF3EYUZ7eTgdonKeLuPwA9aqAlMRAORNaT4lWEDmZTT12A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789677783;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
 References:In-Reply-To:To:Cc:X-Mailer;
 bh=Wf61r/I9uDTelckYRrZf5JBLGAOt+D7daHwPsIx+Fxg=;
 b=cA5D+spkGVkFtUCt/oc9in7Vokhs1DCtlVUHhCYTxHYh/TwpXmFwyhNv/Hj/0yWbF5sv
 0HyQ0o1UsCm/I4aL4tuT6khH57XdhWkrEuQdc998oqGQje68M0N5q6FJ0ifppqY0Ht6HO
 MBnJ+qdHiVXwe0rp9I3UTBlRDDOJL7g+vb67l4qv7qWAosm7dV1yuurH8KhzW9bB15KX4
 ugLyPJwSxfedMuErXvbEp6ILKAjJjvGtSqCvD0qvWya9uWDsj9pd4OPBkBjvBGV/L4/HV
 OIgqmbJdDbRjKw2LDu7+bcISJtYrYUTEWXdgQM6mykmeWQZ8YlDFcwUm853NE6AfzQQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=W49x1Mqh; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=fractalclone@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=W49x1Mqh
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0101840839
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 20:43:01 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49cd4ba9f68so778215e9.1
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 13:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789677780; x=1790282580; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Wf61r/I9uDTelckYRrZf5JBLGAOt+D7daHwPsIx+Fxg=;
 b=W49x1MqhDl58uqoOMbHu5DbwOh0pMuON+VMaQ9wJh8h1PxIlEhB3/QCQG1SKsjf+XI
 7dKhIZJAzZ11kc/FA0KONb2pEYas8/UQUuo9dntOO4RDPHnUWgd33Jc+jl5J1CnBnNHF
 zYmnEwmHke+BpMtMRxE0wsHv8U0LbNQJSGvDBxFKw3gjeJZXS2blzVHvsCiSdtA+BQu4
 6FO7NsxNpZaIu6/9eUDyPSK9628xpxBq0/69zFOFN+NMPmR25QFs4AwdmtJHkJa/IhOK
 amfBx4DYfY7xYIYwNHBIiunrY7SkEAtbbR0EcUPtKIAnFI/x9hewcjmOTiCDDJ7ErAQW
 5amQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789677780; x=1790282580;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Wf61r/I9uDTelckYRrZf5JBLGAOt+D7daHwPsIx+Fxg=;
 b=tjJGOSr+ZpAEyJUP12XFEHVufm7/V12Inv/yBxgGNO0SjVjO+mRo23P1b4Fe9c1Xyp
 RkwIf6tmum34dqf7viKAOMiu2yaSebgCNay7J1T1pCBoSR2WSNhBbdIfADNTefieJTs8
 KJvZYbSB1hZnJnqUznknrISb3idCAm8+8vuPogkKDCiiQ+wDHdgC3X15QBLWZLo44oqg
 REWr+qu35Qyn2Z3tDFzF0XvMeCp8DOOI+H/JBelspmY2cleaW1CIPHUVwjmRyfz2c8Ky
 Zb5JvZKe6rBwSFnEubVg35TuaSnRQ7+oB668xdKXCsBadgai9KDVaGi5Eb28yN9t0pPx
 hWvQ==
X-Gm-Message-State: AFuF++ktAFU0GyBOJ7kksltu4ySXbzi0bzD8dHVQ6V1Gwb+yeu+kFR6U
 duNnFjpNVxZsnWRW/ZdAPpDdSYP12TSBgF2ksoQHHWC2SB1DHnq+7A3wMRs8xIwX
X-Gm-Gg: AYBFou2pzvHeQIqj1EBCW0ykC2t9ViNvOft5jZTs1xdlCtBqTp0NF/uX2a8xMtydQK7
 1Fgs2a7lz1MfWFMym4Z/HVfVYgcf35bAVp0tM4eRnhyxh8KxcCzyb4C37x2x4xkcKZ7GCtIkJl9
 oBEb6mWVP8xhNcekv+ritBLNk1VSXRk5xDxIUdQcXFS3ihd2KSF+FOzjrnfdG5QevWelwzZybD8
 ndLiWkitW2TNdGB4E2zMVm7MptcJGvI4dE8SRuSDgXweM0Ab/Gm5xRzxabEqy3JjabADBV4JiEy
 FmyWn8blp2fhcKdIs+LhH7iseV7kAFsthcrJ9iiL1W4Nm68J2Yak3OmM6Buryxt3/8KnQ5irh3p
 iAqS212rMc66dPlfPPGzC7iNOinEHdR8cZmzLSbLWT6GRgpMuSGLlBzuRtQ75wtVnTPp245zbUd
 7D1r/JSO2XUdBTg+bX314VAofvaYoeyVWyPUBT5vSfZ2HaRn58naenzNFEwB54SHAIl5bThM0o1
 7uE9w==
X-Received: by 2002:a05:600c:37ce:b0:49e:799a:8952 with SMTP id
 5b1f17b1804b1-49fc5743c81mr1256795e9.26.1789677779576; 
 Thu, 17 Sep 2026 13:42:59 -0700 (PDT)
Received: from [192.168.1.138] ([139.47.34.204])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd2563ccsm126681465e9.13.2026.09.17.13.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 13:42:58 -0700 (PDT)
From: Jean-Paul Etienne <fractalclone@gmail.com>
Date: Thu, 17 Sep 2026 22:42:46 +0200
MIME-Version: 1.0
Message-Id: <20260917-rock-pi-4b-v1-3-a1da4ee05567@gmail.com>
References: <20260917-rock-pi-4b-v1-0-a1da4ee05567@gmail.com>
In-Reply-To: <20260917-rock-pi-4b-v1-0-a1da4ee05567@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Jean-Paul Etienne <fractalclone@gmail.com>
X-Mailer: b4 0.16.0
Subject: [Buildroot] [PATCH 3/3] configs/rock4b_defconfig: add support for
 Radxa ROCK-PI 4B board
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

Add board config to support the Radxa ROCK-PI 4B board
with working WiFi, bluetooth and ethernet.

Signed-off-by: Jean-Paul Etienne <fractalclone@gmail.com>
---
 DEVELOPERS                                         |   2 +
 board/radxa/rock4b/extlinux.conf                   |   4 +
 board/radxa/rock4b/genimage.cfg                    |  22 +++++
 board/radxa/rock4b/linux.fragment                  |   6 ++
 .../rock4b/overlay/etc/modprobe.d/brcmfmac.conf    |   4 +
 .../rock4b/overlay/etc/network/if-down.d/wpacli    |   1 +
 .../rock4b/overlay/etc/network/if-up.d/wpacli      |  50 +++++++++++
 board/radxa/rock4b/overlay/etc/network/interfaces  |   9 ++
 board/radxa/rock4b/overlay/etc/wpa_supplicant.conf |   3 +
 .../overlay/etc/wpa_supplicant/wpa_action.sh       |  20 +++++
 .../lib/firmware/brcm/brcmfmac43456-sdio.clm_blob  | Bin 0 -> 7163 bytes
 .../patches/linux-headers/linux-headers.hash       |   1 +
 board/radxa/rock4b/patches/linux/linux.hash        |   2 +
 board/radxa/rock4b/patches/uboot/uboot.hash        |   2 +
 board/radxa/rock4b/post-build.sh                   |   9 ++
 board/radxa/rock4b/readme.txt                      |  93 +++++++++++++++++++++
 configs/rock4b_defconfig                           |  62 ++++++++++++++
 17 files changed, 290 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2fd4c6e26f..04505b8e96 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1617,6 +1617,8 @@ N:	Jean Burgat <jeanburgat33@gmail.com>
 F:	package/openfpgaloader/
 
 N:	Jean-Paul Etienne <fractalclone@gmail.com>
+F:	board/radxa/rock4b
+F:	configs/rock4b_defconfig
 F:	package/brcmfmac_sdio-firmware
 F:	package/rockchip-rkdeveloptool
 
diff --git a/board/radxa/rock4b/extlinux.conf b/board/radxa/rock4b/extlinux.conf
new file mode 100644
index 0000000000..a0af1ea610
--- /dev/null
+++ b/board/radxa/rock4b/extlinux.conf
@@ -0,0 +1,4 @@
+label Radxa ROCK-PI 4B Linux
+  kernel /boot/Image
+  devicetree /boot/rk3399-rock-pi-4b.dtb
+  append root=/dev/mmcblk1p1 rw rootfstype=ext4 earlycon rootwait
diff --git a/board/radxa/rock4b/genimage.cfg b/board/radxa/rock4b/genimage.cfg
new file mode 100644
index 0000000000..966c869273
--- /dev/null
+++ b/board/radxa/rock4b/genimage.cfg
@@ -0,0 +1,22 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot-tpl-spl-dtb {
+		in-partition-table = "no"
+		image = "idbloader.img"
+		offset = 32K
+	}
+
+	partition u-boot-dtb {
+		in-partition-table = "no"
+		image = "u-boot.itb"
+		offset = 8M
+		size = 30M
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/radxa/rock4b/linux.fragment b/board/radxa/rock4b/linux.fragment
new file mode 100644
index 0000000000..ce4b11de27
--- /dev/null
+++ b/board/radxa/rock4b/linux.fragment
@@ -0,0 +1,6 @@
+#
+# Disable the generic GPIO reset driver as it conflicts with
+# the reset-gpios of sdio bus controlling the wifi chip
+#
+
+# CONFIG_RESET_GPIO is not set
diff --git a/board/radxa/rock4b/overlay/etc/modprobe.d/brcmfmac.conf b/board/radxa/rock4b/overlay/etc/modprobe.d/brcmfmac.conf
new file mode 100644
index 0000000000..c997473bd5
--- /dev/null
+++ b/board/radxa/rock4b/overlay/etc/modprobe.d/brcmfmac.conf
@@ -0,0 +1,4 @@
+# Disable Broadcom Frame Aggregation Feature
+# to fix authentication timeout problem for WiFi
+
+options brcmfmac feature_disable=0x2000
diff --git a/board/radxa/rock4b/overlay/etc/network/if-down.d/wpacli b/board/radxa/rock4b/overlay/etc/network/if-down.d/wpacli
new file mode 120000
index 0000000000..340f3ef9e6
--- /dev/null
+++ b/board/radxa/rock4b/overlay/etc/network/if-down.d/wpacli
@@ -0,0 +1 @@
+../if-up.d/wpacli
\ No newline at end of file
diff --git a/board/radxa/rock4b/overlay/etc/network/if-up.d/wpacli b/board/radxa/rock4b/overlay/etc/network/if-up.d/wpacli
new file mode 100755
index 0000000000..983d84fc1e
--- /dev/null
+++ b/board/radxa/rock4b/overlay/etc/network/if-up.d/wpacli
@@ -0,0 +1,50 @@
+#!/bin/sh
+
+START_TRIES=3
+WPA_CLI_BIN="/usr/sbin/wpa_cli"
+WPA_ACTION_SCRIPT="/etc/wpa_supplicant/wpa_action.sh"
+
+# Run this script only for interfaces which have wpa-conf option
+[ -z "$IF_WPA_CONF" ] && exit 0
+
+if [ -n "$IF_WPA_IFACE" ]; then
+	WPA_IFACE="$IF_WPA_IFACE"
+else
+	WPA_IFACE="$IFACE"
+fi
+
+start_wpa_cli() {
+	count=0
+	while [ $count -lt $START_TRIES ]
+	do
+		[ -n "$(pidof wpa_supplicant)" ] && break
+		count=$((count + 1))
+		sleep 0.5
+	done
+
+	[ $count -eq $START_TRIES ] && return
+
+	sleep 0.5
+	$WPA_CLI_BIN -i "$WPA_IFACE" -a /etc/wpa_supplicant/wpa_action.sh -B
+}
+
+case "$MODE" in
+	start)
+		case "$PHASE" in
+			post-up)
+				start_wpa_cli&
+				;;
+		esac
+		;;
+
+	stop)
+		case "$PHASE" in
+			pre-down)
+				killall -q wpa_cli
+				$WPA_ACTION_SCRIPT "$WPA_IFACE" "DISCONNECTED"
+				;;
+		esac
+		;;
+esac
+
+exit 0
diff --git a/board/radxa/rock4b/overlay/etc/network/interfaces b/board/radxa/rock4b/overlay/etc/network/interfaces
new file mode 100644
index 0000000000..1646408d8f
--- /dev/null
+++ b/board/radxa/rock4b/overlay/etc/network/interfaces
@@ -0,0 +1,9 @@
+auto lo
+iface lo inet loopback
+
+auto eth0
+iface eth0 inet dhcp
+
+auto wlan0
+iface wlan0 inet manual
+wpa-conf /etc/wpa_supplicant.conf
diff --git a/board/radxa/rock4b/overlay/etc/wpa_supplicant.conf b/board/radxa/rock4b/overlay/etc/wpa_supplicant.conf
new file mode 100644
index 0000000000..535d0a491b
--- /dev/null
+++ b/board/radxa/rock4b/overlay/etc/wpa_supplicant.conf
@@ -0,0 +1,3 @@
+ctrl_interface=/var/run/wpa_supplicant
+ap_scan=1
+update_config=1
diff --git a/board/radxa/rock4b/overlay/etc/wpa_supplicant/wpa_action.sh b/board/radxa/rock4b/overlay/etc/wpa_supplicant/wpa_action.sh
new file mode 100755
index 0000000000..6d45f46e66
--- /dev/null
+++ b/board/radxa/rock4b/overlay/etc/wpa_supplicant/wpa_action.sh
@@ -0,0 +1,20 @@
+#!/bin/sh
+
+INTERFACE=$1
+ACTION=$2
+UDHCPC_PID_FILE="/var/run/udhcpc.$INTERFACE.pid"
+
+kill_udhcpc() {
+	[ -f "$UDHCPC_PID_FILE" ] || return
+	kill "$(cat "$UDHCPC_PID_FILE")" 1>/dev/null 2>&1
+}
+
+if [ "$ACTION" = "CONNECTED" ]
+then
+	kill_udhcpc
+	udhcpc -i "$INTERFACE" -b -R -p "$UDHCPC_PID_FILE"
+elif [ "$ACTION" = "DISCONNECTED" ]
+then
+	kill_udhcpc
+	ifconfig "$INTERFACE" 0.0.0.0
+fi
diff --git a/board/radxa/rock4b/overlay/lib/firmware/brcm/brcmfmac43456-sdio.clm_blob b/board/radxa/rock4b/overlay/lib/firmware/brcm/brcmfmac43456-sdio.clm_blob
new file mode 100644
index 0000000000000000000000000000000000000000..36b8652655e5bf1704cc3471eba91f7e836d9b05
GIT binary patch
literal 7163
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
AS^xk5

literal 0
HcmV?d00001

diff --git a/board/radxa/rock4b/patches/linux-headers/linux-headers.hash b/board/radxa/rock4b/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/radxa/rock4b/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/radxa/rock4b/patches/linux/linux.hash b/board/radxa/rock4b/patches/linux/linux.hash
new file mode 100644
index 0000000000..f83883b936
--- /dev/null
+++ b/board/radxa/rock4b/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
diff --git a/board/radxa/rock4b/patches/uboot/uboot.hash b/board/radxa/rock4b/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..b6a925ea4e
--- /dev/null
+++ b/board/radxa/rock4b/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/board/radxa/rock4b/post-build.sh b/board/radxa/rock4b/post-build.sh
new file mode 100755
index 0000000000..5b50e1ef81
--- /dev/null
+++ b/board/radxa/rock4b/post-build.sh
@@ -0,0 +1,9 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+install -m 0644 -D "$BOARD_DIR"/extlinux.conf "$TARGET_DIR"/boot/extlinux/extlinux.conf
+
+# Append debugfs in fstab if not present
+grep -F -q "debugfs" "$TARGET_DIR"/etc/fstab || \
+	echo "none	/sys/kernel/debug  debugfs  defaults  0  0" >> "$TARGET_DIR"/etc/fstab
diff --git a/board/radxa/rock4b/readme.txt b/board/radxa/rock4b/readme.txt
new file mode 100644
index 0000000000..a6a7d5c7c1
--- /dev/null
+++ b/board/radxa/rock4b/readme.txt
@@ -0,0 +1,93 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the Radxa ROCK 4B. With the current configuration
+it will bring-up the board, and allow access through the serial console or
+via ssh if the board is plugged via ethernet port or has WiFi network configured.
+
+Radxa ROCK 4B link:
+https://radxa.com/products/rock4/4b
+
+Documentation link:
+https://docs.radxa.com/en/rock4/rock4ab-se
+
+GPIO Interface link:
+https://docs.radxa.com/en/rock4/rock4ab-se/hardware-design/hardware-interface?model=ROCK+4B
+
+This configuration uses mainline ATF, U-Boot and kernel.
+
+How to build
+============
+
+    $ make rock4b_defconfig
+    $ make
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+  $ sudo sync
+
+Insert the micro SD card in your Radxa ROCK 4B and power it up. The console
+is available on UART2 on the GPIO connector, 1500000bps 8N1.
+
+How to flash the board eMMC
+===========================
+
+Before building the sdcard.img for use on the board eMMC, you'll have to
+edit the board/radxa/rock4b/extlinux.conf file with root=/dev/mmcblk0p1
+
+Once the build process is done, flashing the sdcard.img on the board
+eMMC is achieved using the rkdeveloptool tool found in output/host/bin/
+as follows:
+1) Download the Flash loader binary for the board from the following link:
+   https://github.com/radxa/rkbin/blob/9840e87723eef7c41235b89af8c049c1bcd3d133/bin/rk33/rk3399_loader_spinor_v1.15.114.bin
+
+2) Follow the process given in the following link to start the board in Maskrom
+   https://docs.radxa.com/en/rock4/rock4ab-se/low-level-dev/maskrom/linux?model=Without+onboard+eMMC
+
+2) Once done, use the rkdeveloptool tool load the Flash loader binary onto the board as follows:
+   $ sudo ./output/host/bin/rkdeveloptool db PATH_TO_LOADER/rk3399_loader_spinor_v1.15.114.bin
+
+2) Once done, use the rkdeveloptool tool to flash the sdcard.img on the eMMC as follows:
+
+   $ sudo ./output/host/bin/rkdeveloptool wl 0 output/images/sdcard.img
+
+3) Once done reboot as follows:
+
+   $ sudo ./output/host/bin/rkdeveloptool rd
+
+
+How to setup WiFi config via console
+=====================================
+Once logged in do the following to setup the WiFi config:
+
+  $ wpa_cli
+
+  This will run the wpa_cli command in interactive mode.
+  Once wpa_cli has started do the following:
+
+  > add_network
+
+  This will create a network entry and will return its index
+  The following commands assumes index 0 is returned
+
+  > set_network 0 ssid "MY_SSID"
+  > set_network 0 psk "MY_PASSPHARSE"
+  > enable_network 0
+  > save_config
+  > quit
+
+  As the configuration include mdns, you can access the board
+  over your local network using the name rock-4b.local,
+  for example:
+
+  $ ping -c 1 rock-4b.local
+  PING rock-4b.local (192.168.1.5) 56(84) bytes of data.
+  64 bytes from 192.168.1.5: icmp_seq=1 ttl=64 time=8.48 ms
diff --git a/configs/rock4b_defconfig b/configs/rock4b_defconfig
new file mode 100644
index 0000000000..c2f99b7df2
--- /dev/null
+++ b/configs/rock4b_defconfig
@@ -0,0 +1,62 @@
+BR2_aarch64=y
+BR2_cortex_a72_a53=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/radxa/rock4b/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_HOSTNAME="rock-4b"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for Radxa ROCK-PI 4B"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_ROOTFS_OVERLAY="board/radxa/rock4b/overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/radxa/rock4b/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/radxa/rock4b/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/radxa/rock4b/linux.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-rock-pi-4b"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_12_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock-pi-4-rk3399"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="idbloader.img"
+BR2_PACKAGE_BLUEZ_TOOLS=y
+BR2_PACKAGE_BLUEZ5_UTILS=y
+BR2_PACKAGE_BLUEZ5_UTILS_CLIENT=y
+BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE=y
+BR2_PACKAGE_IW=y
+BR2_PACKAGE_MDNSD=y
+BR2_PACKAGE_OPENSSH=y
+BR2_PACKAGE_WIRELESS_REGDB=y
+BR2_PACKAGE_WIRELESS_TOOLS=y
+BR2_PACKAGE_WIRELESS_TOOLS_LIB=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
+BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_ROCKCHIP_RKDEVELOPTOOL=y

-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
