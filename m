Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3793DC982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 17:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB40E60D62;
	Fri, 18 Sep 2026 17:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id stxqDbWb7gGn; Fri, 18 Sep 2026 17:18:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0D01C60D76
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789751897;
	b=ESxss6NhjTXfQ65dpXxIQGmsd+3i+3f2wNXhGhTO1fnR5ln+1IYcYhVLew+5we5Vd1Ki
	 WKAkwHawRsyHl5zxMd+qyFYqCkvBwUWGyWZpNtmzKlLz1ERk1bMBcmWjhwdrIfolXvIbX
	 g6uWwmMEY7uGtIZYGbsDKxCeZHpT/Xwt9CBECCGV3WLqxStb8SIGRexhx3Cu32XD8YNq0
	 y8Wi/mgv2QFgj7p0hLfLtj8T6DRscSDq9ZTdh+n3D05BsBVeXo7x0Gd4d3NdxKLbHNd91
	 ppeEfPmRYzANUs2lLBFODeNfK6Rj5S42zlUEzMq5CdxQSEBdzcqNCVmvnkoJVz2sepw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789751897;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:Date:MIME-Version:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=p7B3CeyIJSCPhlo98tXG9tpTQVuLXG9oNJ3OuoO6yGo=;
	b=JZefsZIKNx7rnelWZb3IrFlPOLsVQXOMTRMWtTGmDmnmF2IZuT+IlhRqFwghG1/4H+0a
	 NgdHzhn+R61wKZuU0RaYw3xfNRElnfoo7aSTLh6/fbuOyYw2ulGTNjZltw5p+NQdSuZsF
	 7nNrNF8wHk/LsUGo6HtAaKT4Q+JRIEDxcdQOcSeonxokRsrPfwWFWV4kiQaeImXFMUk6U
	 Tz46vAnOS/Dq9XenS81B7H8rj7WUFRFXpeltJzo2UvsNayOm8Vhu8jFLYKz5vAHUsjOM+
	 XB22dDnZ/JFSBIueEYIVKyylOYB54pMwHGFc7E/VbbMEvgQCWm84C7iNDHEJdXqGVdw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CWbb4fQT;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789751897;
	bh=p7B3CeyIJSCPhlo98tXG9tpTQVuLXG9oNJ3OuoO6yGo=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fSUhjJgzy1H28pqZ9OgNAQOAzV+CKysmekju4UK07DNon5exbnuci7u3RdJmlMsKl
	 oeWQ9zzFdMnWWbtjpWjSY7zm0GLNkmU+IBkLSYDLL8XAkQ0IfVGUM1a7vMdnffDQwO
	 OkbFy32exyeFFhssg8jgdnOAJdSWPKFxiLZ5BERDL/wHJoRhJovzDsJOc6OHpZmF9X
	 9TRFEBwhlAQ4DoBEJz09Vr/5Etcm6FDjGUVNU0HHfk7uQm9wIQSJI1cTKs1bSVdHf8
	 7NJVQbjiJAb6bbAgPBNJ0u8nMfhb8MjIr06H9ViY4mwwcLE4ZlmVHth8R18tkOO50A
	 VkD5D6r8jHNSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D01C60D76;
	Fri, 18 Sep 2026 17:18:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 34332237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AC0660D76
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yAEf82Fd6DYb for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 17:18:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A9FFC60D62
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789751894;
 b=MuJvftOuxupojqlGKb5BeDr7Ey2q1ObDn7ShGSCwv1oHKlL9ad1J221EjTWTzyB1WZD1
 OPr3llMi9edkNZTAri7rYSif7u+/SnnirHRrbHDkvtn/VovhwR0OP5RjqBfx5otrRtgfC
 jw+/tE9TzpcAH8JSPdvFxaUlKL23feU5Hj3SLFkJkvb1JzLK8UQCYqDkUROqQKuNv+Egu
 SH3TQ7CkqOjAUezJDNRVBBP6wi0TaGgE3yPn7BTToCTLYRvsi5SGUA1290jyLmvpe8c6S
 /UKR2zwgYHLUdw3DjhUcVje5S8JPLKbh4fDFNDnCnpEsH4kDq14nfV9MMxLTjuxppvg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789751894;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
 References:In-Reply-To:To:Cc:X-Mailer;
 bh=riJsuJT0XueGxtz14i5L7qPNUIy5mST5eksptancz+g=;
 b=XYmBd2lH19z+byQiILzVOfOoUsarh+HTxeCvxJGtSWsRRtb9zJLxHJqXeTH/L5MWZWO2
 sCYVG8hJc01OpNariURg8IIm2g505gLqW09W8pFSdAJj+3O3QwcvN5cG4ajL6fW9Balxq
 Y7+fo7qNIhRKXIQ6X9+S2w1PRC4DzmcK/j0yPh++bBofvV7kMzit5yMiwIU5MNx2W7H8m
 fRjc1zfDAVOIYlgG1+ikG7lfG6YNc9ZnThrFNi8fTIiVtMJEXfHB19+mZ5GW+6wgfrm/4
 +LNeMbMXMA6zcsE2QduHe9u41domLJbTGLEZb9F6cjhqCvL2u/AOmwKP9Gpw3sR8oDA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=CWbb4fQT; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=fractalclone@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=CWbb4fQT
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9FFC60D62
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:18:12 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-482f6350faaso557578f8f.0
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 10:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789751890; x=1790356690; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=riJsuJT0XueGxtz14i5L7qPNUIy5mST5eksptancz+g=;
 b=CWbb4fQTkhDxg1odylfdEYF3SwqRYmY40+ogoOmoQ5MuS1OtrCgnAJz/0cmFg/tKc7
 zA1zo9hz7tWAjWoGBeNhtXJuqM6QgfDE7ZeqMc5igJK6pFC+nFYIm2OidvRtVbVCXEnU
 WeLWG47TWs5qV9hgl/h7K2rJw/oDVGJ94x7YLmcHtbiOrapRD8qePazaVvyedzFxh4HT
 OMNUhexrfIRd78s1C+r4jCeVO8dkKLPAPKNyMIp8a5ElprzH47G4hyxscQ4GinJVlTTe
 vTKQgX0ZGy3AjR7228zVqjUy4NNfqEC3XHLcO0PhVox8kqOaTVh5L1USpoPaMyV8ARxz
 R3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789751890; x=1790356690;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=riJsuJT0XueGxtz14i5L7qPNUIy5mST5eksptancz+g=;
 b=RXd9nzozkSmEBuHu+1v+JUpuW+aEXzsZ4C8ugDmH0EIw43lSTGsH90HyNdAl4OmVy+
 mIvSH2mptdm5ioOzISGNfuKyobZlRfwF3RAqSLdoiA6/nUhxrwSLa2l03OmHlFK3rRSI
 6idbrSKYWBtJILAzhWtaleR3y24zzCkB0A/+E5vlDTfZF7ujls+vnKn1ys//VcXnho3L
 b498PIsInfq3fo94ao5uAm7+eB0WPKGCoeiBIzo2lo1BlP8+06OLjhuFoprp0pIGjQ7y
 CVmq8cC6XJnTOrgQX41M8r0s7f29mqUNQ6b7vKhbwsjhJd7P5QE//KzySNsJt+wWQ/Jg
 Ay/w==
