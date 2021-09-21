Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8193C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:39:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0C3661168
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B0C3661168
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81BB04065A;
	Tue, 21 Sep 2021 20:39:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RBpbGudZ_IQx; Tue, 21 Sep 2021 20:39:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2FE740695;
	Tue, 21 Sep 2021 20:39:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B96F1BF47E
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95BFB400E9
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:39:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lYfG7xXjvsl2 for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 20:39:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DEC94400CF
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 20:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1632256773;
 bh=j9gGwj+uKGBZJhTzAhHDY6GK9VccPxeht/iJW1UmdNI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=JTyoTgPPUhL6DPgYjgQeSGW4ZMRpMo/HK9zuVCZQFb96W+DSAg5xLvgpHFOQYsjkY
 B6AGqHEP+OFD6KG0V9UltJJAQti6BbzABQvY7CfTaf8FD6sZGU05Cv2W5MBBaDZtYp
 kfcPztqz4vHNjwqnL+Uq8FPl1n9gZhD+wq0HR/JE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.170]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuUnK-1mjtlH0Jxi-00rXPT; Tue, 21
 Sep 2021 22:39:33 +0200
Date: Tue, 21 Sep 2021 22:39:32 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <20210921223932.5d85a71d@gmx.net>
In-Reply-To: <2913d23f-db1a-ce12-8f5b-ffa33911c35d@xes-inc.com>
References: <20210920211328.17526-1-ps.report@gmx.net>
 <20210920211328.17526-2-ps.report@gmx.net>
 <03db0350-bfe4-40ec-c82d-4385fc726b27@xes-inc.com>
 <20210920234122.3cd8ed56@gmx.net>
 <2913d23f-db1a-ce12-8f5b-ffa33911c35d@xes-inc.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:PiBzm9JxW6Svfc+swtJaB/rNWzDFJodP5NzdJWniPgT+1kvmPa4
 mQfD2j7bVvqoqB9j+CVcNi7OqncbRJlxTZCRIjokmSjfVyLIQsNJJqoqSiTdRGX38v0Et0x
 PKjFLz17hwPtbybbWMuNG3jUT3qzYFpvPovkTW76X8VsuNN81gQEfHNETy/9BD1AimXRMHm
 Uo+sP3Vf5J0hv08QnB4qw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1FuyHOixba8=:oa/duN6NV5DwCzrrO5HLdo
 hvirf0CPGpTO5ehKkWcf9EJPC5URofAQarnrdLUykk+Rluu/RYeKHZZ1tO6lBXEa7svexKFFu
 wwCc5UXwn2e1R5wHXiHzY4WLtOy1pe7hxCE+JIGzPf5zU7OFv4gjRPJ/cE9uH3KkR3lC/sEYW
 Ndw+dVB1343tbBAT9ByZYrWxBGpTHB4vZwoLJh3sj8ZEiUDf3gc+L3/UEt/1JMfHVK3hWYdsI
 RXFsv58LogGSTiPmerHxLvu5DEFxFtZSRtlAmGAHjUWMqwJT9eEowD8D/X3hDXXkwLPcYdSSt
 1T3V5b1FqlakFIWHTbY6IHBio8DitR+rYxPCAQRR4iW5BHtTLwXHKCdLXo3zy16OxuuGS7/El
 sVKccBw7fekVFWdD9Bq/SmRsykYserd2axVLESPBrkuzWN8UvTAKGxNvSscUZyAz7w+boF6kj
 3+mBGQmLR4TKks50sz6mFqoLwATmCOG1DSnBBb+G3+l6U9CHmT0Nn1Ec5tJdKYba2aDJYMhR/
 1Q2bbJqcypSYhDsFJ6aIXnC4lN+BVzu9y9+FqSPcfhv5r/um0OM2rZFS3g4hvePPkszOp5AG0
 wCiSra81Taj+SsEJrcK+SPWAgpcxsyGQ3RjKe/DOnvvW4y9tqr1VUS/rIdYbNaMzHtONaRzJj
 2K2YR9y6Q3xwr6gPHaE/PcYvlr52gKiw4NWUWRD0+RLQHVvE09AAChRVe5WkQuQvwOktWYBZ4
 n/ZljdidJrgo4n6xZYswLERS9SnYZGqnyv7y4mgU6iB6hKaMKPqoh3dT/cQzLTT0pjNHJRakS
 5pKK+Z+FZcSVRJOYcruun5wQlFEoXXCe7IKjVeJk1rSm+BBWspAtBrp59BMmJFv1h4sJ/s9QL
 bFDiqIcRyatC52yYGppZn+HeAoup/F/xsSQbufzE3G+Q7S9lgl+62ywp5uajNWNZAGx+p9hTo
 O5+2H4rxepFnilNtOqPAGHF1yUGILKtkwFH+rd/kAI4hKSC6+EElh2ZFfSM2Hn/kjq+y4Mzgs
 iioM0VbjcjORXFIifhz0e76SzK3UaSZtKpGe5i02vHWtREXh4T83yq47i6Py9H5fCQ4l+rovp
 QOeJeLnz7zw2zE=
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

