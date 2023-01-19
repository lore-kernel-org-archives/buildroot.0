Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63539C00A5A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 12:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1D5860ECE;
	Thu, 19 Jan 2023 12:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1D5860ECE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l2Wh14J0FAmv; Thu, 19 Jan 2023 12:39:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15A1260C34;
	Thu, 19 Jan 2023 12:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15A1260C34
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 139C41BF2C8
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 12:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2CC88140A
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 12:39:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2CC88140A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YVKhV-kEmKTL for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 12:39:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B15B813C0
Received: from mail.xogium.me (mail.xogium.me [107.167.81.91])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B15B813C0
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 12:39:23 +0000 (UTC)
Received: from ganimede.. (2a02-8428-324d-2201-5ccf-c338-3098-6959.rev.sfr.net
 [IPv6:2a02:8428:324d:2201:5ccf:c338:3098:6959])
 by mail.xogium.me (Postfix) with ESMTPSA id 293D7F40214;
 Thu, 19 Jan 2023 07:39:22 -0500 (EST)
From: Casey Reeves <casey@xogium.me>
To: buildroot@buildroot.org
Date: Thu, 19 Jan 2023 13:10:04 +0100
Message-Id: <20230119121004.3416962-3-casey@xogium.me>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119121004.3416962-1-casey@xogium.me>
References: <20230119121004.3416962-1-casey@xogium.me>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=xogium.me; s=xogium-mail; t=1674131962;
 bh=L9fxOhK2Mfo3JhwvPzDdDDIC4LUgPqtcEU1sDrmVQ14=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=WK65o45kS2xDiD9Ca8VYTN1gHSq44aXIcLshAMTKjG1W48kNWncLnqsw3fIPYQv8w
 k37Cb6w7Dj2d9Fhp32xnhbqpKfVExG8/z11R1SK9ySPJf7EY6O5bXPxkLDf7XP4sru
 BJMToUKjnr0A6mDzuv6M0bmTvO5P3ULtdGFclvDxJh1kvYREgAM5xrmw3S6byo26w3
 npCiIAfMTtGE4k7gqVuekskKcmMctjJveeMxkN8t70Lvbu2ORdnboqxPeelxIRu3qn
 0EZdm/l+HSul3bdFCCH6sf2e5Z0BC2macHqioZDfTMDVHhKGC9fGPFH4Wc4J5hamI5
 /JKmW3jZsqbmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=xogium.me header.i=@xogium.me
 header.a=rsa-sha256 header.s=xogium-mail header.b=WK65o45k
Subject: [Buildroot] [PATCH 2/2] boot/barebox: pass required environment
 variables for reproducible build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Barebox makes use of the same variables as the linux kernel does for
handling reproducible build -- KBUILD_BUILD_HOST,
KBUILD_BUILD_TIMESTAMP, KBUILD_BUILD_USER. This patch sets the proper
variables based on linux/linux.mk, and passes them to the make
invocation when building, to ensure a reproducible build is possible
when BR2_REPRODUCIBLE is enabled.

Signed-off-by: Casey Reeves <casey@xogium.me>
---
 boot/barebox/barebox.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index da151d3c25..90be8c1ecc 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -74,6 +74,13 @@ endif
 $(1)_MAKE_FLAGS = ARCH=$$($(1)_ARCH) CROSS_COMPILE="$$(TARGET_CROSS)"
 $(1)_MAKE_ENV = $$(TARGET_MAKE_ENV)
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+$(1)_MAKE_ENV += \
+	KBUILD_BUILD_USER=buildroot \
+	KBUILD_BUILD_HOST=buildroot \
+	KBUILD_BUILD_TIMESTAMP="$(shell LC_ALL=C date -d @$(SOURCE_DATE_EPOCH))"
+endif
+
 ifeq ($$(BR2_TARGET_$(1)_USE_DEFCONFIG),y)
 $(1)_KCONFIG_DEFCONFIG = $$(call qstrip,$$(BR2_TARGET_$(1)_BOARD_DEFCONFIG))_defconfig
 else ifeq ($$(BR2_TARGET_$(1)_USE_CUSTOM_CONFIG),y)
@@ -121,7 +128,7 @@ endef
 
 define $(1)_BUILD_CMDS
 	$$($(1)_BUILD_BAREBOXENV_CMDS)
-	$$(TARGET_MAKE_ENV) $$(MAKE) $$($(1)_MAKE_FLAGS) -C $$(@D)
+	$$($(1)_MAKE_ENV) $$(MAKE) $$($(1)_MAKE_FLAGS) -C $$(@D)
 	$$($(1)_BUILD_CUSTOM_ENV)
 endef
 
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
