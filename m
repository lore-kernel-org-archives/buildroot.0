Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4A5C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 09:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C1DC60A71;
	Tue,  5 Apr 2022 09:39:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pHCWuE1UKsqE; Tue,  5 Apr 2022 09:39:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D250D60D7B;
	Tue,  5 Apr 2022 09:39:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3508C1BF232
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 09:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B0EE40258
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 09:39:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wDHtdSpX7LBz for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 09:39:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D7C540238
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 09:39:17 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4187A10000C;
 Tue,  5 Apr 2022 09:39:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nbfeZ-008YML-Q9; Tue, 05 Apr 2022 11:39:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue,  5 Apr 2022 11:39:01 +0200
Message-Id: <20220405093902.2038437-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/opus: fix build with BR2_OPTIMIZE_FAST
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

Fixes:
http://autobuild.buildroot.net/results/194/1941e194e1f5ad0bc4982ad39c3e34d266bc49c6/

opus requires that it is configured with --enable-float-approx when
-ffast-math (BR2_OPTIMIZE_FAST) is used, otherwise it errors out at build
time:

celt/arch.h:198:2: error: #error Cannot build libopus with -ffast-math
unless FLOAT_APPROX is defined.  This could result in crashes on extreme
(e.g.  NaN) input

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opus/opus.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index 4f816df477..2fa929c7df 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -23,6 +23,10 @@ ifeq ($(BR2_PACKAGE_OPUS_FIXED_POINT),y)
 OPUS_CONF_OPTS += --enable-fixed-point
 endif
 
+ifeq ($(BR2_OPTIMIZE_FAST),y)
+OPUS_CONF_OPTS += --enable-float-approx
+endif
+
 # When we're on ARM, but we don't have ARM instructions (only
 # Thumb-2), disable the usage of assembly as it is not Thumb-ready.
 ifeq ($(BR2_arm)$(BR2_armeb):$(BR2_ARM_CPU_HAS_ARM),y:)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
