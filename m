Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F0EC4332F
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 17:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E313C40342;
	Mon, 24 Jan 2022 17:36:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id boi9Ee66Jf_K; Mon, 24 Jan 2022 17:36:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D101840A15;
	Mon, 24 Jan 2022 17:36:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7754A1BF487
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F79C40A60
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:36:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ljW-Ls7Aj5VN for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 17:36:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E774401CA
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 17:36:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D81F8811E6; Mon, 24 Jan 2022 17:29:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 18:30:54 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: eb96c11e6f5eb3dc0384657fe2dacbcdf4d6e4d6
X-Git-Newrev: 20dffb403d72cc8639db8db5902231e02b9493fb
X-Patchwork-Hint: ignore
Message-Id: <20220124172936.D81F8811E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/coreutils: drop
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

commit: https://git.buildroot.net/buildroot/commit/?id=20dffb403d72cc8639db8db5902231e02b9493fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
index 57b77b8c6a..cfd125e2d2 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -47,7 +47,6 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
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
