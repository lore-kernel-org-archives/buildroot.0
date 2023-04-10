Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BACC77B61
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 15:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 408E181F63;
	Mon, 10 Apr 2023 15:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 408E181F63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VNYK4R2FeYjN; Mon, 10 Apr 2023 15:25:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DB9E81F28;
	Mon, 10 Apr 2023 15:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DB9E81F28
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C02221BF2C4
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 15:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9914440E46
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 15:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9914440E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qy7sq4ifqIMx for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 15:25:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A86C3409CB
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 15:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A86C3409CB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 920A683C6B; Mon, 10 Apr 2023 15:25:12 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 17:24:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e09a43abd1170abdeeda9ac6e89040a7f653722b
X-Git-Newrev: 36bdfd29d87d48c3519876d93738b2aae9d7cb97
X-Patchwork-Hint: ignore
Message-Id: <20230410152512.920A683C6B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-headers: use BR2_MAKE
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

commit: https://git.buildroot.net/buildroot/commit/?id=36bdfd29d87d48c3519876d93738b2aae9d7cb97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since kernel version 6.2, the minimum GNU Make version is 3.82 [1]. We
have an optional host-make 4.0 minimum dependency, so we can use it as
is. It's a bit unfortunate that we have to apply this even to older
kernel versions, but make itself builds fairly fast compared to the
toolchain (which is the only reason to build linux-headers).

Use BR2_MAKE for linux-headers, and depend on BR2_MAKE_HOST_DEPENDENCY.

Signed-off-by: Oleg Lyovin <ovlevin@sberdevices.ru>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/linux-headers/linux-headers.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index e2a0b7a7c9..b4b5a5b47d 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -125,6 +125,8 @@ LINUX_HEADERS_INSTALL_STAGING = YES
 # linux-headers is part of the toolchain so disable the toolchain dependency
 LINUX_HEADERS_ADD_TOOLCHAIN_DEPENDENCY = NO
 
+LINUX_HEADERS_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY)
+
 # For some architectures (eg. Arc, Cris, Hexagon, ia64, parisc,
 # score and xtensa), the Linux buildsystem tries to call the
 # cross-compiler, although it is not needed at all.
@@ -137,7 +139,7 @@ LINUX_HEADERS_ADD_TOOLCHAIN_DEPENDENCY = NO
 # of "its" headers
 define LINUX_HEADERS_CONFIGURE_CMDS
 	(cd $(@D); \
-		$(TARGET_MAKE_ENV) $(MAKE) \
+		$(TARGET_MAKE_ENV) $(BR2_MAKE) \
 			ARCH=$(KERNEL_ARCH) \
 			HOSTCC="$(HOSTCC)" \
 			HOSTCFLAGS="$(HOSTCFLAGS)" \
@@ -148,7 +150,7 @@ endef
 
 define LINUX_HEADERS_INSTALL_STAGING_CMDS
 	(cd $(@D); \
-		$(TARGET_MAKE_ENV) $(MAKE) \
+		$(TARGET_MAKE_ENV) $(BR2_MAKE) \
 			ARCH=$(KERNEL_ARCH) \
 			HOSTCC="$(HOSTCC)" \
 			HOSTCFLAGS="$(HOSTCFLAGS)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
