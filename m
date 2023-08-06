Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352DDC001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 11:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E425F80BB4;
	Sun,  6 Aug 2023 11:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E425F80BB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9DfnNvDnbndU; Sun,  6 Aug 2023 11:48:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4211A80ADA;
	Sun,  6 Aug 2023 11:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4211A80ADA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0CDB61BF293
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 11:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5B0B81E0C
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 11:47:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5B0B81E0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sOW5-CNuILdG for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 11:47:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8434281282
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 11:47:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8434281282
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D543842B3; Sun,  6 Aug 2023 11:47:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 13:46:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c2a450ddd6ab8235009149a9fc14ff77199a9d57
X-Git-Newrev: b032b3b1df645eaaf79f53005945bac7dad45e74
X-Patchwork-Hint: ignore
Message-Id: <20230806114715.6D543842B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stellarium: disable xlsx support
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

commit: https://git.buildroot.net/buildroot/commit/?id=b032b3b1df645eaaf79f53005945bac7dad45e74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit 319c56dfe3309dbf24be01fed3afff6259a2c5dd bumped
stellarium which included this commit
https://github.com/Stellarium/stellarium/commit/186b06fa215bd28ea03cc291dc861b552af8d99a

It removed the previously bundled QXlsx source and lets stellarium
git-clone the sourcecode of the QXlsx package (not present in buildroot)
during the build:

$ find output/build/stellarium-23.2/ -iname .gitignore | grep qxl
output/build/stellarium-23.2/_deps/qxlsxqt5-src/.gitignore

which breaks offline builds.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/stellarium/stellarium.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index cc25f91063..7ee19c8b18 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -20,6 +20,7 @@ STELLARIUM_CONF_OPTS = \
 	-DENABLE_NLS=OFF \
 	-DENABLE_QTWEBENGINE=OFF \
 	-DENABLE_QT6=OFF \
+	-DENABLE_XLSX=OFF \
 	-DUSE_PLUGIN_TELESCOPECONTROL=OFF \
 	-DUSE_SYSTEM_ZLIB=ON
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
