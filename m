Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE34C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F6DA8420E;
	Mon, 19 May 2025 10:50:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wejQOmhixvSr; Mon, 19 May 2025 10:50:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98A6F84208
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98A6F84208;
	Mon, 19 May 2025 10:50:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17973193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C76F44148F
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zvkvvZ_kV1Qq for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8286F410EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8286F410EA
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7EBEB83B63; Mon, 19 May 2025 10:39:50 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 15 Apr 2025 19:16:25 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bdb5809adfcff3a47d7117b5c856a400c7432273
X-Git-Newrev: cebfadde9ba7b26eaea51448cb425f878eb31885
X-Patchwork-Hint: ignore
Message-Id: <20250519103950.7EBEB83B63@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libv4l: disable some
 options when BR2_STATIC_LIBS
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cebfadde9ba7b26eaea51448cb425f878eb31885
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since libv4l was bumped to 1.28.1 and converted to use the meson build
system in Buildroot commit 41ce1cc690b0837a1822079317bf317ddaeac17b,
the build started failing on BR2_STATIC_LIBS=y configurations due to
compiling code that isn't compatible with static linking.

This commit fixes that by disabling the plugin code and the wrappers.

Fixes:

  https://autobuild.buildroot.org/results/89c6c7c0fd991d777ac7cd2b2322424099fa89cc/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libv4l/libv4l.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index e8bcc2bdfc..a535b8e8a6 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -16,6 +16,10 @@ LIBV4L_LDFLAGS = $(TARGET_LDFLAGS)
 LIBV4L_LICENSE = GPL-2.0+ (utilities), LGPL-2.1+ (libraries)
 LIBV4L_LICENSE_FILES = COPYING COPYING.libv4l lib/libv4l1/libv4l1-kernelcode-license.txt
 
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBV4L_CONF_OPTS += -Dv4l-plugins=false -Dv4l-wrappers=false
+endif
+
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 LIBV4L_DEPENDENCIES += alsa-lib
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
