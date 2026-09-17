Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50242C982D2
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 19:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 005DD605CF;
	Thu, 17 Sep 2026 19:17:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id po1Qq1QLUKrg; Thu, 17 Sep 2026 19:17:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 40D8D605DE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789672653;
	b=APKQ4MydGFkMxotJGyWXTKoZWQW5goau3Jkh6+fQja0PLa1qZUsTigqmnsgDha7R7p/V
	 XUvS4Csb6nNP/a8fgcd/T7R3UvDgpeP9YJBjDyvQwxizp19pdrgKHCzOqUpBKNPp43i/h
	 RZTMTLKZ9K1UE4R9a2EKlrTRB+M7M30bO6JJTfQDeZhoZTLe58tBXuXMnRKv+0D35N6bC
	 RZHRgv/WMk5Ht2bLSKHQV6rkkVMM7HejXminP91ak/SymzVcjeibFjvcY9sEvl82nobN/
	 MxzYdvqwJY4AW/fjfFzK2kf+tlexWmn48kX713wXxZ5flzJ/lOUsz1+Y1ekjKWekwBA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789672653;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ioRSHLy0WvqShXUFUrMUKylFiTOixrluukW9Ittw188=;
	b=sDXdkoT4V7EhthUQGnYDKtbAo8FPoCO/eCH3Xg+mO+eQE1da75APwc6qEcmgZtqkUHY3
	 scXdz4jZCeQ3uCz5iKD7jbkuVSZM2JfW9iQmTkJyqoXqOz2ahKp+nNRY82+GNDm6n4IFU
	 3xzbxtGMQ339uMXcMFI8aTN5V5f0yJRNfS4MI8pAw3s0Gtiefdwm6RRYIaJF7s/Y8NcfV
	 evjeNU1WrgEstnHd0vIV6DoHv4E+XXTsYzQIqM3icwq7qEGRwe3E+RQUsN999Ln69ApLr
	 YRKROpCSGgduwM+RjAtqt/80NlSqzECfzBZe8nNB0ToV4ZSiMcqZjmyzoQpJ/Qyuuqw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q4sBDFcH;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789672653;
	bh=ioRSHLy0WvqShXUFUrMUKylFiTOixrluukW9Ittw188=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=THbSLNa+msDm9LhGAjwzXbyxzZnAp4k3sJC38Ngv8IzrsuoAGqsUw129z9dZsrV/3
	 oAI6S608vZdYCmml51x2NiA0WY+Pxtq89HRVGr93oD1UJdN6kar3g1nuIyVl8c4xxv
	 h9rT+r4R0jXtolMLliuEIURdbgr7B6QjuefjfzipR1FsR9FdMyPrPh6tHWsIT3oqxF
	 UQKM89kE4Zmu9bTr3fXF9pY6RBPygUjheEwrmWMs7qZDsnXZS8uXc//8zc3fkE8saw
	 J2XMWBr6dby3PnHfPnKuAbeAsTWtiEw5gA0vjqEfbwfi5uPzrs0a3x2IYVO72Cjur3
	 /WP+wKV8OOEXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40D8D605DE;
	Thu, 17 Sep 2026 19:17:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E981E3AF
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 19:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF81D605DE
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 19:17:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5m4nX2Sh9iVi for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 19:17:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CC148605CF
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789672650;
 b=h9XJxar4To/Wmb9QvfobZqa7EUrfjy9x0MMExeMAPNmjgEuiyJaKMzGdN1iyMcsfR6cG
 hsyPdYjbqaxgBB/QTDN566XgLOMFHZQYrJ6253PTTM+1y5m4bsv+cnrO06z2Qxk7zsPTr
 5GtXjeep5/esa+dQgumoVPWyem6xs0obCNez7BjIxg70L646yjd9sQuGemRfkXsUCeq6c
 GMPTadb9u7+5G2ppWBZrbrwpAqiD68xaUJAQ3Ng6wZLwXK/z7xcsj8imhXkDr7JiGNO4P
 6g8Mp6PFT+Fsvf9Qo9G//5qU/ooGR9pdEB247Nnv5M5DYfA/ESmLLs1CcHRWbi0hjSg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789672650;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=WKDAOVINwSdBhl6i6ZccIdHVLpRmXIy+GZcdXt0QX/s=;
 b=tODaHWsMFCG/Gge/+0/Oe0OLTgLb+Mmurr1UQyu6i9cftpGNlCjYwzrMwq+J/EFt7ZZ7
 stv+KLEDqkDlCjZecPaJcsKmTktwTxR2B+E97PPqXmU7h6cukMNCWmjdAPAAkr95LdBZM
 gBJ0QW2nSqeZgg9XkhB2piQt0tFawJ1OAGr/po+gJGHd6NAmElwR/1zDoQyhwStrKsZOL
 UnjgWVc+Yjo4okPytLIwbM0HsPPJhx0vdKvTX+XnspIlKjvxZnjSfa9S/3Zcszbwxkfcf
 Zy2MqWbG8ZIK5dDCYPw0ke+3Ya2NW0KgrmlVIbGunkaXukrwuW0ow5exuKgeqT8oFdw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=q4sBDFcH; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=fractalclone@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=q4sBDFcH
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CC148605CF
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 19:17:29 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49b912d37b5so7864515e9.2
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 12:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789672648; x=1790277448; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WKDAOVINwSdBhl6i6ZccIdHVLpRmXIy+GZcdXt0QX/s=;
 b=q4sBDFcHU5+8Eci4nmkb8EO9pEzK7V16NilXVAagnAu737up5s/jvz/KE7VKFbapEd
 hOm6tSuVUuY5u6AE3etskAESfftlC6xadalSytfzmU8Uc33PVNUwxaanor+FllHuZqWl
 ZAasRWcfGiUE3s2bJ2cUG/jUb/otoBLednBNrQpTw5eoWuYfDEnisYfi1x1bVWfBV325
 K67hYitv3a2450NBhcjO71YO0LoGCHW5uFDr2sEWGbCbeauQipzEbSQMSJ8yqk1ZDgxm
 wte6Rc+oTXr+8TQfeSdr170lGgA8bb9S0zKazQbJMQp0JFkUuz516J0lT9N5rxjV8W8E
 7O4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789672648; x=1790277448;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=WKDAOVINwSdBhl6i6ZccIdHVLpRmXIy+GZcdXt0QX/s=;
 b=dtU141rcbfYMrMv29PW0+V4z/LVkCOCZ6t8sdCiJu2HYzA/HJLABRkt7vTjsEGD2lj
 MKn1Ga7raGx00SRJ+q1pLp7Mb+HLYGM10kVYEPMEq1D/JGMI2OMTVTjq8XZhP4h4g8AI
 I5JcQQXpNZeVrnmA+UsNPsGpF9rNsuqD2E0qYfAMCXKfgM/svcV1mXasDm2kox5VAKUD
 soVrKS/RTkiP1AAJP6Ov8vVHPDo5nQ1+dxK9Um5zsww67f6q5d+RT7XYDAiyb3txrud6
 HR9vxE0x8EKOOdOC/x3zgM1s68gK0pi/5S6jXpgsoRS61OdLFSP7xwstym2djRElepee
 3Zlg==
