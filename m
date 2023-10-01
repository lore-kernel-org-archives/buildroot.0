Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD4EE748ED
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 14:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03C3E41F58;
	Sun,  1 Oct 2023 14:48:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03C3E41F58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KrxyDVfkU6Kc; Sun,  1 Oct 2023 14:48:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9B6A41F95;
	Sun,  1 Oct 2023 14:48:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9B6A41F95
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF4401BF48D
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 14:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5EA2402E4
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 14:47:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5EA2402E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lg-Wm2lCbX8q for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 14:47:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31C2740004
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 14:47:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31C2740004
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C4B98348F; Sun,  1 Oct 2023 14:47:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Oct 2023 16:35:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21d52e52d8dee0940d28b3a38551eb183be37813
X-Git-Newrev: 1db38d928292aaca493c80527008b9bd7e6db602
X-Patchwork-Hint: ignore
Message-Id: <20231001144733.1C4B98348F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: fix installation
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

commit: https://git.buildroot.net/buildroot/commit/?id=1db38d928292aaca493c80527008b9bd7e6db602
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building for a target architecture that go does not support, the
installation fails with:

    $ make host-go
    [...]
    ln -sf ../lib/go/bin/go /home/nyma7486/dev/work/5GCroCo/O/pouet/per-package/host-go/host/bin/
    ln: failed to create symbolic link '/home/nyma7486/dev/work/5GCroCo/O/pouet/per-package/host-go/host/bin/': No such file or directory

Indeed, the HOST_DIR/bin is not guaranteed to exist when we install a
host package, so it needs to be explicitly created before we can create
entries in there.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Christian Stewart <christian@aperture.us>
Cc: Anisse Astier <anisse@astier.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/go/go.mk b/package/go/go.mk
index 1cb3fb40ee..6f080be5c0 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -147,6 +147,7 @@ define HOST_GO_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/bin/go $(HOST_GO_ROOT)/bin/go
 	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(HOST_GO_ROOT)/bin/gofmt
 
+	mkdir -p $(HOST_DIR)/bin
 	ln -sf ../lib/go/bin/go $(HOST_DIR)/bin/
 	ln -sf ../lib/go/bin/gofmt $(HOST_DIR)/bin/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
