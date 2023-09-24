Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEF7CE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 09:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DD3041775;
	Sun, 24 Sep 2023 09:54:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DD3041775
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gWej0cD8_B6L; Sun, 24 Sep 2023 09:54:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B62741776;
	Sun, 24 Sep 2023 09:54:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B62741776
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 360621BF403
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 09:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1531341775
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 09:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1531341775
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nPp7fFVmKD_Q for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 09:54:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2449F415D9
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 09:54:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2449F415D9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A5EA874A9; Sun, 24 Sep 2023 09:54:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 11:49:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7447700f057a4bf8b2ee84c22a2319ab05f9aeea
X-Git-Newrev: 84c24ab1b5a7d38b481b37a759480ff2273b499d
X-Patchwork-Hint: ignore
Message-Id: <20230924095409.0A5EA874A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs: fix parallel build
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

commit: https://git.buildroot.net/buildroot/commit/?id=84c24ab1b5a7d38b481b37a759480ff2273b499d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Unless told otherwise, ninja will spawn as many jobs as there are CPU
(plus 2). Nodejs is built with ninja, but it is a generic package, so
there is no variable (like with cmake-package) that passes the proper
number of parallel jobs as configured by the user.

As a consequence, the nodejs build will use as many CPU as are
available, possibly overcommitting the rsources the user expected to be
used.

Set the JOBS variableto limit that number.

Signed-off-by: Jens Maus <mail@jens-maus.de>
[yann.morin.1998@free.fr: reword commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nodejs/nodejs.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index fe629ada21..4e70bd71a3 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -46,14 +46,16 @@ HOST_NODEJS_MAKE_OPTS = \
 	CXXFLAGS="$(HOST_NODEJS_CXXFLAGS)" \
 	LDFLAGS.host="$(HOST_LDFLAGS)" \
 	NO_LOAD=cctest.target.mk \
-	PATH=$(@D)/bin:$(BR_PATH)
+	PATH=$(@D)/bin:$(BR_PATH) \
+	JOBS=$(BR2_JLEVEL)
 
 NODEJS_MAKE_OPTS = \
 	$(TARGET_CONFIGURE_OPTS) \
 	NO_LOAD=cctest.target.mk \
 	PATH=$(@D)/bin:$(BR_PATH) \
 	LDFLAGS="$(NODEJS_LDFLAGS)" \
-	LD="$(TARGET_CXX)"
+	LD="$(TARGET_CXX)" \
+	JOBS=$(BR2_JLEVEL)
 
 # nodejs's build system uses python which can be a symlink to an unsupported
 # python version (e.g. python 3.10 with nodejs 14.18.1). We work around this by
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
