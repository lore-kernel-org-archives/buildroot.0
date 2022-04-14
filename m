Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA93AC433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 20:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6761640A90;
	Thu, 14 Apr 2022 20:12:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F73Qs1ByAijh; Thu, 14 Apr 2022 20:12:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E4C4404D7;
	Thu, 14 Apr 2022 20:12:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E0FB41C1189
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCF09831E3
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t0X_QENaxmTU for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 20:11:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBDA082C84
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 20:11:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 74D0E83CC8; Thu, 14 Apr 2022 20:01:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 22:09:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e5c1dbb22bdd0e1daf9302ddc5ac7c89c461b05
X-Git-Newrev: 83aeec71fd6488295292bd1886decfe1874f9442
X-Patchwork-Hint: ignore
Message-Id: <20220414200153.74D0E83CC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libkcapi: fix build with
 BR2_OPTIMIZE_0
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

commit: https://git.buildroot.net/buildroot/commit/?id=83aeec71fd6488295292bd1886decfe1874f9442
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Override CPPFLAGS to fix the following build failure with BR2_OPTIMIZE_0
raised since bump to version 0.14.0 in commit
cd707a9112e38b4ce98326b96c0ed12054ca1cca and
https://github.com/smuellerDD/libkcapi/commit/0e7b2b0300782aca19c324f3352f109777b4c51a:

/home/autobuild/autobuild/instance-15/output-1/host/i686-buildroot-linux-gnu/sysroot/usr/include/features.h:412:4: error: #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]

configure adds -D_FORTIFY_SOURCE to CPPFLAGS if it is not already
defined. However, we don't want _FORTIFY_SOURCE to be enabled unless
it's enabled by Buildroot (for exactly the above reason). Therefore,
override CPPFLAGS in th build step to remove _FORTIFY_SOURCE again.

It should be noted that upstream already rejected a PR to remove
-Werror: https://github.com/smuellerDD/libkcapi/pull/132

Fixes:
 - http://autobuild.buildroot.org/results/35141ea3046f5a4593e0b27ef92e4ace6bc0be66

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libkcapi/libkcapi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
index 60b3f94388..09c5c028bc 100644
--- a/package/libkcapi/libkcapi.mk
+++ b/package/libkcapi/libkcapi.mk
@@ -15,6 +15,7 @@ LIBKCAPI_CONF_ENV = \
 	ac_cv_path_DB2PDF="" \
 	ac_cv_path_DB2PS="" \
 	ac_cv_path_XMLTO=""
+LIBKCAPI_MAKE_OPTS = CPPFLAGS="$(TARGET_CPPFLAGS)"
 
 ifeq ($(BR2_PACKAGE_LIBKCAPI_ENCAPP),y)
 LIBKCAPI_CONF_OPTS += --enable-kcapi-encapp
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
