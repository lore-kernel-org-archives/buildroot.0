Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18505CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 08:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBABC409A6;
	Sun,  7 Apr 2024 08:52:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aGkJW7kc5rBE; Sun,  7 Apr 2024 08:52:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97CAD405C8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97CAD405C8;
	Sun,  7 Apr 2024 08:52:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A92631BF57C
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 08:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A273605E8
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 08:52:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7QlRZWwo4gXI for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 08:52:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4F4C605EB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4F4C605EB
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 08:52:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD54F84BCE; Sun,  7 Apr 2024 08:52:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 10:51:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55c4e96c1bdca0ecff5daccb149d9717e10d081d
X-Git-Newrev: 12ea11d86efa62af8f4b19cd871adf4c90981f52
X-Patchwork-Hint: ignore
Message-Id: <20240407085210.BD54F84BCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dropbear: add optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=12ea11d86efa62af8f4b19cd871adf4c90981f52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When glibc was bumped to version 2.39 in commit
b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
libcrypt support.

Due to this removal dropbear was unable to accept connections using
password authentication.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Tested-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dropbear/Config.in   | 1 +
 package/dropbear/dropbear.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
index e14a670c19..6a9161d659 100644
--- a/package/dropbear/Config.in
+++ b/package/dropbear/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_DROPBEAR
 	bool "dropbear"
 	select BR2_PACKAGE_ZLIB if !BR2_PACKAGE_DROPBEAR_SMALL
 	select BR2_PACKAGE_LIBTOMCRYPT if !BR2_PACKAGE_DROPBEAR_SMALL
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  A small SSH 2 server designed for small memory environments.
 
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 440ebd44a2..1571c5d957 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -36,6 +36,10 @@ ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 DROPBEAR_CONF_OPTS += --disable-static
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+DROPBEAR_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 define DROPBEAR_SVR_PAM_AUTH
 	echo '#define DROPBEAR_SVR_PASSWORD_AUTH 0'     >> $(@D)/localoptions.h
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
