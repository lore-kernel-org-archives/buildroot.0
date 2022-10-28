Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E17C38A02
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 21:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB81D415A4;
	Fri, 28 Oct 2022 21:02:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB81D415A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id peI3gEqIdVfW; Fri, 28 Oct 2022 21:02:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8BE94159F;
	Fri, 28 Oct 2022 21:02:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8BE94159F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 55F7E1BF379
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 21:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38C834157D
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 21:02:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38C834157D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WlzYbuktbEzt for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 21:02:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00BF04157A
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00BF04157A
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 21:02:52 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id k8so8126866wrh.1
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 14:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g+L2zVH3b+3OIF+vk/5VKPhJe6v4D/NSuK43xky524A=;
 b=GxFc2KX7AZpozyOTzSYFrzhTtQeQw3Fbw7bfXVY0NDKQ+RGVAOJ9F34h1tqNdRQv9l
 VhnO/KnVgc/jpE97pipMfOOHODJIVJfBHMejPDReqzTSUk5NChnHtE7ZIMUjqetZnQI1
 bG4sBSkdLor6K3PlNw5LBePvtN9Deb19Vhef5fDPHSppjufSoxOdbVe9fGkLedaDpQp5
 dRYaPAa/2Bx4BBDQsNlYQQyRULJKaWpQgZIdEwoLbeoRZRTjlFm82t6D6yyAAg4eO5H4
 y+MUbtZD5gVMPVJE8PZKOTH+tp9IITrrk89LXjh/1Njc2baMao6XGcx/r5wKUGosSFQC
 wscA==
X-Gm-Message-State: ACrzQf1dFHzj+lnuescgb+71dvUekcgYa3t68EqEy6Ev48D2F1KGyjpo
 66euGMohZZG5vG9XTP4R9+Qcz1/bIfs=
X-Google-Smtp-Source: AMsMyM711zyNKAP+sp80PU1RD+XMvuIcJXKY7UoGGOJg2x0qoto1IdiLpM83/dKJHNflLsTcvxeKkg==
X-Received: by 2002:adf:e44f:0:b0:236:59a3:c5a8 with SMTP id
 t15-20020adfe44f000000b0023659a3c5a8mr688441wrm.396.1666990970553; 
 Fri, 28 Oct 2022 14:02:50 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 f13-20020adff8cd000000b00228692033dcsm4410049wrq.91.2022.10.28.14.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 14:02:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 23:02:45 +0200
Message-Id: <20221028210245.41609-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g+L2zVH3b+3OIF+vk/5VKPhJe6v4D/NSuK43xky524A=;
 b=FaB5a8Dw8SmTSo68mLcST8jdW08CaKgRbv6KUsp9OSJk4MfUncL7EBVxBvUMaZK33d
 JEsEfsXLOIOub7oMZdPlViuDXWvjBnUyPsLmJTV7s+3qquBrOvfmJICIiALwv0oNYixI
 pQ2JD/swUTifFqIjY9loO4IdEyOha7IbGhcyW1Reume+O4FDzg7gpWkblViwF42hP2Xr
 IlzqHSdCIJNnBopvqRolYkLFX4ucE2+lADCkqneP1Cx61QNbS0dQpe+YCKgyQz90jynm
 tQsf3y77K9roFJILEzGOBUzPdBd/2nIGPDm0+6eccCbkh9yt8Tc/uGBIFx3vfArK6W+t
 k0lw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FaB5a8Dw
Subject: [Buildroot] [PATCH 1/1] package/pinentry: bump to version 1.2.1
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

https://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=blob;f=NEWS;h=c080b34e57d01a6ccca9d2996d7096c42b1a3f84

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pinentry/pinentry.hash | 4 ++--
 package/pinentry/pinentry.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pinentry/pinentry.hash b/package/pinentry/pinentry.hash
index e5f3d90652..187c86f9bd 100644
--- a/package/pinentry/pinentry.hash
+++ b/package/pinentry/pinentry.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  b8b88cab4fd844e3616d55aeba8f084f2b98fb0f  pinentry-1.1.1.tar.bz2
+sha1  29daaf45f15cb5b8ec9b4a06284343f7a87082fb  pinentry-1.2.1.tar.bz2
 # Locally computed
-sha256  cd12a064013ed18e2ee8475e669b9f58db1b225a0144debdb85a68cecddba57f  pinentry-1.1.1.tar.bz2
+sha256  457a185e5a85238fb945a955dc6352ab962dc8b48720b62fc9fa48c7540a4067  pinentry-1.2.1.tar.bz2
 sha256  67f82e045cf7acfef853ea0f426575a8359161a0a325e19f02b529a87c4b6c34  COPYING
diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index 5a1519479c..26b55b1366 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PINENTRY_VERSION = 1.1.1
+PINENTRY_VERSION = 1.2.1
 PINENTRY_SOURCE = pinentry-$(PINENTRY_VERSION).tar.bz2
 PINENTRY_SITE = https://www.gnupg.org/ftp/gcrypt/pinentry
 PINENTRY_LICENSE = GPL-2.0+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
