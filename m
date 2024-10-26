Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA048D10BF9
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 13:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B23664078C;
	Sat, 26 Oct 2024 13:24:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xcZG3x-svIOL; Sat, 26 Oct 2024 13:24:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8857D4078D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8857D4078D;
	Sat, 26 Oct 2024 13:24:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CCF95C52
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE6C24019A
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:24:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EdEW2WjiPQLU for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 13:24:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8129F40175
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8129F40175
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:24:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 746F483AD3; Sat, 26 Oct 2024 13:24:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 15:22:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 852fedc643e50085a9f9c3cbf0bd2a4e23b8c9f4
X-Git-Newrev: 8b18c67f2651ac64e865a1dbd46de60ce8390959
X-Patchwork-Hint: ignore
Message-Id: <20241026132401.746F483AD3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liblinear: fix _SITE url
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8b18c67f2651ac64e865a1dbd46de60ce8390959
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package _SITE url only contains the latest version at a given point
in time. When a new version is published, it is replacing the old one.

This issue was not detected because the archive was downloaded from the
sources.buildroot.org backup mirror, when the primary source became
unavailable.

Since commit 559bb33ae "support/testing: do not use s.b.o" [1], the
runtime test infrastructure is disabling this backup mirror. This
makes the nmap runtime test failing [2], which is using liblinear as
a dependency.

The liblinear package author confirmed in a private email that all the
releases, including the latest version, are all kept in the "oldfiles"
directory.

This commit fixes this download issue by updating the _SITE url to that
location. While at it, this commit also change the url to use https
(since the http equivalent redirects to https).

Fixes:
- [2]

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/559bb33ae71dd2358ca2314ccb24b56cc3809fc1
[2] https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008007

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/liblinear/liblinear.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/liblinear/liblinear.mk b/package/liblinear/liblinear.mk
index 014f9e2de4..134673a230 100644
--- a/package/liblinear/liblinear.mk
+++ b/package/liblinear/liblinear.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBLINEAR_VERSION = 2.45
-LIBLINEAR_SITE = http://www.csie.ntu.edu.tw/~cjlin/liblinear
+LIBLINEAR_SITE = https://www.csie.ntu.edu.tw/~cjlin/liblinear/oldfiles
 LIBLINEAR_LICENSE = BSD-3-Clause
 LIBLINEAR_LICENSE_FILES = COPYRIGHT
 LIBLINEAR_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
