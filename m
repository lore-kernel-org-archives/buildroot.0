Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE3BC4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 19:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7661842203;
	Wed,  7 Feb 2024 19:43:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0zRArCas9a_J; Wed,  7 Feb 2024 19:43:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9066342206
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9066342206;
	Wed,  7 Feb 2024 19:43:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A1E31BF350
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 444684222B
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:43:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HrNKMcKSffMb for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 19:43:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F08942206
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F08942206
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 19:43:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A6F7876AF; Wed,  7 Feb 2024 19:43:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 20:41:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de86cac61bb2cbe875707990e49e80eccdba2796
X-Git-Newrev: 026338f66bdb2d9436898bd968a3f22995851b92
X-Patchwork-Hint: ignore
Message-Id: <20240207194320.4A6F7876AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/petitboot: prefer UTF-8 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=026338f66bdb2d9436898bd968a3f22995851b92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The petitboot UI looks much nicer in a Unicode locale:

* Items in the language selection submenu use multibyte Unicode
  characters. In other locales, they say "Unable to display text in this
  locale".

* The combination of TERM=linux with a UTF-8 locale is required to
  trigger a special-case workaround in ncurses code[1]. Without
  this, line-drawing characters in the menu look like q's.

Turn on wchar support in ncurses, and add a reminder that a UTF-8 locale
should be generated for things to look right.

[1] https://invisible-island.net/ncurses/ncurses.faq.html#no_line_drawing

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/petitboot/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
index 6a3d476b11..533c7a9f29 100644
--- a/package/petitboot/Config.in
+++ b/package/petitboot/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_PETITBOOT
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_LVM2 # devmapper
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_WCHAR
 	# run-time dependencies
 	select BR2_PACKAGE_KEXEC if !BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS
 	select BR2_PACKAGE_KEXEC_LITE if BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS && !BR2_PACKAGE_KEXEC
@@ -18,6 +19,9 @@ config BR2_PACKAGE_PETITBOOT
 	help
 	  Petitboot is a small kexec-based bootloader
 
+	  NOTE: petitboot looks best in a UTF-8 locale; be sure there
+	  is one listed in BR2_GENERATE_LOCALE.
+
 	  http://www.kernel.org/pub/linux/kernel/people/geoff/petitboot/petitboot.html
 
 if BR2_PACKAGE_PETITBOOT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
