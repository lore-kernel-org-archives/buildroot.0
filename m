Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3680C433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 21:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D14361245;
	Mon, 30 May 2022 21:44:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Mh2mpNzOJLS; Mon, 30 May 2022 21:44:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19F7C61242;
	Mon, 30 May 2022 21:44:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9C7371BF276
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 21:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A67441A21
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 21:44:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DMcHVMePS3e7 for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 21:44:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB38141A09
 for <buildroot@buildroot.org>; Mon, 30 May 2022 21:44:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A0DD48682B; Mon, 30 May 2022 21:32:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 23:44:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2753d9ef82fe1bb5ff402341c56d18b2a4eb3d1d
X-Git-Newrev: 2d8a4e1fdd0ce07e9db009819e59eeb01225f129
X-Patchwork-Hint: ignore
Message-Id: <20220530213251.A0DD48682B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kvm-unit-tests: fix build on big
 endian aarch64 targets
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d8a4e1fdd0ce07e9db009819e59eeb01225f129
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building with BR2_cortex_a76 in big endian mode, the build of
the kvm-unit-tests is currently failing since the "--arch" option
of the configure script is not set right. We also have to look at
BR2_aarch64_be in this case to get this initialized properly.

Fixes: f7228dadd371 ("package/kvm-unit-tests: add more arm support")
Signed-off-by: Thomas Huth <huth@tuxfamily.org>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kvm-unit-tests/kvm-unit-tests.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index fd07ca85c3..dd8f153710 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -10,7 +10,7 @@ KVM_UNIT_TESTS_SITE = https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/archive
 KVM_UNIT_TESTS_LICENSE = GPL-2.0, LGPL-2.0
 KVM_UNIT_TESTS_LICENSE_FILES = COPYRIGHT
 
-ifeq ($(BR2_aarch64),y)
+ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
 KVM_UNIT_TESTS_ARCH = aarch64
 else ifeq ($(BR2_arm),y)
 KVM_UNIT_TESTS_ARCH = arm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
