Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DC1CCD1BB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D138561385;
	Wed, 22 Oct 2025 16:36:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ehAcbWxbsjr8; Wed, 22 Oct 2025 16:36:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0C0E61371
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0C0E61371;
	Wed, 22 Oct 2025 16:36:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2046F43F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFBB84112A
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R1lWorCzZDi2 for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:36:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F32FC41186
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F32FC41186
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F11CD866C6; Wed, 22 Oct 2025 16:36:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:35:49 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f6efae6a39c3dd90d3431108950c089fb71dc912
X-Git-Newrev: f03637d2be9ab7aaf09efd48a147841c559dab7b
X-Patchwork-Hint: ignore
Message-Id: <20251022163634.F11CD866C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ebtables: disable
 sparc64 target
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f03637d2be9ab7aaf09efd48a147841c559dab7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Commit c5d6cde7b627 ("package/ebtables: remove KERNEL_64_USERSPACE_32
workaround") fixed build with GCC 14 for when Buildroot
BR2_KERNEL_64_USERLAND_32 is enabled. However, ebtables configure script
enables its own KERNEL_64_USERSPACE_32 macro unconditionally for sparc64
target, which triggers a similar build failure. See [1].

Disable sparc64 target for ebtables and its reverse dependency to avoid
build failure.

Fixes:
https://autobuild.buildroot.net/results/9a2510e0038cd13db8c3aac0122ea7a0f834fcd2/

[1] https://git.netfilter.org/ebtables/tree/configure.ac?h=ebtables-2.0.11#n20

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
[Julien: add link to upstream script enabling KERNEL_64_USERSPACE_32]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0549ed0ed1ce7b0b107ac7bd50ccf0496cf8172f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ebtables/Config.in | 1 +
 package/libvirt/Config.in  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/ebtables/Config.in b/package/ebtables/Config.in
index ce5f67bc61..83337feec6 100644
--- a/package/ebtables/Config.in
+++ b/package/ebtables/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_EBTABLES
 	depends on BR2_USE_MMU # fork()
 	# https://lore.kernel.org/all/20210518181730.13436-1-patrickdepinguin@gmail.com/
 	depends on !BR2_KERNEL_64_USERLAND_32
+	depends on !BR2_sparc64 # int-conversion error
 	help
 	  Ethernet bridge frame table administration
 
diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index c55ab429eb..5664f69dd8 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -46,6 +46,7 @@ config BR2_PACKAGE_LIBVIRT_DAEMON
 	default y
 	depends on BR2_INSTALL_LIBSTDCPP # nmap
 	depends on !BR2_KERNEL_64_USERLAND_32 # ebtables
+	depends on !BR2_sparc64 # ebtables
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS # radvd -> libbsd
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_DNSMASQ
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
