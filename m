Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375FFC4708B
	for <buildroot@archiver.kernel.org>; Tue, 29 Nov 2022 22:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C26034031D;
	Tue, 29 Nov 2022 22:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C26034031D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X59ntPXBU9lL; Tue, 29 Nov 2022 22:07:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08B3240194;
	Tue, 29 Nov 2022 22:07:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08B3240194
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 85C621BF5AD
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 22:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F34D4171E
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 22:07:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F34D4171E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IB6CYYUg-aj2 for <buildroot@lists.busybox.net>;
 Tue, 29 Nov 2022 22:07:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9A6B415EB
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9A6B415EB
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 22:07:34 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id z4so24325202wrr.3
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 14:07:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m+0poN6mrWeNmG4MbnViK+m6MyK1P/xPybijC6Kbuig=;
 b=MY3CdPaNT9g0yWnqvvV0L13bNE5XC5jb+8L2g7LdqhQNN9W5qfb26WeBvIqalZzHBQ
 I34TUl4yMjntl6KyDYmAaOSXCoXdwzJYYMumrac8RO14zRt9OL3qHuJb50VePVV31mdx
 7rDnQUNQCDVJSg1M1bnFV54PYDhF7p6RK9Taykjj49krSnPBsn15WciVFQvOgfuVxcHB
 2ZJOsDOQ+vBg8snpdizgCJtHFJN9Xwgbt1xXtK1FFjY/3QklCVILqmEu6/6SgnJj2mhH
 MBo7bveM8x/CakwJ5LLGBemt4T6M+3ASH7Fm8g/bKyuA0sE/vzW4gNQMdbGYv8UtsSIq
 lHrQ==
X-Gm-Message-State: ANoB5pm7CiKA1Zm3bQoXG2l6EKuCV/fgyRx6Vrb8+kORN26cY6wDp85o
 lRnJUXbc/GuJwuLvNZGFgAfb3qBjweMcZQ==
X-Google-Smtp-Source: AA0mqf7R31sz8CypNaCrWRKlAegAiYjBMEHhHK7tTC0XT+kb/FMrnYdghV5n+7RpBoyLx3R8abBBUg==
X-Received: by 2002:adf:ee0d:0:b0:242:28c9:d116 with SMTP id
 y13-20020adfee0d000000b0024228c9d116mr1005910wrn.286.1669759653006; 
 Tue, 29 Nov 2022 14:07:33 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 j33-20020a05600c1c2100b003b4ff30e566sm1610931wms.3.2022.11.29.14.07.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 14:07:32 -0800 (PST)
Message-ID: <7d82a3ee-a476-74e7-2c42-1a39ed0105df@mind.be>
Date: Tue, 29 Nov 2022 23:07:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20221129210800.802451-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20221129210800.802451-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m+0poN6mrWeNmG4MbnViK+m6MyK1P/xPybijC6Kbuig=;
 b=X4DBCCo3HEMERsYOtWjeA4beIMrFOZyvMPElcn/IvDfU5DY9ZsXbYJDiQYSUmOFBy1
 gGoadW13+ARcxhS4hCuZpEijhG0tVir+2ov14qAMsPDqIeK8IrlawJ7+ySOR4venmGcX
 zG5pCUjaG6QZ3zoIbglJA80jPKqSNEDWTVLGt41t5I52c6cwqDrBh1Q00DE/p0/n8/Ea
 1R1lZJWiQp2amNyBeaQ8QBA5ckwizvZCLORpMK+TMt4lz3+XqkgNj+zsoX+m8n0BhpMP
 QEM8znK66b/PVtYg2pVwdj+NGlBROlOwraMY3Y/ekxCBxTb/DdgtdtPKyScdNPedR0O9
 wloQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=X4DBCCo3
Subject: Re: [Buildroot] [PATCH 1/2] DEVELOPERS: add Giulio Benetti to
 rtl8192eu package
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/11/2022 22:07, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c8a052dcec..eecb4bab82 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1153,6 +1153,7 @@ F:	package/qt5/
>   F:	package/rockchip-mali/
>   F:	package/rtl8188eu/
>   F:	package/rtl8189es/
> +F:	package/rtl8192eu/
>   F:	package/rtl8723bu/
>   F:	package/rtl8723ds/
>   F:	package/rtl8812au-aircrack-ng/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
