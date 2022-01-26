Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBB4C2BA4C
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 20:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC765400C7;
	Wed, 26 Jan 2022 20:05:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VPc08hFIULPE; Wed, 26 Jan 2022 20:05:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA1D74016D;
	Wed, 26 Jan 2022 20:05:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 320C01BF5A0
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2101A4178C
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:05:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ejsza-dsujnS for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 20:05:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64A1441789
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 20:05:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 191DD81503; Wed, 26 Jan 2022 19:58:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 20:59:47 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: b5037ecffd5d42771ece111a220e011fec547764
X-Git-Newrev: bf791f4051576d7175dd63db5c14320ed5cbca4c
X-Patchwork-Hint: ignore
Message-Id: <20220126195820.191DD81503@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/pipewire: fix
 avahi build
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf791f4051576d7175dd63db5c14320ed5cbca4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Fix the following build failure raised since commit
27908c6eab768d0b9fd3444a929b3f1b1510da71:

../output-1/build/pipewire-0.3.40/meson.build:348:0: ERROR: Dependency "avahi-client" not found, tried pkgconfig

Fixes:
 - http://autobuild.buildroot.org/results/d1707ad82159aafbddb69c503109bf2e830f0f29

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit f5131f6f28e384eb9dca1b11f571536e38d3ee9d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pipewire/pipewire.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index efda3ad695..7043745cc1 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -82,7 +82,8 @@ else
 PIPEWIRE_CONF_OPTS += -Dalsa=disabled -Dpipewire-alsa=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_AVAHI),y)
+# avahi support needs avahi-client, which needs avahi-daemon and dbus
+ifeq ($(BR2_PACKAGE_AVAHI)$(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yyy)
 PIPEWIRE_CONF_OPTS += -Davahi=enabled
 PIPEWIRE_DEPENDENCIES += avahi
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
