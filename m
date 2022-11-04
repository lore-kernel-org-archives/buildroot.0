Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28806C433FE
	for <buildroot@archiver.kernel.org>; Fri,  4 Nov 2022 15:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 730E940C10;
	Fri,  4 Nov 2022 15:12:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 730E940C10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lMxxSqJvC4hV; Fri,  4 Nov 2022 15:12:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B303540376;
	Fri,  4 Nov 2022 15:12:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B303540376
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A88E1BF281
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 15:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E42576111E
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 15:12:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E42576111E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E5skMdzWaE4F for <buildroot@lists.busybox.net>;
 Fri,  4 Nov 2022 15:12:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECE9B60B0F
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECE9B60B0F
 for <buildroot@buildroot.org>; Fri,  4 Nov 2022 15:12:44 +0000 (UTC)
Received: from vfazio2.xes-mad.com (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id D321E20731;
 Fri,  4 Nov 2022 10:12:43 -0500 (CDT)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Fri,  4 Nov 2022 10:12:42 -0500
Message-Id: <20221104151242.2735240-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1667574763; bh=9m/wfcwkSLpjCnVRnSOb3wcdy0zCKXpSm5G2gduRvqQ=;
 h=From:To:Cc:Subject:Date:From;
 b=qZ6Wb4KQ+8bthvmUqUWUQNyhEk35KixL7WtZ/wni2Vu2uduxWgdnK/VPfCpAW6kY/
 y5ysDXwc01g3AU0QP60mcwGg2fBudlkA3nwEq0EAeXNW7WVHy305qGSp4DcTKZumlg
 RsLat3PN5DFCk68C3ARbshuVfBf8pSsaBieLCDDE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com
 header.a=rsa-sha256 header.s=mail header.b=qZ6Wb4KQ
Subject: [Buildroot] [PATCH 1/1] package/swupdate: specify SWU_VER during
 build
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
Cc: Vincent Fazio <vfazio@xes-inc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The swupdate build process uses SWU_VER as part of the build commandline
for compiling objects to define the value for use in globals.h (see also
Makefile.flags).

This value is also used to communicate capabilities to lua handlers
(see upstream 0f38ff186e76c55c8d00ccb53739a29bcca91445).

When swupdate gets built, SWU_VER defaults to using `git describe` to
determine the version. This, unfortunately, picks up the version of the
Buildroot checkout and not the actual version of swupdate.

Now, specify SWU_VER as part of the make options to override the
calculated value so the proper version is reported.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 package/swupdate/swupdate.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index b2f50d2b71..2f618b2e79 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -209,6 +209,7 @@ SWUPDATE_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_SWUPDATE_CONFIG))
 SWUPDATE_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 
 SWUPDATE_MAKE_OPTS = \
+	SWU_VER="$(SWUPDATE_VERSION) (Buildroot $(BR2_VERSION_FULL))"
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	CONFIG_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
 	CONFIG_EXTRA_LDFLAGS="$(TARGET_LDFLAGS)"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
