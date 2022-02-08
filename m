Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD67C433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 21:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65A868295A;
	Tue,  8 Feb 2022 21:26:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Coo61kT_QU3m; Tue,  8 Feb 2022 21:26:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A20858291A;
	Tue,  8 Feb 2022 21:26:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 741D51BF391
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24C59402AD
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:24:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RBMM_nbYd2z6 for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 21:24:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E30C640868
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 21:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644355448;
 bh=l7Qqo/UI3Ee0cH8B8/TAY5aRhe4KB/i1Q9P9N38xuXY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=I8lTXVEwi1zS/1Ey2SFVd9sHSzabEqaon+lcx1QC6rfnvb4f5MA78A+jnUJEo+NTS
 BLqfpdx47bYoUF+lbLchjTw4yiZLcj3JYvxeLq0eeWkeQWTjlrP3DSJ8OmB5g1RyNM
 NdS9PQbKA1uCh8zWUr7XvyCcp9qaVIIsgJg30vf0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.59]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBlxM-1nTfRU2MrE-00C8m9; Tue, 08
 Feb 2022 22:24:08 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue,  8 Feb 2022 22:24:02 +0100
Message-Id: <20220208212405.19243-11-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208212405.19243-1-ps.report@gmx.net>
References: <20220208212405.19243-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:jPa4inoZvDYDJ4myxzSfTGmK6MVSeTypmnBkIRGV7RU1WEF10oj
 boMfkls7HG7+qtqVIusKAY6Z594CqTrJcMD+vOrWsuR+m0884PjKHRU15BVi+QXVPx5HU1l
 X6FSoNRUzKUDN3JnGn7wSKg5b0nCWLhEgCC9TJP5op8JBv33QM6liE9bNHSKHbvCqFewAM7
 U89PHvZEGquDx2ckfM8Fg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vtZx22/BqxE=:BsI7gRJ+JfWkYlntfalrYZ
 4VEVUSvu/zCs15goGGnOtRllyoAMxA4zP+wDYVe+vS7VQK9+RwwWWKbBXCWd9ZsaAx7BZ9bzs
 IX7Ag2s4wG3kWwUBgdyEwrc3xJsE6Xtr5UeZ1vB2OfTlcL++HhtllVpBLefhvCbevPUqjsie0
 uwnJ0k1Js9k8uU5WSDw1cVMh4eosyou2HOiPAaQ5GnxOwguY7sHbQH+mhO5c/uTfDgZ/umj7Q
 6wWszhKElJ1Ani/xdnnAYZTYJXQZugdlZiq1UobSzArA0D4WdCRXTZ5DRLUOUSANJNLt+SKyr
 i/igR9I2/wo85WfL1hgkf5CfzECdIGl1V8imr/Ihbp2VgkrrVq4qWBsAyMLeRdnc+sUfatDTE
 ZSd2BMIRy9l3i2ukKILBcWAE0bRiNQovIdTlJhRx4k7FsMwvBx9BaNN+iN/czP7yz0zlNP8nf
 edF/BypmSwalPhZ4j3d9MBwPGLFDVfPW6mD4Y0qknto4LAX3mt6HI0KoehInM7RZo40WbxpEi
 mnviP4cj2zakA8EpXWbzu8nq7rKTMhWoUpw7quJCc46T2gvgU7SRf3REevxRorKFTmHONgrTw
 70ly5OpuRmSzb1Vi/7+6Pm5INzUm2VchDysZ65FFLJCxwyf1MIzOCcKNqKcbLMewJvy3uKcR8
 h0KRgzexAyuoB7vJX+seMNm2iDO0OnNCwlumxV7mPZhg7shd0Yh1P9uh0F4MSk77M7q1HXAC1
 YWDYEkTq8Fk1nArbwW8PmAs3DaA7E3Bz2gNdpsXGRUzG2fzEbQiaNQJx+dN2Y3zN57wc2g7WM
 upJwhmmeID69533kak7dCkNaLi5DARrl12PFI5kkEHTmb9vhCQF+F3r7dQrf7Emsku0atmKQt
 TxGj6lw/bpkKHh0GFeMO/FmDPzG0muMax6phisk+tDRvQcTdlYxI05+TzKdZw61RvnEvcQDIe
 3yGtHRiUcxod7mD5SRXC6MGCHELXWD9d+o36mfMcAja399ykQMaGr1Il57AyJgFlrIOI36e8O
 anEiSUC2zypjWiuZWDqsfhp/h/G4aqQxPdk+s3t70w5LSZZwlWLtO9aXx2kQBPF4PVEH2aO2i
 yjkdz+G2Cv30bQ=
Subject: [Buildroot] [PATCH v1 10/13] package/gstreamer1-editing-services:
 bump version to 1.20.0
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
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../gstreamer1-editing-services.hash                          | 4 ++--
 .../gstreamer1-editing-services.mk                            | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
index e29dc112ce..9662e6b8fb 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
@@ -1,5 +1,5 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.18.6.tar.xz.sha256sum
-sha256  fe10d14ef896aa21038317f6f81e1158ccc6caaed9b0d5a29ae5bdd63074582c  gst-editing-services-1.18.6.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.20.0.tar.xz.sha256sum
+sha256  f837adcf4073d19a5908984e879cd039f4192ca368e71d39e8ccd8a56b9feedf  gst-editing-services-1.20.0.tar.xz
 
 # Hashes for license files:
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
index a3722cbbca..5e03c08ae7 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_EDITING_SERVICES_VERSION = 1.18.6
+GSTREAMER1_EDITING_SERVICES_VERSION = 1.20.0
 GSTREAMER1_EDITING_SERVICES_SOURCE = gst-editing-services-$(GSTREAMER1_EDITING_SERVICES_VERSION).tar.xz
 GSTREAMER1_EDITING_SERVICES_SITE = https://gstreamer.freedesktop.org/src/gstreamer-editing-services
 GSTREAMER1_EDITING_SERVICES_LICENSE = LGPL-2.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
