Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08585C43217
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 21:41:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A60D260F93
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 21:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A60D260F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61F2560B08;
	Mon, 20 Sep 2021 21:41:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qsxWXE4OKncQ; Mon, 20 Sep 2021 21:41:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 189FD60B00;
	Mon, 20 Sep 2021 21:41:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55C3D1BF3C6
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 21:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4492C404D5
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 21:41:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nZE9lK6Vt3li for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 21:41:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A2C3040124
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 21:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1632174083;
 bh=inIIP0tuBzI8RlxOa0in7LfI8rqE+rkFeUDyxop9NW0=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=W7j2EXnbhCdIb0pDD3gO7T1mnIRR3cYvTrKx1IRqi28XiFWxmoDUrRZF3Y3ZS4b2L
 fIWKkb1p3lNzJ97wFx33SstECcN36t6GabVgYK/X91Lld/efFUsHrhdGqnQLDAKwVL
 r0QYLzhwO2hv4AiTLbpqn7+/NoFDck3pzQdPBXJc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MSt8Q-1mJCjF30la-00UIWf; Mon, 20
 Sep 2021 23:41:23 +0200
Date: Mon, 20 Sep 2021 23:41:22 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <20210920234122.3cd8ed56@gmx.net>
In-Reply-To: <03db0350-bfe4-40ec-c82d-4385fc726b27@xes-inc.com>
References: <20210920211328.17526-1-ps.report@gmx.net>
 <20210920211328.17526-2-ps.report@gmx.net>
 <03db0350-bfe4-40ec-c82d-4385fc726b27@xes-inc.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:HXeoBq99PhMhb7qGTCoCpbKjyzkcjcZF3UU9qB0zxPa4wFPG+6q
 GBdFrtpxDshxzmzzos4E8KDYDnCPOkhjhBbB7Kl6Uu3frVHK6amUvsnC6qTISAVGpDlluN0
 7AMTofa2WOEUpvl/zMv6HbbUSzp+uIPRsXtQM0O/2m4PJ8kGhIPgSM1F95Ze+5BC4dV5RGp
 Cgu5RxTQ0kjk+3wt7kilg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7eWaNWAXfgo=:k+bgkR7gU3sh9P2ev6Lnzf
 1xo2UVKYuoas2prI7wp9UiZM0RFplNMsBcXvJizEKaD25WtMisqEUgs732DwWC63FJVLr+xdP
 eWX6D4vqTY+ig6un/SwaCiGyR0OWI+wmZUY3+dBrJNbM/9M0knnmUCXIM24D9r+g1vxE3Kwg7
 auQt5OzkGnHZkhfoWvpzQ/sE0nF3Cuo/rrZMwO+qowjN4OFsQjv+uOHz+bvOkrZqQWBSP7qSH
 K816/HwReztwGVAqUHrD1/bIKrkIy2/fFevq+lEDY7hz0OQQza0O47/0Du0tXi28TwlqtSA+i
 KnNnkhhiC3ChB4YlGjvaF1W1aoMSZC2SPlJ8wB3EMixKZFwxnzHB375UeuKtwW3ASca/NF0WB
 1PnqGg0v9ZfL5lOxji0k82+f9ktrqR3lC3u4UX6mTxH//smIyz9gg6+jlYtvU+8LygldKX0ec
 j22X/w206+J2Z+/4hxGAgdgHC3QJjv+CTi/RoYhkouKFxmS8NU1+pUGEJgDKxTIRozz5eDmCL
 ZClnRz6ZZLVLctqf3Qa5+oy0gxnNm4U/M2cB6OL6lce1Zo4KKmwlwPLkdvdrm1KVSwkHKWfTr
 982qSziKl/FS2zEfikupapapen8c6gs4lzRfZTuwM3hc2Uv210L2GV3A7WYuYgMqR0sxIxXJh
 RpPjB+Yu2LA5zKUHNIuW924IMOpNy/WV0iZkLr0iEbGZwdlPPAljT5LBjOHPxApGPGLyYfZDt
 IpxEpW3xJs1dtD3XHvqvltbRTLUh7MH7Mye6jgdBTP1xZlaPG4R87KpKq9mq+UqzkHaWR7h10
 fc4EJedVd+h7BuaKukg9JPRYAzKzHR4/eScr+MeWpmaeEy/S8mdydfeNNC9+4Yky8kN4DoCZT
 15p/5PitltAkglv0/9/6vx45+nEb8Rdm5eogpn3TSE+qryqHjhwOsEz6L7pApQweR0jfN8g2p
 67PmBLTy4D0rkKVZ3xzsW1gxma+BHyL7Y9mR5AiIyeh7c91jjlMxGqOZ4xlypt7TvAdj5pe1C
 OOwbGW1dhQYy1hxQpLCNeotXQxRSBu2sLt18aWTnPbP1FtiYx1P/GOlD4CNwRua8TEyWpmHGB
 72vB0vAi+26DhI=
Subject: Re: [Buildroot] [PATCH v1 2/4] package/rpi-firmware: bump version
 to 9f97081
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Arthur Courtel <arthur.courtel@smile.fr>, Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hello Vincent,

On Mon, 20 Sep 2021 16:19:57 -0500, Vincent Fazio <vfazio@xes-inc.com> wrote:

> Peter,
>
> On 9/20/21 4:13 PM, Peter Seiderer wrote:
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >   package/rpi-firmware/rpi-firmware.hash | 2 +-
> >   package/rpi-firmware/rpi-firmware.mk   | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
> > index 7127b2d824..d6243cb54c 100644
> > --- a/package/rpi-firmware/rpi-firmware.hash
> > +++ b/package/rpi-firmware/rpi-firmware.hash
> > @@ -1,3 +1,3 @@
> >   # Locally computed
> > -sha256  5eaff5da660d6ecd74bb2c927d7a1ba84b5e5c5582f02e65aec058af2ffe50f4  rpi-firmware-33e09977ff3b02967d191801e3361224455acb9d.tar.gz
> > +sha256  60be376238b08b928f98a25ecf90172067c17ad1db543d813409ee6c54b13b07  rpi-firmware-9f9708199f8809ecf16119d0716375bee7b7d8d4.tar.gz
> >   sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
> > diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> > index 181650fa08..6a2bf05248 100644
> > --- a/package/rpi-firmware/rpi-firmware.mk
> > +++ b/package/rpi-firmware/rpi-firmware.mk
> > @@ -4,7 +4,7 @@
> >   #
> >   ################################################################################
> >
> > -RPI_FIRMWARE_VERSION = 33e09977ff3b02967d191801e3361224455acb9d
> > +RPI_FIRMWARE_VERSION = 9f9708199f8809ecf16119d0716375bee7b7d8d4
>
> There is a regression introduced with
> https://github.com/raspberrypi/firmware/commit/25e2b597ebfb2495eab4816a276758dcc6ea21f1
> See here: https://github.com/raspberrypi/firmware/issues/1619
>

Thanks for the info, only did a quick read of the PR 1619, the problem
seems U-boot specific (not the buildroot default case) and there is
already a suggested U-boot fix (submitted by you)?

Regards,
Peter


> >   RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
> >   RPI_FIRMWARE_LICENSE = BSD-3-Clause
> >   RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
>

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
