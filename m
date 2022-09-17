Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34CBECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 10:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CE5F61094;
	Sat, 17 Sep 2022 10:06:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CE5F61094
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dEvur1SMLfJZ; Sat, 17 Sep 2022 10:06:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C516D60D4E;
	Sat, 17 Sep 2022 10:06:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C516D60D4E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C96C1BF5A4
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 10:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB29440223
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 10:06:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB29440223
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rA1-Tc54kgtL for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 10:06:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EB6E40121
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 10:06:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EB6E40121
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0E33684173; Sat, 17 Sep 2022 10:06:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 11:57:24 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 7a4169c374d5878f7509177b6599c7f1bcf9ff29
X-Git-Newrev: fb36908ce9297818717963071fdcdca74852f913
X-Patchwork-Hint: ignore
Message-Id: <20220917100647.0E33684173@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/Makefile.in: only
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb36908ce9297818717963071fdcdca74852f913
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
