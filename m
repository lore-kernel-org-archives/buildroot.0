Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1408C433F5
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 13:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 484C04052A;
	Wed,  1 Jun 2022 13:24:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zRUJkIwGWazz; Wed,  1 Jun 2022 13:24:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F121401A0;
	Wed,  1 Jun 2022 13:24:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB72F1BF3E1
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 13:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA13061062
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 13:24:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u-s81d1OPKvS for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 13:24:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E03FE60C27
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 13:24:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2200B868B0; Wed,  1 Jun 2022 13:13:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Jun 2022 15:24:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1917fe29839c79f92e0a1e307768356c0076b62b
X-Git-Newrev: 6a1331ba01b146f4c3a29e0d604e92cf676a46f8
X-Patchwork-Hint: ignore
Message-Id: <20220601131306.2200B868B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: needs iconv.h
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6a1331ba01b146f4c3a29e0d604e92cf676a46f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

samba4 needs iconv.h since bump to version 4.15.3 in commit
d33ad03e75b89feb97a7edeba3156fa2ac417b06 and
https://gitlab.com/samba-team/samba/-/commit/fc51b38ed8b7ff239db82d4d2d52f6332910ca97:

../../source3/lib/netapi/examples/common.c:13:10: fatal error: iconv.h: No such file or directory
   13 | #include <iconv.h>
      |          ^~~~~~~~~

Strangely enough, there is no autobuilder failures.

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14821

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/samba4/Config.in | 1 +
 package/samba4/samba4.mk | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index e114a7e13f..5907bdc478 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_SAMBA4
 	select BR2_PACKAGE_CMOCKA
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_ZLIB
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index df3a7e58c8..c90fdd006c 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -39,6 +39,11 @@ else
 SAMBA4_CONF_OPTS += --disable-python
 endif
 
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+SAMBA4_DEPENDENCIES += libiconv
+SAMBA4_LDFLAGS += -liconv
+endif
+
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 SAMBA4_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
 SAMBA4_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
