Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BAAC87FCC
	for <buildroot@archiver.kernel.org>; Thu, 31 Jul 2025 14:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1EEC42972;
	Thu, 31 Jul 2025 14:10:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v5bmSh5A29FA; Thu, 31 Jul 2025 14:10:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E64C042965
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E64C042965;
	Thu, 31 Jul 2025 14:10:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B03FD160
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 14:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E93840226
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 14:10:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AghIjtAMK93h for <buildroot@buildroot.org>;
 Thu, 31 Jul 2025 14:10:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC76C4005A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC76C4005A
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 14:10:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB5AC86D2B; Thu, 31 Jul 2025 14:10:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 31 Jul 2025 16:04:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2fbf98da7c393ded3032c7fef95385653f96eddc
X-Git-Newrev: f5101638b9f917dc4c569828ff3fee0c486ba8f8
X-Patchwork-Hint: ignore
Message-Id: <20250731141028.CB5AC86D2B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/syslinux: fix build with gcc-15.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=f5101638b9f917dc4c569828ff3fee0c486ba8f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes build error with gcc-15.x:

drivers/net/3c509-eisa.c:39:26: error:  initialization of 'void (*)(void)'
 from incompatible pointer type 'void (*)(struct nic *, struct eisa_device *)'
 [-Wincompatible-pointer-types]

For a similar fix see https://bugzilla.suse.com/show_bug.cgi?id=1243225

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/syslinux/syslinux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 127f6b3cc1..b8f022b189 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -65,7 +65,7 @@ define SYSLINUX_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) \
 		ASCIIDOC_OK=-1 \
 		A2X_XML_OK=-1 \
-		CC="$(TARGET_CC)" \
+		CC="$(TARGET_CC) -std=gnu17" \
 		LD="$(TARGET_LD)" \
 		OBJCOPY="$(TARGET_OBJCOPY)" \
 		AS="$(TARGET_AS)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
