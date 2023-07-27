Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E85EC001DC
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 10:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF6F7403CA;
	Thu, 27 Jul 2023 10:34:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF6F7403CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mS_Akcoo3Foj; Thu, 27 Jul 2023 10:34:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00C3A401C9;
	Thu, 27 Jul 2023 10:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00C3A401C9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C3CBC1BF40B
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DC9783F9F
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:34:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DC9783F9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ki2SmIvaisUh for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 10:34:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB20F83F9C
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 10:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB20F83F9C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6942836D9; Thu, 27 Jul 2023 10:34:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 12:33:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f0061b666d8429bc8993256f5a1d6c0a01689f3
X-Git-Newrev: 90cedc23bec230e485d9f0eb8818eb65172e8c87
X-Patchwork-Hint: ignore
Message-Id: <20230727103440.B6942836D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libubootenv: needs libyaml
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

commit: https://git.buildroot.net/buildroot/commit/?id=90cedc23bec230e485d9f0eb8818eb65172e8c87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/cc1/cc141c81fd00ca3ece1c33b9659cce93dd5222a9/

Makefile:576: *** libyaml is in the dependency chain of libubootenv that
 has added it to its _DEPENDENCIES variable without selecting it or
 depending on it from Config.in.  Stop.

This error was introduced by buildroot commit
9325ba4754fea800658bb3aec99f28bba3d2acf3.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libubootenv/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libubootenv/Config.in b/package/libubootenv/Config.in
index 9be52c4522..5258ed78b1 100644
--- a/package/libubootenv/Config.in
+++ b/package/libubootenv/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBUBOOTENV
 	bool "libubootenv"
+	select BR2_PACKAGE_LIBYAML
 	select BR2_PACKAGE_ZLIB
 	help
 	  libubootenv is a library that provides a hardware independent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
