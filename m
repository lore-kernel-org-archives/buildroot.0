Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C4DC001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 11:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B471817F2;
	Sun,  6 Aug 2023 11:48:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B471817F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IOOAQ9q6r8YT; Sun,  6 Aug 2023 11:48:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 966F581E7C;
	Sun,  6 Aug 2023 11:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 966F581E7C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA6EF1BF293
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 11:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A0FF40338
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 11:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A0FF40338
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E0aa1Fa79CDj for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 11:47:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F92340084
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 11:47:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F92340084
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A60F842DD; Sun,  6 Aug 2023 11:47:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 13:46:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b032b3b1df645eaaf79f53005945bac7dad45e74
X-Git-Newrev: 2616272339073834c262bc46fdf995fdaa91acf7
X-Patchwork-Hint: ignore
Message-Id: <20230806114715.7A60F842DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stellarium: disable ShowMySky
 atmosphere model
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

commit: https://git.buildroot.net/buildroot/commit/?id=2616272339073834c262bc46fdf995fdaa91acf7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit 319c56dfe3309dbf24be01fed3afff6259a2c5dd bumped
stellarium which included these commits
https://github.com/Stellarium/stellarium/commit/b3f02beaec2a285251db1e1707abe2e423803834
https://github.com/Stellarium/stellarium/commit/5d5edd0e5f5630872628a1525685b77854b6e4b4

It downloads external packages during the build:

$ find output/build/stellarium-23.2/ -iname *.tar.*
output/build/stellarium-23.2/_deps/eigen3-subbuild/eigen3-populate-prefix/src/eigen-3.4.0.tar.bz2
output/build/stellarium-23.2/_deps/showmysky-qt5-subbuild/showmysky-qt5-populate-prefix/src/v0.3.1.tar.gz

which breaks offline builds.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/stellarium/stellarium.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 7ee19c8b18..43c99413dd 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -18,6 +18,7 @@ STELLARIUM_DEPENDENCIES = \
 STELLARIUM_CONF_OPTS = \
 	-DENABLE_MEDIA=ON \
 	-DENABLE_NLS=OFF \
+	-DENABLE_SHOWMYSKY=OFF \
 	-DENABLE_QTWEBENGINE=OFF \
 	-DENABLE_QT6=OFF \
 	-DENABLE_XLSX=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
