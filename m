Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E8EC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 10:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4D93410C1;
	Sun, 14 Aug 2022 10:06:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4D93410C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KfJ02HZc2DvG; Sun, 14 Aug 2022 10:06:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96605410A5;
	Sun, 14 Aug 2022 10:06:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96605410A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B81BA1BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93C2083E9A
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:06:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93C2083E9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mjYI1sGn-ool for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 10:06:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF97D829B1
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 10:06:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF97D829B1
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 214CD87422; Sun, 14 Aug 2022 09:51:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 12:05:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d312d0ff9dd464e6c3416452f3b4941be1c10703
X-Git-Newrev: 44e3d85cbb327480473f6293f20f84600bd3c240
X-Patchwork-Hint: ignore
Message-Id: <20220814095136.214CD87422@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgit2: link with -latomic if
 needed
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=44e3d85cbb327480473f6293f20f84600bd3c240
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libgit2 is currently a library without any reverse dependencies so the
missing atomic symbols do not cause build failures yet.

libgit2 uses the atomics intrinsics on gcc >= 4.7 and the sync
intrinsics on previous gcc versions.  Since gcc 4.9 is the new
minimum, ignore the sync intrinsics requirements.

The next version of libgit2 will also build a binary, which will
expose the problem.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgit2/libgit2.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 3f1e6e1593..9b5e2b897d 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -44,4 +44,9 @@ else
 LIBGIT2_CONF_OPTS += -DUSE_HTTPS=OFF
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LIBGIT2_CONF_OPTS += \
+	-DCMAKE_SHARED_LINKER_FLAGS=-latomic
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
