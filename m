Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE48C433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 20:27:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E003060F25
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 20:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E003060F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7B6140256;
	Sun, 17 Oct 2021 20:27:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DgNGXSL47kIl; Sun, 17 Oct 2021 20:27:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F40C8401D3;
	Sun, 17 Oct 2021 20:27:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7104E1BF593
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 20:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B36E606E7
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 20:27:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6j-y443CLQKk for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 20:27:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF720605D6
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 20:27:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4430:5ced:ec21:1036])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 121D0780340;
 Sun, 17 Oct 2021 22:27:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634502448;
 bh=RqVtwrp9NySC9TfUrbc598nRP9ANhF9kIBe+cHp4EFk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ldrRUXJ951CXKHD4lccVFXVsLlwGDcGLoC2qLqoPJoU8VNHIDO8oaYF+zP57qWt7f
 spYURuP4rnA2rv9u4V9E21wUN6S2ww6FdLtuJUZYDOYwTUpGYIQ6IpcaVFLvJQAUz1
 Yp4zl7F5ofovwofKPK2x5CF8jdDujEyPtzKYmx4mO1OoNuf0M7rwmOT1OBCc/3xfaw
 YePyKMFR9tvxTjioRwpYio93aUYjyh7IUS5xcsp8FZlZvRKQ2aeHTW1YT62MeYzMBs
 I+1zC53ePn7Dql5nF9rKAomKLBlKFezDjd4uI3nWDYQpw1dwRS89OO6q5Tl9UTTC3y
 L4mAhzueFxL5Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Oct 2021 22:27:17 +0200
Date: Sun, 17 Oct 2021 22:27:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20211017202717.GR2400@scaer>
References: <20210921202137.7092-1-ps.report@gmx.net>
 <20210921202137.7092-2-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210921202137.7092-2-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v5 2/6] board/raspberrypicm4io: enable RTC
 and USB overlays
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
Cc: Martin Bark <martin@barkynet.com>, Arthur Courtel <arthur.courtel@smile.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2021-09-21 22:21 +0200, Peter Seiderer spake thusly:
> - add RTC and USB dtoverlay entries to config_cm4io.txt

Why specifically the RTC and USB? And why only on the CM, and not the
other boards?

IIRC, dwc2 is an OTG chip, too, and it is also wired on the rpi0. Well,
by experience, I know that the rpi0 *can* do USB slave/OTG.

Regards,
Yann E. MORIN.

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v4 -> v5:
>   - new patch
> ---
>  board/raspberrypi/config_cm4io.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/board/raspberrypi/config_cm4io.txt b/board/raspberrypi/config_cm4io.txt
> index 01f60395b3..cf7e6df1a1 100644
> --- a/board/raspberrypi/config_cm4io.txt
> +++ b/board/raspberrypi/config_cm4io.txt
> @@ -24,3 +24,10 @@ gpu_mem_1024=100
>  
>  # fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
>  dtoverlay=miniuart-bt
> +
> +# enable RTC
> +dtparam=i2c_vc=on
> +dtoverlay=i2c-rtc,pcf85063a,i2c_csi_dsi
> +
> +# enable dwc2 USB controller (USB 2.0)
> +dtoverlay=dwc2,dr_mode=host
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
