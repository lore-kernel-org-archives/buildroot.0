Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5C1C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 17:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B561360D97;
	Fri, 18 Sep 2026 17:18:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Suj1Etipsdp; Fri, 18 Sep 2026 17:18:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E73F760D9C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789751900;
	b=enMqVvtzQV5GWnAR8I23E0FLRdyANvEkKkXe7barmxjwPIrphtHb2S+ksXNyMCS/lXj8
	 oQXdHYj3zu8jc9ScYMG7Vn0MoJO72YIp6EPhm3oiJ/jGFp6LRmW8xc+zhgI5lnjJQyLGa
	 Vv8yPty9in/y0ueOu3txaU+T0JVgRYmxmi5r0Oekj3PGeXSHixQhdWF3a5x+ZQyvqXdjF
	 JMJb0y81wFuNoZyWwrqIPQO4AImlXTVTgDY1KZGiuneeEhwwHTVGFUf0/WJ6YpNKxYbdJ
	 hPf2FCpjWiN/IZewrHHl6psIFAaNkQYVy8F32BXGDS0PfX+5C7KyozkQSkG2ZKb2YLg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789751900;
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
	b=bMtTLULoHVHMZmpaFx2j1xfO5GAp0MRy314xt9KbWmPlKNQUW26JirWzniqsy2Xbt/TK
	 YudwHuWGOzGGtuXGIX0DpmNtclrcl2rzq07m16eaJ6Kqu3s7V/8d6oLGdjVfZVsD3F7RB
	 0CwiNtZU4/cUROxOQgzOvfXwjAMtt0ph2CtVUo26mq6rxCjn/rPlQ1ZuqhDtwWMyfgxoG
	 hE/eO2CCwgm6s8qTYpwwxZ74qLrO0RfpE3WnrPCjNorIs5ixKoftIcmuPYFGfkDEs+smp
	 AJnNP9eqlp73kM2q55N2cOVc1RvEtm6ZBpiMzQg2LMmTBQQgFIV3rxxpUCsS1Q3YzDw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789751900;
	bh=LX7hA22Gsf6Rt61yJbW8cxHif8M/+Bf9jrREjq3qmfc=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gORDC9QFxZ5nmrZ+eiLViPcVtRPJ+xZLdNW7dklpzOaerwlrltGcPZO9ArN0nabUN
	 LGdzp2MovIOFSjF8v9ljHQFYqMzN7FScBPgM6Jv0p6zXx7DU/UE8E12yevLSwBmbiA
	 v893IZypDoIO02b2hutQBIhE7/x29OL7mfqOAHDhm2zoIRdEWyLHXk7LgILOMUgUp2
	 pWdsIaWCS9nwZLcDPVmZ3XuIFk6chUGRv71bhUoDey/2c4yhNxU5QrY7d784N9wHIb
	 9MEPgcATX8fzlfWEfgc9NesfsfgUpUmO+cOI+r0CI6y5l/vnaxyOHVXJRnldnZXE/A
	 H2S5WWLDJsIMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E73F760D9C;
	Fri, 18 Sep 2026 17:18:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 167D7237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F06A4400F5
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6mFGNPmOC0CT for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 17:18:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 10C1840544
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789751894;
 b=ZGXn637wDlI5vbaURs/ZOVtHr6FkmeGEJ6PU7gQ3Pu8RpsnZgVm6aCr54VbybhioGgKj
 yRyRAgGyhXBH8pabjN7mJOvzrFtPpiN+HqkSDu55oQAoFhmg/9AEr+ly26zmtaVvPTxVB
 BB/hgi0+Ba+XXQfgRKsIsexLQhtdU58/UHXTnqRZadtQY11d5LeTpjIVbB0/EDiZJUiVH
 KioWQ/+MklgFvC0sMNzDYyxf60vS9TJKsCecvKmDXmkBOE6Cc8SGbFSq5HeopPylFTVew
 AcEar0xKsIN77JD5NBhM5Hfuc7HZZNNpJqNLWWrxmHMRzEVdwbAnSRYpIJoJTiYI5bQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789751894;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
 References:In-Reply-To:To:Cc:X-Mailer;
 bh=Wf61r/I9uDTelckYRrZf5JBLGAOt+D7daHwPsIx+Fxg=;
 b=la+EWKKArLFM3jyeeS27aDaJsXuszpSEVpiJdHrL/9cBBVWFRvmqZq5hD3YXdpzbwmv9
 IEVmn7aUijHe9lVz7QHXtQH/+nlJXZUsrbnMmmfiXnLUFjTU0b2cm44kBcxJgRDTmW0WS
 9B5hAhu7B0nNZdzYJhXs792hv0RIEbikcvow0g6VtXvSM8FmzSxOmIlDoGkuVvNz0Q/th
 nUtBK8pMhgFH4tnL5FSKl9/0moL7PRmjqlcT8SGTv2zrhd2UU7vRrZ+loOZ7hJBdS+t6o
 PecXjh5YOfwWORdBze2HKrE18bSvXCy6mYiJvMpVqiXrRCfC+uBbfgPvlcTAb1dztrQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=YAp5VCta; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=fractalclone@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=YAp5VCta
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10C1840544
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:18:13 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49cd38e0f79so6667505e9.3
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 10:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789751892; x=1790356692; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Wf61r/I9uDTelckYRrZf5JBLGAOt+D7daHwPsIx+Fxg=;
 b=YAp5VCtaZ9r4aJdmUr49NTIJpR3T10aMbVAb2qgAXAYwxiY3q2081QR3A8pe1EZ4Ro
 mWvpxZM1Su18fojAUW5no5R/RJJwE1whuSCP53aY5dXsf0DNxA9Q0aYfRx+0fkGTOOtS
 QYVy9u7hiUTV0NrAdePnFwhqdV159XcnNxdUMmZQIGgffIjJn+GPteIYRir1NhJiFxMn
 6iEEyfort21anFXQcH6akAjkV56wACdXZXZYf4dCPAw9bPKYn7TJY3w+3iovfrrs0YRc
 NEP05OJVdnidULXTcuEw3g2rbhkOgS/MmevnnY9iE/q5PNtlsxgsMAac+fiwMbgu6bRQ
 rEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789751892; x=1790356692;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Wf61r/I9uDTelckYRrZf5JBLGAOt+D7daHwPsIx+Fxg=;
 b=AxLQMhplw7Tjz51c+CxOoEB2tTeFE5d7IR8BCiQveHMmPVzvkNZX7fqMXHtCoD+e+v
 4JCoQ7/f9H0j3zISdaTH5uPSpokFWqu1QmwRoU1R4p7hFavaSYLtyPIYTwus7QH2O7yk
 vCvvE+3u8g/PRRJboxhmJCmqobTwgvUE8qQxYnoeg+l3zpMxQiRRdndiyzX9HKC/fmWu
 C5tVmLzXKsHWk8MvRWYh8VpaQXhGHd2vxxgpl6SR3YnNpaDoj/jj0wHGJxs6eS45nLMB
 oIy8Nu8HpLUdgRsvU+fDgdQ62RiGZwFKAiMRfbm0LENllrNpywupQTi6elW40lUACEg7
 ccqg==
