Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D353CC636D7
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 21:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86CD740CB4;
	Tue, 21 Feb 2023 21:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86CD740CB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id POQPm44sC8Iu; Tue, 21 Feb 2023 21:01:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C408B404E9;
	Tue, 21 Feb 2023 21:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C408B404E9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A598D1BF8C7
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 21:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F24341849
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 21:00:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F24341849
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AxsGDcJPGtie for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 21:00:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D5B841841
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 21:00:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D5B841841
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29A158667C; Tue, 21 Feb 2023 21:00:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 21:48:49 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 02ea469db39bb3774093cbcf5c327873febeb0f6
X-Git-Newrev: c42880d994c3162efdd583d4a6097538cd185eb3
X-Patchwork-Hint: ignore
Message-Id: <20230221210052.29A158667C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] boot/barebox: pass
 required environment variables for reproducible build
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

commit: https://git.buildroot.net/buildroot/commit/?id=c42880d994c3162efdd583d4a6097538cd185eb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Barebox makes use of the same variables as the linux kernel does for
handling reproducible build -- KBUILD_BUILD_HOST,
KBUILD_BUILD_TIMESTAMP, KBUILD_BUILD_USER. This patch sets the proper
variables based on linux/linux.mk, and passes them to the make
invocation when building, to ensure a reproducible build is possible
when BR2_REPRODUCIBLE is enabled.

Signed-off-by: Casey Reeves <casey@xogium.me>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c90bd74ebb264ccc925f10a142ccd82ef63a4601)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/barebox/barebox.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 6506294d6d..05629bb4e3 100644
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
