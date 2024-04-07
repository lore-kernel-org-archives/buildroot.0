Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE467CD1299
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 15:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 947E2407E9;
	Sun,  7 Apr 2024 15:37:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BBO81_kiqH4x; Sun,  7 Apr 2024 15:37:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2754F407CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2754F407CD;
	Sun,  7 Apr 2024 15:37:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 121901BF2CC
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7D4360A55
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7XPxuMJoqiP7 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 15:36:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1005B608DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1005B608DE
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 15:36:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B51280FC0; Sun,  7 Apr 2024 15:36:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 17:34:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c19ab7e1cfb2c266090cb8568b4953a6ac7cf87
X-Git-Newrev: 102b0ae459cc051bbf39ebe680e65167c5de6be7
X-Patchwork-Hint: ignore
Message-Id: <20240407153657.0B51280FC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeradius-server: add libxcrypt
 optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=102b0ae459cc051bbf39ebe680e65167c5de6be7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

src/lib/missing.c:31:7: error: conflicting types for 'crypt'; have 'char *(char *, char *)'
   31 | char *crypt(UNUSED char *key, char *salt)
      |       ^~~~~
In file included from src/freeradius-devel/missing.h:60,
                 from src/freeradius-devel/libradius.h:71,
                 from src/lib/missing.c:26:
/home/buildroot/autobuild/instance-2/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/unistd.h:1162:14: note: previous declaration of 'crypt' with type 'char *(const char *, const char *)'
 1162 | extern char *crypt (const char *__key, const char *__salt)
      |              ^~~~~

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/dc45f1291245a0dadd382cea2ad41573ad976d60

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/freeradius-server/Config.in            | 1 +
 package/freeradius-server/freeradius-server.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/freeradius-server/Config.in b/package/freeradius-server/Config.in
index d51d92714d..e99778ea49 100644
--- a/package/freeradius-server/Config.in
+++ b/package/freeradius-server/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_FREERADIUS_SERVER
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBTALLOC
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  FreeRADIUS is an open source server which implements
 	  a protocol for remote user Authorization, Authentication
diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index 1e8ada6bb9..c64ae79918 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -119,6 +119,10 @@ else
 FREERADIUS_SERVER_CONF_OPTS += --without-pcap
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+FREERADIUS_SERVER_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 FREERADIUS_SERVER_CONF_OPTS += --with-rlm_pam
 FREERADIUS_SERVER_DEPENDENCIES += linux-pam
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