X-Gm-Message-State: AFuF++liuD12lhvlYnPOVoJtCJi9NahM1nZMj3dQ58eNPoO1D0MhnwPW
 +6P9HAPG6/mYaD95v5WhfE5bobMEn10mnfoQ/bIZnQlvdshc1efF46swxPI93w==
X-Gm-Gg: AYBFou0QBkrVgaaEGopYuNTO/EPtmoLhfFKmMdlunK3KA8CNiR9oJ+kJgirfa2qujzU
 9iWMbG/ynukmo2IdMjkT3Uo9C9pieZE1kAnYcgbJwoeYmXBzOHAT0yymLLvWMBHf4shVHP/Jdj7
 R+4bn7yzr8YuNVMmg6yas2SmLImkjT/CxqrtZBYOeksXMGTEpic8FzKUBa31sebcIx0qaxh8UMt
 KUotd5l31Ph57Ng3myQ71dVlk0isjPPKOWw4BzpG6h5Br55uON7qn4BNc75WxUYB26q40127+W9
 J0ZvSEMwuthfH8OI4Qa6PaU7fAKfk5ErtCCLN+pPJgbXhDibIv+mlrd0EsxQKi13EJKUmCSBoAW
 Y+PeJNUXJiWAcJXlvnqNFzrzEvpkomDJSG4HVSfvQw2QtTzR5EjZUxtXMCr5u9VfijVSg2SJB8T
 2YuWIuJJJS5zRPGZa61q85GPVAu7TiEy1rVuwlkaEQCmUnRsY7Sn5oT6SIxBMevp6Q4Ab5Mjrbx
 MrDVQ==
X-Received: by 2002:a05:6000:2409:b0:487:342:d147 with SMTP id
 ffacd0b85a97d-4871e363e1cmr4846273f8f.39.1789751889892; 
 Fri, 18 Sep 2026 10:18:09 -0700 (PDT)
