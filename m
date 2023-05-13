Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A179CC77B7D
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 08:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 434FB410EA;
	Sat, 13 May 2023 08:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 434FB410EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vkik9TKX5A06; Sat, 13 May 2023 08:23:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2D23413A3;
	Sat, 13 May 2023 08:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2D23413A3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8CD271BF5DF
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 08:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6618F4034F
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 08:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6618F4034F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xVChRQXiW_9J for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 08:23:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52BE240333
 for <buildroot@buildroot.org>; Sat, 13 May 2023 08:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52BE240333
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 401B084049; Sat, 13 May 2023 08:23:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 10:22:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 97064a5eaa5b235ae754dd0abe639d11a8bff0f6
X-Git-Newrev: 72945e5a5b96c970fa08557eeed1e2e031c46413
X-Patchwork-Hint: ignore
Message-Id: <20230513082336.401B084049@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: allow building only the
 guest agent
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

commit: https://git.buildroot.net/buildroot/commit/?id=72945e5a5b96c970fa08557eeed1e2e031c46413
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Most of the tools are useful only on virtualization hosts. After the
upgrade to QEMU 7.2.0, it is possible to build only quemu-ga, which
makes more sense when we build guest VM images.

Also do not build the other tools by default if none of the emulators is
selected, since the user does not necessarily wants them. Ideally, it
should not be possible to select qemu without selecting at least one of
the subcomponents but it is hard to guess what the user wants.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qemu/Config.in | 8 +++++++-
 package/qemu/qemu.mk   | 6 ++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 235fdb9ce6..91a1b288c6 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -26,7 +26,6 @@ menuconfig BR2_PACKAGE_QEMU
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_QEMU_TOOLS if !BR2_PACKAGE_QEMU_SYSTEM && !BR2_PACKAGE_QEMU_LINUX_USER
 	help
 	  QEMU is a generic and open source machine emulator and
 	  virtualizer.
@@ -358,4 +357,11 @@ config BR2_PACKAGE_QEMU_TOOLS
 	  Say 'y' here to include tools packaged with QEMU
 	  (e.g. qemu-img).
 
+config BR2_PACKAGE_QEMU_GUEST_AGENT
+	bool "Enable guest agent"
+	help
+	  Say 'y' here to include an agent to run on guests, which
+	  communicates with the host over a virtio-serial channel
+	  named "org.qemu.guest_agent.0".
+
 endif # BR2_PACKAGE_QEMU
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index e8a5388596..6a6905d75f 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -165,6 +165,12 @@ else
 QEMU_OPTS += --disable-tools
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_GUEST_AGENT),y)
+QEMU_OPTS += --enable-guest-agent
+else
+QEMU_OPTS += --disable-guest-agent
+endif
+
 ifeq ($(BR2_PACKAGE_LIBFUSE3),y)
 QEMU_OPTS += --enable-fuse --enable-fuse-lseek
 QEMU_DEPENDENCIES += libfuse3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
