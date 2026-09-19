Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C979C982DA
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 12:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 599476069E;
	Sat, 19 Sep 2026 12:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y7uCko4pNZUp; Sat, 19 Sep 2026 12:24:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D506A60678
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789820684;
	b=HoatDQIrYQJsC4hmKJ+11w2o6eY6NqzOxys4hpMZ4TmjlstvrqM2dCPhvrovJzsqplN/
	 BXZClgqaIJH6pGWSkUZPf4KOpYhIKdTah+fu6MhVpYyTrvEy8jdpyXPvRbT3gUX0sEkpl
	 Xhlqrp+bMOmZu/+GhbdLZcc+0mnkrGE2nbzuZTdRIBIK5bVbnWuu/2BtKRncQY8+0RV9I
	 sLsvxhglLMWp4p6EwFLbOnHnFPM/sNEh8LCbzjPRfB7/he30BHhyjssfPrizX4AX+qzDG
	 QdZ9J60feNCUbNEed5khtX3WGVLdEsprIFpc8AVNFlzGMMo9vL5dhqkKvpaC1gsADgw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789820684;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=im6taf89bpZe+8B1nG6viE32PrSghKjmxAc0qwbNFE4=;
	b=pvpISneEeb+i7DlUy8ZZY31gY4AN/a2FZfUd635PDaseaU97VKg02nPCBaqT21YQvvp6
	 fRoVXS2Yph31gSlqGgKFODWJNLZzoJoA8gZR8ZQ9jo+U2z8OFtcvpkPfqinxX9+7Bzsey
	 9EpTW1dqAOxRCRvwkpJSofTp9De/Mz+aSSWAp8J6wzgQIOg607XvPeAhoFOKqz0MeQF4C
	 I4dTuAqK+DcP92RoDiZQ/KXZ5L2h59eOe626fgWb7xDVefQNSJaQhFSp1cZU7lnwkbZpF
	 WUCL9jUV+e3m3MErTkbi/56VbWnazUBw5r+mqcXeH/euWJITgpNJw9szULSxvtciEdw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789820683;
	bh=im6taf89bpZe+8B1nG6viE32PrSghKjmxAc0qwbNFE4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XJwkJFJUkxb+nNImHVzv0DGvdrIou+8BKulbOYQf+vtk0j03PHrHcs9I3W6Kt3l92
	 PCa7vx1TWKg9xIQNyK86pG55oANTL2uifYnxhuFJ1a47Sz0iAmHoq7WOCS8wFyW0AS
	 zKVeRe9+u2hVJBFBisRREnRxXa0F+BuUrJ9aj40Ytn50JreaAlZIvsXV1WiHuzLNle
	 njIEkIvrOqUv21EuxYQrAffn9bmA6DFwA7jVwL5vtfts7BbysI2e0iyEuruBDIdyBf
	 9/Alc2+OZ0z3RIcJyGP6iIPkoAz30Eb1FnHNtQJnjpikkOdrJD4yQLE3q0rY/B29kH
	 LnCxLqY8SZBrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D506A60678;
	Sat, 19 Sep 2026 12:24:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FE8C793
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 12:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F39F140A5B
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 12:24:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vZILOSW9XKEA for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 12:24:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0C53040A59
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789820680;
 b=JnqGS24pdJutQMp8JzrMU8g0MQ8KM/IZ9F+TM1zmiYmZWeGHwtkTyKt/ebZlu+RMpcBM
 RZctGXRel4v/NEPs70HmR+NQS4N3RXogAYTEbQzjIlApkc5NfyZCE+49lK7OKyfPgdAWu
 GSvCwtrRsQrw7rLgmwPY7rsu6PKX4j4IjJVVoYZy8g86EYurDcW0YJYs/JmJxrXvyuH0R
 MiOChV3h3w9yn5696YTN/nYfXWDW63fnV+S8c6/drOBpC07N6Hp8W8FPJfvVxp3q6348A
 wm3Oe4729BWPHkNzt33EvAXj9+SF9AxTH9RlOYjifWA/oP/KrrmQid8bHbwvQz8N2Lg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789820680;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=z78Fp9Y79MPs9U/UJryFx/U+kzRQCXJpa93ebgpRmVc=;
 b=EUuFHyUs4jGEf8Q8WAAyp4C9lfRMCq/BjgGkE/SgOM0T8BLHRnpVYm90j5NakgQ+w7gS
 Q+LEdIuOqfhUQLMC26zOVvoeoxXrufb+gWaKl+rcq0iyg3CwchAurt50dc4zKSvPUKm00
 Tpg9LeNGlqTnpja9nu2s8ufu32J81AprFVOIw8cQFuP5rGNXhCmS8AU+2RCJspJWxFxi9
 E3+iHtm3e50aXn903EOTyoCSTUesxx8dyjwinxpZMQh0r3S+Sf4Z/8LtuCqpk86EWGLc3
 AgVhAB1IVPJoMyZyvALc7dt4CIn4nmqLW6B/w9mum+fYtYe1de+h4DNUFdufRw0YvlQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C53040A59
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 12:24:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 369808D5A9; Sat, 19 Sep 2026 12:23:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 13:28:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6dce485ca72979ba0575a6ac82d7adfbf512e45a
X-Git-Newrev: f94d8e253117ce4db9bd20bd2720a3e8f98e8342
X-Patchwork-Hint: ignore
Message-Id: <20260919122332.369808D5A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-vpl-gpu-rt: bump version to
 26.3.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f94d8e253117ce4db9bd20bd2720a3e8f98e8342
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.3.5
https://github.com/intel/vpl-gpu-rt/compare/intel-onevpl-26.3.4...intel-onevpl-26.3.5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index ed08ef3926..76d18cd3dd 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  afd7c1cda2a5e9f96c21c333ef1b471d97e6325153d31f3ab468617afab0133e  intel-vpl-gpu-rt-26.3.4.tar.gz
+sha256  92867a0f8c09d81419102a61713e9f98dfd2af3fc9c91c6f4fb6d0c784c8e442  intel-vpl-gpu-rt-26.3.5.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index 56e77cda12..9bbac624cd 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 26.3.4
+INTEL_VPL_GPU_RT_VERSION = 26.3.5
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
