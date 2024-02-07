Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F00C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 18:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C25A661474;
	Wed,  7 Feb 2024 18:58:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hdwWLYnu2cMr; Wed,  7 Feb 2024 18:58:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E095361478
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E095361478;
	Wed,  7 Feb 2024 18:58:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC1121BF20D
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 18:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 981E3408E6
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 18:58:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O0d6c4jDQEYH for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 18:58:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6FB3401AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6FB3401AE
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 18:58:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 909778769F; Wed,  7 Feb 2024 18:58:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 19:58:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55c6ae5656a0bbd04baf5d6fbbeb060124e71e4a
X-Git-Newrev: c12e1c7b5946aa7ddc744e17ba5d3d04d639b075
X-Patchwork-Hint: ignore
Message-Id: <20240207185839.909778769F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/scanpypi: use a set comprehension
 for dependencies
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c12e1c7b5946aa7ddc744e17ba5d3d04d639b075
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This ensures that we don't have duplicate dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/scanpypi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 021c99a172..5a58550145 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -411,8 +411,8 @@ class BuildrootPackage():
                         for req in self.pkg_req]
 
         # get rid of commented lines and also strip the package strings
-        self.pkg_req = [item.strip() for item in self.pkg_req
-                        if len(item) > 0 and item[0] != '#']
+        self.pkg_req = {item.strip() for item in self.pkg_req
+                        if len(item) > 0 and item[0] != '#'}
 
         req_not_found = self.pkg_req
         self.pkg_req = list(map(pkg_buildroot_name, self.pkg_req))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
