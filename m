Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F7BC25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 11:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12FAA817C0;
	Tue, 21 May 2024 11:15:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q_SW0t5uD75b; Tue, 21 May 2024 11:15:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D93B81771
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D93B81771;
	Tue, 21 May 2024 11:15:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CC42C1C4FC0
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 11:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5FCD4045D
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 11:15:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BjyBfCYI-0um for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 11:15:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EF6E8401F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF6E8401F3
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF6E8401F3
 for <buildroot@buildroot.org>; Tue, 21 May 2024 11:15:24 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 0DACC4402D3;
 Tue, 21 May 2024 14:15:00 +0300 (IDT)
To: "Jarkko Sakkinen" <jarkko@kernel.org>
In-Reply-To: <D1F9HIPNX2B6.12XBYOS1W36JF@kernel.org> (Jarkko Sakkinen's
 message of "Tue, 21 May 2024 13:47:50 +0300")
References: <20240521103154.32660-1-jarkko@kernel.org>
 <20240521103154.32660-3-jarkko@kernel.org> <877cfnphyj.fsf@tarshish>
 <D1F9HIPNX2B6.12XBYOS1W36JF@kernel.org>
User-Agent: mu4e 1.12.4; emacs 29.3
Date: Tue, 21 May 2024 14:15:21 +0300
Message-ID: <87y183o1py.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1716290100;
 bh=TP+sy6zgbh4PsmQk84LjUMcZcbP7VDvTQm/R6T/3bGA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=siTELI1jovvMlNy/hV0vzWQ17gXYgcHvcvjXpfWatqCIL0a4ZtWkZ0+rP+cQhavz7
 QKbX86vut/LBA8+Nn5sxFxalXKXQhGNwEj5HSE3mDj/LHaZQkUclGNuIhL2mR8NKMp
 IGLYQlVMzSO0q3S6jAtYBAGHnfNL5lVnBaMaYgdKi9KFzrOiSHbrmSJwcykFNKx8UQ
 QR/35NEpBf834QImh8wDejIFZzXgqgssAAtU4SFV6MlpqGWyzZLtaUYe38acl2NaTU
 dRkUekRkY/12pf3zgUFHTcAPXA3GzOqlw37xgfeW/EdVX3f3xM4qMZ8+SeC4y4FIAX
 ev6XzjeOuWa4g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=siTELI1j
Subject: Re: [Buildroot] [PATCH v4 2/3] package/libtpms: add host package
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Stefan Berger <stefanb@linux.ibm.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jarkko,

[ Sorry for the dup again ]

On Tue, May 21 2024, Jarkko Sakkinen wrote:
> On Tue May 21, 2024 at 1:39 PM EEST, Baruch Siach wrote:
>> Hi Jarkko,
>>
>> On Tue, May 21 2024, Jarkko Sakkinen wrote:
>> > diff --git a/package/Config.in b/package/Config.in
>> > index 1b6a5b0dab..30b76349ec 100644
>> > --- a/package/Config.in
>> > +++ b/package/Config.in
>> > @@ -1569,6 +1569,7 @@ menu "Crypto"
>> >  	source "package/libssh/Config.in"
>> >  	source "package/libssh2/Config.in"
>> >  	source "package/libtomcrypt/Config.in"
>> > +	source "package/libtpms/Config.in"
>> >  	source "package/libuecc/Config.in"
>> >  	source "package/libxcrypt/Config.in"
>> >  	source "package/mbedtls/Config.in"
>> > diff --git a/package/libtpms/Config.in b/package/libtpms/Config.in
>> > new file mode 100644
>> > index 0000000000..335a5bc7b6
>> > --- /dev/null
>> > +++ b/package/libtpms/Config.in
>> > @@ -0,0 +1,20 @@
>> > +config BR2_PACKAGE_LIBTPMS
>>
>> You are not adding a target package, right? So this config symbol
>> doesn't do anything.
>
> Ugh, right. Now I need to do a check before I roll out a new version.
>
> I think this is what I should actually do, right (diff below)? Sorry
> learning the process :-)

We usually don't provide config symbols for host packages that are only
used as dependencies of other packages. So the right thing to do is drop
Config.in entirely.

baruch

> diff --git a/package/Config.in b/package/Config.in
> index 30b76349ec..1b6a5b0dab 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1569,7 +1569,6 @@ menu "Crypto"
>         source "package/libssh/Config.in"
>         source "package/libssh2/Config.in"
>         source "package/libtomcrypt/Config.in"
> -       source "package/libtpms/Config.in"
>         source "package/libuecc/Config.in"
>         source "package/libxcrypt/Config.in"
>         source "package/mbedtls/Config.in"
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 0cf9dc3897..4e0dab0504 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -57,6 +57,7 @@ menu "Host utilities"
>         source "package/jsmin/Config.in.host"
>         source "package/kmod/Config.in.host"
>         source "package/libp11/Config.in.host"
> +       source "package/libtpms/Config.in.host"
>         source "package/llvm-project/lld/Config.in.host"
>         source "package/lpc3250loader/Config.in.host"
>         source "package/lttng-babeltrace/Config.in.host"
> diff --git a/package/libtpms/Config.in b/package/libtpms/Config.in.host
> similarity index 89%
> rename from package/libtpms/Config.in
> rename to package/libtpms/Config.in.host
> index 335a5bc7b6..7a477d21a7 100644
> --- a/package/libtpms/Config.in
> +++ b/package/libtpms/Config.in.host
> @@ -1,7 +1,5 @@
> -config BR2_PACKAGE_LIBTPMS
> +config BR2_HOST_PACKAGE_LIBTPMS
>         bool "libtpms"
> -       select BR2_PACKAGE_LIBTOOL
> -       select BR2_PACKAGE_OPENSSL
>         help
>           Libtpms is a library that targets the integration of TPM
>           functionality into hypervisors, primarily into Qemu. Libtpms
>
> BR, Jarkko

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
