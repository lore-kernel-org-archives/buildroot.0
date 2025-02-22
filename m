Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B683BC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30C1985F4D;
	Fri, 28 Feb 2025 17:22:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2SeAk6JEzWNX; Fri, 28 Feb 2025 17:22:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45C8185975
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45C8185975;
	Fri, 28 Feb 2025 17:22:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12FBB1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28ADF42D33
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V5xfcr8wDqw5 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02EF247AB4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02EF247AB4
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EAB1D83577; Fri, 28 Feb 2025 16:30:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Feb 2025 22:21:39 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 838a269b8701f59695d200826a65909e09045a9b
X-Git-Newrev: 2578cf368e604211bacaef27738ea96dcaba7572
X-Patchwork-Hint: ignore
Message-Id: <20250228163046.EAB1D83577@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/containerd: use
 --no-pie on musl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2578cf368e604211bacaef27738ea96dcaba7572
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Disable PIE on musl to fix "read-only segment has dynamic relocations"
errors during linking [1] that appeared after major version bump to v2.

[1] https://github.com/golang/go/issues/17847

Fixes: 9c2e146ca9a21f0de3c97981113a57c58c3a5bd5
Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Reviewed-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/containerd/containerd.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index ee07c22495..1f70a26ebf 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -49,6 +49,12 @@ ifneq ($(BR2_PACKAGE_CONTAINERD_CRI),y)
 CONTAINERD_TAGS += no_cri
 endif
 
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+# Go exe build with PIE doesn't work with musl.
+# See: https://github.com/golang/go/issues/17847
+CONTAINERD_EXTLDFLAGS += -Wl,--no-pie
+endif
+
 define CONTAINERD_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 $(@D)/containerd.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/containerd.service
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
