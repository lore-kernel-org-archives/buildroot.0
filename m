Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9643B107BCFE
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A57441012;
	Sat, 14 Mar 2026 07:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AW9LHpOy2huF; Sat, 14 Mar 2026 07:54:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEAF241004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474844;
	bh=c6ZiHeBTFYrF1yLyT7q4CYATQhXKNpWUINWkvwrIVxA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=U6ZqGHmc8l8C1iop1rb3XGFfUVRRml7lwClseAfUqiuvKOVOmbzNETUCozWXXvZrY
	 1aT/yKY+s/Nunctn20MFFRJiJJZis9xDVmltHgtBBVmAGEwtZM8V7i0LnlQ3pfRxfr
	 g3LtiZfTk/vPN/TTg/lKIH0DWYsRshLjQKbCrM7UrSNTYtW3G21IoSgXUJKME5iM+e
	 ttTvZQUul5p5/baWf3PUK5wAAYLH1NTWWI7WiSAKpnWPb+NkYABdaL+XrieuSsw1EW
	 Wr/0mM2AjLgPuUP8qvXETEYNyIBCHxxWWit+R0yc9bz4adRhMYe//oUvhl2vcWtjzx
	 LNI6/yAY5/4Kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEAF241004;
	Sat, 14 Mar 2026 07:54:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 273C31B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1851660EF6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KXusU1PymMSt for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:53:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 378C860EF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 378C860EF4
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 378C860EF4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:53:59 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-4327790c4e9so2188201f8f.2
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 00:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773474837; x=1774079637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=r/y5ytWuxu3xS3ueKqOZ3Zq2jCZMHuJPrd226iAWcoQ=;
 b=B9UkhXs0X9uUtCdUSGf4eSju0MjPLZngl5uJWf6+X4iB57Obw2+uLettqVyCTbLqHq
 oH83bcN8qYqwFBBd57+i2ZTjdoDXlaiI0RrmSUO+UKYTAUXKuxVktPWvvaPaJLCGp0h7
 lk08TCPEWYES18sjtDej1djGJGbLUB1dEbVBLorPiVw9wluUDJVKkg0XhZFZ+pbpK+lX
 i66mNvHbvpSayWeoATwLpE4yxzr13aADViiqeZj4os+kaFzZHi7G3l4RH5LEBYg7XT9g
 TEEVs2ZPl5nXRs/5IK7l+R0c2qIuu3HQMmIoJ98tJFS/sARhu999/DmLZUUblniRWUMn
 dCvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMdxvGRJf94FyIiq1oamrPxXoC5SWa8JxXheXDQka2sCiVOLMrWv2Im8E3n7CYHigXbTIODOpMf9M=@buildroot.org
X-Gm-Message-State: AOJu0YysRfnV08CfeERfc6rStVyZ+tLIeBARoA7/i8af+4LR6NZET1nz
 +OxvTWduOayODc6dYIa7+9GyRf6Tfv+WWpCIbxacjIYN8XRoMfcafZQj6+PJyrRpsxE=
X-Gm-Gg: ATEYQzx6W1lXC6cxXPBhQeTam1yjnsznbEsaMOg/L+8hZg+2Hj5tlh7Np73T4CZ8G0Y
 1hoFeAC7SWN3XkpF3O+kaKza0cGK13Qhfnwb0W3Nzexg5d++YWK1Z/Boe5gGIX0tQ2esf3zJSUb
 IunxqE9UP3hOOudidsL4riOXZ4gHFZI0TYWv/YsdRzMwvl/itpHydEyakWkDC5iKSaBbPSfg4JZ
 f13ZHjcQhdWPWbzVapxSVBsSiJrV/C8RhT8ePnH2SC9lXuNSBknYGNlqxp6B1+qNBUgk2rIsrs+
 eqM5LrV/ddQP6XVlHhGxURdyRVomqK+qQo7Ehj/3ZF2QCTtWH05H3XT7lnwBdUaelWEB5yGRIc4
 Rar+o+Rpz01d1A+sYnDPvXaqACyepiRXYEcMxsEU1pPTkbGtM8Dj5Xx25daI/bcZRDHLEiPv5Pz
 2AxXf4PaZ+d161gPk=
X-Received: by 2002:a05:6000:290d:b0:439:b6f7:7ed9 with SMTP id
 ffacd0b85a97d-43a04d866b4mr11053423f8f.10.1773474837096; 
 Sat, 14 Mar 2026 00:53:57 -0700 (PDT)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe2187aasm21237811f8f.30.2026.03.14.00.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2026 00:53:56 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 14 Mar 2026 08:53:56 +0100
Message-ID: <20260314075356.15006-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305210950.3471974-13-bernd@kuhls.net>
References: <20260305210950.3471974-13-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773474837; x=1774079637; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r/y5ytWuxu3xS3ueKqOZ3Zq2jCZMHuJPrd226iAWcoQ=;
 b=GkwKfupJV9I0EiyJNDaaqbH/8zo3ASuuIgAv9O93SESHWd77G6ePiqblj6mUCw86Mz
 xZJWRkzZCjSpo+pYnSihICEde43E6mjBYdHYPFtmMZHHSLiaLZbZCHiUjgZxNYwSlIc4
 97zx1r/cuCNl0Wo5FZ52gybJryc6Xfb2yCLeMRRuZ0fj57pCPPl0BXxcZWoWxGy5Un4r
 KrQcI8AbS5qW8YTcq+ceWfORBp2Tdo+0W2KWXmoYM2dsx1/2/v/vqQBMSXzXXiNI0n9A
 9fIIxCqw6NH4VCgh65Z3wY/QKo8HqC+2Mtg02JM+WNOA/V07J/fDTIokUH/MXJkGbqO4
 iC8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GkwKfupJ
Subject: Re: [Buildroot] [PATCH v2 12/14] DEVELOPERS: remove Bernd Kuhls
 from libldns
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2025.11.x & 2026.02.x. Thanks

> ---
>  DEVELOPERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 2673a59824..835be1f6a3 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -430,7 +430,6 @@ F:	package/libhdhomerun/
>  F:	package/libheif/
>  F:	package/libid3tag/
>  F:	package/libilbc/
> -F:	package/libldns/
>  F:	package/libmicrohttpd/
>  F:	package/libminiupnpc/
>  F:	package/libmspack/
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
