Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB09C433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 19:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F3D284CD3;
	Thu, 13 Jan 2022 19:42:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ug8W5hLVVl9X; Thu, 13 Jan 2022 19:42:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D28CE812F4;
	Thu, 13 Jan 2022 19:42:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD5D21BF5B3
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AADC6400E4
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:42:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3uoWW_EVm6Pf for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 19:42:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD55640136
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 19:42:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 987E38356C; Thu, 13 Jan 2022 19:35:42 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 20:41:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55f7c2a580a202638b5c0c9042b24b434632b6a8
X-Git-Newrev: 11b347c03ab0b38389ec11b48f63236a3b4d6547
X-Patchwork-Hint: ignore
Message-Id: <20220113193542.987E38356C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnu-efi: add mips64el support
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

commit: https://git.buildroot.net/buildroot/commit/?id=11b347c03ab0b38389ec11b48f63236a3b4d6547
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mips64el is supported since
https://sourceforge.net/p/gnu-efi/code/ci/3f234f5b6ff5c16c6ddd5f2c2513fb329aecd30a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnu-efi/Config.in  | 1 +
 package/gnu-efi/gnu-efi.mk | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/gnu-efi/Config.in b/package/gnu-efi/Config.in
index d456a23837..8e35fddbcb 100644
--- a/package/gnu-efi/Config.in
+++ b/package/gnu-efi/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
 	default y if BR2_aarch64
 	default y if BR2_aarch64_be
 	default y if BR2_i386
+	default y if BR2_mips64el
 	default y if BR2_x86_64
 
 config BR2_PACKAGE_GNU_EFI
diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index 69618029f4..06bf254738 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -24,6 +24,8 @@ else ifeq ($(BR2_arm)$(BR2_armeb),y)
 GNU_EFI_PLATFORM = arm
 else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
 GNU_EFI_PLATFORM = aarch64
+else ifeq ($(BR2_mips64el),y)
+GNU_EFI_PLATFORM = mips64el
 endif
 
 GNU_EFI_MAKE_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
