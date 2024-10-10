Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6327D24454
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EED641371;
	Thu, 10 Oct 2024 21:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4OEQz_3o2TYx; Thu, 10 Oct 2024 21:39:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BE1641373
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BE1641373;
	Thu, 10 Oct 2024 21:39:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 122A91BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2A70412D0
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:39:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id doYUPKliD9Ry for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:39:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3E64412D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3E64412D4
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:39:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DCA8B85C90; Thu, 10 Oct 2024 21:39:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Oct 2024 23:39:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e6f761878e3136f0c4a55d2d0c92b3e634a69c3
X-Git-Newrev: 914be51ef0d82a39aa50de06faa5822353ca55d8
X-Patchwork-Hint: ignore
Message-Id: <20241010213951.DCA8B85C90@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-engine: add optional
 dependency on tini
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

commit: https://git.buildroot.net/buildroot/commit/?id=914be51ef0d82a39aa50de06faa5822353ca55d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To provide an init process for containers if requested e.g. with
"docker run --init", Docker relies on tini to provide the init
binary. package/tini already provides the required
/usr/libexec/docker/docker-init symlink, the new option just selects
tini if enabled to prevent confusion over why docker-init is missing.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-engine/Config.in | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 49a002a647..e03ecceeff 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -48,6 +48,17 @@ config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS
 	help
 	  Build the vfs filesystem driver for Docker.
 
+config BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT
+	bool "support docker-init"
+	select BR2_PACKAGE_TINI # runtime
+	help
+	  Support providing a minimal init process for containers,
+	  using tini. Required to use "docker run --init".
+
+	  This does not change the Docker engine build, the
+	  docker-init symlink is provided by the tini package
+	  itself. This option only adds the dependency.
+
 endif
 
 comment "docker-engine needs a glibc or musl toolchain w/ threads, headers >= 3.17"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
