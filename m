Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969D1C433EF
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 20:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35B5C8406C;
	Thu,  5 May 2022 20:00:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0J3_S_HFNMaL; Thu,  5 May 2022 20:00:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3924683FF2;
	Thu,  5 May 2022 20:00:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7BD5B1BF376
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69ADC4049E
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:00:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ku6VnDXJDK6d for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 20:00:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 485B44011F
 for <buildroot@buildroot.org>; Thu,  5 May 2022 20:00:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6E35385ADA; Thu,  5 May 2022 19:50:07 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 5 May 2022 21:55:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27c672e53abe0a52665c0b49b6bb80f0742e804c
X-Git-Newrev: 0a91f37c482914d70336454cb4ab4fa8ffda30a5
X-Patchwork-Hint: ignore
Message-Id: <20220505195007.6E35385ADA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-meson: add support for new cpu
 families
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a91f37c482914d70336454cb4ab4fa8ffda30a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add mappings for new cpu families based on the reference table:
https://mesonbuild.com/Reference-tables.html#cpu-families

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-meson.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index f1390a18d0..ff850fa79f 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -36,6 +36,8 @@ else ifeq ($(BR2_arm)$(BR2_armeb),y)
 PKG_MESON_TARGET_CPU_FAMILY = arm
 else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
 PKG_MESON_TARGET_CPU_FAMILY = aarch64
+else ifeq ($(BR2_csky),y)
+PKG_MESON_TARGET_CPU_FAMILY = csky
 else ifeq ($(BR2_i386),y)
 PKG_MESON_TARGET_CPU_FAMILY = x86
 else ifeq ($(BR2_m68k),y)
@@ -50,8 +52,12 @@ else ifeq ($(BR2_powerpc),y)
 PKG_MESON_TARGET_CPU_FAMILY = ppc
 else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
 PKG_MESON_TARGET_CPU_FAMILY = ppc64
-else ifeq ($(BR2_riscv),y)
+else ifeq ($(BR2_riscv)$(BR2_RISCV_32),yy)
+PKG_MESON_TARGET_CPU_FAMILY = riscv32
+else ifeq ($(BR2_riscv)$(BR2_RISCV_64),yy)
 PKG_MESON_TARGET_CPU_FAMILY = riscv64
+else ifeq ($(BR2_s390x),y)
+PKG_MESON_TARGET_CPU_FAMILY = s390x
 else ifeq ($(BR2_sh4)$(BR2_sh4eb)$(BR2_sh4a)$(BR2_sh4aeb),y)
 PKG_MESON_TARGET_CPU_FAMILY = sh4
 else ifeq ($(BR2_sparc),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
