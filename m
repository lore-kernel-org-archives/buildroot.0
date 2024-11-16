Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B9BD68BE5
	for <buildroot@archiver.kernel.org>; Sat, 16 Nov 2024 09:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD3AB612DC;
	Sat, 16 Nov 2024 09:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vyz1h8WOQtOp; Sat, 16 Nov 2024 09:49:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4F95612E2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4F95612E2;
	Sat, 16 Nov 2024 09:49:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AC83B1EB8
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 09:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B735612E2
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 09:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IDaz7VXtQQuB for <buildroot@buildroot.org>;
 Sat, 16 Nov 2024 09:49:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6496612DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6496612DC
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 09:49:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C26A78638D; Sat, 16 Nov 2024 09:49:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 16 Nov 2024 10:48:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0416ae0ed5853cd7da4b34e9f8cd17baabf503f0
X-Git-Newrev: 54cfff355c4011f3f049dc49bbac24ab66f905ea
X-Patchwork-Hint: ignore
Message-Id: <20241116094926.C26A78638D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpng: fix arm build with NEON
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

commit: https://git.buildroot.net/buildroot/commit/?id=54cfff355c4011f3f049dc49bbac24ab66f905ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/52c/52c974e70f922e9d7efea4c538e4438a22faa846/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Co-authored-by: Peter Korsgaard <peter@korsgaard.com>
[https://lists.buildroot.org/pipermail/buildroot/2024-November/767661.html]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpng/libpng.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 9761993d79..c0b3ad24d5 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -16,10 +16,12 @@ LIBPNG_DEPENDENCIES = host-pkgconf zlib
 HOST_LIBPNG_DEPENDENCIES = host-pkgconf host-zlib
 LIBPNG_CONFIG_SCRIPTS = libpng$(LIBPNG_SERIES)-config libpng-config
 LIBPNG_CONF_OPTS = --disable-tools
+LIBPNG_CFLAGS = $(TARGET_CFLAGS)
 
 ifeq ($(BR2_aarch64),y)
 LIBPNG_CONF_OPTS += --enable-arm-neon
 else ifeq ($(BR2_ARM_CPU_HAS_NEON):$(BR2_ARM_SOFT_FLOAT),y:)
+LIBPNG_CFLAGS += -mfpu=neon
 LIBPNG_CONF_OPTS += --enable-arm-neon
 else
 LIBPNG_CONF_OPTS += --disable-arm-neon
@@ -31,5 +33,8 @@ else
 LIBPNG_CONF_OPTS += --disable-intel-sse
 endif
 
+LIBPNG_CONF_ENV = \
+	CFLAGS="$(LIBPNG_CFLAGS)"
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
