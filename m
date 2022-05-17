Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B39C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 21:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C16BE60B26;
	Tue, 17 May 2022 21:10:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KsVlIrgK5g0J; Tue, 17 May 2022 21:10:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB52E60B51;
	Tue, 17 May 2022 21:10:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A57061BF28E
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 21:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A256E41A56
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 21:10:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sifwmQ9ft8P4 for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 21:10:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0A7341A53
 for <buildroot@buildroot.org>; Tue, 17 May 2022 21:10:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8F95385FAB; Tue, 17 May 2022 20:59:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 22:52:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5468cf1095f236fc01f16015a7cf6cfeee69fe55
X-Git-Newrev: b3be5990680514634aad41a1ca8f5a6337223cf6
X-Patchwork-Hint: ignore
Message-Id: <20220517205918.8F95385FAB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ola: add missing python-numpy
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

commit: https://git.buildroot.net/buildroot/commit/?id=b3be5990680514634aad41a1ca8f5a6337223cf6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_NUMPY
  Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS [=y] && (BR2_TOOLCHAIN_USES_GLIBC [=n] || BR2_TOOLCHAIN_USES_MUSL [=n])
  Selected by [y]:
  - BR2_PACKAGE_OLA_RDM_TESTS [=y] && BR2_PACKAGE_OLA [=y] && BR2_PACKAGE_OLA_PYTHON_BINDINGS [=y] && BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS [=y]

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ola/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/ola/Config.in b/package/ola/Config.in
index e59637b57f..399f7702fc 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -52,10 +52,16 @@ config BR2_PACKAGE_OLA_RDM_TESTS
 	bool "rdm tests"
 	depends on BR2_PACKAGE_OLA_PYTHON_BINDINGS
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	select BR2_PACKAGE_PYTHON_NUMPY
 	help
 	  Build OLA RDM tests.
 
+comment "rdm tests needs a toolchain w/ glibc or musl"
+	depends on BR2_PACKAGE_OLA_PYTHON_BINDINGS
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL
+
 comment "plugin selections"
 
 config BR2_PACKAGE_OLA_PLUGIN_ARTNET
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
