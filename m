Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447A2CD8C88
	for <buildroot@archiver.kernel.org>; Sat,  6 Jun 2026 22:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B24A2428EB;
	Sat,  6 Jun 2026 22:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Et44zpljVdMW; Sat,  6 Jun 2026 22:51:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 860AA428DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780786301;
	bh=AcLB+jZAa/AqrKytS/xHgHcIu9ODZgxLCt7Dwplv7NA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qzENhclvPow1T9ekcf/o9WjBeJaqk9mr4stUFu5pQL7XVeiMaiILxIrkBsd9NK97N
	 lQyRe1UKL1iaFHVF8jfobMBZTy3iUtqOO1AkhbO2Z4F2moZfZ2ryDNL5hBhHzxH/94
	 +PWLDprDCYBnDB3GY+ubmovJppkYTHCqHKa2Zf7T9wQ0eXkJiIgDpJ6M3BSJuF5/Jt
	 zWftpXG4X+JWAYu4pHeyBibhOrsewXTeJ/sNabUi6Zvr9Rrrf5OiToqXV4EgEH9UwY
	 +u8ztKxqB9KR3oCEUXWBJOIfdrtpq3unBGpmKri88HCS7EXnctX8CnbBMUXuc+Vfub
	 5euA5Vg55EgDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 860AA428DA;
	Sat,  6 Jun 2026 22:51:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3431C2EF
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 22:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E92A428BD
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 22:51:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pOdmoj3zvscN for <buildroot@buildroot.org>;
 Sat,  6 Jun 2026 22:51:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2E4F4428A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E4F4428A7
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E4F4428A7
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 22:51:33 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-490b4a8e28bso24456365e9.1
 for <buildroot@buildroot.org>; Sat, 06 Jun 2026 15:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780786291; x=1781391091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BMDI8hBnY9dcllsEiAv8T3Qug2/oAsVw2nVynU2RRXs=;
 b=hewuJJukAagH5yiUXWxxWUJfc7RzXzWkMNUSpx7OLWnZfKaSyvXcNrbCg/aAaRkUZv
 PUQgX2iO+xiN436Gay6ATRuWVTNWmshdt6aLUBSqb6+ze0KkD7LcZhue2jOt5mmsUB0t
 Xr/CMSqu/bfOgva1pCRdBSllqKKk30V5RZiDZrL+t813QQY2RLSJfAiQnsdS5Ui7i5Ay
 kUbAzlaZEFhPkll5Yghv0wsfBAiMmsPIxs74HNzUXQM1rN1UXT53sZFbu0DJNWu1l55A
 iyx7uOtxHVlZqJPNdC/CGt+pTVMMNYWAVjVdau9/IrK1OBZdoybVfVjPFFff0Bre0gI+
 +KUA==
X-Gm-Message-State: AOJu0YwF6cv58RqJGDcm/5jGAJ72PVbEf8yISLOHDBGYvuAldI0JPNEJ
 Y/bChIX4UREb6dNiM+xOcL9Qix+IjbV9B6r0wZilCTt3ETfEodjNq+wnrI87/F6lG1ieOO2MimW
 bLSAs
X-Gm-Gg: Acq92OFfMDSAhkGVUSSTEqyRzkaEguCEc+EWtkvExfTjGv+oPEkCm4uEuCRA0EiZ/Z7
 vSnmhLb+P/PMg6X+ERY+LtJVTpuD49CWZOU3hU3Yzw5g9w+vOfS4iVXgCpLWkLZtM2fnqoEFkRV
 cRsLJnMxylaNAxQYKBQ6cid4O517FpP1amQ+3Pa3sEJp0Q7lr4LV+Y2iem7eJFlFakfVWwS8TVg
 J92lxDkbjkh+rPjsHkzTnZrzv/uPWJjBVHFXYPjnfMXNucX1AL8BJdBGwoJOpxZfwzM11S18uKs
 Q7LJgCld9plKju8JAAGhYtHi3qPNHbwSapmkhYsTYAhEd74hGfMyOVivX94UGVsOPclTLYKrrvy
 4l9CWdGhm8gITw57z7AuBcsPszsRv1RottGT5c83x0QodV5dnAekdu1bRruVRcDiO3LmhtHyPRk
 zrjf6Kk9doAxaRlgooFuA3uKDpUV02oewjgLKIG+TUDOeutLxamzM9yZ6VZXubPUoLNr+Kn68XH
 +PT9vcQCv/t/woOBSSiHmPHtiPeyVNhsJ0L1ThQimHLHp8=
X-Received: by 2002:a05:600c:6994:b0:490:3f7a:108b with SMTP id
 5b1f17b1804b1-490c25de6f1mr146433255e9.16.1780786291174; 
 Sat, 06 Jun 2026 15:51:31 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f351ac0sm67014650f8f.27.2026.06.06.15.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jun 2026 15:51:30 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
 Michael Durrant <mdurrant@ArcturusNetworks.com>
