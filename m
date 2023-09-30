Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95EAE7736D
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 10:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0ECA83D7E;
	Sat, 30 Sep 2023 10:50:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0ECA83D7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xXDRUufG1IuI; Sat, 30 Sep 2023 10:50:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 704C983D80;
	Sat, 30 Sep 2023 10:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 704C983D80
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 340A41BF471
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 10:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 199F683D80
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 10:50:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 199F683D80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XwC3XDNMicG7 for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 10:50:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2251182163
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 10:50:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2251182163
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E85783957; Sat, 30 Sep 2023 10:50:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 12:34:32 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 789502a58369e250cb4bc317a9c0bb31cad3528b
X-Git-Newrev: 30956141119ab55409442c743acdbb1c487a8ece
X-Patchwork-Hint: ignore
Message-Id: <20230930105042.0E85783957@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/nodejs: fix
 parallel build further
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
Content-Type: multipart/mixed; boundary="===============2588577799890617169=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2588577799890617169==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=30956141119ab55409442c743acdbb1c487a8ece
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Commit 84c24ab1b5a7 (package/nodejs: fix parallel build) made use of
BR2_JLEVEL to set the number of jobs nodejs should use instead of using
the number of CPUs (+2).

However, BR2_JLEVEL can be set to 0 by the user, to let Buildroot detect
the number of CPUs (+1), and stores it in PARALLEL_JOBS, and leaves
BR2_JLEVEL untouched, so 0.

Thus, we can end up spawning a build by passing -j0 to ninja, which it
interprets as "no -limit yolo" and does not limit the number oj jobs it
spawns, which usually ends up in an OOM somewhere...

Fix this by using PARALLEL_JOBS.

Reported-by: Cédric & Co
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d574e2a4f440903a0e32de6deb8275b1f385da2e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 4e70bd71a3..b8e57e567d 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -47,7 +47,7 @@ HOST_NODEJS_MAKE_OPTS = \
 	LDFLAGS.host="$(HOST_LDFLAGS)" \
 	NO_LOAD=cctest.target.mk \
 	PATH=$(@D)/bin:$(BR_PATH) \
-	JOBS=$(BR2_JLEVEL)
+	JOBS=$(PARALLEL_JOBS)
 
 NODEJS_MAKE_OPTS = \
 	$(TARGET_CONFIGURE_OPTS) \
@@ -55,7 +55,7 @@ NODEJS_MAKE_OPTS = \
 	PATH=$(@D)/bin:$(BR_PATH) \
 	LDFLAGS="$(NODEJS_LDFLAGS)" \
 	LD="$(TARGET_CXX)" \
-	JOBS=$(BR2_JLEVEL)
+	JOBS=$(PARALLEL_JOBS)
 
 # nodejs's build system uses python which can be a symlink to an unsupported
 # python version (e.g. python 3.10 with nodejs 14.18.1). We work around this by

--===============2588577799890617169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2588577799890617169==--
