Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DE5C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 08:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A5D840275;
	Sat,  4 Dec 2021 08:21:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cvbnDl_MMG7V; Sat,  4 Dec 2021 08:21:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CFF340146;
	Sat,  4 Dec 2021 08:21:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E9E601BF5E9
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 08:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E618F607A3
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 08:21:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dPredqwtECfQ for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 08:21:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41C8D60776
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 08:21:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 592D087FC7; Sat,  4 Dec 2021 08:16:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 09:20:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47f3f8a1c8311d32822fccab8c271001db65cf52
X-Git-Newrev: 2b397c22fc202407902c2b5880835ecabd2a6710
X-Patchwork-Hint: ignore
Message-Id: <20211204081632.592D087FC7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tinydtls: fix build with automake
 >= 1.16.4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2b397c22fc202407902c2b5880835ecabd2a6710
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Touch ar-lib as suggested by upstream in
https://github.com/eclipse/tinydtls/pull/103 and
https://github.com/eclipse/tinydtls/commit/5c6fd178e83cec7ccc40ac3ab13a15ce611da8a8
to avoid the following build failure since bump of automake to version
1.16.4 in commit fe90272b5128987ee7492fff950660e05324838d:

configure.ac: error: required file 'ar-lib' not found

Fixes:
 - http://autobuild.buildroot.org/results/fa23cdf0d454c2ad11af3cdcc2810cd442918667

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tinydtls/tinydtls.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/tinydtls/tinydtls.mk b/package/tinydtls/tinydtls.mk
index 6d839bc05a..bba9e5f6fa 100644
--- a/package/tinydtls/tinydtls.mk
+++ b/package/tinydtls/tinydtls.mk
@@ -16,4 +16,10 @@ TINYDTLS_AUTORECONF = YES
 # use inttypes.h data types instead of u_intXX_t for musl compatibility
 TINYDTLS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -DSHA2_USE_INTTYPES_H"
 
+# Fix build with automake >= 1.16.4
+define TINYDTLS_TOUCH_AR_LIB
+	touch $(@D)/ar-lib
+endef
+TINYDTLS_PRE_CONFIGURE_HOOKS += TINYDTLS_TOUCH_AR_LIB
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
