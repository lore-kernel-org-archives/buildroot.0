Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20B2C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Jun 2022 16:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 388B8612B3;
	Fri, 10 Jun 2022 16:57:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uambJcHelWAu; Fri, 10 Jun 2022 16:57:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63F50612AD;
	Fri, 10 Jun 2022 16:57:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5434F1BF358
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 16:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41EFD84444
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 16:57:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s37uCJsjvKuo for <buildroot@lists.busybox.net>;
 Fri, 10 Jun 2022 16:57:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B2FB843BB
 for <buildroot@busybox.net>; Fri, 10 Jun 2022 16:57:00 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id c21so4203594wrb.1
 for <buildroot@busybox.net>; Fri, 10 Jun 2022 09:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=olR01nGqMIyAE0SiQ4yNOmo8EMuk0Gx2+ZOaOx7j2AE=;
 b=EyPKDXPx9n/Xi1CRnm0RMwTcCY3pcycDADF6fo6pgGx9Cv+aKF7w6Zq2//GvvWD3ca
 HuJFYlS30C+k1yOhy/qjjDmw5fqIXmnGtDW+TtxZOgOsac+dpW8axlnINyWr7lvvUmys
 LlpniYzFU/EIdON0vWUY/EZrnIqqZGziJxll/svVRTS79LbGfcbtuWbe8lSdqwg8C75u
 lqAF6lpIaYroz96Z2HexFFr5ICOKpNj97fNJLuFk917U8liFXK3IsyYMup9KBPu9yIxe
 5VsbqL8MKUINTOvXY9KIgWeZTTvrJfmDF8BueWI0b6vpUd/oFxGjEeeuEXTvNh0roWo6
 NBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=olR01nGqMIyAE0SiQ4yNOmo8EMuk0Gx2+ZOaOx7j2AE=;
 b=r07iZgHFXCe+54SuE+OHZguw614nCaD4zwAq9dxO4vxIBLnOaOMD2NkHDa7vF56evD
 DKEg1VBp7TAMl+0KEkQyv4rFcZl+mPYMc54hWANKJcHv7ISWR/imq9GTnbqCsLJPsip5
 xUnDbW2olTZNwhnnZNpEAAdJtJVBOl2HAjdzCZwaJYVM/u7aYx2irsjIRb/HxGLTDewK
 4KFUaD7XK4HyseJkFtIgq3esr2AmWZaNMBchk0kGCr3dSGxCsE1EU/8qhwsQlLzxURK6
 +pLX7diiZsA0FnrLagNMVQIGBwmOBTrq5XDKA1KrrE/fz332HhsASDDf5w3d/cC/14Fr
 UmNQ==
X-Gm-Message-State: AOAM5326tASnp6aPn7JnAAHmH2Mxy8X+5/dp2yKLwdgl5a9hhvMLmi4R
 y5534HuwYi63xSVcKOlq+Rwa7vbyUy5ZCg==
X-Google-Smtp-Source: ABdhPJwnswg0LkhkkY1VX87VQlvSKggQx4GN5Q8NiXBuIEZdWaFionQ0+Z/7l8me1U47Ru0h5CY8Lg==
X-Received: by 2002:a05:6000:108b:b0:213:abed:50fe with SMTP id
 y11-20020a056000108b00b00213abed50femr43138771wrw.425.1654880218519; 
 Fri, 10 Jun 2022 09:56:58 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 z14-20020adfd0ce000000b00215bd1680a8sm20839480wrh.79.2022.06.10.09.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:56:57 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 10 Jun 2022 18:56:54 +0200
Message-Id: <20220610165654.2574448-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/iptables: bump to version 1.8.8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/iptables/iptables.hash | 2 +-
 package/iptables/iptables.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iptables/iptables.hash b/package/iptables/iptables.hash
index 7f1441393..f4e5ae159 100644
--- a/package/iptables/iptables.hash
+++ b/package/iptables/iptables.hash
@@ -1,4 +1,4 @@
 # From https://netfilter.org/projects/iptables/downloads.html
-sha256  c109c96bb04998cd44156622d36f8e04b140701ec60531a10668cfdff5e8d8f0  iptables-1.8.7.tar.bz2
+sha256  71c75889dc710676631553eb1511da0177bbaaf1b551265b912d236c3f51859f  iptables-1.8.8.tar.bz2
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 555bb384f..a54194a8c 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPTABLES_VERSION = 1.8.7
+IPTABLES_VERSION = 1.8.8
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = https://netfilter.org/projects/iptables/files
 IPTABLES_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
