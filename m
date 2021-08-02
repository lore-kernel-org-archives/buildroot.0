Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A5E8C432BE
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 20:21:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98F1860F39
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 20:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98F1860F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dopsi.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5627760A91;
	Mon,  2 Aug 2021 20:21:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sNwcIMZv52rB; Mon,  2 Aug 2021 20:21:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 939A060A36;
	Mon,  2 Aug 2021 20:21:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7F1521BF9AA
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 20:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C2C040184
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 20:21:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=dopsi.ch
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y01XfIiNWcd4 for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 20:21:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0DAE2401CD
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 20:21:05 +0000 (UTC)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com
 [51.77.79.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41103.protonmail.ch (Postfix) with ESMTPS id 4GdqC35qbbz4wwvm
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 20:21:03 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (2048-bit key) header.d=dopsi.ch header.i=@dopsi.ch
 header.b="VxjDjc7X"
Date: Mon, 02 Aug 2021 20:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dopsi.ch;
 s=protonmail2; t=1627935653;
 bh=WdB2PrfB2+qAJFNw+4xlujTSMJbeHBrehH+CNFAl8HA=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=VxjDjc7Xkyt6b0FCf+l1yEYKGks86rzpOp+ifzXiG8NJG6+cE2YpOpvtn90nufWTx
 65v0qfRHOUZpB+YO/RY+2BUz2L1R2l0dbli7qcewcUuYoyRx7YbbBH8fdFTiL3EBua
 ol0bTjpSon5ZJM0xkEQ+yAFzozMDmEHBX+wBdFOejUwMOd8VftcFgzrjR7pKnPUI5r
 rxPCuHQIcF0TlI3tEgCStfsyPqi+q2EFHGWZyTprioh4O83QTNJJCbX5F3M79m5eln
 7oXgk4xwuBxLozVU0tQdxILP/frOE/RiXQxczJve8Io0di051znkakc4IpFDw7CBWC
 BZiqWbxEd5itw==
To: buildroot@buildroot.org, yann.morin.1998@free.fr
From: dopsi@dopsi.ch
Message-ID: <20210802202035.405287-1-dopsi@dopsi.ch>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 0/1] configs/stm32mp157c_odyssey: new
 defconfig
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
Reply-To: dopsi@dopsi.ch
Cc: Simon Doppler <dopsi@dopsi.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

From: Simon Doppler <dopsi@dopsi.ch>

Hi Yann, Hi all,

Thanks for your feedback on v2.

Now that upstream has fixed the SDMMC CD pin, I backported the patch
as you suggested.

This is the only change since v2.

Regards

Simon Doppler

Simon Doppler (1):
  configs/stm32mp157c_odyssey: new defconfig

 DEVELOPERS                                    |   4 +
 board/seeed/stm32mp157c-odyssey/genimage.cfg  |  22 +++
 board/seeed/stm32mp157c-odyssey/linux.config  | 182 ++++++++++++++++++
 .../overlay/boot/extlinux/extlinux.conf       |   4 +
 ...-fix-stm32mp157c-odyssey-card-detect.patch |  36 ++++
 configs/stm32mp157c_odyssey_defconfig         |  31 +++
 6 files changed, 279 insertions(+)
 create mode 100644 board/seeed/stm32mp157c-odyssey/genimage.cfg
 create mode 100644 board/seeed/stm32mp157c-odyssey/linux.config
 create mode 100644 board/seeed/stm32mp157c-odyssey/overlay/boot/extlinux/extlinux.conf
 create mode 100644 board/seeed/stm32mp157c-odyssey/patches/linux/5.10.1/0001-ARM-dts-stm32-fix-stm32mp157c-odyssey-card-detect.patch
 create mode 100644 configs/stm32mp157c_odyssey_defconfig

--
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
