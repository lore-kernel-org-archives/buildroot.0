Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB73FC2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 05:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BFAC6064B;
	Tue,  9 Jul 2024 05:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TUqWg7x3HQdK; Tue,  9 Jul 2024 05:48:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0C39606FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0C39606FF;
	Tue,  9 Jul 2024 05:48:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C0FC71BF97C
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 05:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAB044023E
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 05:48:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id deh-_wcD7C6t for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 05:48:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2F334015F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2F334015F
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 05:48:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3FF0A84293; Tue,  9 Jul 2024 05:48:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Jul 2024 07:47:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ff544cb629e4f7df293a27318a3c0bde5b46838
X-Git-Newrev: 17f607e341216d38b6d79a580cf61815313ff238
X-Patchwork-Hint: ignore
Message-Id: <20240709054835.3FF0A84293@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dovecot: needs engine support when
 built with libopenssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=17f607e341216d38b6d79a580cf61815313ff238
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit 623d3bbe43e9193aa8e3395367d01af59071b859 disables
engine support when BR2_PACKAGE_LIBOPENSSL_ENGINES is not set.

Fixes:
http://autobuild.buildroot.net/results/7484edfa0b8c45bafb8da051ca839bf174c8f93f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dovecot/Config.in b/package/dovecot/Config.in
index 034dcc175f..517040fad6 100644
--- a/package/dovecot/Config.in
+++ b/package/dovecot/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_DOVECOT
 	bool "dovecot"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
