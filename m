Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D115C433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 17:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDFEA60EBF;
	Mon, 24 Jan 2022 17:37:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LhRduEwd7pmp; Mon, 24 Jan 2022 17:37:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D40B560ECB;
	Mon, 24 Jan 2022 17:37:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E0F381BF487
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D62840209
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:36:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BsyG6fV0d4ZN for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 17:36:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 679084022F
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 17:36:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C4F9781051; Mon, 24 Jan 2022 17:29:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 18:28:20 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 2a35749e6f93e7ff712dd3007efb2b7e8302468e
X-Git-Newrev: 8021a9feca97e14f5143fc339930298ebf12de4c
X-Patchwork-Hint: ignore
Message-Id: <20220124172947.C4F9781051@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/coreutils: drop
 gl_cv_func_fstatat_zero_flag=no from config env
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

commit: https://git.buildroot.net/buildroot/commit/?id=8021a9feca97e14f5143fc339930298ebf12de4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Configuring coreutils with gl_cv_func_fstatat_zero_flag=no results in
non-functional lchmod library function which causes 'mkfifo -m' to
always complete with the message 'cannot set permissions of ...: Invalid
argument' and an error exit code. gl_cv_func_fstatat_zero_flag=no is not
needed when building coreutils-9.0 for linux and its setting should be
correctly determined by the configure script.
Drop gl_cv_func_fstatat_zero_flag=no from the coreutils configure
environment.

For more details see
https://lists.buildroot.org/pipermail/buildroot/2021-December/631388.html

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fef5d9fbda813668885f2df00d887cb39b4fc505)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/coreutils/coreutils.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 9c0f46cb29..a31354ac5a 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -45,7 +45,6 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 	gl_cv_func_getcwd_null=yes \
 	gl_cv_func_getcwd_path_max=yes \
 	gl_cv_func_gettimeofday_clobber=no \
-	gl_cv_func_fstatat_zero_flag=no \
 	gl_cv_func_link_follows_symlink=no \
 	gl_cv_func_re_compile_pattern_working=yes \
 	gl_cv_func_svid_putenv=yes \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
