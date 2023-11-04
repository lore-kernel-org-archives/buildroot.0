Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348C1C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 07:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D714E41F7C;
	Sat,  4 Nov 2023 07:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D714E41F7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BFUCNMLjHF6k; Sat,  4 Nov 2023 07:25:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0801A410CA;
	Sat,  4 Nov 2023 07:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0801A410CA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11C871BF397
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 07:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DED1960E17
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 07:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DED1960E17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xNJttZfz0VwZ for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 07:25:12 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2DE8760B29
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 07:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DE8760B29
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32d9effe314so1578671f8f.3
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 00:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699082709; x=1699687509;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7iFruvXZuOmAx16rIw1NEV1JrrFdzINLnHLv/+x46uw=;
 b=oZ1XIlPDaaWhriikk/jvuy9IFbw2xI7ULx4FdQB/BtPN8wE0rJldpspIen2r2RNlJq
 mhkNJsgyzLl1G6vuivdWK0ot2orax7JU2UwAcgu7GzvJTDjoWeCtZ3GSDzP5xYeRlkqX
 CKIyOKS+/UYfqDBXplf9EA32iywjQbuK/nH9xpoRw4pP74gAXAP1mK6Pam8UIsv/whpS
 hly71Qxos5DziBCKtJ0SfFpMNtAeHlSh3bDs5bAF5zlNJT9CcdlOVv08Qx8qwKowsc3a
 qio2heTHTIZU078t+MQkh/w5PKb2BTPswrVT+FF1xNanx1t+H9b6wuG1HPg2gE3ak7hZ
 JFww==
X-Gm-Message-State: AOJu0Yx01t5PXyUVGnuPA1/D3kltTM5W/iwjpsyenf9elOzCWqpO48+z
 yBJ4TfgacKGtcZT9COQ/qK4yAI7ASfk1JG/BFYeuMQ==
X-Google-Smtp-Source: AGHT+IEFewtBLV+L4hfpiwpxx8OaSDxOrtU3NNtL+upqaK7yF5qo3yaxw7kknCBGNxG38A31yGy4yA==
X-Received: by 2002:a5d:49ca:0:b0:32d:8982:ff1c with SMTP id
 t10-20020a5d49ca000000b0032d8982ff1cmr14892596wrs.36.1699082709499; 
 Sat, 04 Nov 2023 00:25:09 -0700 (PDT)
Received: from jpl.. ([151.238.102.70]) by smtp.gmail.com with ESMTPSA id
 c18-20020a5d5292000000b0032da87e32e2sm3686742wrv.4.2023.11.04.00.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 00:25:09 -0700 (PDT)
From: Javad Rahimipetroudi <javad321javad@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 10:54:55 +0330
Message-Id: <20231104072458.7369-4-javad321javad@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231104072458.7369-1-javad321javad@gmail.com>
References: <20231104072458.7369-1-javad321javad@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699082709; x=1699687509; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7iFruvXZuOmAx16rIw1NEV1JrrFdzINLnHLv/+x46uw=;
 b=aXTz+tC1SiUbwWJly/RnUFVLQ3JyR04/4Yo8yZySw8Rjb5LTsHfpwjrJq1+QwISutn
 DddkkEdUv7KNMXVURBoCg3wPsAQzpz90KNbn2I6BU0/4Lhpd5+klUXe+eGjdQzBPkuxC
 lALe5kn2cKjrypVcHLT2TUThh/8tO3mbrZdmj5ZIV10+78e2JQQ7kPP1MQ8nLswKv7/d
 epknSoMuxP/XpxPoHtbQQv/G+SnoX8Jgb1spSJhACHYoh/OFdW9LqMe1h9UGJSgEUE+i
 KCMjxg1q1T5RZneknzRVUas/Kv75c7wRXF61N0xtHIusJtC9w+RxpnqJtfYpMoa9euFv
 DTng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aXTz+tC1
Subject: [Buildroot] [PATCH 4/7] configs/pine64_defconfig: add dynamic mdev
 To add networking support, dynamic mdev is required to load network drivers.
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

Signed-off-by: Javad Rahimipetroudi <javad321javad@gmail.com>
---
 configs/pine64_defconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/configs/pine64_defconfig b/configs/pine64_defconfig
index b567462f5d..5cb4b4a0b5 100644
--- a/configs/pine64_defconfig
+++ b/configs/pine64_defconfig
@@ -42,9 +42,13 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # Filesystem
 BR2_TARGET_GENERIC_ISSUE="Welcome to PINE64"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_SYSTEM_DHCP="eth0"
+
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