Hello Vincent, all,

On Tue, 21 Sep 2021 08:08:10 -0500, Vincent Fazio <vfazio@xes-inc.com> wrote:

> Peter, all,
>
> On 9/20/21 4:41 PM, Peter Seiderer wrote:
> > Hello Vincent,
> >
> > On Mon, 20 Sep 2021 16:19:57 -0500, Vincent Fazio <vfazio@xes-inc.com> wrote:
> >
> >> Peter,
> >>
> >> On 9/20/21 4:13 PM, Peter Seiderer wrote:
> >>> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> >>> ---
> >>>    package/rpi-firmware/rpi-firmware.hash | 2 +-
> >>>    package/rpi-firmware/rpi-firmware.mk   | 2 +-
> >>>    2 files changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
> >>> index 7127b2d824..d6243cb54c 100644
> >>> --- a/package/rpi-firmware/rpi-firmware.hash
> >>> +++ b/package/rpi-firmware/rpi-firmware.hash
> >>> @@ -1,3 +1,3 @@
> >>>    # Locally computed
> >>> -sha256  5eaff5da660d6ecd74bb2c927d7a1ba84b5e5c5582f02e65aec058af2ffe50f4  rpi-firmware-33e09977ff3b02967d191801e3361224455acb9d.tar.gz
> >>> +sha256  60be376238b08b928f98a25ecf90172067c17ad1db543d813409ee6c54b13b07  rpi-firmware-9f9708199f8809ecf16119d0716375bee7b7d8d4.tar.gz
> >>>    sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
> >>> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> >>> index 181650fa08..6a2bf05248 100644
> >>> --- a/package/rpi-firmware/rpi-firmware.mk
> >>> +++ b/package/rpi-firmware/rpi-firmware.mk
> >>> @@ -4,7 +4,7 @@
> >>>    #
> >>>    ################################################################################
> >>>
> >>> -RPI_FIRMWARE_VERSION = 33e09977ff3b02967d191801e3361224455acb9d
> >>> +RPI_FIRMWARE_VERSION = 9f9708199f8809ecf16119d0716375bee7b7d8d4
> >> There is a regression introduced with
> >> https://github.com/raspberrypi/firmware/commit/25e2b597ebfb2495eab4816a276758dcc6ea21f1
> >> See here: https://github.com/raspberrypi/firmware/issues/1619
> >>
> > Thanks for the info, only did a quick read of the PR 1619, the problem
> > seems U-boot specific (not the buildroot default case) and there is
> > already a suggested U-boot fix (submitted by you)?
>
> Yes, sorry I was not very clear in my email yesterday (I was sending it
> on my way out the door).

No problem ;-), the hint was/is very valuable!

>
> Yes, u-boot is affected, though I think edk2 may also be affected. The
> u-boot patch has not yet been reviewed and may not make it for 2021.10
>
> I just wanted to give a heads up that bumping this package could have
> consequences for some configurations.

So there are the following possibilities:

- never update rpi-firmware to not break legacy u-boot (and maybe edk2 and
  maybe linux-mainline and maybe ...) setups

- delay the rpi-firmware update until up-to-date u-boot (and edk2 and ...)
  are available (as this bump seems to fix some other regressions e.g
  'kernel: Second attempt to fix the CPU startup failure' [1]

- apply the rpi-firmware update now and hope that this email thread is
  found by all people affected by the u-boot (and ...) defect, but
  keeps the default buildroot/rpi users up-to-date ;-)

Regards,
Peter

[1] https://github.com/raspberrypi/firmware/commit/9f9708199f8809ecf16119d0716375bee7b7d8d4

>
> > Regards,
> > Peter
> >
> >
> >>>    RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
> >>>    RPI_FIRMWARE_LICENSE = BSD-3-Clause
> >>>    RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
>

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
