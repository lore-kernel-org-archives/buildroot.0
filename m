Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC24C4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 20:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1247342EB1;
	Tue, 31 Oct 2023 20:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1247342EB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DDPldUvSWiMN; Tue, 31 Oct 2023 20:42:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ED7C42EB0;
	Tue, 31 Oct 2023 20:42:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9ED7C42EB0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 258A31BF2E3
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 20:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A3B441D82
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 20:42:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A3B441D82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MZJjt_ZRR78H for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 20:42:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC56540131
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 20:42:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC56540131
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C88BE86277; Tue, 31 Oct 2023 20:42:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 31 Oct 2023 21:41:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4658ede712305455eaf72a67a74509d4434a46a
X-Git-Newrev: 9705d300266d9b0332f898b2517fad67b586e9d6
X-Patchwork-Hint: ignore
Message-Id: <20231031204207.C88BE86277@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tini: move docker-init to
 /usr/libexec/docker/
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

commit: https://git.buildroot.net/buildroot/commit/?id=9705d300266d9b0332f898b2517fad67b586e9d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The docker-init is not intended to be a user-facing command, and as such
it is more appropriate for it to be found in /usr/libexec/ than in $PATH.

See:
https://github.com/moby/moby/commit/6caaa8cadc9e4f1e122b7b2bb4451500bbec6086
https://github.com/docker/docker-ce-packaging/commit/5a998af6f53d978810aa6f5b566a484911ff4ca2

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
[yann.morin.1998@free.fr: use mkdir -p, not install -d]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tini/tini.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/tini/tini.mk b/package/tini/tini.mk
index 9da54f8a25..aa8e259db2 100644
--- a/package/tini/tini.mk
+++ b/package/tini/tini.mk
@@ -31,7 +31,8 @@ endef
 
 define TINI_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/bin/tini $(TARGET_DIR)/usr/bin/tini
-	ln -sf tini $(TARGET_DIR)/usr/bin/docker-init
+	mkdir -p $(TARGET_DIR)/usr/libexec/docker
+	ln -sf ../../bin/tini $(TARGET_DIR)/usr/libexec/docker/docker-init
 endef
 
 # Tini's CMakeLists.txt is not suitable for Buildroot.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
