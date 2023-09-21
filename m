Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80805E7D0A6
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 19:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2125D83CB6;
	Thu, 21 Sep 2023 19:27:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2125D83CB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SQqsow61GxO1; Thu, 21 Sep 2023 19:27:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 532C683843;
	Thu, 21 Sep 2023 19:27:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 532C683843
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2787B1BF390
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F19B86136A
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:27:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F19B86136A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K9fvLnB66j5T for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 19:27:36 +0000 (UTC)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1A6E6132D
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 19:27:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1A6E6132D
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-98377c5d53eso161085366b.0
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 12:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695324454; x=1695929254;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UgiMXcpTQ4IARaqnBcjUA39vO97OTYxTcWR46sszAT8=;
 b=VQSaRFEITMny2/6yR8U95bSlUsVhQDof8CSUwE9nC1vq6GdOMwX8VYXiuzYPDXg/aF
 9xSLDhbGir/7st8UcKJk7qn4+HXbUgWs17aG7nHdnwduhlpv3n0CS0DbeREEXuZIdOrB
 tqyy0624TlTa/LU9XwK4iBWpQ+aoqIqOE6lyTwayKPUQPn52Y1klXkJ0tX1LsteMeYTi
 1RrR9FUDoieNkzPggzjUa20EjgFi+ochAMk1B3GFSg7kwqPBYRk524/GjFl88k5T9pby
 JkSkd5wLGvDUGciZ2QL17ORkHd8FGhGGbSqe4gy+aenzNCfQHFD4T4CnkgvpXNDGwzU5
 hrzA==
X-Gm-Message-State: AOJu0YwBVAMOJLHTvjcpV+maU0ekxIYuogZdtmswuVA5+A7a0n/y6F+d
 2S9lk+Jwssfs9DlHoN6dVCPhXw==
X-Google-Smtp-Source: AGHT+IFu/lzinbvOJ/lKA97k/s1MzzHNX44eHH3XjNu6K/dRGEGcf/X8XXPEOd/F1++wYxvxqPgYXw==
X-Received: by 2002:a17:907:77d0:b0:9ae:690d:4284 with SMTP id
 kz16-20020a17090777d000b009ae690d4284mr2047849ejc.75.1695324454007; 
 Thu, 21 Sep 2023 12:27:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a1709062a4f00b009ad8084e08asm1491297eje.0.2023.09.21.12.27.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 12:27:33 -0700 (PDT)
Message-ID: <9d01d811-92fd-04d4-188a-7b691437e5b0@mind.be>
Date: Thu, 21 Sep 2023 21:27:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Jens Maus <mail@jens-maus.de>, buildroot@buildroot.org
References: <20230917202917.1391442-1-mail@jens-maus.de>
In-Reply-To: <20230917202917.1391442-1-mail@jens-maus.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1695324454; x=1695929254; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UgiMXcpTQ4IARaqnBcjUA39vO97OTYxTcWR46sszAT8=;
 b=I43crjpe2Ur1oZs787dQWjH96LHWmR6hwiKB33QEa7z9H8Md6M7qBUDnSNvb54HfV7
 BxhUsdvn3FrTISEmHBPt3jevNFDbaCzcbe5maOlGvh+NhSQsGmRwe1kittsws1FgF2mP
 DYY9mh22JYgr2SAApA767TfqCroHKa5aZA9yok2Xu6JhljobbnHK6061bXDnHBdBlNZu
 lrZoItDIqifz/7XeKoXWUepXsH7evFFVSm2xXoEwG8sm8YYxjyEWn75CngjIDSDiKgM4
 2bBgvfl06yVZ41wdS6VZc2GGhZ3LI7fG0N6Rr5HFFTIBVnBz7zZxzycaSPCnqmQboaWK
 w9mw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=I43crjpe
Subject: Re: [Buildroot] [PATCH 1/1] package/fio: remove native build to fix
 crashes
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/09/2023 22:29, Jens Maus via buildroot wrote:
> Per default, the fio package uses the "-march=native" GCC option. This,
> however can result in "illegal instructions" when fio is compiled in a
> cross compile environment where the target machine will have a different
> cpu feature set than the compilation environment. Thus we make sure fio
> will not use that compiler option by adding --disable-native to
> FIO_OPTS.
> 
> Signed-off-by: Jens Maus <mail@jens-maus.de>

  Applied to master, thanks.

  I changed the subject line of the commit message to

package/fio: remove -march=native

The subject line should give a short summary of _what_ is changed, the why is 
for in the body (and explained pretty well there).

  I also changed the body of the commit message a little.

  Regards,
  Arnout

> ---
>   package/fio/fio.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/fio/fio.mk b/package/fio/fio.mk
> index b1763d6c73..f6e7b036bb 100644
> --- a/package/fio/fio.mk
> +++ b/package/fio/fio.mk
> @@ -9,7 +9,7 @@ FIO_SITE = http://brick.kernel.dk/snaps
>   FIO_LICENSE = GPL-2.0
>   FIO_LICENSE_FILES = COPYING MORAL-LICENSE
>   
> -FIO_OPTS = --cc="$(TARGET_CC)" --extra-cflags="$(TARGET_CFLAGS)"
> +FIO_OPTS = --disable-native --cc="$(TARGET_CC)" --extra-cflags="$(TARGET_CFLAGS)"
>   
>   ifeq ($(BR2_PACKAGE_LIBAIO),y)
>   FIO_DEPENDENCIES += libaio
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
