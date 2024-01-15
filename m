Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0D0C3DA79
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 21:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9922583A3F;
	Mon, 15 Jan 2024 21:11:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9922583A3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kc6ucoxucCJd; Mon, 15 Jan 2024 21:11:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0FAA83A57;
	Mon, 15 Jan 2024 21:11:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0FAA83A57
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D7CD51BF383
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 21:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8F3483A57
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 21:11:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8F3483A57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oeZimFAnZtff for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 21:11:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA05C83A3F
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 21:11:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA05C83A3F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE20586273; Mon, 15 Jan 2024 21:11:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 15 Jan 2024 22:09:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 263244e1191770f7b60d68aa3c3421217e55c827
X-Git-Newrev: e07402afff12c684a288a0d94484a8e6e6ff7faa
X-Patchwork-Hint: ignore
Message-Id: <20240115211145.AE20586273@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvpl: fix libdrm dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=e07402afff12c684a288a0d94484a8e6e6ff7faa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit c50e9c21f0444b064bc257fcc0d3073fee945623 initially
added the package onevpl (meanwhile renamed to libvpl) and forgot to
add all dependencies of BR2_PACKAGE_LIBDRM_INTEL.

Fixes:
http://autobuild.buildroot.org/results/8fa/8fa0f2cd7a027d3d8fae56125621b0b814e132da/

Note: BR2_PACKAGE_LIBDRM_HAS_ATOMIC is always true on x86, but it is
propagated for consistency with the actual dependencies of libdrm-intel.

Notes: this means the current comntition in the .mk is correct in
practice, even if it does not account for the atomic case on x86.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[yann.morin.1998@free.fr: add notes]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libvpl/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libvpl/Config.in b/package/libvpl/Config.in
index 012f31b3be..b9e9a20fd7 100644
--- a/package/libvpl/Config.in
+++ b/package/libvpl/Config.in
@@ -12,7 +12,9 @@ config BR2_PACKAGE_LIBVPL
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
 	# libva support needs a libdrm with intel driver
-	select BR2_PACKAGE_LIBDRM_INTEL if BR2_PACKAGE_LIBVA
+	select BR2_PACKAGE_LIBDRM_INTEL if BR2_PACKAGE_LIBVA && \
+		(BR2_i386 || BR2_x86_64) && \
+		BR2_PACKAGE_LIBDRM_HAS_ATOMIC
 	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
