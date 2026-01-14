Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43881D39013
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 19:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0401D40B13;
	Wed, 14 Jan 2026 19:55:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zsoYPYKuq-6; Wed, 14 Jan 2026 19:55:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E10B40B1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768420510;
	bh=1qmPo9ppL7B1CdfwpfQHlrURtj6MYW3Y7We2AW5wtB4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VKo8d8ifgth9chazIaoZ1kx3lPFybIqEZO/iCNjUp2CBhzBALs7pBiYDxvT59uwbO
	 HbjF6SV2WqFpOU4ipymN8uut0+OOZr3MPkzf6jmt7b9w7nr9kZ5TWOFBz9LJmIWp5R
	 AMxCCClaRhpDC4wLZ8BjrBMWuS1iHvQw6Xiz0N3fVN5hYQLvwwRwChsJX75BPIe9jQ
	 Ojwzx3F7Qri8l3mI6uhza3OLYfj0rhOy/TjtMfWW1vUA3ORziSsyKkhPnFi7o5LJl9
	 eDFO2363Y14QobRN7RIF1lpGDd9MP41hixlBOtqT5eKNnxWojjTzypIBVmmkxZK9Fs
	 eF/C4A06DmI6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E10B40B1B;
	Wed, 14 Jan 2026 19:55:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 45F561C3
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDFE540AE5
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OFymoolRr87S for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 19:54:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.176;
 helo=smtpcmd15176.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8328540AE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8328540AE6
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8328540AE6
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:57 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id g6xAvBAQ9wf0Dg6xDvzgcY; Wed, 14 Jan 2026 20:54:55 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jan 2026 20:54:42 +0100
Message-ID: <20260114195451.3978704-10-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
References: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPAbAqtF48MySqi5n2QEtKiZOfdDNaQ5g6jwTJE/tUu4+rn7SYvPaRNfgU20jx2lI1U8eiOHdbZKpXYhRDLGnHQREdUKQk5Ai99R+OdHqZgmO9MKGKRg
 ogPDJNLXMyrhwZhNeGk2INZeQoWn3TdwkQ06KwQY5h7Uu1tJw/HPBHZ+Y5Ybwg0o9ZLzjq219dISiPMUMvUA8B42/+hTw70fOJ/nEjjd/zcVGFp9yLK6cwWL
 8F1w3K3Iv1ndZZHUpCMxkgdi/rKMm5fer8eV2zY9iH5hQh04QDPgGQ2mJK89G8uvO81RLWQbg7EfFQmTeaLTvBxqk1JA5o4OC/U3r8nhmft5RsEdKQ/7zEsr
 vIVftwXbdMCus1bZieJKzq6/CJxCYqKThzh91ODxcxawsLtTu/PaMgrcuacQIIBpt4YzpjQ6+RP8ki2Dder3l9WsZ0J1u4CXEyo4qXvsjYPW7AyTd35BjX+R
 DXQBHIGvWfncIkx0QjgsC53d6I87sWlC/rLdUgpumGZmir3s2wAqUqgllUNYALtaoxwk3JAqwDfwXorE
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1768420495; bh=Hxm0nhdHfE1BJQh3qIDqDDJTaFjxkDCruOY0+qT9CYA=;
 h=From:To:Subject:Date:MIME-Version;
 b=ET8dzStMlNeTOTWcZcb+6Mx/h/utkk7RrhvaCWOoEkCffJwejRjaCQj1L/TbZlfp3
 K3hZygPZjK/Ao+1LJJswkA0XiOkq73i00mLxfUm+waKMvrb9JijIBnIyiLi8PdNxlA
 CSNvEgJ3zCRHnaYt4zrfzvt2ogD6piIj+pgeCJ1RWdORm/49RlQHf6I6YS7U9JP3ku
 z9YRHOhvXJ01mvtZmUNMW7JFqDKLOd9YvF0aTEtn3tzHm1GYN31UW5/KKjK9nx4klY
 lxLh/XX1gWgg0ewQlCCkv7L30oddXeEZl3qTbEIxWDMFaNYTP9myXs+pn5tXi0FmQs
 8P1juu/qHkbMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=ET8dzStM
Subject: [Buildroot] [PATCH 09/17] board/olimex/axx-common: introduce folder
 to avoid files redundancy
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
Cc: Leon Anavi <leon.anavi@konsulko.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All sunxi boards can be handled by the same exact fileset so let's
introduce axx-common folder with hash patches, overlay, genimage and a
linux local patch to be switched to by subsequent patches.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/olimex/axx-common/genimage.cfg            | 17 +++++++++++++++++
 .../patches/linux-headers/linux-headers.hash    |  1 +
 .../olimex/axx-common/patches/linux/linux.hash  |  3 +++
 .../olimex/axx-common/patches/uboot/uboot.hash  |  2 ++
 .../rootfs_overlay/boot/extlinux/extlinux.conf  |  4 ++++
 5 files changed, 27 insertions(+)
 create mode 100644 board/olimex/axx-common/genimage.cfg
 create mode 120000 board/olimex/axx-common/patches/linux-headers/linux-headers.hash
 create mode 100644 board/olimex/axx-common/patches/linux/linux.hash
 create mode 100644 board/olimex/axx-common/patches/uboot/uboot.hash
 create mode 100644 board/olimex/axx-common/rootfs_overlay/boot/extlinux/extlinux.conf

diff --git a/board/olimex/axx-common/genimage.cfg b/board/olimex/axx-common/genimage.cfg
new file mode 100644
index 0000000000..b48e12a831
--- /dev/null
+++ b/board/olimex/axx-common/genimage.cfg
@@ -0,0 +1,17 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8K
+		size = 1016K # 1MB - 8KB
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
diff --git a/board/olimex/axx-common/patches/linux-headers/linux-headers.hash b/board/olimex/axx-common/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/olimex/axx-common/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/olimex/axx-common/patches/linux/linux.hash b/board/olimex/axx-common/patches/linux/linux.hash
new file mode 100644
index 0000000000..3917966cfe
--- /dev/null
+++ b/board/olimex/axx-common/patches/linux/linux.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  7a8879167b89c4bae077d6f39c4f2130769f05dbdad2aad914adab9afb7d7f9a  linux-6.18.3.tar.xz
+sha256  189d1f409cef8d0d234210e04595172df392f8cb297e14b447ed95720e2fd940  linux-6.18.5.tar.xz
diff --git a/board/olimex/axx-common/patches/uboot/uboot.hash b/board/olimex/axx-common/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..60971ee74f
--- /dev/null
+++ b/board/olimex/axx-common/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/board/olimex/axx-common/rootfs_overlay/boot/extlinux/extlinux.conf b/board/olimex/axx-common/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..f754da3623
--- /dev/null
+++ b/board/olimex/axx-common/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label Olinuxino
+    kernel /boot/zImage
+    fdtdir /boot
+    append console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
