Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BD6C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 15:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0882A4105D;
	Wed, 22 Feb 2023 15:54:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0882A4105D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NPYsEdp6wQCQ; Wed, 22 Feb 2023 15:54:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FE7C415AB;
	Wed, 22 Feb 2023 15:54:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FE7C415AB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14B391BF3BE
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 15:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E24564097E
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 15:54:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E24564097E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VP8F5hifJQjy for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 15:54:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBC034097B
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 15:54:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBC034097B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B464F86727; Wed, 22 Feb 2023 15:54:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 16:51:59 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: c42880d994c3162efdd583d4a6097538cd185eb3
X-Git-Newrev: e6751cb90fef4f745c499cdeacd9559d6a9b2a17
X-Patchwork-Hint: ignore
Message-Id: <20230222155428.B464F86727@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/yajl: explicitly
 request a tag in _SITE
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

commit: https://git.buildroot.net/buildroot/commit/?id=e6751cb90fef4f745c499cdeacd9559d6a9b2a17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The yajl repository has both a branch and a tag names 2.1.0. Because of
this, when we use the usual github URL [1], github doesn't return a
tarball but rather an ASCII string:
   the given path has multiple possibilities: #<Git::Ref:0x00007f193bebe4d8>, #<Git::Ref:0x00007f193bebd858>

This obviously (and fortunately) leads to a hash check failure.

To make sure we get the tag and not the branch, we should use a URL that
explicitly asks for refs/tags/2.1.0 [2]. We can't change VERSION to
include refs/tags, because that also affects the _SOURCE default, the
contents of the tarball, the CPE ID and the release-monitoring access.
Therefore, add the refs/tags/ prefix to the github helper call.

[1] https://github.com/lloyd/yajl/archive/2.1.0/yajl-2.1.0.tar.gz
[1] https://github.com/lloyd/yajl/archive/refs/tags/2.1.0/yajl-2.1.0.tar.gz

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 5be76a39d3a0c21d6f3ceeab0889edc3cec9f2f3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/yajl/yajl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/yajl/yajl.mk b/package/yajl/yajl.mk
index 1fb16f50e9..d14a68b402 100644
--- a/package/yajl/yajl.mk
+++ b/package/yajl/yajl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 YAJL_VERSION = 2.1.0
-YAJL_SITE = $(call github,lloyd,yajl,$(YAJL_VERSION))
+YAJL_SITE = $(call github,lloyd,yajl,refs/tags/$(YAJL_VERSION))
 YAJL_INSTALL_STAGING = YES
 YAJL_LICENSE = ISC
 YAJL_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
