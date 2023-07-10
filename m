Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F0FEB64DA
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 21:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92ED440B9E;
	Mon, 10 Jul 2023 21:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92ED440B9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8RPNO7YL-JUy; Mon, 10 Jul 2023 21:23:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0F1640B91;
	Mon, 10 Jul 2023 21:23:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0F1640B91
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C288C1BF33B
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 21:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A958A40B91
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 21:23:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A958A40B91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vG-BfZd45ILm for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 21:23:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E43D940B33
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E43D940B33
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 21:23:45 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-31427ddd3fbso5162618f8f.0
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 14:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689024224; x=1691616224;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8hJSLRGNVfDzQSFZzsXKe3FINyf+1qMytBmYZJYpjec=;
 b=DzZYqY1BuOrjVtlkdimIYeLy6XSshGHACGN4AfhcG4k6JaHeSqiNrrVLQJTdDGTbom
 8EzvncojNHEcfWHwE6W7hTJXkujktmUT45eE4+0ZbTQ/lxFXeYPJEHjflP9MHH/kG4Af
 1lxvFYhLDO6T6LtIl3Harfqt+IQ4PboYs0dRSsO1lSsFRBbtRDvqRseJ3Y5j7r2tPn9R
 r8vFOJkpsSVAubLsBKHcCtVukC/dWUFYckFwg790IJO+tRZ1FJBgeqisXuTEgepCa597
 8tN8vzMFJbU5nNjLG/AB45X4XcQNcSLZW6+A5JFfTpsqpn7PS1C+R58N+FhX+/sQsUMk
 ICLQ==
X-Gm-Message-State: ABy/qLaDg8Dre+TAna749Hcyt0E436Nksq3wDmFeJPMM5VTDAdo66z2e
 YLFCqI9Y9A++6wcTLfr6f4A=
X-Google-Smtp-Source: APBJJlFOEJgbCRDhTg8/uo6FO9FWms5AkEk2xDjTAvESNph5tzdfGATm7CjuEE9fMTfg6hK6lYNcqg==
X-Received: by 2002:a05:6000:1b86:b0:314:34dd:aaec with SMTP id
 r6-20020a0560001b8600b0031434ddaaecmr13287172wru.8.1689024223690; 
 Mon, 10 Jul 2023 14:23:43 -0700 (PDT)
Received: from ?IPV6:2a01:e34:eca2:2100:dea8:bf43:866b:a7e4?
 ([2a01:e34:eca2:2100:dea8:bf43:866b:a7e4])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a5d50c1000000b0031438e42599sm409483wrt.82.2023.07.10.14.23.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jul 2023 14:23:43 -0700 (PDT)
Message-ID: <630338f9-52ca-bed1-124a-542ff988c237@gmail.com>
Date: Mon, 10 Jul 2023 23:24:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Kilian Zinnecker <kilian.zinnecker@mail.de>, buildroot@buildroot.org
References: <20230707075339.7207-1-robertoxmed@gmail.com>
 <8241193.T7Z3S40VBb@kilian-aisec>
From: Roberto Medina <robertoxmed@gmail.com>
In-Reply-To: <8241193.T7Z3S40VBb@kilian-aisec>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689024224; x=1691616224;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8hJSLRGNVfDzQSFZzsXKe3FINyf+1qMytBmYZJYpjec=;
 b=rjk5S+5IGi7w82mm5UACkjMjMFq09m/MDmglPWFzC7s3x2oXYup+s2udx5xMqRsiHa
 6D9lk0kbJnBDZ2BCdrHPjSXfYlVx0jFwRAyEFLgtfgjSWIEAr6vLooMvMpkiNEHC+Ysf
 IROF8C+TpWZZVdIYlIQIPYIIzlTE4ilBXY3+bNXX3TULROYLx2sKTs4AU5P8cqLPWNrR
 Acwk0dFkOgzm8sGr94M44mrLOpkGqZxoqXf63gt/IhjaQroEEGHPHCCkUE4BWYMo8l3G
 U1ggFppBWkkcyo+Jdvy8DhCzN/8C+gzxl4TLH1APKHaQAR+Xx+WYXvP1i6p5m21Vt1nU
 5tTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=rjk5S+5I
Subject: Re: [Buildroot] [PATCH 1/1] configs/roc_pc_rk3399: Bring back the
 configuration for the rockchip rk3399 built by firefly.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kilian,

On 7/9/23 19:39, Kilian Zinnecker wrote:
> Tested-by: Kilian Zinnecker<kilian.zinnecker@mail.de>

Thank you for testing and for your feedback. I have submitted a v2 of 
this patch.

Best regards,
Roberto
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
