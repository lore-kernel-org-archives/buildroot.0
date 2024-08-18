Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAD8C52D7C
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 07:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9730E40129;
	Sun, 18 Aug 2024 07:20:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gV9Ejd43n7VT; Sun, 18 Aug 2024 07:20:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65BC940187
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65BC940187;
	Sun, 18 Aug 2024 07:20:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E5BE71BF41A
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 07:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0D0480BC0
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 07:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T_MIUdzb2JD6 for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 07:20:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0705580BB5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0705580BB5
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 07:20:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E605685F82; Sun, 18 Aug 2024 07:20:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 Aug 2024 09:19:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 308d2c992714520844b2dd96a4d79d688afcd28a
X-Git-Newrev: c58abf42c04b8cbc40bf80c21fe6516ec73c2977
X-Patchwork-Hint: ignore
Message-Id: <20240818072029.E605685F82@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnu-efi: only supported on
 MMU-capable platforms
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

commit: https://git.buildroot.net/buildroot/commit/?id=c58abf42c04b8cbc40bf80c21fe6516ec73c2977
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit
1f7c58145497ed01d566e08734a62feef1696807 ("package/gnu-efi: enable on
RISC-V 64-bit"), we allow building on RISC-V... and that includes
noMMU RISC-V. This unfortunately fails badly with:

/home/autobuild/autobuild/instance-2/output-1/host/bin/../riscv64-buildroot-linux-uclibc/bin/ld.real: unrecognized option '-Wl,-elf2flt=-r'
/home/autobuild/autobuild/instance-2/output-1/host/bin/../riscv64-buildroot-linux-uclibc/bin/ld.real: use the --help option for usage information

Since we're anyway not interested in gnu-efi on noMMU platforms, let's
not even spend time on trying to fix this and make MMU support a
requirement for gnu-efi.

Fixes:

  http://autobuild.buildroot.net/results/8b4a503939bdbe773ceee69e01a3ea16873a75fa/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gnu-efi/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gnu-efi/Config.in b/package/gnu-efi/Config.in
index 012324712c..2c4b78b794 100644
--- a/package/gnu-efi/Config.in
+++ b/package/gnu-efi/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
 	default y if BR2_aarch64
 	default y if BR2_i386
 	default y if BR2_x86_64
+	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_GNU_EFI
 	bool "gnu-efi"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
