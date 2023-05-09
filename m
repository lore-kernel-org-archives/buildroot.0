Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632B3C77B75
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 07:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0B9141E92;
	Tue,  9 May 2023 07:14:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0B9141E92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NoS06evyRpgf; Tue,  9 May 2023 07:14:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B932841E71;
	Tue,  9 May 2023 07:14:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B932841E71
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8D58C1BF2C9
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 07:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71C8741E71
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 07:14:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71C8741E71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qB4fyAsdoujN for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 07:14:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0E7941BA5
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0E7941BA5
 for <buildroot@buildroot.org>; Tue,  9 May 2023 07:14:44 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-50bcb229adaso10376964a12.2
 for <buildroot@buildroot.org>; Tue, 09 May 2023 00:14:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683616483; x=1686208483;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XsGsZ22uR1wEz8W3wABzuTNY3DVUK4/cVIPoyOuXqv8=;
 b=JlW6BccquNPVGsPiGLyn76Li7jQOkSir1HspdTIpOTDPM5mpdqF2K7jN/GqFVVdThG
 r/hK9+sCFSTzFKr6iFgy76IvhXu5Xzfd0Q1DavSeYoVR5UHn+jezUvM2ppNPsRyGtSoj
 Qg9QRHy8TEVFTdcS05yplCdyy3oDv4ull29LSTUSgNgsnLZphx9LlYlbv4vsu7SPiSWN
 lXX8llAV3zd5dIzOw3i6A/tVDu6SYhQVGaptajLJRTL8ucKH2f0EMSJNpleQuN/XNVr4
 AB8JvgXmLDUIlTTfRXd0cn7c5F1AWdP2JZKdvxdmfkO/nyQVqzo8WW91B0SuQEpUE6Ne
 zRPQ==
X-Gm-Message-State: AC+VfDyqX4lQxra2sEFku25/d1fl2ngtCPp61vTHhjR2fK5/bDfxWlEs
 yBuYjKlJ4H/lbLbMSL7N4cF06NEUD/tqa4Fb1aodStmJfVNx66NW
X-Google-Smtp-Source: ACHHUZ4DlZYujL30GP8N6GdLJeF1Njkn6sKKDEHDjdYRnNYr3IMdsx640TOZ/9L82Kbx2Ztg5M1zumiYyvapSwL8ZmI=
X-Received: by 2002:a17:906:ef0e:b0:965:c2ab:7014 with SMTP id
 f14-20020a170906ef0e00b00965c2ab7014mr11245475ejs.35.1683616482974; Tue, 09
 May 2023 00:14:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230508181850.21256-1-ju.o@free.fr>
In-Reply-To: <20230508181850.21256-1-ju.o@free.fr>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 9 May 2023 09:14:32 +0200
Message-ID: <CAN5uoS9yGv0O7XuGdSQ5hfLwmG_qVPvsnN7g=QPQ1JLV_vgSaw@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683616483; x=1686208483;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XsGsZ22uR1wEz8W3wABzuTNY3DVUK4/cVIPoyOuXqv8=;
 b=r8nNeb67G8cCvwfglDoZI8ebT1+xR5Ee8OZxUl4JMibSPS/LxJi9qqb1n9DpMDHpzE
 CByqnIqdplOK/vNKxLwgdGb8IKxBlJ/4ScbWHIcTrNNXzYBxdSdSlzeOkdMORjeAxulp
 I7IsxzYotqsSKwQ5e/tJMSMpglOGuaVZmcCOpiroCosTSquSiT1cwqdkQuBootvMTI09
 TYib/sYwuQ2AcK63iN7ZZUFYxRJjwJSOTQnasWsMKGhfXYWXh7+NRXi2W4g9lah7SBow
 twENv4+3A7zw8LSvZqUMN4IYxyyCfGhi5ZH2maLrt7dyDFHY8SiD7lZ8aHzNZUkK47SA
 0Y1A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=r8nNeb67
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: remove entry for
 optee-benchmark
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

Hello Julian,

On Mon, 8 May 2023 at 20:19, Julien Olivain <ju.o@free.fr> wrote:
>
> optee-benchmark package was removed in commit cf39b596e7
> ("package/optee-benchmark: remove deprecated package") but forgot to
> remove the associated DEVELOPERS file entry.
>
> Using the get-developers script on any file generates a warning,
> for example:
>
>     utils/get-developers DEVELOPERS
>     WARNING: 'package/optee-benchmark/' doesn't match any file, line 865
>     git send-email --to buildroot@buildroot.org
>
> This commit fixes the issue by removing the entry.

Thanks for the fix. I've indeed  missed that.

br,
etienne

>
> Cc: Etienne Carriere <etienne.carriere@linaro.org>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 5658dfa14b..efb2907d1b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -862,7 +862,6 @@ F:  package/python-kiwisolver/
>
>  N:     Etienne Carriere <etienne.carriere@linaro.org>
>  F:     boot/optee-os/
> -F:     package/optee-benchmark/
>  F:     package/optee-client/
>  F:     package/optee-examples/
>  F:     package/optee-test/
> --
> 2.40.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
