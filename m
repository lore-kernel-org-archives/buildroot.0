Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E31EE49A5
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68D9140B58;
	Mon, 21 Aug 2023 20:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68D9140B58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6bB0BbxAO-Gf; Mon, 21 Aug 2023 20:01:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2F1840B2F;
	Mon, 21 Aug 2023 20:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2F1840B2F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BD511BF951
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6A5C6111F
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6A5C6111F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WDi7vimfhGcF for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E70B60E82
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E70B60E82
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BF7D85FEB; Mon, 21 Aug 2023 20:01:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 12:33:19 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 05a0adea8355ba0901d5af02548a57657a2af89d
X-Git-Newrev: f788a8f527c038112671ff6fdc968823a54cf3aa
X-Patchwork-Hint: ignore
Message-Id: <20230821200123.1BF7D85FEB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/uboot: add
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f788a8f527c038112671ff6fdc968823a54cf3aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
