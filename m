Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E115C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 10:09:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D9556105A
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 10:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D9556105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3182940327;
	Thu,  5 Aug 2021 10:09:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ODkOfS_F-GaK; Thu,  5 Aug 2021 10:09:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 140C74034E;
	Thu,  5 Aug 2021 10:09:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 102A61BF298
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 10:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E13BF83478
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 10:07:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dwEzvUp8SRsn for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 10:07:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19386837D2
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 10:07:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C98EC8B768; Thu,  5 Aug 2021 10:07:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 12:05:35 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 75c040a60a1b3185ac25a27b174022bc1c5b4253
X-Git-Newrev: eb880351a8e4395f15b5ecfd85979f3c6589ed53
X-Patchwork-Hint: ignore
Message-Id: <20210805100700.C98EC8B768@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/python-pysftp:
 add missing C++ dependency from paramiko
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=eb880351a8e4395f15b5ecfd85979f3c6589ed53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

python-paramiko has a dependency on C++ support, which was added in
commit 2d7b73cf75daedd4a198a75546308fedae7c9467 in 2016.

When python-pysftp was added in commit
3b920487bad119abf5bfb10a237cedd3b5278c10 in 2020, this C++ dependency
was not propagated, even though python-pysftp selects python-paramiko.

This commit fixes this issue by propagating the dependency, which
fixes this warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_PARAMIKO
  Depends on [n]: (BR2_PACKAGE_PYTHON [=n] || BR2_PACKAGE_PYTHON3 [=y]) && BR2_PACKAGE_PYTHON3 [=y] && BR2_INSTALL_LIBSTDCPP [=n]
  Selected by [y]:
  - BR2_PACKAGE_PYTHON_PYSFTP [=y] && (BR2_PACKAGE_PYTHON [=n] || BR2_PACKAGE_PYTHON3 [=y]) && BR2_PACKAGE_PYTHON3 [=y]

That occurs with configuration with C++ disabled, but python-pysftp
enabled.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8d1a72866a9eab1502a9cf4ebcf86e35cf8fc7db)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pysftp/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-pysftp/Config.in b/package/python-pysftp/Config.in
index 06f883f602..0866df3055 100644
--- a/package/python-pysftp/Config.in
+++ b/package/python-pysftp/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_PYTHON_PYSFTP
 	bool "python-pysftp"
+	depends on BR2_INSTALL_LIBSTDCPP # python-paramiko
 	select BR2_PACKAGE_PYTHON_PARAMIKO # runtime
 	help
 	  A friendly face on SFTP.
 
 	  https://bitbucket.org/dundeemt/pysftp
+
+comment "python-pysftp needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
