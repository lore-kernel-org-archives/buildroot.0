Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96435C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 07:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12E5F40878;
	Sat,  4 Nov 2023 07:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12E5F40878
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ixrWlTATgPfG; Sat,  4 Nov 2023 07:25:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4830E41937;
	Sat,  4 Nov 2023 07:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4830E41937
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F2251BF397
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 07:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11493409C8
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 07:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11493409C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PAjN-RrYHA1N for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 07:25:11 +0000 (UTC)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1DD55400C1
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 07:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DD55400C1
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c5056059e0so39664071fa.3
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 00:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699082708; x=1699687508;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aIdBNmvN1qkgw82Q1GFOc4svmav4RWpu22R40F/arIs=;
 b=wp1HGSzfPwoeuUvNxTNS2RKfR8rash5uZlOoG1q1pNkUJKzQrj0fjhMDCYngTFhiKx
 96F0wxUAOu6+g7r9PQCw/5/sfHbcOaSJWX6YgikjnPgFIvPdePj6ERqYN7FHXMJ1aJ6+
 fIq6cj+d8TYttV93g0pYUqEw23vqRTZrhXXJDJl1CMzw8ePnnRZCYBJdFD7DXhw8l5cm
 i+Grl+N/Ba+Ybu/I+BvopCkdqxjnlK6fGyy1EkUZ/IWEjcV4IJ2/2JfHfJ7iy03NN7DJ
 EpFsC5JjOyV99NmbpSadywwb0wGmlWpGYGIGJRq6cyhCUy846kCB+utUIsT9QKZTluDi
 avVQ==
X-Gm-Message-State: AOJu0YyYhPwwJtkETKDGbnmAXRhuFDFktb5DyJLNywB3nxHTDq/erKOq
 aDZHtuBqnSaXNhIb2lDVCDLXf5UTrrjdfuE8CEkLKQ==
X-Google-Smtp-Source: AGHT+IFSINxr+7NryNW9cKw3sCOOE/1JMBuXM4oW1x7gbFcsky/SQB2yJWM407jWRzBmttWSSS5hdA==
X-Received: by 2002:a19:430e:0:b0:507:96c7:eb1a with SMTP id
 q14-20020a19430e000000b0050796c7eb1amr16873684lfa.54.1699082707708; 
 Sat, 04 Nov 2023 00:25:07 -0700 (PDT)
Received: from jpl.. ([151.238.102.70]) by smtp.gmail.com with ESMTPSA id
 c18-20020a5d5292000000b0032da87e32e2sm3686742wrv.4.2023.11.04.00.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 00:25:07 -0700 (PDT)
From: Javad Rahimipetroudi <javad321javad@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 10:54:54 +0330
Message-Id: <20231104072458.7369-3-javad321javad@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231104072458.7369-1-javad321javad@gmail.com>
References: <20231104072458.7369-1-javad321javad@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699082708; x=1699687508; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aIdBNmvN1qkgw82Q1GFOc4svmav4RWpu22R40F/arIs=;
 b=UjRMTCv2BXLE4kdrfRCMU+H1DFILpWkf0SxawvBrvGO61tco+Jny/OTYEOJI69nOuD
 aMjldizUwFtt5rzdRbIAltPFCJSdOu3kbMbG+QhkNDUHsitXdLzXIgpUq64b8WQqRhcP
 xxQBO4BMLIQcQ8z0w3mxEDBKwDkpZnwG02J36k/kxdltxatDCsDyN3KpTs33WCM7aijv
 V/c04MwSCWVFG4cfnJPco9zSZqZtvWlbxpMxTp5R7qvQvL0rHlenaAMWCpgg5LyfSkFz
 j8TUtAKlm4RcAZaFIlu0h6px1TBhkfWiXBX7NdXsi/mjlKh5L7mKUM7N+Rx0biDkZMXt
 b06g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UjRMTCv2
Subject: [Buildroot] [PATCH 3/7] configs/pine64_defconfig: bump Uboot
 version to 2023.04
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
Cc: Javad Rahimipetroudi <javad321javad@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Uboot version has upgraded to 2023.04.
Furthermore, the custom itb was no longer required. So it has been deleted.

Signed-off-by: Javad Rahimipetroudi <javad321javad@gmail.com>
---
 configs/pine64_defconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/configs/pine64_defconfig b/configs/pine64_defconfig
index 8d2324260c..b567462f5d 100644
--- a/configs/pine64_defconfig
+++ b/configs/pine64_defconfig
@@ -16,15 +16,17 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pine64_plus"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
 BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/pine64/pine64/boot.cmd"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
