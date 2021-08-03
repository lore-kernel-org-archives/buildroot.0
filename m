Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10DB0C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 08:45:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1DD060F94
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 08:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1DD060F94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90A674034D;
	Tue,  3 Aug 2021 08:45:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NsLJVw7AfvGS; Tue,  3 Aug 2021 08:45:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0341D403A0;
	Tue,  3 Aug 2021 08:45:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF6CC1BF357
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 08:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF7D482B2F
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 08:45:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nHO40l2cDeX4 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 08:45:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E738D82AED
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 08:45:06 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id y1so240373iod.10
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 01:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YSxy94/pKDLQTqo+alzNixkaUW5PZBL4mkUD0BdP5IE=;
 b=bxB1EpLAi8VMo4oD/EFbZHMIb+n/YyxbrUCnztOmSz0IOO4sgfQS3VPqYqKM3B/uxb
 NGnpgIylxz4RecDhDz7OGmQ21IC7Zvhl92jC5tlkzeNT+2Vn5uGPm9LHEbS+JNh3Oaob
 VYcZxHTOsxkxQh/SuQhRDVuih0AxYKQipo0M14VFTmZebW3v+rPxvmws7vo00KdEHpWg
 /SA4YdGQTtsD354Hh6bdoNO7VEplZml0Yssv27fH7Lt3+EmVqthyiJMSGfs0fr6bioil
 Sqa38Iaz5A4CYzl5VetE1oezlvl9grjplqzuABsfLmMhl73hJ+cc1oi0Idv/TzPuhWJL
 DTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YSxy94/pKDLQTqo+alzNixkaUW5PZBL4mkUD0BdP5IE=;
 b=j89hKT7xkMHwtdwh/idhZj1YLNRD6UpVEY5CTb/fR/ChzoE/WpQDNjAA2YELuqNngn
 aFKXFV8Zk41ij7q2XPUYlQSLIqAPrTbRjwBIfDC/RKJaTyXFMsw42tun/2fPFdNdgnWV
 S4lwYIOX8CfEQNsR9lFzUnB9nN3aiSrr5avAvRZQFzMTUuMzQmveSaStm75XIUtqPe4y
 Cjj2mt4Dgl7hlGJIGiBlr2xeBCmlFaDAqe6T4OG7irDe/c9B8y5mnqXDImfQp6GiIsPl
 5gpVarK+N4Ym76TNU5b3yjnmXw1Hn0/ZcqhUdvixeMpOhSLvyYNOCIgKHOg7ftCceMJ+
 /4hg==
X-Gm-Message-State: AOAM5332idinHbZCkdlzRG3HUGVQXBZNyJUSnqWGCcs9LBsAcnmBJFS8
 SSW95BAQyauJzo9j6xR3Kt3SOEMatY0=
X-Google-Smtp-Source: ABdhPJwSWy9qh2KxAKjXHLKZbnJL0kZvdoSUHgdOGjaiz25ePSHmVGTSYBZMq0wRwghfzbG0nkA4Jw==
X-Received: by 2002:a5d:8596:: with SMTP id f22mr153200ioj.147.1627980305871; 
 Tue, 03 Aug 2021 01:45:05 -0700 (PDT)
Received: from james-x399.localdomain (97-118-178-184.hlrn.qwest.net.
 [97.118.178.184])
 by smtp.gmail.com with ESMTPSA id x10sm6577174ill.26.2021.08.03.01.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 01:45:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Aug 2021 02:45:03 -0600
Message-Id: <20210803084503.2445206-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pipewire: add libdrm dependency
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

The libcamera option requires libdrm, require and depend on it
when available for libcamera plugin.

Fixes:
 - http://autobuild.buildroot.net/results/e3bc1d9aa69af1d2cdeee7709df318fccbaa5476

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pipewire/pipewire.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index b316d482d9..2317398088 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -95,9 +95,9 @@ else
 PIPEWIRE_CONF_OPTS += -Dv4l2=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_LIBCAMERA)$(BR2_PACKAGE_HAS_UDEV),yy)
+ifeq ($(BR2_PACKAGE_LIBCAMERA)$(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_HAS_UDEV),yyy)
 PIPEWIRE_CONF_OPTS += -Dlibcamera=enabled
-PIPEWIRE_DEPENDENCIES += libcamera
+PIPEWIRE_DEPENDENCIES += libcamera libdrm
 else
 PIPEWIRE_CONF_OPTS += -Dlibcamera=disabled
 endif
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
