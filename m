Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99219ECAAA1
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 09:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25D9141820;
	Thu, 15 Sep 2022 09:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25D9141820
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KRhBHP0KqLOU; Thu, 15 Sep 2022 09:48:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3383416F8;
	Thu, 15 Sep 2022 09:48:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3383416F8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EDB351C11A0
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 09:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C35A441053
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 09:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C35A441053
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lSSOFg0h4e_k for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 09:47:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E505C40133
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 09:47:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E505C40133
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D417683C4D; Thu, 15 Sep 2022 09:47:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 Sep 2022 11:44:33 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: e41c102b57339bdb6f98ff27086a0b3b3d57de1a
X-Git-Newrev: 55f2627f2d4e65bda1f28a791d5d3a6064b3b8c9
X-Patchwork-Hint: ignore
Message-Id: <20220915094747.D417683C4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] paclage/ace: explain why
 we use C++ pre-processor flags for C++ flags
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

commit: https://git.buildroot.net/buildroot/commit/?id=55f2627f2d4e65bda1f28a791d5d3a6064b3b8c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Commit e8011a08b6fd (package/ace: needs C++11) did not explain why it
passed C++ flags via the pre-processor flags rather than as C++ flags
(via ACE's CCFLAGS).

This caused some head-scratching when reviewing and applying
803247337d35 (package/ace: fix build failure due to gcc bug 101915).

Add a comment to try and explain the non-standard use of pre-processor
flags to pass actual C++ flags.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc; Weber, Matthew L Collins <Matthew.Weber@collins.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
(cherry picked from commit b717880f1fb7728648a2426dc20c3985fa3c530b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ace/ace.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ace/ace.mk b/package/ace/ace.mk
index e67e597bbe..3f7fe5e994 100644
--- a/package/ace/ace.mk
+++ b/package/ace/ace.mk
@@ -23,6 +23,9 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_101915),y)
 ACE_CPPFLAGS += -O0
 endif
 
+# ACE uses DEFFLAGS as C++ pre-processor flags, and CCFLAGS as the C++ flags.
+# Ace passes the pre-processor flags after the C++ flags, so we pass our
+# C++ flags as pre-processor flags, via DEFFLAGS.
 ACE_MAKE_OPTS = \
 	ACE_ROOT="$(@D)" \
 	DEFFLAGS="$(ACE_CPPFLAGS)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
