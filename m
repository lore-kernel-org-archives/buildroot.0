Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95350C433FE
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 23:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F0C2408C3;
	Sat, 15 Oct 2022 23:06:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F0C2408C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m3mPUqTTpq2b; Sat, 15 Oct 2022 23:06:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FB2A40533;
	Sat, 15 Oct 2022 23:06:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FB2A40533
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 188091BF3FF
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 23:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D88C981403
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 23:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D88C981403
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e06MbfBS6xLt for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 23:05:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0819D81911
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0819D81911
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 23:05:44 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id p16so6567125iod.6
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 16:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d/YyctslH6tnl3olOKy89p5LjxpKSGr1FgEgztJQgsk=;
 b=K9UUKwRTHN6HZWQKDy6fIAr5n7yOV+1mogCJg1p4Qob6u0CUbRvyKCqEWm94fcYhPd
 pc0lxPltUEjusXvMQSBQSPNsl7IPd7pjnnlXY8j+e3CdA828y2ddu3itET6Us44ifUL5
 oiQUXLw/hBFZrLFwl66cprJfHwxoNljJuSvyIB/wiackACdXcdCOMJE6A6AFkLq4F9fF
 Ndf+o6/v6NO4R7RnRNxZ6QKt6QlDORUA1ExkUeH55rIrk4D8HHtnAHp90aw8Hl9b8CJJ
 t3y2AGKEENp6xe25I04tXeSLDLIkWvxBcDiSamJEJ5qlxiAUPWvDAMTBiKNuOFGmAXYO
 cDwg==
X-Gm-Message-State: ACrzQf00NNkp6QvAsdRq28BWSG8+cLbf9wUELAKqNrA2PLHAAPVqqfnA
 XVqoirbhcMsXjJeHeJKdHo9Hr3uzfPVJIQ==
X-Google-Smtp-Source: AMsMyM4u551ac7jcyrWqVo6R1LFXXv9oNoTsbSG1tkIqis/c4sAeQMUZrcFBTQQn3jI47C+fKDMdAg==
X-Received: by 2002:a5e:a602:0:b0:6bb:ed93:5b63 with SMTP id
 q2-20020a5ea602000000b006bbed935b63mr1776883ioi.88.1665875143737; 
 Sat, 15 Oct 2022 16:05:43 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 186-20020a021dc3000000b00363e61908bfsm2718163jaj.10.2022.10.15.16.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 16:05:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 17:05:29 -0600
Message-Id: <20221015230534.4016536-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221015230534.4016536-1-james.hilliard1@gmail.com>
References: <20221015230534.4016536-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d/YyctslH6tnl3olOKy89p5LjxpKSGr1FgEgztJQgsk=;
 b=Ymkh0/dHz+XdmCouEYMfS3/kIH7v4IKetcuq2no9KXrvRf+tbGgCf0hArwcWQW9CeQ
 SOMZSEs6S33ScUsn4F9WBjQgr2+JogvSGiJwMMWxwHFdyhX7me55OtTHjZHljyvA6cir
 hRj15too4gN8CQX/VkxpuHfk4hgQCItJ5lItq5ResMvHERfSnLHomznZpi44BU56I1Mj
 +00mY7PPGO6JLgRqLXiqXpqucjDVm6H6Y/W6kX3uAcJIIwj9J//xK00LNFMH3bCRJ+up
 bBjHDgMQHD4+UKjkftZqO3yZdDwTK41AXwAZNw6TZCc3H97ZaJJwF7Bk1tdxo0tQtDRV
 N3ZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Ymkh0/dH
Subject: [Buildroot] [PATCH 07/12] package/gst1-libav: bump version to 1.20.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gstreamer1/gst1-libav/gst1-libav.hash | 4 ++--
 package/gstreamer1/gst1-libav/gst1-libav.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index 1b86e82b93..78f5b5bb07 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.20.3.tar.xz.sha256sum
-sha256  3fedd10560fcdfaa1b6462cbf79a38c4e7b57d7f390359393fc0cef6dbf27dfe  gst-libav-1.20.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.20.4.tar.xz.sha256sum
+sha256  04ccbdd58fb31dd94098da599209834a0e7661638c5703381dd0a862c56fc532  gst-libav-1.20.4.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 80545fdd4c..a867af5147 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.20.3
+GST1_LIBAV_VERSION = 1.20.4
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
