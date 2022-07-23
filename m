Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59701C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 21:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E98734169A;
	Sat, 23 Jul 2022 21:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E98734169A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jaWu6TQfKBmP; Sat, 23 Jul 2022 21:14:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00C3A408C0;
	Sat, 23 Jul 2022 21:14:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00C3A408C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB3011BF419
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 21:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DB5B408C0
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 21:14:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DB5B408C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E1cKC5J9_Aiz for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 21:14:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB4164049B
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB4164049B
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 21:14:11 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id b26so10892850wrc.2
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 14:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ixg3AK4JYcl6HevQ2Uaa1AvkcsHUWlc/9+WHUOvzGSU=;
 b=22r/ASYPl4wu918vxAhzsk0SPxXR/BTbrdcd+KAxhILZKIqrguhH0VnFlHWBTkxczw
 sT3WpdJAlMAFh18z+IIbEnEfDEKWM0mlfqcyVDpshl/p0Qx4epvLyOlPsRpm3Tjbz8h6
 sXYS1AcF+CABzG79efWIbvyDpPR04JgZjSAT/KA3ruK9YgvuETYfiwujME6K/2iPb6yu
 qTcHRlAnqp5kAlrxa7kYtfYCAc4ZmaU7yCFiktlxKu8TO2fnZhXp3EA1PuQpMCnz2pOZ
 nyKNmR8H/gweAopLHC4QRCIuS8V+lhjG8bwp2OumAQWoBqV+RC2WAGH2dQChDwml2Uyw
 7VLA==
X-Gm-Message-State: AJIora9JTIFmnaT9pEtK3+6Zfddy8pQh9hBLGsRWVuxtIrq/OjsQjSD/
 WouIcQewbhdDP9CcjGxhLq1YnL9EMew=
X-Google-Smtp-Source: AGRyM1t8J1IurDE9BKQQ55RNVmDFA/el1YRpPcRNqYIRbKjwnxq1H2CHjbXGjYl5Ztig8bvs6WtFGA==
X-Received: by 2002:adf:fbc3:0:b0:21e:660c:d01c with SMTP id
 d3-20020adffbc3000000b0021e660cd01cmr3643937wrs.137.1658610849571; 
 Sat, 23 Jul 2022 14:14:09 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a5d498b000000b0021e42e7c7dbsm8040205wrq.83.2022.07.23.14.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 14:14:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 23:14:03 +0200
Message-Id: <20220723211404.487090-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ixg3AK4JYcl6HevQ2Uaa1AvkcsHUWlc/9+WHUOvzGSU=;
 b=Cng9qQG8M0w0ZkmhJv6A7pRwS/VizxCEePyPGuNwiwZELNUm/GOtyp54EOyEAlMp77
 x8sG3T+RD7rVW+FgJXD0S4QiyyGSlJ3RwjR3ncRyIL0rRMDkONAiEFmj8WdiQsfmbkkH
 MkFTYsID+jTxD/FrV04odalstPOH8ToNkGMIKrHWhdLY3JIYWFveIieuJbp29nkdcDkN
 Y5zPZ3M1dqR734eBgIeVeMeJ/cyfe19AWrS4ZsZb01ghamgCIR1YyCxJFgvGN2yNlp4Q
 Xizen/bvQ/RjsCdvx4Y2B25gyx70aA0P9buGverZIbEnW3VNlpXO/u6+km4cFg/PdzCP
 kpmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Cng9qQG8
Subject: [Buildroot] [PATCH 1/2] package/hackrf: drop unrecognized option
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

Drop BUILD_HACKRF_TOOLS which has never been recognized since the
addition of the package in commit
29b7cc88f401dcc69a085be5af067851f896da58

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hackrf/hackrf.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/hackrf/hackrf.mk b/package/hackrf/hackrf.mk
index d80f87e6b9..6d694f5fbc 100644
--- a/package/hackrf/hackrf.mk
+++ b/package/hackrf/hackrf.mk
@@ -13,8 +13,6 @@ HACKRF_DEPENDENCIES = fftw-single libusb
 HACKRF_SUBDIR = host
 HACKRF_INSTALL_STAGING = YES
 
-HACKRF_CONF_OPTS += -DBUILD_HACKRF_TOOLS=ON
-
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 HACKRF_CONF_OPTS += \
 	-DINSTALL_UDEV_RULES=ON \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