X-Gm-Message-State: AFuF++lHBp/R/UGSZyeRmdCOlpOpu0+gDMAKEJWtTtLIbh23p8e+gv+2
 ZB+Ppim/q1hD+07XYU48xqu7f6NaVwzMPTJNAD+6WG9NAEVS6mNkxm+ji47gfw==
X-Gm-Gg: AYBFou1v+WJkS2v6kmblQptTdZDkOIdK8OCImq6V4oMcye77IUaObUrCX/rSMLuJZ7Q
 0NcmkAOz+y3O6c7RH6Uv3rVgLY5u4i4siaw/5pnMThVt/Ry/d2WmSrWoBCL0CzBpnaUR1F3w+ge
 xzX4cVbdSgbL9HpfLY11JBGlr4niuEtCJNoU3YLk4ppTgHTjdHRLU8UeuFI3EVsxeWbrxfUhT3k
 NDJYVwXscIRe3sDirnAQFTR6A3Xq0aLWiU9M/cb7D2DsnjmezZo4ofpV/tubMQlB4iozelJBRgv
 IlzP7lIAAcsqr0ZMefbSWkrpQ5sUgzf0pX+SpHvOd7hc+4WPBmJ3U2yWGWrjw8F89NCj5CXD/p0
 LGHSnQWl22KASAp62s8q47Jk+ySXOQWvYLqvd9Q85fsj5wc+NaLKiLg7okZ7W1r7/ngc7o/hsE3
 g7wXahVo8MZXKHRe16zoF6+5WO1D0kWu04DhWvHQedDfIHU5FUEChYqwER9Ns+cZi+khQUDsDxq
 FdVLw==
X-Received: by 2002:a05:600c:5020:b0:49d:726:cc9f with SMTP id
 5b1f17b1804b1-49fc56716f3mr23557915e9.5.1789751891599; 
 Fri, 18 Sep 2026 10:18:11 -0700 (PDT)
Received: from [192.168.1.138] ([139.47.34.204])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48724460964sm133880f8f.7.2026.09.18.10.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 10:18:11 -0700 (PDT)
From: Jean-Paul Etienne <fractalclone@gmail.com>
Date: Fri, 18 Sep 2026 19:17:37 +0200
MIME-Version: 1.0
Message-Id: <20260918-rock-pi-4b-v2-3-89120500a1de@gmail.com>
References: <20260918-rock-pi-4b-v2-0-89120500a1de@gmail.com>
In-Reply-To: <20260918-rock-pi-4b-v2-0-89120500a1de@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Jean-Paul Etienne <fractalclone@gmail.com>
X-Mailer: b4 0.16.0
Subject: [Buildroot] [PATCH v2 3/3] configs/rock4b_defconfig: add support
 for Radxa ROCK-PI 4B board
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
