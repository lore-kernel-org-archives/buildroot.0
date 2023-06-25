Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86423EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 19:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F8DB612A1;
	Sun, 25 Jun 2023 19:37:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F8DB612A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iFyOmJPGK3zM; Sun, 25 Jun 2023 19:37:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F2CF612C0;
	Sun, 25 Jun 2023 19:37:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F2CF612C0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 223E61BF3A4
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33940612C5
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:37:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33940612C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EztOGvXxGJCN for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 19:37:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 549036125C
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 19:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 549036125C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4051984DF2; Sun, 25 Jun 2023 19:37:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 21:34:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52ae2a4e1d10da4ea46bc730db69a40d79eb835a
X-Git-Newrev: 9d58b525fcfd0d92fcdd3c66d7858213c4b139c6
X-Patchwork-Hint: ignore
Message-Id: <20230625193715.4051984DF2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcgroup: allow to build with
 musl and uClibc
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9d58b525fcfd0d92fcdd3c66d7858213c4b139c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libcgroup depends on fts API which is missing in musl and uClibc
and provided by musl-fts package.

This patch makes libcgroup dependent on musl-fts for
non-glibc configurations.

Signed-off-by: Oleg Lyovin <ovlevin@sberdevices.ru>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/libcgroup/Config.in    | 7 +++----
 package/libcgroup/libcgroup.mk | 4 ++++
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/libcgroup/Config.in b/package/libcgroup/Config.in
index 03efa71e6b..546b5f3560 100644
--- a/package/libcgroup/Config.in
+++ b/package/libcgroup/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_LIBCGROUP
 	bool "libcgroup"
 	depends on BR2_INSTALL_LIBSTDCPP
-	# libcgroup uses <fts.h> which is not included by default in uClibc
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  libcgroup is a library that abstracts the control
 	  group file system in Linux.
@@ -18,5 +17,5 @@ config BR2_PACKAGE_LIBCGROUP_TOOLS
 
 endif
 
-comment "libcgroup needs a glibc toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC
+comment "libcgroup needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
\ No newline at end of file
diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
index fb0b646c51..e3de48c561 100644
--- a/package/libcgroup/libcgroup.mk
+++ b/package/libcgroup/libcgroup.mk
@@ -36,4 +36,8 @@ else
 LIBCGROUP_CONF_OPTS += --disable-pam
 endif
 
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
+LIBCGROUP_DEPENDENCIES += musl-fts
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
