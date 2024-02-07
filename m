Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A938BC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B41683BA4;
	Wed,  7 Feb 2024 16:11:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TlpgCuTLj0Hg; Wed,  7 Feb 2024 16:11:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A66CA83BA7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A66CA83BA7;
	Wed,  7 Feb 2024 16:11:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 278011BF3DF
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2182B403E7
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:11:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VNihIrzJiUcA for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:11:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14AC0400CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14AC0400CB
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:11:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F3E0987610; Wed,  7 Feb 2024 16:11:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 17:11:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3641347ff13267fe8a7f45d0207d333dac9ca38a
X-Git-Newrev: 34da86d1ef85226f758e83a381a81c03c6824734
X-Patchwork-Hint: ignore
Message-Id: <20240207161143.F3E0987610@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swugenerator: add missing runtime
 dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=34da86d1ef85226f758e83a381a81c03c6824734
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

swugenerator might use openssl to encrypt files in .swu(cpio)
resulting output archive and gzip or zlib to compress the same files
but we're not sure whether build environment have or not openssl, gzip
and zlib installed so we add them as host dependencies.

Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/swugenerator/swugenerator.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/swugenerator/swugenerator.mk b/package/swugenerator/swugenerator.mk
index f4ead1d229..466fe1f046 100644
--- a/package/swugenerator/swugenerator.mk
+++ b/package/swugenerator/swugenerator.mk
@@ -9,6 +9,10 @@ SWUGENERATOR_SITE = $(call github,sbabic,swugenerator,v$(SWUGENERATOR_VERSION))
 SWUGENERATOR_LICENSE = GPL-3.0
 SWUGENERATOR_LICENSE_FILES = LICENSE
 HOST_SWUGENERATOR_SETUP_TYPE = setuptools
-HOST_SWUGENERATOR_DEPENDENCIES = host-python-libconf
+HOST_SWUGENERATOR_DEPENDENCIES = \
+	host-gzip \
+	host-openssl \
+	host-python-libconf \
+	host-zstd
 
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
