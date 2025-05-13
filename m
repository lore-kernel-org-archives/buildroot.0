Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AB3C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0AD870D67;
	Mon, 19 May 2025 11:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7jw4xF5fVai; Mon, 19 May 2025 11:00:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51A3D70D56
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51A3D70D56;
	Mon, 19 May 2025 11:00:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 83F92D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0007441776
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sjQWaXEY88lt for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FC004156D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FC004156D
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DF9682A2E; Mon, 19 May 2025 10:40:02 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 13 May 2025 22:09:52 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4dfe97dde426c8419ad137e4ee6e92b1857af066
X-Git-Newrev: 999fb19d4b09c9ced3425668b7c3a12a9dd88b87
X-Patchwork-Hint: ignore
Message-Id: <20250519104002.7DF9682A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/unixodbc: fix build
 with gcc-15.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=999fb19d4b09c9ced3425668b7c3a12a9dd88b87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Inspired by
https://gitweb.gentoo.org/repo/gentoo.git/commit/dev-db/unixODBC?id=b5629b3aefd8633d378beea7e955d66ce709bebe

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/unixodbc/unixodbc.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/unixodbc/unixodbc.mk b/package/unixodbc/unixodbc.mk
index 28f1e5bc94..302b964a44 100644
--- a/package/unixodbc/unixodbc.mk
+++ b/package/unixodbc/unixodbc.mk
@@ -12,6 +12,12 @@ UNIXODBC_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (programs)
 UNIXODBC_LICENSE_FILES = COPYING exe/COPYING
 UNIXODBC_CPE_ID_VENDOR = unixodbc
 
+# gcc-15 defaults to -std=gnu23 which introduces build failures.
+# We force "-std=gnu17" for gcc version supporting it. Earlier gcc
+# versions will work, since they are using the older standard.
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
+UNIXODBC_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu17"
+endif
 UNIXODBC_CONF_OPTS = --enable-drivers --enable-driver-conf
 
 ifeq ($(BR2_PACKAGE_LIBEDIT),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
