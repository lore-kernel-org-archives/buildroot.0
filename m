Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2908CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 08:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 652AE4051B;
	Sun,  7 Apr 2024 08:52:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5YlwJfGBD7fz; Sun,  7 Apr 2024 08:52:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E61E440AE6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E61E440AE6;
	Sun,  7 Apr 2024 08:52:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0EA3D1BF57C
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 08:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1F9F404A0
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 08:52:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2F9uzegBKC2u for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 08:52:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A349404B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A349404B1
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 08:52:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93FE284BCE; Sun,  7 Apr 2024 08:52:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 10:51:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7d9080d6c6838305dbd8c3621bcde2b04ad8526
X-Git-Newrev: ef833f926b43713f23944898d1d4e64ee26f046d
X-Patchwork-Hint: ignore
Message-Id: <20240407085210.93FE284BCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-pam: select libxcrypt with
 glibc
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef833f926b43713f23944898d1d4e64ee26f046d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/autobuild/autobuild/instance-6/output-1/per-package/linux-pam/host/bin/../lib/gcc/or1k-buildroot-linux-gnu/13.2.0/../../../../or1k-buildroot-linux-gnu/bin/ld: .libs/pam_pwhistory_la-opasswd.o: in function `compare_password':
opasswd.c:(.text+0x26c): undefined reference to `crypt'

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/e17911978febb7b25112940a7c40037b3f98d491

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-pam/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
index b17716f2f7..c8aca97ac6 100644
--- a/package/linux-pam/Config.in
+++ b/package/linux-pam/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LINUX_PAM
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	select BR2_PACKAGE_FLEX
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  A Security Framework that Provides Authentication for
 	  Applications
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
