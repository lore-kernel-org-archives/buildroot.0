Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1361C433FE
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 16:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77C8E60B74;
	Tue,  4 Jan 2022 16:47:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kIdjPTWWjBtT; Tue,  4 Jan 2022 16:47:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C205260EB8;
	Tue,  4 Jan 2022 16:47:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D1EA01BF9B2
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 16:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C12A0400FB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 16:46:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Y7HK1BWEyYS for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 16:46:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 207394015E
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 16:46:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 97B2582E21; Tue,  4 Jan 2022 16:40:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 4 Jan 2022 17:17:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53ba8d3c0e1f7d4023ff37f6aea838043466c59e
X-Git-Newrev: f5131f6f28e384eb9dca1b11f571536e38d3ee9d
X-Patchwork-Hint: ignore
Message-Id: <20220104164044.97B2582E21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: fix avahi build
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

commit: https://git.buildroot.net/buildroot/commit/?id=f5131f6f28e384eb9dca1b11f571536e38d3ee9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since commit
27908c6eab768d0b9fd3444a929b3f1b1510da71:

../output-1/build/pipewire-0.3.40/meson.build:348:0: ERROR: Dependency "avahi-client" not found, tried pkgconfig

Fixes:
 - http://autobuild.buildroot.org/results/d1707ad82159aafbddb69c503109bf2e830f0f29

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
