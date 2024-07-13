Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4565DC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 16:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAF5C40463;
	Sat, 13 Jul 2024 16:30:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vi58TTON6-6X; Sat, 13 Jul 2024 16:30:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BBF140359
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BBF140359;
	Sat, 13 Jul 2024 16:30:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F2F421BF2FA
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 16:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF7E041482
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 16:30:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E91R9MXcs8DQ for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 16:30:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 70F38413EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70F38413EC
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70F38413EC
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 16:30:54 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-367a3d1a378so2545606f8f.1
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 09:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720888252; x=1721493052;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BfmZzwYYvATFtx0+EHxH/QG9vSDEAv7cgWf0KiBTWII=;
 b=njW+8PfkM6Ig6Qg1cXJLqzz+HhK3VTPqDGdA5kynugYsAd7gOamAZVg1pWUJJEJ9q2
 MWvpsHEJSOgt9Ut0DRZRq0LWAo8aJ4hDWnnRVnP61r0LqL2tGwMZf5tPSI0EOxOMyqR7
 IPoagn6Ywp3LEXELmH9fzHnvFF9lcESDI8O0UNgWGvvpwZn516btq6SpyOFqJAxxnmge
 A4QTZ60Va/HeYVYNZOPkOCBbpUkMkWAgtB6A+pPORnz8caQnBRhs0tSxsSBifwSegN8H
 nsektmxk+M+3p2IxayK1CHzZSjzTeWr2gXD1laR8iM3xjNxn6x6+dlSeHv9yTs0jxxV3
 Rkvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRF5TT7OuYhWHFDo27Pc97LF0VGrrJZTwz2lbFDNXRnWHtJWI6gz1QdDDcjiuLQNtvs+znccyLxLlidet9sJQUQDIxCLMb/w==
X-Gm-Message-State: AOJu0Yy91539Q9pa/syOQ9QPrfDsI6jLZfX1hpgOiS4zsdElfaTNb71p
 Qo4ZJ7wAAD5gaOkl6czhiLv7WmPf1eJxz35BmRu9EvzS0glRd4eEiMQyNKIDkGk=
X-Google-Smtp-Source: AGHT+IHbOLRutw2XLdyQpDreoEtvRxx9dETo+iUEsA8XuE/Skjze67dw3g2BzIJtPbKry6tv6QWKhg==
X-Received: by 2002:adf:cf0d:0:b0:367:f185:e73b with SMTP id
 ffacd0b85a97d-367f1952ba7mr6242524f8f.65.1720888252171; 
 Sat, 13 Jul 2024 09:30:52 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dabf02csm1885330f8f.41.2024.07.13.09.30.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Jul 2024 09:30:51 -0700 (PDT)
Message-ID: <6fc04f1a-a96e-4cf2-86cf-f9d996330fae@mind.be>
Date: Sat, 13 Jul 2024 18:30:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
References: <20240713144316.403640-1-arnout@mind.be>
 <D2OJUFSZ6Y3N.CIWMCVYF7ZFS@collins.com>
Content-Language: en-GB
In-Reply-To: <D2OJUFSZ6Y3N.CIWMCVYF7ZFS@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720888252; x=1721493052; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BfmZzwYYvATFtx0+EHxH/QG9vSDEAv7cgWf0KiBTWII=;
 b=XviyC0doYqm62Gw/mkUfWVdB8/GNzl7GipikuxjS/phdihzbjPA3FdvU34sYqa4uki
 QiJqyj14Zj4S/H1Pa5U8BXBsoi2WrDxReZjr7OaPYnTUoVwuFt6QeA1Ntr0emJc2YfqG
 klV7zEZZmP4vL95fuWBrSmiCobMOmtm/5nmLeDoH2T+RwCB3JhbYaLBU/9p6krR3kRRi
 mBPIEWruhgBI+PigROxcPAlRUQAiOV34LGWeOoMpAmEspaH4WRe6BHlh5j799cZ3wTMP
 RrWC7J92hKmEU7xXr4uZeNh8e7DWDPcXhEkLeiXnJvqgXFBs1t6PomN/hrA4RlUPKikk
 fSAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=XviyC0do
