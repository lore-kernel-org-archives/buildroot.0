Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13DECCD185
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 17:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F9D4811BB;
	Fri, 10 Oct 2025 17:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J571lnJomr1F; Fri, 10 Oct 2025 17:16:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F5F9811BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F5F9811BE;
	Fri, 10 Oct 2025 17:16:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BE5231
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 17:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E036811BF
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 17:16:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3uL8wjNTnSVD for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 17:16:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9DEB811BB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9DEB811BB
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 17:16:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98D7386FC3; Fri, 10 Oct 2025 17:16:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Oct 2025 19:12:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6bf05cb6a4d0a3b5ac0d30f5e103ae81f10f2ee7
X-Git-Newrev: 0549ed0ed1ce7b0b107ac7bd50ccf0496cf8172f
X-Patchwork-Hint: ignore
Message-Id: <20251010171604.98D7386FC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ebtables: disable sparc64 target
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0549ed0ed1ce7b0b107ac7bd50ccf0496cf8172f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
