Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0743AD68B33
	for <buildroot@archiver.kernel.org>; Thu, 14 Nov 2024 16:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB95E60A57;
	Thu, 14 Nov 2024 16:25:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tSXNIQZp-Q9s; Thu, 14 Nov 2024 16:25:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5040606CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5040606CA;
	Thu, 14 Nov 2024 16:25:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DDA11ED5
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 16:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EC8640771
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 16:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bURqJOeI8eMO for <buildroot@buildroot.org>;
 Thu, 14 Nov 2024 16:25:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C4D240741
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C4D240741
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 16:25:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 34EA7863D6; Thu, 14 Nov 2024 16:25:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Nov 2024 16:51:22 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: efd6528e308a48802de1a35ecde7d310080b6e05
X-Git-Newrev: 1d8cf02e88e212cf4c7bc9b18ccdc582a5edb95b
X-Patchwork-Hint: ignore
Message-Id: <20241114162544.34EA7863D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] Revert "package/libpng:
 fix arm soft-float build"
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

commit: https://git.buildroot.net/buildroot/commit/?id=1d8cf02e88e212cf4c7bc9b18ccdc582a5edb95b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

This reverts commit 4875dbed58837174780e3f7c6ec7ef419fdbe9fe.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpng/libpng.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 9761993d79..3e7fc42d82 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -17,9 +17,7 @@ HOST_LIBPNG_DEPENDENCIES = host-pkgconf host-zlib
 LIBPNG_CONFIG_SCRIPTS = libpng$(LIBPNG_SERIES)-config libpng-config
 LIBPNG_CONF_OPTS = --disable-tools
 
-ifeq ($(BR2_aarch64),y)
-LIBPNG_CONF_OPTS += --enable-arm-neon
-else ifeq ($(BR2_ARM_CPU_HAS_NEON):$(BR2_ARM_SOFT_FLOAT),y:)
+ifeq ($(BR2_ARM_CPU_HAS_NEON)$(BR2_aarch64),y)
 LIBPNG_CONF_OPTS += --enable-arm-neon
 else
 LIBPNG_CONF_OPTS += --disable-arm-neon
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
