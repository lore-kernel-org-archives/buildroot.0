Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40993CD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1072C418B7;
	Wed,  3 Apr 2024 19:56:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s9bNqVnlZVCS; Wed,  3 Apr 2024 19:56:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7472418BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7472418BD;
	Wed,  3 Apr 2024 19:56:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 35A2F1BF983
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2278C40490
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:55:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ywpHGd6Uu4Mg for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:55:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50C5E40437
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50C5E40437
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:55:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CDB284776; Wed,  3 Apr 2024 19:55:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 3 Apr 2024 21:54:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2402e0f1d31327806422692db6523120227bc5b0
X-Git-Newrev: cbd22bacff2a1d08e9850cd272e3ca97815ce27a
X-Patchwork-Hint: ignore
Message-Id: <20240403195557.3CDB284776@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dovecot: add optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=cbd22bacff2a1d08e9850cd272e3ca97815ce27a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When glibc was bumped to version 2.39 in commit
b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
libcrypt support.

As glibc's libcrypt was providing dovecot's libcrypt dependency this
broke the dovecot build using glibc version 2.39.

To fix this select the libxcrypt dependency to dovecot when using a
glibc toolchain and add the dependency if selected.

Fixes:
http://autobuild.buildroot.net/results/99d816fb7a033ec73a958200041f0dcd728e0e87/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dovecot/Config.in  | 1 +
 package/dovecot/dovecot.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/dovecot/Config.in b/package/dovecot/Config.in
index 20b08b62be..c94421526f 100644
--- a/package/dovecot/Config.in
+++ b/package/dovecot/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_DOVECOT
 	bool "dovecot"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index f90996fdd7..b8652900d0 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -73,6 +73,10 @@ else
 DOVECOT_CONF_OPTS += --without-sodium
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+DOVECOT_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 DOVECOT_CONF_OPTS += --with-pam
 DOVECOT_DEPENDENCIES += linux-pam
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
