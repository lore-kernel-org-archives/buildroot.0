Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9357C433EF
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 10:22:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55F7A60F39
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 10:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 55F7A60F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A5944022A;
	Sat,  6 Nov 2021 10:22:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RQ6zeLgsBz_3; Sat,  6 Nov 2021 10:22:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DE52400CC;
	Sat,  6 Nov 2021 10:22:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1EFDB1BF476
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 10:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D724401A3
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 10:22:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MATbiyFEmbsZ for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 10:22:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3EDC2400CC
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 10:22:05 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 a20-20020a1c7f14000000b003231d13ee3cso11312269wmd.3
 for <buildroot@buildroot.org>; Sat, 06 Nov 2021 03:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JqieS2vzBPWbjgMNn23y0su1Y7rGT/hlTU5VWzSFmgw=;
 b=YUTfkFpMytvkjcLhfeLVsuePWzfpFgdOfAtTJQsPKMU4DHB/WcCOCB/8FGFTddE7R1
 S/UpSsF7wU2lvBhkvUCZMWMIqjkqjmgoCMz8WYhzstL9EO5mmR0F9CM1Q0J2/JgHqjbi
 mwLBnkcRdqxU0P4IcRbKjMR9vIrqDBekqBWc6JT7GWbredhki13ZiA8+kZgGxzw9hU9L
 1VRFiy9KWygsPq36Ko5XG4cotz2lwcFDz1QTBFKuUKcWVdMkp9MgW8lcIMFj4PgZCalo
 VCXAJBGAenV5NgX3/VDmnRlv2Rd0Wto05v9XkNxyWLgS5ZALUWd28Fr/N1fdGDVvBia+
 WBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JqieS2vzBPWbjgMNn23y0su1Y7rGT/hlTU5VWzSFmgw=;
 b=zH/jobv3zos3ZqdTW8OBnxmdS1FYfGK6cnPWtojigp955mw35KDEgbDcXZt56/Tdam
 O8xI6UOOtzP7I5/nq5hNy+lF4aGcsEfRSN7BLjd1rR4YYp3yxbrPYr6DPY1IcS8yPpK2
 yAYdVhwtRhqwoAqK9yjZw16PHDmA2ffrb4+eaa5KVcMCGmOd0PT9N8CHLM5Ley7iEVc/
 vTqGaCe8s2qMOUm3D47sh48jmEjbc8P1IIljoIK3//cPewWrMqdTWV/Vdxc77iuME5jp
 z8Wb621O9sspX+C4wJ0Pi6xHN3zn50YYMOZPUcY0t6KA3uj67Gw6QonyznUPFqJgjdhA
 vGKg==
X-Gm-Message-State: AOAM532Lv9976VaWhdbvfv1rVw2lgp0Ea7W3PU8Sh62p4RBcDJNfEbgP
 wFmGRHoXV0Gk657JJhWhYFb4wNDm6WM=
X-Google-Smtp-Source: ABdhPJw2z5hbBgm++tf0rRa/81vAirVSJ4uvxtzjLByTb0O0UkYtkhyPvb2xi2IY+2L5fgUhjIZLuw==
X-Received: by 2002:a05:600c:3586:: with SMTP id
 p6mr31764437wmq.34.1636194123222; 
 Sat, 06 Nov 2021 03:22:03 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id m14sm1392523wrp.28.2021.11.06.03.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 03:22:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Nov 2021 11:20:15 +0100
Message-Id: <20211106102015.2814008-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pipewire: drop dbus from Config.in
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit d9796f2db9866060b916487784b046bb6b76f9b6 forgot to removed dbus
from Config.in

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pipewire/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
index 506b85e856..1f48a4b50f 100644
--- a/package/pipewire/Config.in
+++ b/package/pipewire/Config.in
@@ -1,11 +1,10 @@
 config BR2_PACKAGE_PIPEWIRE
 	bool "pipewire"
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
-	depends on BR2_USE_MMU # dbus
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO if BR2_PACKAGE_BLUEZ5_UTILS # runtime
-	select BR2_PACKAGE_DBUS
 	help
 	  PipeWire is a server and user space API to deal with
 	  multimedia pipelines.
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
