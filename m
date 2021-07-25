Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E01BDC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:33:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9259B60F58
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9259B60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E4734061C;
	Wed,  4 Aug 2021 00:33:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NilgeUZCxMFw; Wed,  4 Aug 2021 00:33:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AA8A40633;
	Wed,  4 Aug 2021 00:33:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9117E1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33163404D6
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eh_JkoAJ3nrJ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1582040F59
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6D22B83D7B; Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 15:38:34 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5e960d5c7c90d98e44d292159082d887910795f5
X-Git-Newrev: 8d1a72866a9eab1502a9cf4ebcf86e35cf8fc7db
X-Patchwork-Hint: ignore
Message-Id: <20210803211017.6D22B83D7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pysftp: add
 missing C++ dependency from paramiko
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
