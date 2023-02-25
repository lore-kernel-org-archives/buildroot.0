Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC67C64EC7
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 09:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96D8E40586;
	Sat, 25 Feb 2023 09:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96D8E40586
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ipKkUv_qWi6I; Sat, 25 Feb 2023 09:22:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF7A1400EC;
	Sat, 25 Feb 2023 09:22:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF7A1400EC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 72C391BF5DF
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 581D6410EC
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 581D6410EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qHJmE9MQol9t for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 09:22:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41783410B7
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41783410B7
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 09:22:32 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 l2-20020a05600c1d0200b003e1f6dff952so3921721wms.1
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 01:22:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0S2HK2LMtef4s3j9ttmP6j8hrsJgJ9vLVQGaCJeeP2Y=;
 b=aTK19bVwfa3hbHzSdvmHEP9w3fBFKUMsiGL37b8iUNNQRuiUFFzqVasreJMubOR7Dd
 v+PG7tL88OmyWXKT55mlODBbpliGPMcxl0e8rtHSi58DBRwHtQ3ONrSgpO/imG7I81Wv
 4Gm7p+s472aALN7bRXAZpDIRDRSHQEFN/0QmHPzVwEURa0v9Rt2GkNES0OKIFAJjBRyh
 9M/XO0Y2NRFcwY5okT44HOKeG6U/dceqT5BXIZNopJRbTEmkuBXJZElGdm0a6wpSL8IZ
 as8uwekjnWXcCtKlDcH96PDySYVvEOc/dhtim1bP46cLZQ07KVFLGckgOVMP0HgjE0mt
 rk3A==
X-Gm-Message-State: AO0yUKV8arLQS51xOp3cKlx7wZAml4NELQ6JmQls9L0efbS1iI2mJ79v
 /F17R585WUscGSwC5LWcy32C3MyYNSo=
X-Google-Smtp-Source: AK7set+OGQfjRuM4nc4ZlbqtsSHf4lgZww1gC+ajYp3GNxAOdZpM+l4YBT0Z25xBvLPBni5XovxSZA==
X-Received: by 2002:a05:600c:319a:b0:3db:5f1:53a5 with SMTP id
 s26-20020a05600c319a00b003db05f153a5mr14699376wmp.20.1677316949864; 
 Sat, 25 Feb 2023 01:22:29 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p15-20020a7bcdef000000b003e200d3b2d1sm1902328wmj.38.2023.02.25.01.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:22:29 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 10:22:27 +0100
Message-Id: <20230225092227.9308-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0S2HK2LMtef4s3j9ttmP6j8hrsJgJ9vLVQGaCJeeP2Y=;
 b=dtvsgd6fDcgM9rUJ1R3luc9vAw6AZKols2B0qh4P82A7YHuZq4mOR44AkWLpFtZaEr
 NhiFRfoUqa7aAWJDXesm2A3wW6VajGsO97KAqOWiFndaXuYQ7qEcPfAkFMiDAD7XiWL0
 9Pk0t9VWf8lGmrjEHG1bjca9Lh1vX/7bCrSXXrRuDLxLTosV1GYNo/l7uIQMzMQQd90H
 sdQrN+pNipNhmDhyRYx5Ukd1B9BiaFulY/7OgIsocj37AMMLeRQY8CH4JDU6Wr6QeVEe
 GahzKAqVSeeNN99C5h/NLUoyuCqaYsIjWK2tjHFjgsAXbhhCLN0v/wn7jn52n1ZVXKfR
 wjdQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dtvsgd6f
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: add ti-k3-r5-loader
 handling
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit 0189bcb47c7733c36fcbcb88fbf26f57958db576:

make[2]: *** No rule to make target '_defconfig'.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/d7449b2b2f2349af672bfeee832b89a223a7d9cc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 utils/genrandconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index d192c5b324..64b9be69db 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -518,6 +518,11 @@ def fixup_config(sysinfo, configfile):
        'BR2_TARGET_S500_BOOTLOADER_BOARD=""\n' in configlines:
         return False
 
+    if 'BR2_TARGET_TI_K3_R5_LOADER=y\n' in configlines and \
+       'BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG=y\n' in configlines and \
+       'BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG=""\n' in configlines:
+        return False
+
     if 'BR2_TARGET_UBOOT=y\n' in configlines and \
        'BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y\n' in configlines and \
        'BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG=y\n' in configlines and \
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
