Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76563CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3522418C3;
	Wed,  3 Apr 2024 19:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fJ4pdSjALi2g; Wed,  3 Apr 2024 19:56:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9ABD5418D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ABD5418D5;
	Wed,  3 Apr 2024 19:56:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 52A0B1BF4D5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BDC282279
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:55:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Hn2Sbl2716U for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:55:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 818D582281
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 818D582281
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:55:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E52D84777; Wed,  3 Apr 2024 19:55:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 3 Apr 2024 21:54:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 330cb457feb3e380184ceec4553c1286aa894947
X-Git-Newrev: 3807f906c9c6d370586ef65503b54cb1f21d7b74
X-Patchwork-Hint: ignore
Message-Id: <20240403195557.7E52D84777@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sysvinit: add optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=3807f906c9c6d370586ef65503b54cb1f21d7b74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When glibc was bumped to version 2.39 in commit
b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
libcrypt support.

As glibc's libcrypt was providing sysvinit's libcrypt dependency this
broke the sysvinit build using glibc version 2.39.

To fix this select the libxcrypt dependency to sysvinit when using a
glibc toolchain and add the dependency if selected.

Fixes:
http://autobuild.buildroot.net/results/3a9/3a99389bd7b6db7f9467b34c7bead1d58ce5a18d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sysvinit/Config.in   | 1 +
 package/sysvinit/sysvinit.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/sysvinit/Config.in b/package/sysvinit/Config.in
index 7f27a70fcc..e5ca1d7f2d 100644
--- a/package/sysvinit/Config.in
+++ b/package/sysvinit/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_SYSVINIT
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INIT_SYSV
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  System V style implementation of /sbin/init, parent of all
 	  processes
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 49c92ec2ac..7f37cea131 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -18,6 +18,10 @@ SYSVINIT_DEPENDENCIES += libselinux
 SYSVINIT_MAKE_OPTS += WITH_SELINUX="yes"
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+SYSVINIT_DEPENDENCIES += libxcrypt
+endif
+
 define SYSVINIT_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(SYSVINIT_MAKE_OPTS) -C $(@D)/src
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
