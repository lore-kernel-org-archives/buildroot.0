Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE371E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 21:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E6C680B6C;
	Sun, 29 Dec 2024 21:49:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z5yWko--q836; Sun, 29 Dec 2024 21:49:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A772980B70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A772980B70;
	Sun, 29 Dec 2024 21:49:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 81A62CA
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B51E608A2
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:49:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WueZqyqgrM7C for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 21:49:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91E9060894
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91E9060894
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:49:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83B448774F; Sun, 29 Dec 2024 21:49:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 22:49:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e14380b3c4c3d5e037662c45b2cf90056056920a
X-Git-Newrev: 073ea145df6e6c55427d6c8bf576622b5db19a53
X-Patchwork-Hint: ignore
Message-Id: <20241229214954.83B448774F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opkg: add optional libsolv
 dependency
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
