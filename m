Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E20C6FD18
	for <buildroot@archiver.kernel.org>; Sat, 22 Apr 2023 09:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BA2040448;
	Sat, 22 Apr 2023 09:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BA2040448
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MHG1LtGNa8Xq; Sat, 22 Apr 2023 09:35:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C6CB41874;
	Sat, 22 Apr 2023 09:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C6CB41874
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 945161C29B8
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 09:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D5BA60C00
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 09:35:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D5BA60C00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j56KBWnWHKSW for <buildroot@lists.busybox.net>;
 Sat, 22 Apr 2023 09:35:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7BAD60BA1
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7BAD60BA1
 for <buildroot@buildroot.org>; Sat, 22 Apr 2023 09:35:01 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-63b73203e0aso18707440b3a.1
 for <buildroot@buildroot.org>; Sat, 22 Apr 2023 02:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682156101; x=1684748101;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OSGxoJ+Bb+REiYV9kd9hAjNwT1xvd6OKQkDA2wxV72w=;
 b=LJ9amARxVFwVxC4nsc8IxsQkyz/NgnzZI+t9mP977FXKxew4cAb5rNVajKqsZNIzrT
 yQ5lSsk7feY293BQWljLBt7gHdb8TsF5GM7UXAKteElykbMD5q78TRlsnFN8f7gJRz1m
 2nMI0D2scZD8oX6VvWb2U/BoG1EOgAkC7Shd/rBBmsA6FXI7vX53E1u4XgKehU8b/kUP
 T04ZYbBoHXpiPA4vd7LKBKFTyThfJEtFN/poN2Gh0rFI1WNVZ06dDCqzZ3mJbyw9mMhe
 Ci0BXTVhUJmTU25R1MfzoN0E3etQoHfj6w0Ia+t8VBJHQ1O6UQRFR1RAniVy5QQRo5/f
 07kQ==
X-Gm-Message-State: AAQBX9eJ9XI+c4ZsZNPPxBdkSiRf6tO3B7m4LV4y7rX1RdvnkvssRdrM
 n3/wNDRm5hO6Rha6EpSAJhzN4pEI9yc3Fw==
X-Google-Smtp-Source: AKy350YpFWVm9Z+b/yZD9HmMnPa/W2cR1c+cAREJbsIPyaKwe5zo9h1z/uiynd6j3nrmSstU9uhgjA==
X-Received: by 2002:a17:902:d2c3:b0:1a6:3def:5ff6 with SMTP id
 n3-20020a170902d2c300b001a63def5ff6mr9923856plc.4.1682156100867; 
 Sat, 22 Apr 2023 02:35:00 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 j17-20020a170902759100b001a6e3e3dbc3sm3739849pll.22.2023.04.22.02.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 02:35:00 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 22 Apr 2023 02:34:58 -0700
Message-Id: <20230422093458.46975-1-christian@aperture.us>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] DEVELOPERS: update email address
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch updates my email address in the DEVELOPERS file.

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5cd882b579..d9e95a3d05 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -538,7 +538,7 @@ F:	package/syslog-ng/
 N:	Christian Kellermann <christian.kellermann@solectrix.de>
 F:	package/python-pylibftdi/
 
-N:	Christian Stewart <christian@paral.in>
+N:	Christian Stewart <christian@aperture.us>
 F:	package/balena-engine/
 F:	package/batman-adv/
 F:	package/catatonit/
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
