Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF468D597B0
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 16:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1E42405E9;
	Wed, 13 Nov 2024 16:49:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3SVJGx8Yo4O7; Wed, 13 Nov 2024 16:49:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54A2E405EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54A2E405EB;
	Wed, 13 Nov 2024 16:49:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E27D1531
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 16:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70B964059E
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 16:48:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QgyBSmytJmdy for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 16:48:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EF954057E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EF954057E
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 16:48:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B1CA8630B; Wed, 13 Nov 2024 16:48:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Nov 2024 17:17:19 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 9a8e12341158b826a714aa0f43eb714fe787744d
X-Git-Newrev: 43f9594c879361c5dfe8d974ba36e9db2f07e69f
X-Patchwork-Hint: ignore
Message-Id: <20241113164856.4B1CA8630B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/libpng: fix arm
 soft-float build
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

commit: https://git.buildroot.net/buildroot/commit/?id=43f9594c879361c5dfe8d974ba36e9db2f07e69f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Bumping libpng to 1.6.44 with buildroot commit
583bb434ffe1eec0dbf6887dd719c3f41a6253e9
causes a build failure on arm because the NEON code is only available
for softfp and hardfp ABIs, and not soft-float.

Fixes:
http://autobuild.buildroot.net/results/021/02158525203d8c7f16a4a32637d44d6c87b7f333/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Co-authored-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a100286aa1eff05db57230eceebbb6aa79c63d1a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpng/libpng.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 3e7fc42d82..9761993d79 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -17,7 +17,9 @@ HOST_LIBPNG_DEPENDENCIES = host-pkgconf host-zlib
 LIBPNG_CONFIG_SCRIPTS = libpng$(LIBPNG_SERIES)-config libpng-config
 LIBPNG_CONF_OPTS = --disable-tools
 
-ifeq ($(BR2_ARM_CPU_HAS_NEON)$(BR2_aarch64),y)
+ifeq ($(BR2_aarch64),y)
+LIBPNG_CONF_OPTS += --enable-arm-neon
+else ifeq ($(BR2_ARM_CPU_HAS_NEON):$(BR2_ARM_SOFT_FLOAT),y:)
 LIBPNG_CONF_OPTS += --enable-arm-neon
 else
 LIBPNG_CONF_OPTS += --disable-arm-neon
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
