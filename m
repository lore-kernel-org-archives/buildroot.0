Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F62C433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Mar 2022 11:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1830181BD9;
	Tue,  8 Mar 2022 11:54:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pcnT7kk287-7; Tue,  8 Mar 2022 11:54:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58DC881819;
	Tue,  8 Mar 2022 11:54:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 389EB1BF870
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 11:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 341EA405E7
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 11:54:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AL1JNLw3YM8o for <buildroot@lists.busybox.net>;
 Tue,  8 Mar 2022 11:54:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D7D0400FD
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 11:54:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EE65382578; Tue,  8 Mar 2022 11:46:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 8 Mar 2022 12:49:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c44600c104f04d2d191f6e0e6320b4d5ff8b967
X-Git-Newrev: dd170f0cbad729dba4193b2b20e3de0a7010d485
X-Patchwork-Hint: ignore
Message-Id: <20220308114603.EE65382578@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/Makefile.in: Use 64-bit
 time_t with glibc toolchains for > year 2038 support"
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd170f0cbad729dba4193b2b20e3de0a7010d485
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 6e33e5908086a511294296f317f6e6f86fa84b1d.

This unfortunately breaks a number of packages, as glibc errors out if 64bit
time_t is used without 64bit file offsets, and some packages undefine
_FILE_OFFSET_BITS leading to build breakage:

 #  if ! defined (_FILE_OFFSET_BITS) || _FILE_OFFSET_BITS != 64
 #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
..

So revert it for 2022.02.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index cde050ca82..508ea7c366 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -167,7 +167,7 @@ else ifeq ($(BR2_FORTIFY_SOURCE_2),y)
 TARGET_HARDENED += -D_FORTIFY_SOURCE=2
 endif
 
-TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64
+TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) $(TARGET_HARDENED)
 TARGET_CXXFLAGS = $(TARGET_CFLAGS)
 TARGET_FCFLAGS = $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
