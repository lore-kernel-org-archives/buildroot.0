Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA4EC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 18:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27FAC6FC89;
	Fri,  7 Jan 2022 18:08:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mUnfY5Mm4Tfr; Fri,  7 Jan 2022 18:08:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74CA56FC67;
	Fri,  7 Jan 2022 18:08:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 043391BF5E9
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F142842A09
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:08:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vXw66YOzNVpp for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 18:08:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DC494296C
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 18:08:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0658583465; Fri,  7 Jan 2022 18:02:04 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 19:08:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 338b2e58d46ac32ded7877e2f211515024bd881a
X-Git-Newrev: b07842e20d945649dec1815afffba253c7932211
X-Patchwork-Hint: ignore
Message-Id: <20220107180204.0658583465@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/file: fix build with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=b07842e20d945649dec1815afffba253c7932211
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 5.41 in
commit d38b72bcd75392a88b5100839ac410859d0a6a79:

readelf.c: In function 'do_auxv_note':
readelf.c:1046:2: error: 'for' loop initial declarations are only allowed in C99 mode
  for (size_t off = 0; off + elsize <= descsz; off += elsize) {
  ^

Fixes:
 - http://autobuild.buildroot.org/results/31cbc313fceb84c0cbb1969fca5ac44244871dbc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/file/file.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/file/file.mk b/package/file/file.mk
index 12647af8bb..62cec4b2c9 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -9,6 +9,7 @@ FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file
 HOST_FILE_DEPENDENCIES = host-zlib
 FILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
+HOST_FILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 FILE_INSTALL_STAGING = YES
 FILE_LICENSE = BSD-2-Clause, BSD-4-Clause (one file), BSD-3-Clause (one file)
 FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
