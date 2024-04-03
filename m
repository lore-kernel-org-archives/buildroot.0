Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF594CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4CE641B26;
	Wed,  3 Apr 2024 19:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ha77bUJ-jCML; Wed,  3 Apr 2024 19:56:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 618A941B19
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 618A941B19;
	Wed,  3 Apr 2024 19:56:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D1FB1BF982
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54C586073E
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:55:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c5rXpihlir9Q for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:55:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D99560751
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D99560751
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:55:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68FAB84776; Wed,  3 Apr 2024 19:55:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 3 Apr 2024 21:54:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 09c882573cea6e18d98bea3132bf4e0b566a042a
X-Git-Newrev: 9a5495b9160de730e43dd2a1b0fec0a974c7cae0
X-Patchwork-Hint: ignore
Message-Id: <20240403195557.68FAB84776@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pure-ftpd: add optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a5495b9160de730e43dd2a1b0fec0a974c7cae0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When glibc was bumped to version 2.39 in commit
b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
libcrypt support.

As glibc's libcrypt was providing pure-ftpd's libcrypt dependency this
broke the pure-ftpd build using glibc version 2.39.

To fix this select the libxcrypt dependency to pure-ftpd when using a
glibc toolchain and add the dependency if selected.

Fixes:
http://autobuild.buildroot.net/results/2a62f48973b30873f4da842e75176633398bef86/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pure-ftpd/Config.in    | 1 +
 package/pure-ftpd/pure-ftpd.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/pure-ftpd/Config.in b/package/pure-ftpd/Config.in
index c060102650..edfe0159e3 100644
--- a/package/pure-ftpd/Config.in
+++ b/package/pure-ftpd/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PURE_FTPD
 	bool "pure-ftpd"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Pure-FTPd is a free (BSD), secure, production-quality and
 	  standard- conformant FTP server. It doesn't provide useless
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index b918c70930..2c01bc8804 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -30,6 +30,10 @@ ifeq ($(BR2_PACKAGE_LIBSODIUM),y)
 PURE_FTPD_DEPENDENCIES += libsodium
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+PURE_FTPD_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_MARIADB),y)
 PURE_FTPD_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr
 PURE_FTPD_DEPENDENCIES += mariadb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