Date: Sun,  7 Jun 2026 00:51:18 +0200
Message-ID: <20260606225120.409046-7-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260606225120.409046-1-romain.naour@smile.fr>
References: <20260606225120.409046-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1780786291; x=1781391091; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BMDI8hBnY9dcllsEiAv8T3Qug2/oAsVw2nVynU2RRXs=;
 b=HAH4QLmaPdq1WLwTo6j8Vssjt8F8WGzBNh3qV5IyoF2thbdaDGsRR3nI362rREiKkx
 XPYHEVspUQb8rJPp5cVF3+v2RHfQ8KngvdBbuUk0o/VLswuNq6UnUjgyvGlbNsmvmAT7
 ztLvl0rsDPS6DvIPFg6SKjuzVEdjAqnyta1Ig=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=HAH4QLma
Subject: [Buildroot] [PATCH 7/7] configs/arcturus_ucp1020: specify Linux
 license file
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

The used Linux kernel (4.4.144) does not contain the default license
files as those were only added in 4.16 with commit e00a844aca
("LICENSES: Add Linux syscall note exception"), so specify the correct
license file to fix:

make legal-info
..
cp: cannot stat '/path/to/output/build/linux-headers-custom/LICENSES/preferred/GPL-2.0': No such file or directory

And add the sha256sum to the .hash file.
Enable BR2_DOWNLOAD_FORCE_CHECK_HASHES.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913808 (arcturus_ucp1020_defconfig)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Michael Durrant <mdurrant@ArcturusNetworks.com>
---
Note: This defconfig still use a vendor 4.4.144 kernel
(linux-v20190618.tar.gz), a vendor 2019.07-rc4 uboot
(uboot-v20190618.tar.gz) and a gcc based toolchain since
the support for ppc SPE has been removed from gcc.
How long should we keep this defconfig?
See commits:
531b2a10cda6bae78ecc141c9fe48f2024f71dbc (2021)
96e80ad214ced86c802d561946fa7da88c1595eb (2020)
---
 .../ppc-ucp1020/patches/linux-headers/linux-headers.hash       | 1 +
 board/arcturus/ppc-ucp1020/patches/linux/linux.hash            | 2 ++
 board/arcturus/ppc-ucp1020/patches/uboot/uboot.hash            | 2 ++
 configs/arcturus_ucp1020_defconfig                             | 3 +++
 4 files changed, 8 insertions(+)
 create mode 120000 board/arcturus/ppc-ucp1020/patches/linux-headers/linux-headers.hash
 create mode 100644 board/arcturus/ppc-ucp1020/patches/linux/linux.hash
 create mode 100644 board/arcturus/ppc-ucp1020/patches/uboot/uboot.hash

diff --git a/board/arcturus/ppc-ucp1020/patches/linux-headers/linux-headers.hash b/board/arcturus/ppc-ucp1020/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/arcturus/ppc-ucp1020/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/arcturus/ppc-ucp1020/patches/linux/linux.hash b/board/arcturus/ppc-ucp1020/patches/linux/linux.hash
new file mode 100644
index 0000000000..eafb86d8cb
--- /dev/null
+++ b/board/arcturus/ppc-ucp1020/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  5ad0192e5cd10eca5f9fabb3234f2bfcbafba3382a9577139cc66be629e5bafa  linux-v20190618.tar.gz
diff --git a/board/arcturus/ppc-ucp1020/patches/uboot/uboot.hash b/board/arcturus/ppc-ucp1020/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..eb9744043c
--- /dev/null
+++ b/board/arcturus/ppc-ucp1020/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  eba8aaf634affec7c27a55b899c404a85a0c219c3f814d576793e3c21b711b05  uboot-v20190618.tar.gz
diff --git a/configs/arcturus_ucp1020_defconfig b/configs/arcturus_ucp1020_defconfig
index 8e489f7f19..c0423032bc 100644
--- a/configs/arcturus_ucp1020_defconfig
+++ b/configs/arcturus_ucp1020_defconfig
@@ -1,6 +1,8 @@
 BR2_powerpc=y
 BR2_powerpc_8548=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+BR2_GLOBAL_PATCH_DIR="board/arcturus/ppc-ucp1020/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="UCP1020"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Arcturus uCP1020 System on Module"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -8,6 +10,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,ArcturusNetworks,uCP1020-kernel,v20190618)/linux-v20190618.tar.gz"
+BR2_LINUX_KERNEL_LICENSE_FILES="COPYING"
 BR2_LINUX_KERNEL_DEFCONFIG="ucp1020"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ucp1020"
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