Subject: Re: [Buildroot] [PATCH 1/3] utils/docker-run: allow to specify
 extra mount points to propagate
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
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/07/2024 18:24, Brandon Maier wrote:
> Hi Arnout,
> 
> On Sat Jul 13, 2024 at 2:43 PM UTC, Arnout Vandecappelle via buildroot wrote:
>> Sometimes, the build needs access to directories which are outside of
>> the current directory, e.g. for pre-downloaded toolchains, local kernel
>> sources, OVERRIDE_SRCDIR, BR2_EXTERNALs, ... We need these to be mounted
>> into the container to be able to perform the build.
>>
>> Since there is no generic way to find out all the directories that are
>> needed, we need a manual mechanism. We choose the environment variable
>> EXTRA_MOUNTPOINTS which contains a space-separated list of directories
>> (or files) to mount.
>>
>> We choose an environment variable to avoid having to parse command-line
>> arguments to docker-run.
>>
>> Update the terse documentation in utils/readme.txt with this
>> information.
>>
>> Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
>> ---
>>   utils/docker-run | 5 +++++
>>   utils/readme.txt | 5 ++++-
>>   2 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/utils/docker-run b/utils/docker-run
>> index 1adb02d74e..3bb7b6a41b 100755
>> --- a/utils/docker-run
>> +++ b/utils/docker-run
>> @@ -90,6 +90,11 @@ if [ "${BR2_DL_DIR}" ]; then
>>       docker_opts+=( --env BR2_DL_DIR )
>>   fi
>>
>> +if [ -n "${EXTRA_MOUNTPOINTS:-}" ]; then
>> +    read -r -a extra_mountpoints <<<"${EXTRA_MOUNTPOINTS}"
> 
> I think it would be good to use `IFS=:` here and split EXTRA_MOUNTPOINTS
> on ':'. That would make sure we don't split on other unexpected
> characters like spaces, tabs, and newlines. And it would be consistent
> with how BR2_EXTERNAL works.

  Well, there's a bigger chance that a file/directory contains a colon than that 
it contains a newline or tab, so : is not _that_ much better. Between tab and 
space I'd say they are about equally likely.

  However, a path with a space will simply not be supported by Buildroot. So if 
that extra mountpoint has a space and is used for a BR2_EXTERNAL, for a local 
tarball, for an override srcdir, for an output directory, for a host directory, 
for a download directory, or for some more things I'm forgetting, it simply will 
not work.

  On the other hand, a path that has a colon in it _can_ be used for all of 
these things, except for a BR2_EXTERNAL.

  So I'm no fan of using a colon.

  Yann typically has a useful opinion about this kind of thing, so I'm putting 
him in Cc.

  Regards,
  Arnout


> 
> Thanks,
> Brandon
> 
>> +    mountpoints+=( "${extra_mountpoints[@]}" )
>> +fi
>> +
>>   # shellcheck disable=SC2013 # can't use while-read because of the assignment
>>   for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
>>       docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
>> diff --git a/utils/readme.txt b/utils/readme.txt
>> index 6488d13c75..0cc665e478 100644
>> --- a/utils/readme.txt
>> +++ b/utils/readme.txt
>> @@ -21,7 +21,10 @@ check-package
>>   docker-run
>>       a script that runs a command (like make check-package) inside the
>>       buildroot CI docker container; pass no command to get an interactive
>> -    shell.
>> +    shell. If additional directories need to be accessible inside the
>> +    container, specify them with the environment variable EXTRA_MOUNTPOINTS.
>> +    The buildroot directory, the current directory, and the download
>> +    directory are automatically propagated.
>>
>>   genrandconfig
>>       a script that generates a random configuration, used by the autobuilders
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
