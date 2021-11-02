Return-Path: <SRS0=drHZ=PV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52EDAC433EF
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 05:50:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FCB960E90
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 05:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8FCB960E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59066402E2;
	Tue,  2 Nov 2021 05:50:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UvwRB0ubAfWm; Tue,  2 Nov 2021 05:50:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF7E5402D8;
	Tue,  2 Nov 2021 05:49:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B4E21BF2A0
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 05:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B77D402D8
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 05:49:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lJxdbWWnESkd for <buildroot@lists.busybox.net>;
 Tue,  2 Nov 2021 05:49:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58380402D4
 for <buildroot@buildroot.org>; Tue,  2 Nov 2021 05:49:57 +0000 (UTC)
Received: by mail-ua1-x935.google.com with SMTP id l43so689665uad.4
 for <buildroot@buildroot.org>; Mon, 01 Nov 2021 22:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gKJl14maK3r+XAEND0edkiQUuT/ZLRaxqrx54vluSQ8=;
 b=Sbxh2xfCdbHVyXnY0nqA81VXm8KbqedQHQuMG7bnLC7C80uSKjG1liaZptsgD13iOK
 c2YLFUDwWYSBiQguRMSz5wkGqxpOM9rMGK2391J0ZRe17mWjIIttc+Y38Pzrj6um9500
 jmixdtaiCeDg01k4NQIyV8odBzPqW4/yUAbzCEqtx/LQ4G7iJDZILg3ArVhjNMeFVBt9
 yIuJrJKMGtG4xjrpoAJrATNVY2R+3I2wRdD3d02nxchQsZ9JspIoIaOyX2DBn6OIBmbK
 XRITx9f1hWYS4ibG36AShl0n7eFXOsNhsQfyoSke5xIm8AG/BBn0nCMeVHK0uNpwSpIB
 2tEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gKJl14maK3r+XAEND0edkiQUuT/ZLRaxqrx54vluSQ8=;
 b=qsIl91AIC9DxeJsxKCM8l6auZtG6sIcNFu8QOIrKicuQsBJc89BB2yaDhYoHLqI0oW
 ZptoAfu5BamxTUiO5FXcGOa//J3RvBnNKygbszty2H1eM2aK0eG1iRv8xl4vTstbSWdr
 BHvsYUq1cBNaqphaAfxL/j1YyX9QH1vk6GvbmPm2B0nMgS3bmLwV8neMcsua6UIk7K6u
 asKxuYqP9J6TBiNnF/+a/5xdh8B3kVtYOc8hkmh4DCcohbaVlq6x37jR8Gdrk/LIpAht
 0FEzlR8m6beqhuhXJJHvWink0tcOTMzFF4HOUvg0LCgW3WKkN1PrYJHiHOkTWlrMwHRB
 /lHg==
X-Gm-Message-State: AOAM532taH+EJhoHzckpHzYNpaYrSqF8caaokz0ct32Jc2ZEubm4dQHU
 GcvPX3SX+FE9xP6F3qplvkTdTPS8H+bNpQ==
X-Google-Smtp-Source: ABdhPJwZxIvDUxRW+DVwAIhyBMeRo2teBi33bJ6bYYJvsaL3eGtJGSN5CX/sLp8lTX4ewOnLd6dSmA==
X-Received: by 2002:ab0:2b04:: with SMTP id e4mr34575332uar.70.1635832195864; 
 Mon, 01 Nov 2021 22:49:55 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46])
 by smtp.gmail.com with ESMTPSA id e9sm1091442uan.9.2021.11.01.22.49.55
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 22:49:55 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id l43so689619uad.4
 for <buildroot@buildroot.org>; Mon, 01 Nov 2021 22:49:55 -0700 (PDT)
X-Received: by 2002:a67:fb98:: with SMTP id n24mr18767668vsr.17.1635832195374; 
 Mon, 01 Nov 2021 22:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <CA+h8R2rzoKOTwyJXQSWHDbFPr3w1Uxu6D=-qQrYvv0UsuA_obw@mail.gmail.com>
In-Reply-To: <CA+h8R2rzoKOTwyJXQSWHDbFPr3w1Uxu6D=-qQrYvv0UsuA_obw@mail.gmail.com>
Date: Mon, 1 Nov 2021 22:49:44 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rzmhEEUEFr5omvGtocC--bB2pF_tJsSptR02+gbXsDdw@mail.gmail.com>
Message-ID: <CA+h8R2rzmhEEUEFr5omvGtocC--bB2pF_tJsSptR02+gbXsDdw@mail.gmail.com>
To: Christian Stewart <christian@paral.in>
Subject: Re: [Buildroot] containerd: hash changed for download
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On Mon, Nov 1, 2021 at 10:45 PM Christian Stewart <christian@paral.in> wrote:
> It appears that for some reason the containerd v1.5.7 download from GitHub is returning an incorrect hash:
>
> containerd-1.5.7.tar.gz has wrong sha256 hash:
> expected: 7d8f7014a74b063da9cdf7fe8673db8dc338747efdbb9b6a6a919d5137b1987e
> got: 09be0cedea77568029aa0c7be9a323b89fa6886b402b5d223780a05b8c7cd45a
>
> The file matching the correct hash currently in Buildroot today can be fetched from the void linux archives:
>
> https://sources.voidlinux-ppc.org/containerd-1.5.7/v1.5.7.tar.gz

Correction: the current version in the Buildroot master branch is
currently 1.5.5.

So this issue doesn't affect master currently.

Best regards,
Christian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
