Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97971CC6B34
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 07:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0016A40813;
	Thu, 15 Oct 2026 07:08:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aDACtxN_S3aB; Thu, 15 Oct 2026 07:08:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 28A9E4080C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792048102;
	b=CxLsVScUiNcv6zothYwOBrbovA6b3s6m8uAdlKsrIyh4LOPbNqwu9EcfxUVRO0FvJ87G
	 JgKLEEilrVY6QUOGS1JVR6eh76o7445bkTPms/ovbS60Gt+enWKGypVvTMaHbA57/rgDe
	 imeCSF6cXSV4LkLFjDJ2G8yj6crgdB34EPGLGQ7Y6Bg5z13k0ZhD4Jn3HXQ5/xAYzfGSC
	 7Shfn3tpQj2z35jOFVPH8k1uBbfzXtgf19kinO1Ac5/nFDoWfd2v1BFAnNOFKMI5KL7/s
	 csFEgpH7LYtyyvCJlqHMjlC/EEfO2BhrTzaOJzCcERzg6k5BH7HFRFJPPok6N9hfgFQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792048102;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=U3eCT+VF0sTWh8mNDMTnbnUzm7TIkke+pBkoCChyz4w=;
	b=dVqJp3MkxMl/iRNLh4Laed/BG8s5fbRE+/RypIN8SS6I5+nZGPd4YbKEmpfaPh/j0azJ
	 5KqYXraeJqf/9dIw4lei/0IgPTmRzfE3FtUY3UtSBv+ONOiXM2OG6CljG5nXMFllkxKwn
	 vx22rCivwfANrEV5lCeCLJ189Iuh8Ca/xJuT+jFPHMxnkrQ+WlBGHR5mvZLNGsyo/Mk0J
	 rnc2UmrO1Msyz29ecM4UHDVP1/EiIfl2msG0qw0YkDQGZ/9AWNmxsNXoKA7FTetVJqbS2
	 XIQYsvhK9JqRhC9eZzCxsdRhUGk5ghlp8q8PKhikTZ2XsvXYzhNkGiEe/ujXbHRk9PQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792048102;
	bh=U3eCT+VF0sTWh8mNDMTnbnUzm7TIkke+pBkoCChyz4w=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z7YmPQhejzo0fHyDAGwniamVCFT/J1odgIa4HnKko9+Pso3M1adqJr++yKG2c4p9o
	 dZUBJpv/YCA0cctxNUB9vhYaLgNbRhF4KKvPxJAHMI8nhgBLvfpYh0yjzB7y9VxibG
	 ZHJdZZXV5lFFCuMJ3usNMLGZBIEGJ/xOJSIDb/iClQQDwbEmonJJcEuzcsepXUMQC/
	 qiiTBNmr54q0H9BRmacBdu45pQykuQ9D6f8V3TqNGhDuIWL4/7bGHL1fqePcqiV6jA
	 7zqIRzaLsvQRQBvYk2d60ytec136n+IncSLIKjfd4BVwZXPizKhEV9sKD3Rf/zg7mI
	 qbIGSFq4zjSAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28A9E4080C;
	Thu, 15 Oct 2026 07:08:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C71841DE
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 07:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B92054009C
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 07:08:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h2P08R0yLEyy for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 07:08:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 79AC540053
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792048100;
 b=slLzhYD01uEAHxJ74VfhyUoYg+pF275fxe4urb0JdsfqvKgL+GhAVakb497RRJmy51/C
 goWbJfH5pXf8dYEnk9p5HH98esfM0mwnOlNd1ESGFhBUcQgN9HQkawYulcBuZlRjclERp
 tfQU+TLBQ7dAHfRFdJ0NX3f3nZSyHrHMqsEJE2r/+SGBYGzpVTKSn0VmeVIVA2xy238Uh
 3QHDj70oC3EtoM3PI7sfm3QcDBTMWnCar+qnssmmW8HJUHYJRaNjC6G7myGcCxw47guTj
 LHwSg1pjXZ+nPGZsTumLOYGnna+p8WBGlohA0lmy+LTGr/wqchAeA+efKkho9XjwcAw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792048100;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=EUxKaR9QtpNiJpM66c1Uad6NnQ3sw9J7cFGEKNJZbPU=;
 b=h9fh4Kki6V5WpgYziUDFuxzrpHYoE4wR3Tc3dlyks1FIDk/XiWxJLWxL7HBiUlCrzhwQ
 Hdc0oposkBwk7wvHR7of6+cbObp4/StwxXgRXuFDIxO06a3mY80pt1mhBIvFkfaiiWlhD
 /FAXfAk6a+1MpIKP7Sv2wDLdZ2TF81EEHdFap17c/Ypo0HeEA6fv0xYCFAqghue/7bIKr
 vTVZoquRO6tR8qEc2Ew/dU/O1uBTHY2o2K59OA7xQeO19JOg+Dlhoh10Tiv4nXnltLczs
 Y+YDQE2QDV8pwQkuPAt4Mr6Wc2gPY9hnd1prpNN78CY3/I5PAZKR02Oc9NVaVFv+Qwg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=VryuDkC+; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=VryuDkC+
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79AC540053
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 07:08:18 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a180fbeef5so44416005e9.1
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 00:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1792048097; x=1792652897;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=EUxKaR9QtpNiJpM66c1Uad6NnQ3sw9J7cFGEKNJZbPU=;
 b=VryuDkC+H7rmmTzOH5Y+v0fgVALAbbeLUZHuKwaXcgPj39Xr4GT6SQX/ijgjDL+F4o
 AUGK0m71nqa7+014mD/Fa9wsBsWNnvBT2q2PcA5rlq9MtyOQx3wHeaTBOcoa5oElMbty
 mAZ18iQjD5NMjgFoAvRxf5BFU6AUWylcNdtrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792048097; x=1792652897;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EUxKaR9QtpNiJpM66c1Uad6NnQ3sw9J7cFGEKNJZbPU=;
 b=fmkpb9S43P7UGtKQUn6LBlKfW4XyMEa+YlJ/R0ZGI3iPdXLXlFW+fq7FjkEhhPboj3
 JN0vD1JAxl8U63CgIAILCcmrXLIvsHcPIcPM22FbMkS3CHZV6HL/9fmjvEgVOnJHEuiT
 Henc6qA43lZCFwFVBkCgDNR7Wx/nhImrlBcdKRY3UEjeZJqc8XJGExoaPcuho1YJaFUy
 bmwloK3j9VyjkbOlLTvJEbUonLAGCeG7chfGp5wm874bTPqEGtkNV4ZZgZiQDKbW75Vc
 jtXyYgCvXYOEKL3K8VGmhLGmYaE9RKa2U2dpmLiF2GWP4yBlZRIGpktrrHf0TJkjCz9/
 XCLg==
