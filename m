Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A915AC5AD49
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 19:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 636EF40A9B;
	Wed, 28 May 2025 19:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MdjZwFiZBosZ; Wed, 28 May 2025 19:52:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B6CB40AFC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B6CB40AFC;
	Wed, 28 May 2025 19:52:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D18B8127
 for <buildroot@buildroot.org>; Wed, 28 May 2025 19:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C364C60EEF
 for <buildroot@buildroot.org>; Wed, 28 May 2025 19:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Q4gBfFiUvzC for <buildroot@buildroot.org>;
 Wed, 28 May 2025 19:52:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12D0A60EED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12D0A60EED
 for <buildroot@buildroot.org>; Wed, 28 May 2025 19:52:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0236B87757; Wed, 28 May 2025 19:52:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 May 2025 21:52:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7d11b87d40057ddd298ee9ac84f7f57fc83107b
X-Git-Newrev: 4e7ac190e28417e44f05575ad3c616cb8e301292
X-Patchwork-Hint: ignore
Message-Id: <20250528195252.0236B87757@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sane-airscan: propagate
 dependencies of selects
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e7ac190e28417e44f05575ad3c616cb8e301292
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the sane-airscan package was introduced in
f78280bf262ceb1c1abbdade9de77fcc4add74ae, the depends on of options
that is selects were not properly accounted for, so let's fix this.

Fixes:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_GNUTLS
  Depends on [n]: !BR2_STATIC_LIBS [=n] && BR2_USE_WCHAR [=n]
  Selected by [y]:
  - BR2_PACKAGE_SANE_AIRSCAN [=y]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sane-airscan/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/sane-airscan/Config.in b/package/sane-airscan/Config.in
index f35e244ea6..b7cf224741 100644
--- a/package/sane-airscan/Config.in
+++ b/package/sane-airscan/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_SANE_AIRSCAN
 	bool "sane-airscan"
+	depends on !BR2_STATIC_LIBS # avahi, gnutls, sane-backends
+	depends on BR2_TOOLCHAIN_HAS_THREADS # avahi, dbus
+	depends on BR2_USE_WCHAR # avahi, gnutls
+	depends on BR2_USE_MMU # dbus, sane-backends
 	select BR2_PACKAGE_AVAHI
 	select BR2_PACKAGE_AVAHI_DAEMON # needed to get avahi-client
 	select BR2_PACKAGE_DBUS # needed by avahi to get avahi-client
@@ -18,3 +22,8 @@ config BR2_PACKAGE_SANE_AIRSCAN
 	  support "driverless" scanning.
 
 	  https://github.com/alexpevzner/sane-airscan
+
+comment "sane-airscan needs a toolchain w/ wchar, dynamic library, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
