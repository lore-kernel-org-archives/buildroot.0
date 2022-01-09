Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5458CC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 20:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD2DF4058C;
	Sun,  9 Jan 2022 20:08:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HzgN53RlOf7B; Sun,  9 Jan 2022 20:08:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C17D940581;
	Sun,  9 Jan 2022 20:08:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 48E241BF44C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3830240359
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:08:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YWNfEejMQ_Kt for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 20:08:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38240402C3
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 20:08:37 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 c126-20020a1c9a84000000b00346f9ebee43so6058559wme.4
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 12:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=53nxwSte9yxwATKqREPzF+qNtJ0HKCGgDwbad5z79hk=;
 b=Wrak084JAj4KeCAodsyD71NHKxRjeEE76iD32lGIcP+vGyVpeYFxCjttBxQ1pf/gGG
 zXkyqGehFHXeEWgYBewsvp4UDdNnm3CgfuvAsJL8jTFjb8scp3MNo4Iu4txG3NFCkcN+
 wCi4Sd1gm6uYeUQepDBXi5ZkOSYGCRPx2T2KuI2oWbSaLvf9j+A0Htm5H6gPmxDf3A6B
 fIhgSZb9cRNF6E7rCgO9qVGN5MiZnmlAVwO51TWFZ0Qmiux5GJure6lQ5K4kooXUqjYc
 4ZdbrFXPi/4oA3V6Xmh+J+Z1+fbi2MX4qrdsmF5kdoN8NGTGlDap9u5dBykC7mCaYuNX
 +C3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=53nxwSte9yxwATKqREPzF+qNtJ0HKCGgDwbad5z79hk=;
 b=pFQjYzuHx5vR4O59s7KZtJD/8JR20DFNGevsEL6yM30qZ4VY6FoZwaLIt8lzSKhNoX
 OedlUfOs9BMtJPe5YgZdsXxKiuR6zF4SiQe3qjDZo4kO5eXCBqF4yoH0Cj3sAbODrYXj
 iN8lxjzjfDzxZYUgj7//ndasIwGx8LyXFY9je4z4g994jazmhKQ39onf1GIhqguuY213
 MMknU9GAC8yryf4lUSpQ+6gYVPQPsEj1tOaiL2QEGyVeplB1sa7J3TddrNvkvd8i4RXe
 /KTO5DCjacaPTYG84CQoHlFsObcAmyEsQ2jL/p35rIUg4GW4lnUU4oQYyH/31CVYMpKV
 L55w==
X-Gm-Message-State: AOAM530YjzD8CK7HU0lzudtzChrDctdgDWvgAlqB5kK8VhCTBCDS4ncw
 NRBoFiXict7kiw2aKCR2q4Bn3g==
X-Google-Smtp-Source: ABdhPJw3L+wQCvLpVH7wEL30ck1GuhDCSzh9bLfQN+oNaFcoq72l9C1E0DCKUe5NkK83+fylS434Pw==
X-Received: by 2002:a05:600c:204e:: with SMTP id
 p14mr6945118wmg.55.1641758915464; 
 Sun, 09 Jan 2022 12:08:35 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id f6sm5518478wmq.6.2022.01.09.12.08.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 12:08:35 -0800 (PST)
Message-ID: <d85d6f3c-2315-8583-a48c-b0b58e443a4d@mind.be>
Date: Sun, 9 Jan 2022 21:08:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: William Tambe <tambewilliam@gmail.com>, buildroot@buildroot.org
References: <CAF8i9mOtQLce7b+H_PzHrsiUe_5qphpk-QsXq=WeLZodMv1heA@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAF8i9mOtQLce7b+H_PzHrsiUe_5qphpk-QsXq=WeLZodMv1heA@mail.gmail.com>
Subject: Re: [Buildroot] BR2_PACKAGE_DHCP_CLIENT fails to build:
 readline/history.h: No such file or directory
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



On 09/01/2022 19:18, William Tambe wrote:
> I am attempting to build:
> 
> +BR2_PACKAGE_DHCP=y
> +BR2_PACKAGE_DHCP_CLIENT=y
> 
> However it fails as follow complaining about not finding readline/history.h:
> 
> making all in /home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/bin/nsupdate
> /home/tambewilliam/Documents/buildroot-build/host/bin/pu32-elf-gcc

  pu32 doesn't exist in Buildroot, so this may very well be due to external changes.

> -I/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35
> -I../.. -I/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/lib/lwres/include
> -I../../lib/lwres/unix/include -I../../lib/lwres/include
> -I/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/lib/dns/include
> -I../../lib/dns/include
> -I/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/lib/bind9/include
> -I../../lib/bind9/include
> -I/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/lib/isc/include
> -I../../lib/isc -I../../lib/isc/include -I../../lib/isc/unix/include
> -I../../lib/isc/pthreads/include -I../../lib/isc/noatomic/include
> -I/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/lib/isccfg/include
> -I../../lib/isccfg/include    -D_REENTRANT -DVERSION=\"9.11.35\"
> -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64  -Os -g0  -static   -W -Wall
> -Wmissing-prototypes -Wcast-qual -Wwrite-strings -Wformat
> -Wpointer-arith -fno-strict-aliasing -fno-delete-null-pointer-checks
> \
>          -DSESSION_KEYFILE=\"/var/run/named/session.key\" \
>          -c ./nsupdate.c
> ./nsupdate.c:104:10: fatal error: readline/history.h: No such file or directory
>    104 | #include <readline/history.h>
>        |          ^~~~~~~~~~~~~~~~~~~~

  This sounds like you changed your configuration without doing 'make clean'. Is 
that possible?

  Is BR2_PACKAGE_READLINE enabled in your configuration? Has it been built?

  Regards,
  Arnout

> compilation terminated.
> make[5]: *** [Makefile:473: nsupdate.o] Error 1
> make[4]: *** [Makefile:79: subdirs] Error 1
> make[3]: *** [Makefile:88: subdirs] Error 1
> make[2]: *** [package/pkg-generic.mk:270:
> /home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/.stamp_built]
> Error 2
> make[1]: *** [Makefile:23: _all] Error 2
> make[1]: Leaving directory '/home/tambewilliam/Documents/buildroot-build'
> make: *** [pu32/makefile:67: pu32-build/buildroot] Error 2
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
