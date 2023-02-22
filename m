Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85707C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 15:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C110415AD;
	Wed, 22 Feb 2023 15:56:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C110415AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iVGr3rYuYWVE; Wed, 22 Feb 2023 15:56:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 675B740B8E;
	Wed, 22 Feb 2023 15:56:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 675B740B8E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A79241BF3BE
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 15:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 829384105D
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 15:55:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 829384105D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bHK9SqbsU8oB for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 15:55:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD5BD40AB7
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 15:55:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD5BD40AB7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9AB5486743; Wed, 22 Feb 2023 15:55:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 16:51:12 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 5efc9e326d033b52da69bd1670127d894dfd59b1
X-Git-Newrev: dd67740aa9946be0c272f89fc5795ff597664cf6
X-Patchwork-Hint: ignore
Message-Id: <20230222155544.9AB5486743@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/yajl: explicitly
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd67740aa9946be0c272f89fc5795ff597664cf6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
