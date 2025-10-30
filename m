Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA1BCCF9F8
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E34DA81332;
	Thu, 30 Oct 2025 08:24:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id giu2colDynFH; Thu, 30 Oct 2025 08:24:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F6E98117F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F6E98117F;
	Thu, 30 Oct 2025 08:23:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B52B2A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D6194117A
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vYO4IH-GcQeo for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:23:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 905E041020
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 905E041020
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 905E041020
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:51 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-4285169c005so422987f8f.0
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 01:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761812629; x=1762417429;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NJBohVKnYkTLFBnlNLQYHtKs0qmmSPMOB2UPyj4S6/A=;
 b=H10Az1A5KO0ENzVOHaUcUUTBamh/hz5RiWVSmLFEUrGR+iAfOYH7oBsaV8bshxUwZs
 AxQKZxHALQapvA/szN+N9bj2we/NtUXmRsy+WMxswnzH5XVaW1LNLzmvzGbixiVf5sEv
 ljD91uV7f0IyRGXW97E9jxmxzoiKr2XSjGaIpOON+d8S+b0Z6DJ57GRi42tPyXPaYaoq
 j+F2QmvQJHpXqbfIWzS0sGGEmqa+CNU0YSeHnL/0p0jzfQcf1JzBcDKcZuYElxPczN/o
 OFapMxR8G+bhewe3Dred3/ijkhb35b8oDUwpYflFJGY14AQFfvvmu/VV7m++Q39uoDp8
 toKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLAEm7nOBiQCu3vGQ0th7GEbkYnfSwJCiCAJyx5OMLKEd73FLqiwaFRbCAkPfbKb+YLkcpFTuZV6M=@buildroot.org
X-Gm-Message-State: AOJu0Yw+dbt9h04PETNtmMiaNbru7UnwuaDpKmphsEyr3iXceP8ujutv
 QB9I1H5YF1G/BCME0lGY3ERoxkkEMI0o8yCqtfLGNxyHvWw8rrnt2TOm3BKBxrrTP3sE/07wxSv
 +/BCa
X-Gm-Gg: ASbGnctW9IDZaw9KAwd05d3mBKg2aWNZZAwvhoev7a4g7JzCOUL2Zv9nxvtCiZgF4ND
 lgl1WZ833ttkcub3cn3tfKmBA92DSkOeOipLUdLaIGfKZNwkCmxoDydRB+SoCi2ZTgviJ4ioc9x
 a35Oxv7R49hflFbCzs7YsEFudDIEbFIuFDqH8b4QTmRRwbbdbGzl/Ii5M3uep7Gev/k4wIEe9rN
 5Yjb22xncO+F7gvdo737hoCLMxQGpoGg7UCP/BXr027GJ9CMEGaA9al8jj2GhSNTK+zDzIExo1z
 CvYYo7xfwm5xjXLu0u1+jce3yxwLXNiCkVvI32XgshaWH4lZ/+dAzVx2NBVlM2V6pHab1YQ3YT2
 9dD0aHPFMp3l1n5qGH60ldzw1S3u93hHUL2pWb0gDYhcBlLoLARq7xR7bLYJO5Kp06buHDfKYBT
 jAzZK/2ZqnE780HN99xerG3xobRsutLn9p+M4V
X-Google-Smtp-Source: AGHT+IEHa89jjOE0V/CuJXHmciJCBffgDNgFJERBn6y/p4TWo+WDBTYa/nvIR2giiW3coPdw2Dsrhg==
X-Received: by 2002:a5d:5c89:0:b0:3e7:68b2:c556 with SMTP id
 ffacd0b85a97d-429aef84080mr4970481f8f.26.1761812629610; 
 Thu, 30 Oct 2025 01:23:49 -0700 (PDT)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952db9d1sm30199389f8f.35.2025.10.30.01.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 01:23:49 -0700 (PDT)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 30 Oct 2025 09:23:48 +0100
Message-ID: <20251030082348.35087-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022163104.17325-3-dario.binacchi@amarulasolutions.com>
References: <20251022163104.17325-3-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761812629; x=1762417429; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NJBohVKnYkTLFBnlNLQYHtKs0qmmSPMOB2UPyj4S6/A=;
 b=JGA6NMAy7k8TnQCEA9wztQW95WU09ygH7pyKjli85PhVIyZd+Pv/uW18aWpjMZhSqR
 zRbrR9sCD2YYgO5Ms7P6ConQTIdcgsDF3EIQtVS15rpHdejuW6Q8PM+8isfpB0oiQjvO
 Ee7lV2KZBqfjELpN/S42/A1qDQMdztmek8zZknuyJgdrV9YM2uZOErNYeR7H7jPvSCsy
 0X5BJxPsx52ILsV4a8jJbJ/nZXaapsReP/NoR5aTZCmW6R8EVi2vHwJ1uHtFdc91rMrz
 jO4JAZJ0D7RvNFwwvrfv4GWC4MkVPnCcFwElSWC7lriecYdvKr3CxA/YFNwkpi/KpiCo
 xXhw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JGA6NMAy
Subject: Re: [Buildroot] [PATCH 3/3] DEVELOPERS: add Dario Binacchi for
 libgphoto2
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
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2025.02.x & 2025.08.x. Thanks

> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 66199a5b72cb..63afce3facb3 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -812,6 +812,7 @@ F:	package/empty/
>  F:	package/iana-assignments/
>  F:	package/inih/
>  F:	package/less/
> +F:	package/libgphoto2/
>  F:	package/pocketpy/
>  F:	package/sscep/
>  F:	package/tinyinit/
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