X-Gm-Message-State: AFuF++mSC+DaLqlzwCYA8XasOUPDF4mxtfVZNB/4EBQL/GJUuuhcVHlu
 WK3+bqDblG4xFMaqZSg5ScrAbBXlG4mYBYMUSMO8xCQtAJMOuWstMhj7gHWBhcN1
X-Gm-Gg: AYBFou0Un6NoCSnmIzVNHum6EF39mpw5D6hmYf0lCaqU2YRpUp9oWo50eHzT8Pr2Cay
 64I5VwAje6wv2wuMkvXhIQiHRQ5ojLZO674DSw+PopR7n2ku5DsMyAkrsn7HHAM92Re848bgxY5
 9ycPLK/axU9Ck0Z+LyTlw9uFt/3VCyC0jUFW+3hKItutpPgXMiA9vSSy5+qGLjuWWY55X7bdV/H
 gI5aHWVFkqUkPMspv8w2aRVzIzcQ9Dl83ZMj1fdLOaTcTjJ6q4lW07xDxy/7muxCyoDrGONwNcl
 yKzneAwvHmGBRMJAurbhnWaRcLglC7jLrpGbSXFzZ87jMKC3snpFYUqD21+4/yyufYKHmL5T4b6
 qD+yWvZY1rlF6EZ1NHnX3TiGC9ydMAm5Jn4dRDgXddrR+gEexS+h+K09+DAZiFbwR7vqkNngMIA
 /4y/UjhoeLR2rbfNFC9tJFHlG+zdrB6dGeutAAybxCx7C2U7RBSIbxAv3BnXI+EMW3Jbm0tIJ1D
 hEg
