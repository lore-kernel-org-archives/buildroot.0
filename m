Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD112C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB47181332;
	Fri, 28 Feb 2025 16:49:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lh34ZHEetIAa; Fri, 28 Feb 2025 16:49:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B296A81348
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B296A81348;
	Fri, 28 Feb 2025 16:49:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 179D71DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A56F426F7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uYAZacMpgJrX for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B31FA42592
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B31FA42592
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A69AB82215; Fri, 28 Feb 2025 16:29:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 22:49:34 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e14380b3c4c3d5e037662c45b2cf90056056920a
X-Git-Newrev: 073ea145df6e6c55427d6c8bf576622b5db19a53
X-Patchwork-Hint: ignore
Message-Id: <20250228162953.A69AB82215@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/opkg: add optional
 libsolv dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=073ea145df6e6c55427d6c8bf576622b5db19a53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

opkg configure script supports the --with-libsolv option since v0.3.2.
See [1].

Note that the opkg internal satisfaction solver is beeing deprecated
as of v0.7.0. See the note in changelog [2].

[1] https://git.yoctoproject.org/opkg/commit?id=bc2d3413e7dd61dd0001cc30b7785880c26eada4
[2] https://git.yoctoproject.org/opkg/tree/CHANGELOG.md?h=v0.7.0#n12

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opkg/opkg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index 4922d8fc0f..42cd0956cd 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -44,6 +44,13 @@ else
 OPKG_CONF_OPTS += --disable-bzip2
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSOLV),y)
+OPKG_DEPENDENCIES += libsolv
+OPKG_CONF_OPTS += --with-libsolv
+else
+OPKG_CONF_OPTS += --without-libsolv
+endif
+
 ifeq ($(BR2_PACKAGE_LZ4),y)
 OPKG_DEPENDENCIES += lz4
 OPKG_CONF_OPTS += --enable-lz4
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