X-Gm-Message-State: AFq9FYKQIFl/rXMDMf7CpNw1xHRcVmKbAiEJD9G36YCa36prVcmNh3r+
 DPdUzds5lJDKMiWSJrwd++aj4YCMKrz9m+iqHEuCcQElt2JhRs5uu3cPbM6IBpRYoDe8qXmj5k6
 orokE
X-Gm-Gg: AYBFou0V+DLwX7HlO9pUvdKFzK33dkv/Ctk0c+XeZW7SoeULEjB08DA4k1bNJZFLyBc
 XonD1EaE3OMvrogh1yJLRvEX1/YLCPoTHGWX5UcBVCH/YofxZAhnsxKlN5zww3Shb6Dq9DIRCff
 QB0G7GdoPzPiByYVkam7sVgsh1e3k0pNBXX6lz3dmPicHR/YZk4MBCOJzyg1uSLQHgS9yfedBC6
 uuFVyB5NyV/rfJcJyus791D6sifprghtGj5+xy/viURQqnrzjPLt3664biIMHKq5J7qrO0wWpH4
 dVc+Gx9C3LtKbD7p1aMh3p6UjjjpHwa0wb9ydgYRWIXCNAHHki+pVKVbjD5YqnCf7j9ZRlnKaea
 CFXc5shikTwGpaCZc9AOa+b0fwYsg511dsLzh4q7SolIeDMM83v7Nfu5UYUxpkq7Ed1fgC5iBvJ
 whmveWUq5XFqOv0fKaOxsDzexqVnPz8i5IWCrEb9K3ChJAZImD9PGs/DdTobz8QBChpzrC4q7zP
 eOkZ4a0bq61kBynbJXzmVs2wFYVvMcITNICAJw0JaiKeyPauQ8jjmBB+VN4EttEGws=
X-Received: by 2002:a05:600c:46cf:b0:499:b65e:49c9 with SMTP id
 5b1f17b1804b1-4a18e47ad5fmr399156355e9.10.1792048096651; 
 Thu, 15 Oct 2026 00:08:16 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:c903:d469:8f3f:2c53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd99faf3sm48705435e9.14.2026.10.15.00.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 00:08:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 15 Oct 2026 09:08:12 +0200
Message-ID: <20261015070812.1059968-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] configs/stm32f429_disco_xip: bump Linux to
 6.1.189
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

The patch bumps the Linux kernel to version 6.1.189. The size of
xipImage has increased by 9286 bytes (1706592 bytes compared to
1696766 in version 6.1.177).

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stmicroelectronics/stm32f429-disco/patches/linux/linux.hash | 2 +-
 configs/stm32f429_disco_xip_defconfig                           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
index be1c34bc237f..196a0535c905 100644
--- a/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  f6529bfe1a457adab69156fb7fa2232cc203eb63f5e46210f9953d6fc9f70a30  linux-6.1.177.tar.xz
+sha256  3ec834a2fefc9a08aac62f993525d7acd10163db6f01d63b4549cbff3f5c9439  linux-6.1.189.tar.xz
diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index 40577a21a5ee..d82088c71832 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -8,7 +8,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.177"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.189"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f429-disco/linux.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
