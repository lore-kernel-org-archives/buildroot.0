Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D352C32789
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 19:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0023409BE;
	Sun, 21 Aug 2022 19:31:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0023409BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YTA-_5CWTiSF; Sun, 21 Aug 2022 19:31:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B09134091C;
	Sun, 21 Aug 2022 19:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B09134091C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9CC111BF5DF
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 19:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7779D40587
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 19:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7779D40587
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OYUud-QVPKqp for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 19:31:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C29CA40586
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 19:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C29CA40586
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2D7F087A4C; Sun, 21 Aug 2022 19:16:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 Aug 2022 21:28:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 525913b24ba686b599e8c1847ed9da1e1cb03b00
X-Git-Newrev: d349d50dac5a264c174cb6e0fd9f197ea780f2ed
X-Patchwork-Hint: ignore
Message-Id: <20220821191637.2D7F087A4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/Makefile.in: only error out when
 no C library is configured when building
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

commit: https://git.buildroot.net/buildroot/commit/?id=d349d50dac5a264c174cb6e0fd9f197ea780f2ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index ff60f85092..43d214bcbe 100644
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