Received: from [192.168.1.138] ([139.47.34.204])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48724460964sm133880f8f.7.2026.09.18.10.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 10:18:09 -0700 (PDT)
From: Jean-Paul Etienne <fractalclone@gmail.com>
Date: Fri, 18 Sep 2026 19:17:35 +0200
MIME-Version: 1.0
Message-Id: <20260918-rock-pi-4b-v2-1-89120500a1de@gmail.com>
References: <20260918-rock-pi-4b-v2-0-89120500a1de@gmail.com>
In-Reply-To: <20260918-rock-pi-4b-v2-0-89120500a1de@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Jean-Paul Etienne <fractalclone@gmail.com>
X-Mailer: b4 0.16.0
Subject: [Buildroot] [PATCH v2 1/3] package/rockchip-rkdeveloptool: new host
 package
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

rkdeveloptool is an open-source command-line tool
used to communicate with Rockchip devices over USB
for flashing firmware, reading and writing flash storage
and debugging.

Signed-off-by: Jean-Paul Etienne <fractalclone@gmail.com>
---
 DEVELOPERS                                              |  3 +++
 package/Config.in.host                                  |  1 +
 package/rockchip-rkdeveloptool/Config.in.host           |  9 +++++++++
 .../rockchip-rkdeveloptool/rockchip-rkdeveloptool.hash  |  5 +++++
 .../rockchip-rkdeveloptool/rockchip-rkdeveloptool.mk    | 17 +++++++++++++++++
 5 files changed, 35 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0a6d4e455e..6d69fd4663 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1616,6 +1616,9 @@ F:	configs/orangepi_pc2_defconfig
 N:	Jean Burgat <jeanburgat33@gmail.com>
 F:	package/openfpgaloader/
 
+N:	Jean-Paul Etienne <fractalclone@gmail.com>
+F:	package/rockchip-rkdeveloptool
+
 N:	Jens Kleintje <scooby22@web.de>
 F:	package/gcnano-binaries/
 
diff --git a/package/Config.in.host b/package/Config.in.host
index 595caf9e7f..9b4b6172db 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -105,6 +105,7 @@ menu "Host utilities"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/rauc/Config.in.host"
 	source "package/riscv-isa-sim/Config.in.host"
+	source "package/rockchip-rkdeveloptool/Config.in.host"
 	source "package/runc/Config.in.host"
 	source "package/rustc/Config.in.host"
 	source "package/s6-rc/Config.in.host"
diff --git a/package/rockchip-rkdeveloptool/Config.in.host b/package/rockchip-rkdeveloptool/Config.in.host
new file mode 100644
index 0000000000..5f8029bc7d
--- /dev/null
+++ b/package/rockchip-rkdeveloptool/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_ROCKCHIP_RKDEVELOPTOOL
+	bool "host rockchip-rkdeveloptool"
+	help
+	  This package contains the Command-line utility used to
+	  communicate with Rockchip devices over USB for
+	  flashing firmware, reading and writing flash storage,
+	  and debugging.
+
+	  https://github.com/rockchip-linux/rkdeveloptool
diff --git a/package/rockchip-rkdeveloptool/rockchip-rkdeveloptool.hash b/package/rockchip-rkdeveloptool/rockchip-rkdeveloptool.hash
new file mode 100644
index 0000000000..6dfec07958
--- /dev/null
+++ b/package/rockchip-rkdeveloptool/rockchip-rkdeveloptool.hash
@@ -0,0 +1,5 @@
+# Locally computed
+sha256  84f6e7876f1ea3c8d9dcb905a50a48d6d83439439898d06b054d2e8752de1456  rockchip-rkdeveloptool-304f073752fd25c854e1bcf05d8e7f925b1f4e14-git4.tar.gz
+
+# License file
+sha256  1be990a929b50ca91d815cea1cd3cebb5c49e86076ade82b1103f2b9cd71a3af  license.txt
diff --git a/package/rockchip-rkdeveloptool/rockchip-rkdeveloptool.mk b/package/rockchip-rkdeveloptool/rockchip-rkdeveloptool.mk
new file mode 100644
index 0000000000..52e6e3caa4
--- /dev/null
+++ b/package/rockchip-rkdeveloptool/rockchip-rkdeveloptool.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# rockchip-rkdeveloptool
+#
+################################################################################
+
+ROCKCHIP_RKDEVELOPTOOL_VERSION = 304f073752fd25c854e1bcf05d8e7f925b1f4e14
+ROCKCHIP_RKDEVELOPTOOL_SITE = https://github.com/rockchip-linux/rkdeveloptool.git
+ROCKCHIP_RKDEVELOPTOOL_SITE_METHOD = git
+ROCKCHIP_RKDEVELOPTOOL_LICENSE = GPL-2.0
+ROCKCHIP_RKDEVELOPTOOL_LICENSE_FILES = license.txt
+
+HOST_ROCKCHIP_RKDEVELOPTOOL_DEPENDENCIES = host-libusb host-pkgconf
+
+HOST_ROCKCHIP_RKDEVELOPTOOL_AUTORECONF = YES
+
+$(eval $(host-autotools-package))

-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
