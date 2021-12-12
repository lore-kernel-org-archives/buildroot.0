Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFD5C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0DBE4049E;
	Sun, 12 Dec 2021 12:38:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gEkCmBQbr-O3; Sun, 12 Dec 2021 12:38:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F36C40530;
	Sun, 12 Dec 2021 12:37:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 65F981BF373
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 550EE85986
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:37:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=libero.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DNLByFuT8dLd for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:37:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from libero.it (smtp-34.italiaonline.it [213.209.10.34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D2B585920
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:37:57 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it ([82.50.51.121])
 by smtp-34.iol.local with ESMTPA
 id wO70mmmvtUpmcwO71mGvHj; Sun, 12 Dec 2021 13:37:55 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1639312675; bh=1RSVE0cv08Z2UWF6/KlCdZqwCwNqC9EM4GYpzcmBGFE=;
 h=From;
 b=zQsasLL/Ug9pSxCtVmu+oFW5qcS/mJty8eqTdbyWTFCEXMhCKHindUHhllOTQ+65E
 dVgOeAlgix/0tKTSvU2S7SALe9lp9mSw3qP94VGf9YcfmYzcDiS5cFzaLevkvVvq2z
 oM7gWVigsW/LaFHDFPJD7TbyDQo1XGamq2VwpsDz7DTT3H/BTD/yPi7s0YENCnnrR/
 HXak+Dq2jz/mr+d4cCFbY87JEm0wWuurbaHSLxWdCw2WCPPJbZw8A2k0rOQ6TMQjHV
 6cQBBUH53A78V8lOZPCsOtgZEXGGLxxNzMZ673Njm4eTmUnmNT055CjfJM/XHNbxNc
 bpyxnXf6DC3DA==
X-CNFS-Analysis: v=2.4 cv=VsDmv86n c=1 sm=1 tr=0 ts=61b5ed23 cx=a_exe
 a=xtCFBUu/Ze6RtP+zVSd77w==:117 a=xtCFBUu/Ze6RtP+zVSd77w==:17
 a=e2X5L8jO6AHGwzUiFLIA:9
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 13:37:49 +0100
Message-Id: <20211212123753.11848-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfIYBQeKBx+I9Uv1nhIe3VScveqbDtkPtAv2LwR5psLEkAWbDwK/YyTma+5tfPlsi4t15yLE8YKmHZS07lBouor99E73Ky4cIqbe2V7s9BgSGawveqSUV
 7wjQpDsNNh+Qh4gOQrzebwQc/K04Xc5PrURU7Fft1u7MuvQVqLLGcUQ/94Dy5sKKQBCui42e1ZGY0Lcb9ZqcGju3sepeYNLX0N+8HJ6ELHwqb9Xr6HlORFRs
 gdZp6tqJyGxZ2GMXwkmw7G5qfS8O9SAdFPrUEUnV6R7A0juQxqZ5JqpAIQ7+CAFnW9BX76QJsFt/iUaePvoSYLDUIvbd66HttRMUd9aHwsV7Qid2WFdsiGeK
 wmdV9MmwJEiK+ivU0xaIsi1dWhTi4Q==
Subject: [Buildroot] [RESEND PATCH v2,
 0/4] configs/stm32f429_disco: fix kernel bootup
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
From: Dario Binacchi via buildroot <buildroot@buildroot.org>
Reply-To: Dario Binacchi <dariobin@libero.it>
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Lee Jones <lee.jones@linaro.org>, Dario Binacchi <dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Inspired by Arnout Vandecappelle's review of the kernel bootup fix patch
for the stm32f429-disco board I created this series which required the
afboot bootloader update and the kernel bootup fix for the
stm32f469_disco_xip_defconfig configuration. I therefore renamed the
configurations of the stm32f429 and stm32f469 boards to make them more
explicit.

Dario Binacchi (4):
  configs/stm32f469_xip_disco: fix kernel bootup
  boot/afboot-stm32: upgrade version
  configs/stm32f429_disco: fix kernel bootup
  configs/stm32f4{2|6}9_*_defconfig: rename configurations

 .../stm32f429-disco/flash.sh                  |   2 +-
 .../stm32f429-disco/linux.config              | 120 ++++++++++++++++++
 ...sco-don-t-force-init-in-chosen-boota.patch |  32 -----
 .../stm32f469-disco/{flash.sh => flash_sd.sh} |   0
 .../stm32f469-disco/flash_xip.sh              |   2 +-
 .../{linux.fragment => linux-sd.fragment}     |   0
 .../stm32f469-disco/linux-xip.config          |   8 +-
 ...32f469-i-Update-kernel-start-address.patch |  56 --------
 ...fault-dram-address-without-remapping.patch |  38 ------
 .../stm32f469-disco/readme.txt                |   4 +-
 .../stm32f469-disco/readme_xip.txt            |   2 +-
 boot/afboot-stm32/Config.in                   |  32 +++++
 boot/afboot-stm32/afboot-stm32.hash           |   2 +-
 boot/afboot-stm32/afboot-stm32.mk             |  18 ++-
 ...efconfig => stm32f429_disco_xip_defconfig} |  11 +-
 ...defconfig => stm32f469_disco_sd_defconfig} |   2 +-
 configs/stm32f469_disco_xip_defconfig         |   4 +-
 17 files changed, 187 insertions(+), 146 deletions(-)
 create mode 100644 board/stmicroelectronics/stm32f429-disco/linux.config
 delete mode 100644 board/stmicroelectronics/stm32f429-disco/patches/linux/0001-ARM-stm32f249-disco-don-t-force-init-in-chosen-boota.patch
 rename board/stmicroelectronics/stm32f469-disco/{flash.sh => flash_sd.sh} (100%)
 mode change 100644 => 100755 board/stmicroelectronics/stm32f469-disco/flash_xip.sh
 rename board/stmicroelectronics/stm32f469-disco/{linux.fragment => linux-sd.fragment} (100%)
 delete mode 100644 board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm32f469-i-Update-kernel-start-address.patch
 delete mode 100644 board/stmicroelectronics/stm32f469-disco/patches/linux/0001-Use-default-dram-address-without-remapping.patch
 rename configs/{stm32f429_disco_defconfig => stm32f429_disco_xip_defconfig} (63%)
 rename configs/{stm32f469_disco_defconfig => stm32f469_disco_sd_defconfig} (97%)

-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
