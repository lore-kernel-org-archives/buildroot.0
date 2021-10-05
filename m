Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431FAC433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 01:00:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5597B611AE
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 01:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5597B611AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2DF082919;
	Tue,  5 Oct 2021 01:00:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q5l0KRLjCE-P; Tue,  5 Oct 2021 01:00:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74A758291C;
	Tue,  5 Oct 2021 01:00:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A4531BF2BA
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 01:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 596614063A
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 01:00:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fmH8n9OmjUKn for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 01:00:50 +0000 (UTC)
X-Greylist: delayed 00:07:00 by SQLgrey-1.8.0
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp4.osuosl.org (Postfix) with ESMTP id E290F40639
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 01:00:49 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id XYiIm8WvNiqGsXYiJmX2zc; Tue, 05 Oct 2021 02:53:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1633395227; bh=HtC2U1LJ5fNaEvMFBn8Qn0o9HyuInRZr7k2vp0HgiTI=;
 h=From:To:Subject:Date:MIME-Version;
 b=Y3Zi83d9s2yoE06+o4biWhrHkJgUJk91n47yE0pz9Ew4E7Sqr5fhUzZd7d6OS6STw
 yjYpLnYJ43kSNGuJ9CV/WX5U50gPMZ3nv7dM4r9JnV0kgaOP25evnQs8kc/VB4u4NO
 FHsxeToS37nczCPlFcKcayUWY2bQDvWITcm60idSk9hei+5D9AoztM8oopbSGh+rAR
 GA1PFgUgw2/zBLSg5mmMvMu+dIZpVAfISHp8D9ul6BpDn7VS9uCkXo/8CB5/S4NUj3
 w1ta2pxONHUuyMc06lTKSLHeIRY/gFPwuPFeQEWBW6xzo8Bvt8ll/UCDahM/t2JQ4e
 7HOWqPYLKYGlg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  5 Oct 2021 02:53:42 +0200
Message-Id: <20211005005346.955339-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfLUpa+kz4RUqJs4e3zShwH0U5ECOuRLaL9+oxikDBZdm4KlmCUdvBa63dFTlAIskOA8CIjSUFb6YkhnJ9bOGOWThlZJ2JGo1/RmTplrxSkpEyWxheOxU
 h05zWdiiUfZOsJaOAHAbsvM5k5zJeHEwhiebQEfbHzYNXGGKsCHBvnFKFao7/a4pUNeQOXDzpOqEsx7OKQBtXs+BjnPLYngPbRKPl6Sg7k8fdwlS+U/bHJqx
 7DA9pxcAdFvh4TpLsgsqmc3KoEJgEkIHiGKxq6UhKP7wI0gq5qrNaJO0umDDSuwqCa0nKR6fLp2Lz+BGydT2gUc55eeJE7PfY7QrSm8msB67tMGqEL/GS1Op
 3ZmQZjgbUqHS1z5bdOYG11a7Njd+HA==
Subject: [Buildroot] [PATCH 0/4] Make A20/A33 using NEON+VFPv4 FPU strategy
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patchset enable on remaining A20/A33 board the NEON+VFPv4 FPU
strategy as other A20 boards already do.

Giulio Benetti (4):
  configs/bananapi_m1: use NEON+VFPv4 as FPU strategy
  configs/olimex_a20_olinuxino_lime: use NEON+VFPv4 as FPU strategy
  configs/olimex_a20_olinuxino_lime2: use NEON+VFPv4 as FPU strategy
  configs/olimex_a33_olinuxino: use NEON+VFPv4 as FPU strategy

 configs/bananapi_m1_defconfig                | 1 +
 configs/olimex_a20_olinuxino_lime2_defconfig | 1 +
 configs/olimex_a20_olinuxino_lime_defconfig  | 1 +
 configs/olimex_a33_olinuxino_defconfig       | 1 +
 4 files changed, 4 insertions(+)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
