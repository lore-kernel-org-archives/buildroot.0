Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC516C433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 18:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10CBD40176;
	Thu,  3 Feb 2022 18:45:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j4V_Ms6liCLv; Thu,  3 Feb 2022 18:45:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D723B40490;
	Thu,  3 Feb 2022 18:45:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1ECFA1BF3AA
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 18:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CF7D6009C
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 18:45:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LF7h6Qwg38Mv for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 18:45:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E44C60093
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 18:45:11 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id w14so7932420edd.10
 for <buildroot@buildroot.org>; Thu, 03 Feb 2022 10:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=DyIaNYJTzgOWOlgngxYKXSKrrfoFGN/KiQeLESyCrS0=;
 b=eYjYBUiyabS1bHU3DnTSdKhIxA1kP+UWXaACuQm81D641OgJnu4c3RP+72OkFpypuj
 R/iDry/V6XjulSFus52ce5gKH6R6BLT0rbnAiRrKe/uJlpiqV5c3lMZyGc4uMMPA8+ZX
 O7f7rzbhy95Dh11hrKskJ7YtTC6/EKSNyIL83cOvelUm77X+P75NI/1ffJFgbRoXhtQe
 kHtKjU+psxoAt/6qNw2eULbjid6a16w402YZWAqMVppbHdwRvrQlBGmE7MTc80tmR3q5
 jY8k6CHbuqwDY+iOi0W2fyATEEDFU1PIcBoVlTtChspU0SJhxojrHYJkSKzaO9jQnWgD
 cHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DyIaNYJTzgOWOlgngxYKXSKrrfoFGN/KiQeLESyCrS0=;
 b=V0uOd4N74nhBSsY0KwKKERumLDAtUh9+2TV157zWK6hQGK7xh+55KLJLiTcM9p/i9B
 SpXr2jcN788GyPTGRC03XRSb9cQISV3m9PqTu7DWXKJJ0xv6WGaxhlap5jHoJ2vpGJqj
 fTGluDQdQ1VXl85lMho3cbUt3/oTxGJXTs5UazBpx9kCSgW9/e7f/39PSbuF8gRTXb79
 priXMQZdAo/c8RHgqnuUm+HtL+VpMUsjsb2IXlzSIts91aZUn1jHBFECdobQIcKnO0Np
 /F/og2R4CzMTygvbfurxhdq3VJeY0RWUQxd5OJBpxoQL1MUISRm2ETkToOFClVupfJHx
 4YNw==
X-Gm-Message-State: AOAM530Joro9LdkCsdpefGhaFUgDqSY4kXdHiFwIC6WnIWSnQax/NnN3
 O+2r8DMDeRFm3zVyioBtWYkzdA==
X-Google-Smtp-Source: ABdhPJwio7SRRYA6h5DeX9/fxGAi58G2tE3xRKurWGF2qYyFIqT+IJn6V7wdX95Q/VWOp/RdUgV7SA==
X-Received: by 2002:a05:6402:1e92:: with SMTP id
 f18mr36753950edf.347.1643913909741; 
 Thu, 03 Feb 2022 10:45:09 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id m13sm17001074eja.160.2022.02.03.10.45.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 10:45:08 -0800 (PST)
Message-ID: <ff363cc2-4eab-1b91-1933-d0fbe65aaf48@mind.be>
Date: Thu, 3 Feb 2022 19:45:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: ca0 <ca0@protonmail.ch>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
References: <5_xofMlQqIrdAjpopLNCIYCGiqsc2UoXvUQG4GIV5Bd0dY31bw-gZ_0eoD0ix_iW-BI3-5O_RbQESkV3ybUN1zFSLY2r3PAr3ZOfxYOFmrU=@protonmail.ch>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <5_xofMlQqIrdAjpopLNCIYCGiqsc2UoXvUQG4GIV5Bd0dY31bw-gZ_0eoD0ix_iW-BI3-5O_RbQESkV3ybUN1zFSLY2r3PAr3ZOfxYOFmrU=@protonmail.ch>
Subject: Re: [Buildroot] package libldns
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

  Hi ca0,

On 03/02/2022 03:01, ca0 via buildroot wrote:
> Building this package with orangepi_zero_defconfig results in an useless user system because both thee files are blown away

  What is "this package"? The subject mentions libidns, but there's no libidns 
package in buildroot.

  What do you mean with "blown away"?

> ./output/target/usr/lib/ld-musl-armhf.so.1

  This file belongs to the musl standard C library, but orangepi_zero_defconfig 
builds a uClibc standard C library, so it shouldn't even be there.

  You can check which libraries are needed for an executable or shared library 
with "readelf -d output/target/...". All the libraries mentioned there should 
exist in output/target/lib or output/target/usr/lib. If not, it is indeed broken.


  If you want more help, you will need to provide a whole lot more details.

  Regards,
  Arnout


> ./output/host/arm-buildroot-linux-musleabihf/sysroot/usr/lib/ld-musl-armhf.so.1 >
> Is the ldconfig hackery needed for embedded systems and is it supported when cross compiling?
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
