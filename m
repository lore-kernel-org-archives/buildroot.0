Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EB4C05027
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 20:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2096F41949;
	Wed,  1 Feb 2023 20:00:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2096F41949
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MPnXA058Z-ly; Wed,  1 Feb 2023 20:00:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29340417C8;
	Wed,  1 Feb 2023 20:00:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29340417C8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F31911BF31A
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 20:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D99E56102F
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 20:00:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D99E56102F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LgEF5bXxMvAj for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 20:00:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D049861073
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D049861073
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 20:00:01 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id n13so4090061plf.11
 for <buildroot@buildroot.org>; Wed, 01 Feb 2023 12:00:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ia+feWxImDvJvcSRyBncq4ydebEaOhqEUxfTwSjNHUk=;
 b=zjxrfmt6OaYcU3pnjHgNbkl74T1r+skoDrk0ckReV7+PH6syPH6G1cexgxSKTJgeYk
 SZcMPGo2sf+9keZiaSVBdIzjNzUx5t/HMbqntCvnC4RZzYOQyUgh4QC17h3f5u1Rx8D2
 DuWrBo2kpJby5FxWUytu+yQgXVLoT9KrpZy9ItRed5zmyS3EsRUtA7UF2Sx8eKXf9Y6T
 OZS2GuCazLyx5Qui/ds7K8x/+UEfBjLAWSzrcmHhHRAGCB9GiDureh03ypJynq7XFSTE
 kDslxBcW1uyDJoHgR6QggLlKPB+pSl1Et23QZ10a5qYSbxp5JobMEXxLBN54HH0C+809
 srZw==
X-Gm-Message-State: AO0yUKVuPrVlxZ7NRr3Bb9TiZWaQgpCrFHiyJm2qjoCJn053KNULVRHm
 s8mkX/rl9tJIpssT+5a0OlmY4FK2c0dqKIyI
X-Google-Smtp-Source: AK7set8erXq7mUw6sTgvRoQzgXVj7FsZKZ0V9hktX3nZMKeVugUx9sBEtDsVa5C35gsNwnTNsauvbw==
X-Received: by 2002:a17:902:e892:b0:196:7c6d:2aee with SMTP id
 w18-20020a170902e89200b001967c6d2aeemr4771351plg.11.1675281601019; 
 Wed, 01 Feb 2023 12:00:01 -0800 (PST)
Received: from localhost.localdomain (S0106f875a4344b41.gv.shawcable.net.
 [70.67.112.211]) by smtp.gmail.com with ESMTPSA id
 bc11-20020a170902930b00b001960096d28asm12111506plb.27.2023.02.01.12.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 12:00:00 -0800 (PST)
From: Graeme Smecher <gsmecher@threespeedlogic.com>
To: buildroot@buildroot.org
Date: Wed,  1 Feb 2023 11:59:56 -0800
Message-Id: <20230201195956.1758827-1-gsmecher@threespeedlogic.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=threespeedlogic-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ia+feWxImDvJvcSRyBncq4ydebEaOhqEUxfTwSjNHUk=;
 b=azdFTx8YUK7gFyNOqAZ9WLHujtNRq+YZ845BZPI7BJcw7xM8PRM73UJwTbyg8Dhl5Y
 f++sjJKFhNl4zVnXhkX3MCfh+IaP+MLujildWD1szAOeYecKHXDnIkHH0H7ZUzWNbaUs
 RUXPdBh8c+yhDTHXRt9JNIopXMkhsQuAar788cIKMsqGcQOuE1/yNCvQPHVsSSEexgzE
 5XhKqdU06l/6eCK8BhFSBrgdIP2+NlOdSW6i3FGQ+2l4+2RcP0mLaqX7TPPsDQzZF19n
 Ro7dYaoSciYGyoO6yimt1yGK7uNfxPx5boFPyfAY6QcGZSq4n716RfiRDy8BJwwX7evR
 WNdA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=threespeedlogic-com.20210112.gappssmtp.com
 header.i=@threespeedlogic-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=azdFTx8Y
Subject: [Buildroot] [PATCH 1/1] board/zynqmp/post-image.sh: Don't insist on
 a xilinx/ prefix for .dts files.
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
Cc: Graeme Smecher <gsmecher@threespeedlogic.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If using BR2_LINUX_KERNEL_CUSTOM_DTS_PATH to copy .dts files from
buildroot into the linux tree, these .dts files are copied to
arch/arm64/boot. Unfortunately, the post-image.sh script expects to find
them in arch/arm64/boot/xilinx.

This patch does not require the xilinx/ prefix to be present when
symlinking the device-tree to system.dtb where u-boot expects to find
it.

Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
---
 board/zynqmp/post-image.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/zynqmp/post-image.sh b/board/zynqmp/post-image.sh
index ed6dbe188c..c5de2db820 100755
--- a/board/zynqmp/post-image.sh
+++ b/board/zynqmp/post-image.sh
@@ -5,7 +5,7 @@
 # devicetree listed in the config.
 
 FIRST_DT=$(sed -nr \
-               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/([-_/[:alnum:]\\.]*).*"$|\1|p' \
+               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
                ${BR2_CONFIG})
 
 [ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb ${BINARIES_DIR}/system.dtb
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
