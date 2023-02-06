Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D844C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 10:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3B4B60ACE;
	Mon,  6 Feb 2023 10:03:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3B4B60ACE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ghGcJ_nr9CQk; Mon,  6 Feb 2023 10:03:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D08EF60ACA;
	Mon,  6 Feb 2023 10:03:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D08EF60ACA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D8BB31BF4E3
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2F3381470
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2F3381470
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qu4aF40kBDJm for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 10:03:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF11681405
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 10:03:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF11681405
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B99A839FF; Mon,  6 Feb 2023 10:03:15 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 11:02:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c7fece853f3def9a425eccc384b9dacb1010051
X-Git-Newrev: 5be76a39d3a0c21d6f3ceeab0889edc3cec9f2f3
X-Patchwork-Hint: ignore
Message-Id: <20230206100315.9B99A839FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/yajl: explicitly request a tag in
 _SITE
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

commit: https://git.buildroot.net/buildroot/commit/?id=5be76a39d3a0c21d6f3ceeab0889edc3cec9f2f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
