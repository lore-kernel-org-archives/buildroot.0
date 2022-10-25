Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BEDC04A95
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 14:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32A9340443;
	Tue, 25 Oct 2022 14:29:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32A9340443
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id abgiOWtGnkfU; Tue, 25 Oct 2022 14:29:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FAB440235;
	Tue, 25 Oct 2022 14:29:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FAB440235
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 60BAD1BF976
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 14:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4965160687
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 14:29:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4965160687
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0MUfhqF3vtfs for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 14:29:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFC6660615
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DFC6660615
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 14:29:32 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id l127so10415749iof.12
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 07:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M8zzTIC+R4ai2F2tliIXmx1UvqvzLNGcv5ArhSe5YUI=;
 b=fPT4SgOutSSA6hOiT5Ad70bRVPz3KHMjGjdO0ko3irqLIuGzhzeenvOMtWaztPpinq
 CXxA89aYT95GPwlvOB51lzhXokRCgzZS/ntLDxD7bIt4oQwv2CIzGnzjbPsvMiHy4sxw
 mry5LirVZLiDQ8MushkLzthB4e7VPbsyIVaMZlbTY2Ut3chOx6lypP+ha8aBUuxnflgD
 bu7XdjgON/+Z9wNga/ppMVWtfwoWiBvDH+wNg4mZcj8wKiTwlZRTxCEz9J8HaJAGlMOf
 Y5se6BsFMdvFx3mh6LFhbBKO5lP7Odhdc1UXSy9i3DfOd7TtQY5CCdXbTTMFSAvO9X+K
 1kSA==
X-Gm-Message-State: ACrzQf3BEdSrDQEUKUFWlzmVAyvClDqdKOnLVtzYOprDjzoZLHGLfz27
 CkAVtc8cJyn6lPzd6DWYpxV1YJLdtZzwWQ==
X-Google-Smtp-Source: AMsMyM4WUCuG3Bq1+CEM+E9DEqyU97iWHT1I7n2FqIerrQo1D+VqhLubE17KLZpGoVVQ4/bDdqr/2g==
X-Received: by 2002:a05:6602:3409:b0:6bc:698c:cfca with SMTP id
 n9-20020a056602340900b006bc698ccfcamr21039199ioz.98.1666708171645; 
 Tue, 25 Oct 2022 07:29:31 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 o127-20020a022285000000b00374fa30a0d3sm951105jao.143.2022.10.25.07.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 07:29:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Oct 2022 08:29:29 -0600
Message-Id: <20221025142929.3089316-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M8zzTIC+R4ai2F2tliIXmx1UvqvzLNGcv5ArhSe5YUI=;
 b=D5uwNUhl20Jx6zJ+1SSOzNo5c7Ww17IuoYublG8tlzyHpS7+KSsQPPeO6DnZiW5smt
 JZ0M4ycqxki0y0kMUs/HcTKJl3EwkEMypOyQc21hFFzCbg8xj9Pd52y0JqkCGXBrVcY4
 pvv0FOF0mSoj7PqYXhuVuo+ZtaEgUAER/RSbXbmzUcAGT3NFE+0Ihhf1yQyub87eoVg1
 ciPqrGP5LKcVbtiuhtV6nPg8YMnvpYyhttlhPhi4a2lsTMm6Qfwdjce4ps/CfE39GvAj
 QlLDDXrYaOcVnbPhrNy2IIOGpGG7Hd430UALFYR0QGVgb9R06ECG77MyFf9ugAfqKYeZ
 tetQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=D5uwNUhl
Subject: [Buildroot] [PATCH 1/1] package/kmod: bump to version 30
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
 package/kmod/kmod.hash | 2 +-
 package/kmod/kmod.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kmod/kmod.hash b/package/kmod/kmod.hash
index c68e41f1b6..b181f73e9b 100644
--- a/package/kmod/kmod.hash
+++ b/package/kmod/kmod.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kmod/sha256sums.asc
-sha256  0b80eea7aa184ac6fd20cafa2a1fdf290ffecc70869a797079e2cc5c6225a52a  kmod-29.tar.xz
+sha256  f897dd72698dc6ac1ef03255cd0a5734ad932318e4adbaebc7338ef2f5202f9f  kmod-30.tar.xz
 
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  libkmod/COPYING
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 82e8597759..5d6d4408f9 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMOD_VERSION = 29
+KMOD_VERSION = 30
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
 KMOD_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
