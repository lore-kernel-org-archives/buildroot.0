Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A72FC433FE
	for <buildroot@archiver.kernel.org>; Fri, 11 Nov 2022 21:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A43840017;
	Fri, 11 Nov 2022 21:58:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A43840017
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Amt520z1rlP; Fri, 11 Nov 2022 21:58:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E14BD4184F;
	Fri, 11 Nov 2022 21:58:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E14BD4184F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DFC5E1BF589
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 21:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA88C60B44
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 21:58:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA88C60B44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KAMmjiCrrvFB for <buildroot@lists.busybox.net>;
 Fri, 11 Nov 2022 21:58:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AF3D60B55
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4AF3D60B55
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 21:58:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 2DF3D20003;
 Fri, 11 Nov 2022 21:58:04 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Fri, 11 Nov 2022 22:57:59 +0100
Message-Id: <20221111215759.358116-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221111215759.358116-1-thomas.petazzoni@bootlin.com>
References: <20221111215759.358116-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668203884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FRXz8HOc1yjqFFrHnKAdaNG4WXOd79ACLWQDN+AaBX4=;
 b=Cvs5UhW+u+TvAaMH4xgwUU8/gJwFsN1+82ZpJ8B+vHlLY4LcTy/tuToDMQUbvF+yoOER7S
 u/QxPPAb1p56O6CMAhdUGVT5DddE6wyvU/0e+gDKEXSIPQUHcPu/qUWpyuudp1ClCWHufB
 0or3sOv79AxIHGb/r5QEnrYTI7HIc9/M0aLKZXlZ1ijnnd9BODWilakAcKqbAG8cTy6cw8
 MEKCLNUL+RWjYISTShpYJzNG2yDCYhoc5CDgs73dtOvpfn7ohSKIU9ChnnjOCZO8gv4Vno
 l0ipWByLWhnu40tfZmFfztJ1XFkJ28hc5So54uWXW1UK2GdmLXSdvvZ+m2dbcw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Cvs5UhW+
Subject: [Buildroot] [PATCH 2/2] utils/genrandconfig: disallow configs with
 BR2_XTENSA_CUSTOM=y
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When BR2_XTENSA_CUSTOM=y is used with the internal toolchain, an
overlay file is mandatory, which genrandconfig can't provide. So we
simply disallow such configurations.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index f19a405685..9c6c2b359c 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -304,6 +304,11 @@ def fixup_config(sysinfo, configfile):
     # No C library for internal toolchain
     if 'BR2_TOOLCHAIN_BUILDROOT_NONE=y' in configlines:
         return False
+    # Xtensa custom cores require an overlay file with internal
+    # toolchains
+    if 'BR2_XTENSA_CUSTOM=y' in configlines and \
+       'BR2_TOOLCHAIN_BUILDROOT=y' in configlines:
+        return False
 
     if 'BR2_PACKAGE_AUFS_UTIL=y\n' in configlines and \
        'BR2_PACKAGE_AUFS_UTIL_VERSION=""\n' in configlines:
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
