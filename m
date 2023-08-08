Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61409EC8733
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C16582F77;
	Thu,  7 Sep 2023 15:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C16582F77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zUjxe66pyprD; Thu,  7 Sep 2023 15:03:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49BC9827A0;
	Thu,  7 Sep 2023 15:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49BC9827A0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A26C01BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8B5161288
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8B5161288
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QbUdF6uDihSC for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39E276126F
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39E276126F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 381F786A22; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 8 Aug 2023 21:54:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a20f8a87aaf5d8d16755fd645263d4d286ef52de
X-Git-Newrev: 9488ec2b58d94b1bd4954dc5348626e94b3e79ac
X-Patchwork-Hint: ignore
Message-Id: <20230907145128.381F786A22@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: add host-python-pylibfdt
 dependency if needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=9488ec2b58d94b1bd4954dc5348626e94b3e79ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Until now, BR2_TARGET_UBOOT_NEEDS_PYLIBFDT was only bringing host-swig
as a dependency, because U-Boot was building its own pylibfdt, which
requires host-swig.

However, since commit
231d79c81e9a1f8c2ef14861374a40fcdc5e6b33 ("boot/uboot: set DTC path
when BR2_TARGET_UBOOT_NEEDS_DTC"), in which we tell U-Boot to use the
Buildroot built DTC, a consequence is that U-Boot no longer builds its
own pylibfdt: it expects the system to provided it. So now,
BR2_TARGET_UBOOT_NEEDS_PYLIBFDT really needs to bring
host-python-pylibfdt. The dependency on host-swig is no longer needed,
as what we need is host-python-pylibfdt, and it is an internal detail
of pylibfdt that it needs host-swig to build.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556137
  https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556224
  https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556227
  https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556229
  https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556230

Signed-off-by: Christian Stewart <christian@aperture.us>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index f0a85ee1ca..9f81c0b842 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -236,7 +236,7 @@ UBOOT_DEPENDENCIES += host-python3 host-python-setuptools
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYLIBFDT),y)
-UBOOT_DEPENDENCIES += host-swig
+UBOOT_DEPENDENCIES += host-python-pylibfdt
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
