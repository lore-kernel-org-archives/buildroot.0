Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5029EC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 13:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B12DB60BC8;
	Sun, 14 Aug 2022 13:33:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B12DB60BC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y9-4-iWDqpGC; Sun, 14 Aug 2022 13:33:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9CF460BB4;
	Sun, 14 Aug 2022 13:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9CF460BB4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D20AC1BF423
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 13:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC9FD408FE
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 13:33:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC9FD408FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b638EfhWD575 for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 13:33:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE949408A7
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 13:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE949408A7
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B8C9A874A0; Sun, 14 Aug 2022 13:19:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 15:29:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 803247337d35643afdca9718c4616500b9930f2d
X-Git-Newrev: b717880f1fb7728648a2426dc20c3985fa3c530b
X-Patchwork-Hint: ignore
Message-Id: <20220814131906.B8C9A874A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] paclage/ace: explain why we use C+
 pre-processor flags for C++ flags
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

commit: https://git.buildroot.net/buildroot/commit/?id=b717880f1fb7728648a2426dc20c3985fa3c530b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
