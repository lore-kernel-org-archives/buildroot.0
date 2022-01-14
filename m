Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAF7C433EF
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 09:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EF7060AD0;
	Fri, 14 Jan 2022 09:39:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wT_OQfzQJq_Z; Fri, 14 Jan 2022 09:39:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 676F160AA9;
	Fri, 14 Jan 2022 09:39:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0EE871BF3DF
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 09:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B02A83F89
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 09:39:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lyk3ivUqt5tD for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 09:39:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 247BC83F5F
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 09:39:39 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id b14so9948881lff.3
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 01:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QktnRjLdnMVOvTHfgZ3yuYeEpl81zbDfYolFRu7Eqj8=;
 b=Ww6RGUSyUF9K018fKMnLHwnTnyZDEcF1Ry9bjWLUI8Ook6ku3jgy0DWB4DF8g1Bl8G
 E8Sdv9vWec1ewLk76aKPmr7fbXyygIWjzyF2J+/S8w9XlCLbT8v1VBmvDJ3s0q/Dj7xB
 Q79Ci4rCS9JJMLZTwirm6gi55p4eigljoFqJ1MBunY9s6tDLT+BzFCggW825pF97ciuf
 vtvGnmLe89NNiii9f6whw3ma1O2FEBW+Lw5uJP/YO7kDHnPmQ5R4b86P87HY7BXDhtm4
 w48tRQy0uRDXtvjPpsm4UY7+tkGVtNJFkbaGsI326NAmKGhWWN1ixJK4lHDnuvLAUB+8
 BWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QktnRjLdnMVOvTHfgZ3yuYeEpl81zbDfYolFRu7Eqj8=;
 b=M3bURmjpoy83nkor5WauM85JJAzUG/sZxuBIckYEQpyaLQTPvQnEO7y2HOjBXh/Tuu
 yNFlPv1QazGKB+8lHZRBCE0lQsL8CzpJV8/mLEBjYX12p8AWlWj2P45B6bJQ6bF0WPwc
 cVf+lqfVxFe1ftN7lJekLhn3cpuVHldean2xM0PS5bjGVS1adFYG+XQrwyutVIOHPJJw
 XsXks7+xTS/+IhahVhHpVBTprjhvw4PPBdeZM8IB87aZs+gMu8AI9VEFzLsqIjR4jbbg
 7DicbakBaKCL7nRckVvU1vj7z0Qd1pmjHLoPi91+7VVLmpxVT52xFfybORlEkXXXgtve
 H1AQ==
X-Gm-Message-State: AOAM533wdR6C/dihR3RLxIMN/8GdVBqPFCNHkc0bfqalYmgRUmieGkDp
 HQWsMzKiNsqBFnoC9JRdZnsedVm2EGQoqjJWyxk=
X-Google-Smtp-Source: ABdhPJxJjDqWnXJiAMtxgz32cpB0hI5XoRvdEqxyXgcjhyeIY/bIXkY7JO9tOyl/qKqdBY4L1C1wm6YJkGHTNNLwi4o=
X-Received: by 2002:a19:ae14:: with SMTP id f20mr6241771lfc.106.1642153177245; 
 Fri, 14 Jan 2022 01:39:37 -0800 (PST)
MIME-Version: 1.0
References: <20220112184821.916646-1-heiko.thiery@gmail.com>
 <20220113220057.1db30808@windsurf>
 <CAOMZO5C+cjNoVVEe44MsnuZgVj2TKdTJo8xF7Y0o5ksjk_TLpw@mail.gmail.com>
In-Reply-To: <CAOMZO5C+cjNoVVEe44MsnuZgVj2TKdTJo8xF7Y0o5ksjk_TLpw@mail.gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 14 Jan 2022 10:39:26 +0100
Message-ID: <CAEyMn7Z-+WVwtYje4EutgZVBMBZqdvS+3kt7DhGvOzJD0no1Yg@mail.gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [Buildroot] [PATCH] configs/kontron_bl_imx8mm_defconfig: new
 defconfig
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
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabio,

Am Fr., 14. Jan. 2022 um 00:14 Uhr schrieb Fabio Estevam <festevam@gmail.com>:
>
> Hi Heiko,
>
> On Thu, Jan 13, 2022 at 6:01 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>
> > Have you considered using extlinux.conf ? This is generally much easier
> > than a boot script, and removes the need to generate the boot script.
>
> I used your patch as a reference and modified it as per Thomas'
> suggestions to add Buildroot support for imx8mm-evk using only
> upstream components.
>
> Please find attached the patch.
>
> I haven't submitted it formally yet because the kernel does not always boot.

Can you tell me how often this happens? I updated my defconfig with
the comments from Thomas. Now I bootet the board with that several
times and can not see the behavior you describe.

>
> Usually, it hangs at:
>
> mmc1 is current device
> Scanning mmc 1:1...
> Found /boot/extlinux/extlinux.conf
> Retrieving file: /boot/extlinux/extlinux.conf
> 1:      imx8mm-evk-buildroot
> Retrieving file: /boot/Image
> append: root=/dev/mmcblk0p1 rootwait rw
> Retrieving file: /boot/imx8mm-evk.dtb
> Moving Image from 0x40480000 to 0x40600000, end=42770000
> ## Flattened Device Tree blob at 43000000
>    Booting using the fdt blob at 0x43000000
>    Loading Device Tree to 000000004fff5000, end 000000004ffffd6b ... OK
>
> Starting kernel ...
> (hangs here)
>
> Looks like a U-Boot issue that I need to investigate.
>
> Thanks for your patch and hope this helps.

Your welcome,

-- 
Heiko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
