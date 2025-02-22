Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BE7C021B2
	for <buildroot@archiver.kernel.org>; Sat, 22 Feb 2025 21:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AF75607D5;
	Sat, 22 Feb 2025 21:28:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dBsLHD_kn7Ir; Sat, 22 Feb 2025 21:28:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4562607E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4562607E5;
	Sat, 22 Feb 2025 21:28:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 202BD943
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 21:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03F40607D5
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 21:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ljvYaVq7oO7s for <buildroot@buildroot.org>;
 Sat, 22 Feb 2025 21:28:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19020606B3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19020606B3
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 21:28:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13024879B6; Sat, 22 Feb 2025 21:28:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Feb 2025 22:21:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 838a269b8701f59695d200826a65909e09045a9b
X-Git-Newrev: 2578cf368e604211bacaef27738ea96dcaba7572
X-Patchwork-Hint: ignore
Message-Id: <20250222212815.13024879B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/containerd: use --no-pie on musl
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
