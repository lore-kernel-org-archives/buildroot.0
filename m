Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61835C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 07:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 095244099F;
	Wed, 27 Jul 2022 07:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 095244099F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ouI6La5YIECl; Wed, 27 Jul 2022 07:41:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE45D40996;
	Wed, 27 Jul 2022 07:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE45D40996
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE67E1BF3A0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA8EB81454
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:41:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA8EB81454
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rqh7QeeWoP4U for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 07:41:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1F3C818AC
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 07:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1F3C818AC
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 54CFD8644C; Wed, 27 Jul 2022 07:27:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 09:41:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55106a056e09cbb1c16c561c41ba160464305c62
X-Git-Newrev: 94ab3132cc232f70d1770bcf263e44d2cfa6f6ae
X-Patchwork-Hint: ignore
Message-Id: <20220727072744.54CFD8644C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: simplify alsa-lib
 feature selection
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=94ab3132cc232f70d1770bcf263e44d2cfa6f6ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of having the user need to figure out that 2 alsa-lib features
are needed for pipewire ALSA support, have the top-level pulseaudio
option select the relevant alsa-lib features, when alsa-lib is enabled
as already done for pulseaudio in commit
97cd3680a4cc4bc0c71bccccb1459eda4b880159

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pipewire/Config.in   | 2 ++
 package/pipewire/pipewire.mk | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
index 3bfcf42a81..f038291e87 100644
--- a/package/pipewire/Config.in
+++ b/package/pipewire/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_PIPEWIRE
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_setname_np()
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	select BR2_PACKAGE_ALSA_LIB_UCM if BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_SEQ if BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO if BR2_PACKAGE_BLUEZ5_UTILS # runtime
 	help
 	  PipeWire is a server and user space API to deal with
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index ecfb6c0ae2..790d9c8d9f 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -77,7 +77,7 @@ endif
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 PIPEWIRE_CONF_OPTS += -Dpipewire-alsa=enabled
 PIPEWIRE_DEPENDENCIES += alsa-lib
-ifeq ($(BR2_PACKAGE_ALSA_LIB_SEQ)$(BR2_PACKAGE_ALSA_LIB_UCM)$(BR2_PACKAGE_HAS_UDEV),yyy)
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 PIPEWIRE_CONF_OPTS += -Dalsa=enabled
 else
 PIPEWIRE_CONF_OPTS += -Dalsa=disabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
