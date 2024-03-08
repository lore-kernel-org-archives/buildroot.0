Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15604C5475B
	for <buildroot@archiver.kernel.org>; Fri,  8 Mar 2024 11:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6D0E831FB;
	Fri,  8 Mar 2024 11:32:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v66i1jCLRdOJ; Fri,  8 Mar 2024 11:32:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B0B3833CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B0B3833CD;
	Fri,  8 Mar 2024 11:32:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E9B01BF995
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 11:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C055610F6
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 11:32:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B5zTpb5q0Zif for <buildroot@lists.busybox.net>;
 Fri,  8 Mar 2024 11:32:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59B68610E2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59B68610E2
 for <buildroot@buildroot.org>; Fri,  8 Mar 2024 11:32:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40BCB880E1; Fri,  8 Mar 2024 11:32:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 8 Mar 2024 12:27:09 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 5f1bccce4706c910f844c751b451476746c772c0
X-Git-Newrev: 52106d80350f6e3e52802c320a894dddb20e6e39
X-Patchwork-Hint: ignore
Message-Id: <20240308113207.40BCB880E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/petitboot: prefer
 UTF-8 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=52106d80350f6e3e52802c320a894dddb20e6e39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
(cherry picked from commit 026338f66bdb2d9436898bd968a3f22995851b92)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