X-Received: by 2002:a05:600c:8a09:20b0:49f:bc0d:2e9 with SMTP id
 5b1f17b1804b1-49fbc0d032dmr127425955e9.0.1789672647357; 
 Thu, 17 Sep 2026 12:17:27 -0700 (PDT)
Received: from fedora ([139.47.34.204]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd23a815sm107083065e9.14.2026.09.17.12.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 12:17:26 -0700 (PDT)
From: Jean-Paul Etienne <fractalclone@gmail.com>
To: buildroot@buildroot.org
Cc: Jean-Paul Etienne <fractalclone@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2026 21:17:17 +0200
Message-ID: <20260917191717.2471859-3-fractalclone@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917191717.2471859-1-fractalclone@gmail.com>
References: <20260917191717.2471859-1-fractalclone@gmail.com>
MIME-Version: 1.0
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
 DEVELOPERS                                    |   2 +
 board/radxa/rock4b/extlinux.conf              |   4 +
 board/radxa/rock4b/genimage.cfg               |  22 +++++
 board/radxa/rock4b/linux.fragment             |   6 ++
 .../overlay/etc/modprobe.d/brcmfmac.conf      |   4 +
 .../overlay/etc/network/if-down.d/wpacli      |   1 +
 .../rock4b/overlay/etc/network/if-up.d/wpacli |  50 ++++++++++
 .../rock4b/overlay/etc/network/interfaces     |   9 ++
 .../rock4b/overlay/etc/wpa_supplicant.conf    |   3 +
 .../overlay/etc/wpa_supplicant/wpa_action.sh  |  20 ++++
 .../firmware/brcm/brcmfmac43456-sdio.clm_blob | Bin 0 -> 7163 bytes
 .../patches/linux-headers/linux-headers.hash  |   1 +
 board/radxa/rock4b/patches/linux/linux.hash   |   2 +
 board/radxa/rock4b/patches/uboot/uboot.hash   |   2 +
 board/radxa/rock4b/post-build.sh              |   9 ++
 board/radxa/rock4b/readme.txt                 |  93 ++++++++++++++++++
 configs/rock4b_defconfig                      |  62 ++++++++++++
 17 files changed, 290 insertions(+)
 create mode 100644 board/radxa/rock4b/extlinux.conf
 create mode 100644 board/radxa/rock4b/genimage.cfg
 create mode 100644 board/radxa/rock4b/linux.fragment
 create mode 100644 board/radxa/rock4b/overlay/etc/modprobe.d/brcmfmac.conf
 create mode 120000 board/radxa/rock4b/overlay/etc/network/if-down.d/wpacli
 create mode 100755 board/radxa/rock4b/overlay/etc/network/if-up.d/wpacli
 create mode 100644 board/radxa/rock4b/overlay/etc/network/interfaces
 create mode 100644 board/radxa/rock4b/overlay/etc/wpa_supplicant.conf
 create mode 100755 board/radxa/rock4b/overlay/etc/wpa_supplicant/wpa_action.sh
 create mode 100644 board/radxa/rock4b/overlay/lib/firmware/brcm/brcmfmac43456-sdio.clm_blob
 create mode 120000 board/radxa/rock4b/patches/linux-headers/linux-headers.hash
 create mode 100644 board/radxa/rock4b/patches/linux/linux.hash
 create mode 100644 board/radxa/rock4b/patches/uboot/uboot.hash
 create mode 100755 board/radxa/rock4b/post-build.sh
 create mode 100644 board/radxa/rock4b/readme.txt
 create mode 100644 configs/rock4b_defconfig

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
