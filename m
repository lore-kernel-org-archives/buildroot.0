Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A118EC6379F
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 08:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CD75828A5;
	Tue, 21 Feb 2023 08:37:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CD75828A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eO6zc4qEjMXC; Tue, 21 Feb 2023 08:37:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75D148284B;
	Tue, 21 Feb 2023 08:37:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75D148284B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA4931BF292
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8513340A59
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8513340A59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ePnEJ4VF3Z-D for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 08:37:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C45BE40A04
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 08:37:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C45BE40A04
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B23E9865A2; Tue, 21 Feb 2023 08:37:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 09:37:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ceb9c36b921f5237f823c34ab369ef521f3ba12b
X-Git-Newrev: 762b3f743dd0687841a2edb64c4b56a522058d5e
X-Patchwork-Hint: ignore
Message-Id: <20230221083752.B23E9865A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/multipath-tools: fix path to
 kernel headers
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
Content-Type: multipart/mixed; boundary="===============8902662730712951316=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8902662730712951316==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=762b3f743dd0687841a2edb64c4b56a522058d5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With change 6b7d47be3b23 ("multipath-tools: Makefiles: simplify code for
include dirs") the Makefile variable 'LINUX_HEADERS_INCDIR' has been replaced
with 'kernel_incdir'.

fpin_handlers.c:355:32: note: each undeclared identifier is reported only once for each function it appears in
fpin_handlers.c:360:37: error: ‘ELS_DTAG_LNK_INTEGRITY’ undeclared (first use in this function)
  360 |                         if (dtag == ELS_DTAG_LNK_INTEGRITY) {
      |                                     ^~~~~~~~~~~~~~~~~~~~~~
make[2]: *** [../Makefile.inc:116: fpin_handlers.o] Error 1

Fixes:

  http://autobuild.buildroot.net/results/e0f56ef924c13d6b1535fdc350ad8ecc06ea0a58

Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/multipath-tools/multipath-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
index 90394fae9f..23b3cc9442 100644
--- a/package/multipath-tools/multipath-tools.mk
+++ b/package/multipath-tools/multipath-tools.mk
@@ -22,7 +22,7 @@ MULTIPATH_TOOLS_CPE_ID_VENDOR = opensvc
 
 MULTIPATH_TOOLS_DEPENDENCIES = lvm2 json-c readline udev liburcu libaio host-pkgconf
 MULTIPATH_TOOLS_MAKE_OPTS = \
-	LINUX_HEADERS_INCDIR=$(STAGING_DIR)/usr/include \
+	kernel_incdir=$(STAGING_DIR)/usr/include \
 	LIB="lib" \
 	RUN="run" \
 	OPTFLAGS="" \

--===============8902662730712951316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8902662730712951316==--
