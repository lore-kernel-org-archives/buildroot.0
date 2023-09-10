Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E31EE49A4
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 21:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F6464056E;
	Sun, 10 Sep 2023 21:43:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F6464056E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EOF8tka9IFnO; Sun, 10 Sep 2023 21:43:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93F29405D8;
	Sun, 10 Sep 2023 21:43:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93F29405D8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 626501BF573
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C76A8148D
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:43:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C76A8148D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AZT3iOCe_Alb for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 21:43:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43E188148B
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 21:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43E188148B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 30B6D86BC4; Sun, 10 Sep 2023 21:43:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Sep 2023 23:15:37 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: eef7d67a4ff0f0f4f774eaaf110fb2db41af8d3e
X-Git-Newrev: 2eb849ac1663f2dd0322dc2a117f504e9a935d36
X-Patchwork-Hint: ignore
Message-Id: <20230910214330.30B6D86BC4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] boot/uboot: add
 host-python-pylibfdt dependency if needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=2eb849ac1663f2dd0322dc2a117f504e9a935d36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
(cherry picked from commit f788a8f527c038112671ff6fdc968823a54cf3aa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 1a6e70a792..c3e3829362 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -217,7 +217,7 @@ UBOOT_DEPENDENCIES += host-python3 host-python-setuptools
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
