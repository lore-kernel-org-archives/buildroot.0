Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00154C5321E
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 13:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71A17402FF;
	Sun, 25 Aug 2024 13:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WfptO-5jhJSO; Sun, 25 Aug 2024 13:05:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2673C40308
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2673C40308;
	Sun, 25 Aug 2024 13:05:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 28A831BF4E6
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 13:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 219C640308
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 13:05:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V2M69FbXwWqv for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 13:05:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EDD940306
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EDD940306
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 13:05:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07F47861E8; Sun, 25 Aug 2024 13:05:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Aug 2024 14:58:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 71f54e07804437df8cc389e618e7374e5c3e40d2
X-Git-Newrev: 0196ec4198771e5fe83d6df02c7cd3b13c0ce05f
X-Patchwork-Hint: ignore
Message-Id: <20240825130544.07F47861E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x264: disable assembly code on x86
 + musl + PIC/PIE
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8531109268530081516=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8531109268530081516==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0196ec4198771e5fe83d6df02c7cd3b13c0ce05f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The x264 package uses large amounts of non-PIC assembly code
(e.g. common/x86/dct-a.asm), which results in textrels, which aren't
supported by musl-libc's dynamic linker.

Disable x264's assembly code when compiling for x86 with PIC/PIE and
musl-libc to avoid this particular incompatibility.

Reported-by: Yann Morin <yann.morin@orange.com>
Fixes: https://lore.kernel.org/buildroot/ZrsirnrvgsEIpAJI@tl-lnx-nyma7486-2/
Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

--===============8531109268530081516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8531109268530081516==--
