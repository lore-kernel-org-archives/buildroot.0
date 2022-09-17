Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34AAEECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 10:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B38E040354;
	Sat, 17 Sep 2022 10:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B38E040354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5hDuRqr10zYA; Sat, 17 Sep 2022 10:06:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B110740223;
	Sat, 17 Sep 2022 10:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B110740223
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 92FC31BF5A4
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 10:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F5F083F7C
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 10:06:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F5F083F7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rd88kwFY5Vze for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 10:06:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C7F583F7F
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 10:06:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C7F583F7F
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8385D8416F; Sat, 17 Sep 2022 10:06:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 11:57:32 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: d53114a569e0b7c4e37f9770d58e5149b79e820c
X-Git-Newrev: bfb343d2ec87ceb7cec933ac85971072110f599a
X-Patchwork-Hint: ignore
Message-Id: <20220917100638.8385D8416F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/Makefile.in: only
 error out when no C library is configured when building
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

commit: https://git.buildroot.net/buildroot/commit/?id=bfb343d2ec87ceb7cec933ac85971072110f599a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Commit fda53f0791f5657d41735a40a29df3c8d0e8ae79 ("package/Makefile.in:
add detection for the lack of C library") added an $(error ...)
message when no C library is available for the currently selected
architecture.

However, this error message pops up not just when building, so for
example, the command:

  make BR2_HAVE_DOT_CONFIG=y VARS=%_LICENSE printvars

no longer works (this command is used by the pkg-stats script).

We restore a functional behavior by doing the check only when
BR_BUILDING=y.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d349d50dac5a264c174cb6e0fd9f197ea780f2ed)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 580e9d14ca..d184534549 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -53,7 +53,7 @@ else ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
 LIBC = musl
 else ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 LIBC = gnu
-else
+else ifeq ($(BR_BUILDING),y)
 # This happens if there is a bug in Buildroot that allows an
 # architecture configuration that isn't supported by any library.
 $(error No C library enabled, this is not possible.)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
