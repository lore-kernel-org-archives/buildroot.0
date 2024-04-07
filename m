Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBEFCD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 15:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 420D340807;
	Sun,  7 Apr 2024 15:37:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yYOoBWtHOA5I; Sun,  7 Apr 2024 15:37:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44108407F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44108407F8;
	Sun,  7 Apr 2024 15:37:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B2B8E1BF954
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F56760A54
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A5oeam26kAiS for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 15:36:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC6D1608BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC6D1608BD
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 15:36:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D467A80FC0; Sun,  7 Apr 2024 15:36:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 17:34:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a9164adeecabf77a6a811dcc0e629d3d37a35f8
X-Git-Newrev: 90fc4d74ae70b2cbe50e4cfcc4a7dfcea636344c
X-Patchwork-Hint: ignore
Message-Id: <20240407153656.D467A80FC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nginx: select libxcrypt with glibc
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

commit: https://git.buildroot.net/buildroot/commit/?id=90fc4d74ae70b2cbe50e4cfcc4a7dfcea636344c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

In file included from src/core/ngx_config.h:26,
                 from src/core/nginx.c:8:
src/os/unix/ngx_linux_config.h:55:10: fatal error: crypt.h: No such file or directory
   55 | #include <crypt.h>
      |          ^~~~~~~~~

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/a186fffc468f9c901626c47c4ce216ae501085b8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nginx/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index 8e888baa1c..1c74f6e116 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -2,6 +2,7 @@ menuconfig BR2_PACKAGE_NGINX
 	bool "nginx"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBATOMIC_OPS if BR2_sparc_v8 || BR2_sparc_leon3
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  nginx is an HTTP and reverse proxy server, as well as a mail
 	  proxy server.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
