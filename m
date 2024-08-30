Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CB5CA0FF7
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 14:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6109A81EB0;
	Fri, 30 Aug 2024 14:03:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i50co3jZGcWE; Fri, 30 Aug 2024 14:03:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D35F844C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D35F844C9;
	Fri, 30 Aug 2024 14:03:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 145901BF5B3
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 14:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 029A2844BF
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 14:03:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8KtURIl5AUT6 for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 14:03:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 368D0844CE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 368D0844CE
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 14:03:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 201BA86729; Fri, 30 Aug 2024 14:03:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 30 Aug 2024 15:58:20 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 56c02aa6c9a8b2f4eb564f0ccc073a588be51303
X-Git-Newrev: 4737f8407e57f4eb7fd15d92b3d8c1622bef22d3
X-Patchwork-Hint: ignore
Message-Id: <20240830140347.201BA86729@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/apr: fix musl
 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=4737f8407e57f4eb7fd15d92b3d8c1622bef22d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

strerror_r on musl always returns an int since its addition back in 2011
with
https://git.musl-libc.org/cgit/musl/commit/src/string/strerror_r.c?id=0b44a0315b47dd8eced9f3b7f31580cf14bbfc01

As a result, setting ac_cv_strerror_r_rc_int to no results in the
following build failure since bump to version 1.7.2 in commit
783cd8d90d37b5e0b59d6f0bfca6667855b2b9e1:

misc/unix/errorcodes.c: In function 'native_strerror':
misc/unix/errorcodes.c:385:9: error: assignment to 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
  385 |     msg = strerror_r(statcode, buf, bufsize);
      |         ^

Fixes: 783cd8d90d37b5e0b59d6f0bfca6667855b2b9e1
 - http://autobuild.buildroot.org/results/9a42a4427ff64d47da61c731abb99d7585781cdd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6f34e68217264fb62c48ce28c48bf759b30fef0e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apr/apr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index cb8c12dd65..d4526a4172 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -39,7 +39,7 @@ APR_CONF_ENV = \
 	ac_cv_sizeof_struct_iovec=8 \
 	ac_cv_sizeof_pid_t=4 \
 	ac_cv_struct_rlimit=yes \
-	ac_cv_strerror_r_rc_int=no \
+	ac_cv_strerror_r_rc_int=$(if $(BR2_TOOLCHAIN_USES_MUSL),yes,no) \
 	ac_cv_o_nonblock_inherited=no \
 	apr_cv_mutex_recursive=yes \
 	apr_cv_epoll=yes \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
