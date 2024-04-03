Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAF9CD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0C35415AF;
	Wed,  3 Apr 2024 19:56:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gx1aioSlXosh; Wed,  3 Apr 2024 19:55:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BEA9417E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BEA9417E5;
	Wed,  3 Apr 2024 19:55:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2860D1BF4D5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2295F607C2
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:55:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wsVMkzT5FyRd for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:55:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FED46073E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FED46073E
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:55:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E28784773; Wed,  3 Apr 2024 19:55:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 3 Apr 2024 21:54:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f387594730a7a5048d5d6079935af4abab60e384
X-Git-Newrev: 09c882573cea6e18d98bea3132bf4e0b566a042a
X-Patchwork-Hint: ignore
Message-Id: <20240403195557.5E28784773@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lighttpd: add optional dependency
 to libxcrypt
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

commit: https://git.buildroot.net/buildroot/commit/?id=09c882573cea6e18d98bea3132bf4e0b566a042a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When glibc was bumped to version 2.39 in commit
b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
libcrypt support.

As glibc's libcrypt was providing lighttpd's libcrypt dependency this
broke the lighttpd build using glibc version 2.39.

To fix this select the libxcrypt dependency to lighttpd when using a
glibc toolchain and add the dependency if selected.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lighttpd/Config.in   | 1 +
 package/lighttpd/lighttpd.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 5d9e624506..66532d7dd5 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIGHTTPD
 	bool "lighttpd"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_XXHASH
 	help
 	  lighttpd a secure, fast, compliant and very flexible
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 5109e3cebb..be8eda6b8d 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -30,6 +30,10 @@ LIGHTTPD_CONF_OPTS = \
 	-Dbuild_static=false \
 	-Dmoduledir=lib/lighttpd
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+LIGHTTPD_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_BROTLI),y)
 LIGHTTPD_DEPENDENCIES += brotli
 LIGHTTPD_CONF_OPTS += -Dwith_brotli=enabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
