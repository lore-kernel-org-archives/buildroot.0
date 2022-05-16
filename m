Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE596C433EF
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 21:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B944418FF;
	Mon, 16 May 2022 21:30:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jqq6-sPvgyeB; Mon, 16 May 2022 21:30:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F2F7418D3;
	Mon, 16 May 2022 21:30:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D76451BF35A
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 21:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4B714034B
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 21:30:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vQ5WKgIfTByZ for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 21:30:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B657040B90
 for <buildroot@buildroot.org>; Mon, 16 May 2022 21:30:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B26EE85E3D; Mon, 16 May 2022 21:19:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 16 May 2022 23:28:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe6dc835e0581f82c570460903054d5b7d379cd2
X-Git-Newrev: 9690c141f6f6644a5b92e950ac3b2a3c7fdd230b
X-Patchwork-Hint: ignore
Message-Id: <20220516211903.B26EE85E3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5base: enable ccache via
 configure option
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

commit: https://git.buildroot.net/buildroot/commit/?id=9690c141f6f6644a5b92e950ac3b2a3c7fdd230b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This should be cleaner than editing mkspecs/common/g++-base.conf.

This should be more reliable with qt5webengine gn build system.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Peter: Leave in QMAKE_{CC,CXX} override to ensure HOST{CC,CXX} is used]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/qt5base.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 0c811b3ac1..926d6a307a 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -318,9 +318,14 @@ endef
 endif
 
 # This allows to use ccache when available
+ifeq ($(BR2_CCACHE),y)
+QT5BASE_CONFIGURE_OPTS += -ccache
+endif
+
+# Ensure HOSTCC/CXX is used
 define QT5BASE_CONFIGURE_HOSTCC
-	$(SED) 's,^QMAKE_CC\s*=.*,QMAKE_CC = $(HOSTCC),' $(@D)/mkspecs/common/g++-base.conf
-	$(SED) 's,^QMAKE_CXX\s*=.*,QMAKE_CXX = $(HOSTCXX),' $(@D)/mkspecs/common/g++-base.conf
+	$(SED) 's,^QMAKE_CC\s*=.*,QMAKE_CC = $(HOSTCC_NOCCACHE),' $(@D)/mkspecs/common/g++-base.conf
+	$(SED) 's,^QMAKE_CXX\s*=.*,QMAKE_CXX = $(HOSTCXX_NOCCACHE),' $(@D)/mkspecs/common/g++-base.conf
 endef
 
 # Must be last so can override all options set by Buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
