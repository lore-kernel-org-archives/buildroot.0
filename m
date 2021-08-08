Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA49C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:22:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D31460E93
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D31460E93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64AE8614CE;
	Thu, 26 Aug 2021 22:22:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0DHGgfdpiYAU; Thu, 26 Aug 2021 22:21:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D36F614E6;
	Thu, 26 Aug 2021 22:21:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 266391BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8291740790
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SzWG-zeoSTWP for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B457F40792
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 13A408DC52; Thu, 26 Aug 2021 22:01:28 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 22:35:55 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a364ebd7f0b87a02971cefb68c0fc98939dceef2
X-Git-Newrev: 2d991fd7b23f66e3a88c02177bf28d5587061ac8
X-Patchwork-Hint: ignore
Message-Id: <20210826220128.13A408DC52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt5/qt5base: fix
 libatomic handling to not affect host builds
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=2d991fd7b23f66e3a88c02177bf28d5587061ac8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

qt5declarative builds qmltyperegistrar for the host as part of its build
process.
When building qt target packages (which is the case for qt5declarative),
-spec devices/linux-buildroot-g++ is passed to qmake in QT5_QMAKE
variable and this spec currently has -latomic in its LIBS.

This -latomic makes it to the build of the host build of
qmltyperegistrar which is not useful.

This was discovered on Fedora 34 where libatomic is not pulled with gcc
package, therefore was missing on the host machine.

This makes sure that -latomic is not added for host build of qt
packages.

Fixes: 7d286be4f9 ("package/qt5base: link with -latomic when needed")

Cc: Quentin Schulz <foss@0leil.net>
Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5base/qt5base.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 8b55aa3098..9da3de468a 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -277,7 +277,7 @@ QT5BASE_ARCH_CONFIG_FILE = $(@D)/mkspecs/devices/linux-buildroot-g++/arch.conf
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 # Qt 5.8 needs atomics, which on various architectures are in -latomic
 define QT5BASE_CONFIGURE_ARCH_CONFIG
-	printf 'LIBS += -latomic\n' >$(QT5BASE_ARCH_CONFIG_FILE)
+	printf '!host_build { \n LIBS += -latomic\n }' >$(QT5BASE_ARCH_CONFIG_FILE)
 endef
 endif
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
