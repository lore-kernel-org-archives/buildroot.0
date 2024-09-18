Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E007CDD54D
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 17:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08436411BC;
	Wed, 18 Sep 2024 17:09:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TIKCZZu8gWfl; Wed, 18 Sep 2024 17:09:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2839411AC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2839411AC;
	Wed, 18 Sep 2024 17:09:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 441691BF5A7
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 17:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CB51608E9
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 17:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gkih3GOG46Tr for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 17:09:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F3B8606F8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F3B8606F8
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 17:09:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5393783B77; Wed, 18 Sep 2024 17:09:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Sep 2024 19:04:12 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 090dea2faa1d04a14e399b03e0038f45f9699eef
X-Git-Newrev: 68e71cde3069d0875e8bf30ebed509b157044de2
X-Patchwork-Hint: ignore
Message-Id: <20240918170947.5393783B77@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/x264: disable
 assembly code on x86 + musl + PIC/PIE
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
Content-Type: multipart/mixed; boundary="===============5234803098999141309=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5234803098999141309==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=68e71cde3069d0875e8bf30ebed509b157044de2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The x264 package uses large amounts of non-PIC assembly code
(e.g. common/x86/dct-a.asm), which results in textrels, which aren't
supported by musl-libc's dynamic linker.

Disable x264's assembly code when compiling for x86 with PIC/PIE and
musl-libc to avoid this particular incompatibility.

Reported-by: Yann Morin <yann.morin@orange.com>
Fixes: https://lore.kernel.org/buildroot/ZrsirnrvgsEIpAJI@tl-lnx-nyma7486-2/
Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0196ec4198771e5fe83d6df02c7cd3b13c0ce05f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x264/x264.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index 97caf19466..e96d993017 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -14,9 +14,15 @@ X264_INSTALL_STAGING = YES
 X264_CONF_OPTS = --disable-avs --disable-lavf --disable-swscale
 
 ifeq ($(BR2_i386)$(BR2_x86_64),y)
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL)$(BR2_PIC_PIE),yy)
+# libx264 uses large amounts of non-pic assembly code, resulting in text
+# section relocations, which are not supported on musl-libc's ld.so.
+X264_CONF_OPTS += --disable-asm
+else
 # nasm needed for assembly files
 X264_DEPENDENCIES += host-nasm
 X264_CONF_ENV += AS="$(HOST_DIR)/bin/nasm"
+endif
 else ifeq ($(BR2_ARM_CPU_ARMV7A)$(BR2_aarch64),y)
 # We need to pass gcc as AS, because the ARM assembly files have to be
 # preprocessed

--===============5234803098999141309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5234803098999141309==--
