Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F98C433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 11:27:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88DB360EFD
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 11:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88DB360EFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 479EC40568;
	Sat,  9 Oct 2021 11:27:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zSyiWTVwBilt; Sat,  9 Oct 2021 11:27:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DFE640502;
	Sat,  9 Oct 2021 11:27:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F8521BF36E
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 11:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F923837BC
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 11:27:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2PABRkzem-3n for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 11:27:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCC45837AC
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 11:27:22 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id m3so50453736lfu.2
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 04:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Gw9ZKLRsrEa9bSnGMiPgh6WP/hdrKfTT6Csi8SrSrA0=;
 b=l+fkbombSf7Nqq7jZO4FW2+TbSul8pgHX/OVTV6UxHnvRy++BeteLV2P50sqk+0gll
 Yrsz5GzOYmCDoX3Ce9LPuv2sQ2a1gqVVaQLRNqAp2PDoWJkXkqQllI+lTJdHOYbYXvU3
 Y4UJh63M0nzSUGOo3jroBF80g8Ip9ct4Vf2sXhznuwk6XhGwW9sF8JwIgpXCotpgUxhU
 sVRUGwmGP4vUPWSYjastpMFGa6JHQ9hdDzfMi0UN1VbK2VKKgZYbBXknG2g63l2WBA1w
 W2uk9qvvKYNS0Z6idPij5mF0hRTdOBb6MBrvEjVKpzhn7875yUmrE48hPR4p5jVGwSY3
 rmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gw9ZKLRsrEa9bSnGMiPgh6WP/hdrKfTT6Csi8SrSrA0=;
 b=2gi3OadEL9cyFppzNgkH1dMXm+/KsiReWHcx9A+SR3eeVSQ6jGJaIlYfRfMGj3Hj6B
 PjUDTwdPMoCeDKzXNmubB/2iQGsYLTNa5t+LuO/3rsXS1oYXmr5H2Bj/nQygJsx7aZ39
 8bFYoRM6s+9Qt+ddrJc+s6tMWmdhatOvWvgIIiHkuZJBqhLV8YSrLqNcR85AmNlCKYEz
 MchZIgLOBrm5kIrBEZfqbkrW5ok5peyuFud/rz4PlJbwHDPq7hyx2PH9mmEgVpl+yFqw
 SHzdnKhpCRNaMegvzDukpSgHHf0p14nr4IvOGyETfkUGwD9rwuztzXwS/lh1y22n8hB8
 0g+Q==
X-Gm-Message-State: AOAM533BvcOsexzZUqSOhYElZNcC7fSrbPafBXobAvz3Bm8WlSQ+Of5J
 u1diXB9uytDjiJovgkECQZSKsHafRC8=
X-Google-Smtp-Source: ABdhPJxHiriPTvn22sEPBfOVu+WHp2H8UsPOwWIsl+yGNaBRvSqr5RcMoF1SgKHlIgORySMAtmxkYw==
X-Received: by 2002:a05:651c:892:: with SMTP id
 d18mr9716972ljq.12.1633778840439; 
 Sat, 09 Oct 2021 04:27:20 -0700 (PDT)
Received: from [10.0.196.136] ([94.254.51.197])
 by smtp.googlemail.com with ESMTPSA id b15sm211441lji.126.2021.10.09.04.27.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Oct 2021 04:27:20 -0700 (PDT)
To: Peter Seiderer <ps.report@gmx.net>
References: <20211009094144.130161-1-troglobit@gmail.com>
 <20211009123049.0359d4c3@gmx.net>
From: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <cd68258f-839a-9912-a709-24d5943b770f@gmail.com>
Date: Sat, 9 Oct 2021 13:27:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211009123049.0359d4c3@gmx.net>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 1/1] package/libuev: bump version to v2.4.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 10/9/21 12:30 PM, Peter Seiderer wrote:
> Hello Joachim,
> On Sat,  9 Oct 2021 11:41:44 +0200, Joachim Wiberg <troglobit@gmail.com> wrote:
>> This update is critical for linking against GLIBC v2.34, due to the
>> changes related to 64-bit time_t on 32-bit systems.
> Thanks for the patch, version bump already suggested, see [1], but
> preferring your version because of the additional glibc-2.34 info ;-)

Ouch, sorry about that, totally overlooked checking the mailing list 
first!  Thank you, yeah I thought it worth mentioning since that
transition will be a bitch for a lot of packages.

> Feel free to (additional) adopt the package ;-)

OK, will do! :-)

Best regards
  /Joachim
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
