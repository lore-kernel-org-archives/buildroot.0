Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C0A7C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 13:39:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C214060720
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 13:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C214060720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D4684040F;
	Sun, 25 Jul 2021 13:39:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pJlKgND-4e03; Sun, 25 Jul 2021 13:39:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7478F40412;
	Sun, 25 Jul 2021 13:39:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 99B2E1BF95A
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 13:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85BE640154
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 13:39:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N1VO9zT0gTzW for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 13:39:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 802A440147
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 13:39:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 299D088EB0; Sun, 25 Jul 2021 13:04:33 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 15:38:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e960d5c7c90d98e44d292159082d887910795f5
X-Git-Newrev: 8d1a72866a9eab1502a9cf4ebcf86e35cf8fc7db
X-Patchwork-Hint: ignore
Message-Id: <20210725130433.299D088EB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pysftp: add missing C++
 dependency from paramiko
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d1a72866a9eab1502a9cf4ebcf86e35cf8fc7db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/python-pysftp/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/python-pysftp/Config.in b/package/python-pysftp/Config.in
index de2d2df63d..5d5b731f33 100644
--- a/package/python-pysftp/Config.in
+++ b/package/python-pysftp/Config.in
@@ -1,8 +1,13 @@
 config BR2_PACKAGE_PYTHON_PYSFTP
 	bool "python-pysftp"
 	depends on BR2_PACKAGE_PYTHON3 # python-paramiko -> python-bcrypt
+	depends on BR2_INSTALL_LIBSTDCPP # python-paramiko
 	select BR2_PACKAGE_PYTHON_PARAMIKO # runtime
 	help
 	  A friendly face on SFTP.
 
 	  https://bitbucket.org/dundeemt/pysftp
+
+comment "python-pysftp needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
