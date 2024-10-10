Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAB9D24454
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAAD441373;
	Thu, 10 Oct 2024 21:39:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EotY9QtA6kBJ; Thu, 10 Oct 2024 21:39:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23A9E413A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23A9E413A5;
	Thu, 10 Oct 2024 21:39:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C17721BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB0A28145B
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:39:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OzylucRrbUpU for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:39:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBA2181432
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBA2181432
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:39:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D13C785C8F; Thu, 10 Oct 2024 21:39:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Oct 2024 23:39:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 581297cb08bf7d5553fd69bcf3234f27dacd5ca1
X-Git-Newrev: 7e6f761878e3136f0c4a55d2d0c92b3e634a69c3
X-Patchwork-Hint: ignore
Message-Id: <20241010213951.D13C785C8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tini: restore use as docker-init
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

commit: https://git.buildroot.net/buildroot/commit/?id=7e6f761878e3136f0c4a55d2d0c92b3e634a69c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 24cac9c4e6a36fd14b263a8eecf7ae7d58ab5a59 "system: add tini as
init system" made BR2_PACKAGE_TINI depend on BR2_INIT_TINI. This is
incorrect: tini is not only needed when building a container image
using Buildroot, but also to run Docker containers on Buildroot
systems using another another init system, if Docker is configured to
provide an init process for the container (e.g. with "docker run
--init"). The tini package already provides the "docker-init" symlink
required for that.

Example error without tini installed:

$ docker run --rm -ti --init alpine
docker: Error response from daemon: exec: "docker-init": executable file not found in $PATH.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Reviewed-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tini/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/tini/Config.in b/package/tini/Config.in
index bca8ad8e96..719e1e1f22 100644
--- a/package/tini/Config.in
+++ b/package/tini/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_TINI
 	bool "tini"
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_INIT_TINI
 	help
 	  tini is a simple but valid init binary to
 	  act as PID 1 for containers.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
