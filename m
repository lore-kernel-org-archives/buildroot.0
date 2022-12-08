Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5727DC4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 18:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C09941917;
	Thu,  8 Dec 2022 18:46:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C09941917
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XNuM2DgEgKLc; Thu,  8 Dec 2022 18:46:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A547441914;
	Thu,  8 Dec 2022 18:46:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A547441914
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9CB351BF3DA
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 18:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77A8B820DE
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 18:46:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77A8B820DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DJckAq8p6uWD for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 18:46:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8652D820DD
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8652D820DD
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 18:46:18 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id y25so3382363lfa.9
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 10:46:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3DBuNTtyNnG57Yxbu7L4/2imCBuDHZtfanrLsXeX+/Q=;
 b=YaxxJgX7Za7bxhMnenV4FC8mEndj726THFP4+fLo0k5l1QCB7+IqcWlh1uIYinMo1v
 6m4XT1RuL6OZTWs3ye8IVjxoL0lgL+lMZkngjcXPDK5orqQDEWm3mTuF6iPJv+PON1BK
 DYCY6HYY2h6/F9LS0QIXZZSHC/oTJ37ECBIu7+6hKXt8Vlf9sQLuRrqoXcE017uw6VgS
 Dio6p+TdvWo/YEPSz9YRYq2gWTjS3GDsPRgRLDjXCpgQz+bduMOOLFL4NVqpZWsQM581
 rXhTFa2fbaI84kRBqsbPscQje+xpwA7i2Uffl7wZdXsqjDM7D0AWg8F2gaixkqE93+Xl
 dKag==
X-Gm-Message-State: ANoB5pkSTfoyCqQs0tsFrJmS1tiNzo/K+e96Pxhob9BzRz47RjC9lEhB
 tUFW3UOoZiWrg3kH/RSAfUqFMo3SJNM=
X-Google-Smtp-Source: AA0mqf5lYhiF0bItq46NXFc3ndH0yUWyf4QX7PLimsYoJZOcIbJO0n7l26TGf5FJD6UEOAqcIKXvFQ==
X-Received: by 2002:a05:6512:21b:b0:4b5:5098:e6f7 with SMTP id
 a27-20020a056512021b00b004b55098e6f7mr621682lfo.68.1670525176364; 
 Thu, 08 Dec 2022 10:46:16 -0800 (PST)
Received: from curiosity ([5.188.167.245]) by smtp.gmail.com with ESMTPSA id
 c17-20020a056512075100b004b50b4f63b7sm3445704lfs.170.2022.12.08.10.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 10:46:15 -0800 (PST)
Date: Thu, 8 Dec 2022 21:46:14 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <Y5Iw9tj1ivJtQ7xb@curiosity>
References: <20221208174057.687435-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221208174057.687435-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3DBuNTtyNnG57Yxbu7L4/2imCBuDHZtfanrLsXeX+/Q=;
 b=cyDjxQLaE0kjdw5tYDy2wgk0f1ay99hLGWjBtioAMBX2jGJ40BO+uVbKN98pRaWUJu
 QrteIfbEmHdYYu5lIRXOGf+4sC7xZ6CdZIlkoAThaEy/15lUSC/0XDBRp3NzK1lvK24L
 TuMi+OQSHno4RSmNhcFfrSwEn4NcmD69Z5BmJwzWpNT95GlX+zcsFvE2ZJpgplYWrA0Z
 IY+NBExSyc9F4b4WxqXp9X4P+8Espo6L4m+gQGWEWFIq/jojsgDbYa9y5xtpsgJ5yMVB
 Uf/hs9Pl9wBjq58ZZw5JLKYOXmdH5AdkmWhuQ+8s9+mYBvfACiQg8no5AhzXARSmfYY7
 0gpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cyDjxQLa
Subject: Re: [Buildroot] [PATCH] package/xr819-xradio: fix build failure
 with Linux 6.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> Bump to latest version to fix build failure with Linux 6.0.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/xr819-xradio/xr819-xradio.hash | 2 +-
>  package/xr819-xradio/xr819-xradio.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Could you please add references to autobuild reports.
I have at least the following ones in my mailbox:

- http://autobuild.buildroot.net/results/434c1d2a5104090366519278314bf750324d3710/
- http://autobuild.buildroot.net/results/002cbbce02db8ccfc6e8f4eff8998f75615745a9/
- http://autobuild.buildroot.net/results/738eebd1e2480592100d92a80e801e01bfd32d9c/

Regards,
Sergey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
