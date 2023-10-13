Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D450CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 14:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29A906F606;
	Fri, 13 Oct 2023 14:47:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29A906F606
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y7w7wIVbCokN; Fri, 13 Oct 2023 14:47:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1998F6F58D;
	Fri, 13 Oct 2023 14:47:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1998F6F58D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 01DDB1BF997
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 14:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF80E82EB5
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 14:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF80E82EB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iM2UQCclu346 for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 14:47:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F408682E5F
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 14:47:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F408682E5F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFC30847A5; Fri, 13 Oct 2023 14:47:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 16:36:58 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 15a57fab296a9d5ed131b3eb7d63ce0557483afe
X-Git-Newrev: cbe2f10910dd3208b656ccca0029f54cefd4321e
X-Patchwork-Hint: ignore
Message-Id: <20231013144706.DFC30847A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/go: fix
 installation
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

commit: https://git.buildroot.net/buildroot/commit/?id=cbe2f10910dd3208b656ccca0029f54cefd4321e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

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
(cherry picked from commit 1db38d928292aaca493c80527008b9bd7e6db602)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/go/go.mk b/package/go/go.mk
index 01442b0f62..cc374aa44f 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -146,6 +146,7 @@ define HOST_GO_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/bin/go $(HOST_GO_ROOT)/bin/go
 	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(HOST_GO_ROOT)/bin/gofmt
 
+	mkdir -p $(HOST_DIR)/bin
 	ln -sf ../lib/go/bin/go $(HOST_DIR)/bin/
 	ln -sf ../lib/go/bin/gofmt $(HOST_DIR)/bin/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
