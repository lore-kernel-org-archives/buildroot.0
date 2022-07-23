Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E22CC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 00:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88A734182D;
	Sat, 23 Jul 2022 00:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88A734182D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16WRVJ2Iuftf; Sat, 23 Jul 2022 00:41:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 479A941813;
	Sat, 23 Jul 2022 00:41:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 479A941813
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CFB81BF591
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 00:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54A4940498
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 00:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54A4940498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i5-pQ5l6TIsC for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 00:41:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73FC9400D1
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73FC9400D1
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 00:41:28 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id g1so7530334edb.12
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 17:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SA2JPdrktBr9cj3/sF8eOCm0hssN98VLE/U7P5Djat8=;
 b=ZNCzxS9yineROATxC0fDm1Jr/C++bQs9BNF9fkNvF8DmnLOYSxk1Tb6SdUxUlPHbUb
 ww/6gyuOkay+UeSOoH+U6HVo1IQKkjURc3ijDusYdZo/0vB8ctEUgDaeFlZPghWfj4Js
 xpaQZYqS4QDUM5FaxAv7vbpcm6d+NWC2Kfedh8PvVGbVSmju3FogmjjokEsPt5UaqA+o
 CEfKDveinkWEcHrnnRM6rE2Cxqi2whLKuj2TMO7sEjjK8b5jpGgTT0ETtLK12gCio0Pq
 ndeCqtGf9inbVE9dQmWLq59XV9DAvsHco88KQBta3OzqfiOvcrPI7NKNcR3BvV8yP6G9
 BuQA==
X-Gm-Message-State: AJIora9FB35MZjdPOAMNXYIjdj0YF81lQs/amlPQVJ80rQJOiGkTw1li
 XNpij8RmWxywJGrQrUI4RamHvDVxHagFYw==
X-Google-Smtp-Source: AGRyM1v+ngkMhYOJGEt0WnpTlow8jtq2lAeeP5hdDqVkZvJPhENT+mS38NkTh9iUuzNGt4fdi8UWJA==
X-Received: by 2002:a05:6402:350b:b0:43a:e18e:dee6 with SMTP id
 b11-20020a056402350b00b0043ae18edee6mr2162065edd.31.1658536886268; 
 Fri, 22 Jul 2022 17:41:26 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com.
 [209.85.208.51]) by smtp.gmail.com with ESMTPSA id
 i12-20020a170906090c00b0072af56103casm2523525ejd.220.2022.07.22.17.41.25
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 17:41:25 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id c72so4684104edf.8
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 17:41:25 -0700 (PDT)
X-Received: by 2002:a05:6402:438d:b0:43a:ae23:b77e with SMTP id
 o13-20020a056402438d00b0043aae23b77emr2114699edc.233.1658536884849; Fri, 22
 Jul 2022 17:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220720125707.1899437-1-festevam@gmail.com>
 <20220720183856.742c4a09@windsurf>
 <8CF2C8F5-F7EA-43C2-80BA-1D4122D22A66@withsecure.com>
 <20220720222430.7eb519f6@windsurf>
 <7202d505-f0fa-9fba-b21b-8dc8cb44b01b@mind.be>
 <20220722231518.1536cd2f@windsurf>
 <65b22e0d-1a50-54e9-3ad2-92e3d804ebbb@mind.be>
In-Reply-To: <65b22e0d-1a50-54e9-3ad2-92e3d804ebbb@mind.be>
Date: Fri, 22 Jul 2022 17:41:13 -0700
X-Gmail-Original-Message-ID: <CA+h8R2oX11-6vwu8SsqKQqKKZ8OsMDRzOcNThC9PPnYb+sXE=A@mail.gmail.com>
Message-ID: <CA+h8R2oX11-6vwu8SsqKQqKKZ8OsMDRzOcNThC9PPnYb+sXE=A@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=SA2JPdrktBr9cj3/sF8eOCm0hssN98VLE/U7P5Djat8=;
 b=W/yrrfCiG6HI95y4BRYZKKdsn4+gPRCvS5m5ZgfyksHjuGufeyydJ5YghEcK5b0fHL
 9J3lKYsvptBzWZiB5jcXLTW9vKiPmOK+HUr5A58pcK1LJywpE+uCEKHrP80p4OyCDorg
 K2txR7FPQIdfkTI/x0pGNxlc69NaX6Ycwdduyevy4RhuSX0u7q+HARPBN4l7A+gZiaYG
 Hka+bMv8nloWREBH48ftVWjPGi8GwYAF5+z4jqylSFEw8IYNxoHe1WiR6F6dOSPWtvUK
 mvH+dhGMrtPLdQw0imMzlRGm0OT8BGnOPz2mYdjwO7RKBqiSe3EejvoVg9y4y8p7Hm9i
 9JhQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=W/yrrfCi
Subject: Re: [Buildroot] [PATCH] package/crucible: Pass 'osusergo netgo' tags
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
Cc: Christian Stewart <christian@paral.in>, "Barisani,
 Andrea" <andrea.barisani@withsecure.com>, Fabio Estevam <festevam@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,


On Fri, Jul 22, 2022 at 3:03 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>   I'd actually expect that the package itself would specify whether it needs cgo
> or not. Can we test a build of a package that actually uses cgo to verify if we
> really need to set it in HOST_GO_COMMON_ENV?

"CGO_ENABLED" informs the compiler that it's OK to use Cgo.

It should still be set to 1 even if the package doesn't use cgo at all.

>   Regardless, we *will* need to set the 'osusergo netgo' tags for all cgo-using
> packages when they do use cgo - so either we still need a per-package "enable
> cgo" option, or we should just always add those tags if cgo is enabled and we're
> doing static linking.
>
>   Is there any reason why this problem is only observed for the crucible package?

So, this doesn't work?

FOO_GO_ENV += CGO_ENABLED=0

.. because the package needs tags enabled conditionally if cgo is
available or not?

I don't understand why this specific package can't just check
HOST_GO_CGO_ENABLED and conditionally add the tags?

Best,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
