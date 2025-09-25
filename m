Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54ACCAC5BC
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8B4F615D6;
	Thu, 25 Sep 2025 20:17:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RWoaPScjEPUJ; Thu, 25 Sep 2025 20:17:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E060B615EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E060B615EC;
	Thu, 25 Sep 2025 20:17:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C825177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A53C41678
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aIPntYzsZepB for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:17:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7D9CF4169A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D9CF4169A
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D9CF4169A
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:03 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3c68ac7e18aso816351f8f.2
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831421; x=1759436221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qsx5lvQZj4m5YCjxCl1BtrRkdyt/iKOA4TimABKJNE4=;
 b=KQGcCIEZjdkJDqVRzpy01Oa0orjmPJ4MYo9VMGcMK/TH0Ovl5z/o/YfFxB5LAgm+tQ
 QC4ws2FQ17RUsKTrwn3XDZDaGMHfGSuGEiKzQbXzemzKajg0bvJffZF8WHEZ57tRuz9M
 gSKMJGYpy16PJPwY/9zXhrnDgKBB1GYhcijdDeZ7qHSA13XAH5ma8jRF4v52yMUki0qr
 C6RjhOm+0myh1QXVvbgQ97zkOHn8VV1rOghce4nq34PVA775UIrx2NorYzlHcUnTfs6N
 BVd0v8g7wNADoeqvIgJUZ/iweUt/NhsA3LsEP+xGIbnUBdG81dP6TXTCJMKVkOCt6cY7
 7faw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8CqI58vPi9ngbXQvMzq6Y8f7kbUWlWZoee4q2Dl2WyHoYNkrEE+3CVWYiYrespCzdpjNyHepBMg0=@buildroot.org
X-Gm-Message-State: AOJu0Yx7KE9en7WTgH3R/y8ZF/smYDvBLlVmXZVNXyZkic+voWpmVpRF
 JpuOXMkn7xxnEhoxXVAiysBStivjqY/Uw+RBuzE+cLEvOVNy2QDvrUEyiXJ05srufuZWhIQVwvJ
 PxrKBvrk=
X-Gm-Gg: ASbGnct6YRY3qlDG0y7Jb+z56TbGda0nBiTdfySDXNUHF/pOEktBQNoEhybyYeZksoP
 moBt3mby7IJ9ZqzMjJNmLlcjVvwKSU5GFi+U/7Pssa/OaKgK9hxmsbuhi/ztWLSxzJzKB7BvIz6
 gSv8ExY6PSOKD23BySAyzPBPRTLzFRKIS2pgxTul5opBp66Dg/odpwgx6HnyQ1q0dJbzumniSn2
 a5u5mBYgxPlybX/SOAwG0AZuXmlurqPFh3H4W5IF5iQfSIOZ2aA9jrgZmGOe5wykg7SrD+Gruaj
 EItwHerH56cO9Jd1Rf8da1QL9f9XAUUxJcsed/JNuYqOFICX1MEMjo1fWReGEc3k9gA0qkp2eUM
 qIP27J8GCM6L10Js=
X-Google-Smtp-Source: AGHT+IFStYJZ7kzkfdWAxWX60j1IZZc3V4RK9hwaCpkrUhAFomOIM1L+Nw2qWWIS01E5vknMl1ji/Q==
X-Received: by 2002:a05:6000:40e0:b0:3e1:9b75:f0b8 with SMTP id
 ffacd0b85a97d-40e499acc26mr4003513f8f.47.1758831421446; 
 Thu, 25 Sep 2025 13:17:01 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc7c41e52sm4090951f8f.51.2025.09.25.13.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:17:01 -0700 (PDT)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:17:00 +0200
Message-ID: <20250925201700.44346-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920111244.2575859-2-dario.binacchi@amarulasolutions.com>
References: <20250920111244.2575859-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831421; x=1759436221; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qsx5lvQZj4m5YCjxCl1BtrRkdyt/iKOA4TimABKJNE4=;
 b=KvrxhLw+chkkyLHfaLSfRPK4hd7diQ+PWTUPLTvhT1Jwp2fnj+599RUds5Y2FDh/h9
 wJZT4oeCb0PG7HxmMIMNI+r1fGqXP37fD+Gh5SbZzPYbbvOldGwzTciajR63XRbiT2lD
 yUh9EpIHjLxxxWU1vhivpBThQwAxQFGQS3nUUyP/r8gR9gYN+WyLaIsADjNR8/cUPnEn
 YN7GAFrzhn0vbxcPtwsDJN/5x7LKn8v4zW2oQAx5lhLpqKVb8HIQkonLF+wbFkTHceqo
 o0AANvt5quDWqD1flE1zynxg1Nl4sdaP0SW67tXnekIHCCp3XlGAUFY1UZcyE11EunDa
 JD2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KvrxhLw+
Subject: Re: [Buildroot] [PATCH 2/2] DEVELOPERS: add Dario Binacchi for
 cmocka
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

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 16d9ee892bdb..121455035926 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -806,6 +806,7 @@ F:	configs/stm32f769_disco_sd_defconfig
>  F:	package/aespipe/
>  F:	package/armadillo/
>  F:	package/babeld/
> +F:	package/cmocka/
>  F:	package/iana-assignments/
>  F:	package/inih/
>  F:	package/pocketpy/
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
