Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C67FECAAA1
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 09:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0107F41044;
	Thu, 15 Sep 2022 09:47:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0107F41044
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jMHBTASXDZHT; Thu, 15 Sep 2022 09:47:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B6594102D;
	Thu, 15 Sep 2022 09:47:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B6594102D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E196A1BF3C3
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 09:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA3FC6102A
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 09:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA3FC6102A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u3tbdP5DnyGm for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 09:47:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1E2761012
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 09:47:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1E2761012
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E081F83C43; Thu, 15 Sep 2022 09:47:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 Sep 2022 11:46:23 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 6757c071ef2b01dca150fc841a0478d98acae1a3
X-Git-Newrev: 2a66954390163df510adbc8bc54e16844fbe785e
X-Patchwork-Hint: ignore
Message-Id: <20220915094733.E081F83C43@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] paclage/ace: explain why
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a66954390163df510adbc8bc54e16844fbe785e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
