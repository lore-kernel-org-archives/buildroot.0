Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57813C6FA82
	for <buildroot@archiver.kernel.org>; Wed,  7 Sep 2022 12:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E623D60AFC;
	Wed,  7 Sep 2022 12:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E623D60AFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CMlbFrplGPtC; Wed,  7 Sep 2022 12:42:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD9DF60AEF;
	Wed,  7 Sep 2022 12:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD9DF60AEF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2AF5F1BF59E
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 12:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05EDB60AEF
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 12:42:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05EDB60AEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 50Q_FDd6W9P2 for <buildroot@lists.busybox.net>;
 Wed,  7 Sep 2022 12:42:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B53860AEE
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B53860AEE
 for <buildroot@buildroot.org>; Wed,  7 Sep 2022 12:42:51 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id q21so11860570edc.9
 for <buildroot@buildroot.org>; Wed, 07 Sep 2022 05:42:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=JzVD4CAZZUTMjH7jgqgaBOiQTGoJz1pxx1RK+dJSRSo=;
 b=ZpKJAkL7IT5zhvkOzd/8rfqu6xlGOHJYAbIJSBSvHqRAhuFIOUfQECEARpx8JEho5G
 CR7TZtnpnvaw+gXaKKAthrOG5UXEG00UKgfzRfyo4g69GBcc6zfJmR8qmGi45SefE0AS
 7D9D0taRK20NzgzAueYuWJ6bz67snKON4DUq3pORRiblaSiX1EvwTlPkEIulnba0Oq/Z
 8CdTRYNRM+Lkvs2WvWuS+qjCvO01CIo8i8b2D0W7jTBrk0aaHvhZuCNmue/AeaGWm1pK
 xPUiuFu0xVQccwRrP1M0g8RMkvpHfCBbucAfarxMzpoUCRXa067F4SP7hAHDj9alkcpu
 /+eQ==
X-Gm-Message-State: ACgBeo1ZWsZWGt689E0bEEWRYBxauV6jxDUwnApZgww2sFV+9YkH7imj
 UlSFxPvhR714YBNbp084bAWfDYMfgx6puA==
X-Google-Smtp-Source: AA6agR6JHf00MfgtIxuEpTI9NE0kG5I7VfqY2M62ggpzlxKIRjTq5OLx4PgKOtSo3uj1aIqAvN7/Kg==
X-Received: by 2002:a05:6402:2786:b0:44f:2d99:93d1 with SMTP id
 b6-20020a056402278600b0044f2d9993d1mr129113ede.324.1662554570239; 
 Wed, 07 Sep 2022 05:42:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 r16-20020aa7da10000000b0044838efb8f8sm1595281eds.25.2022.09.07.05.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Sep 2022 05:42:49 -0700 (PDT)
Message-ID: <09be7323-3af8-2fa2-2d45-16d3d92e1c13@mind.be>
Date: Wed, 7 Sep 2022 14:42:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220905202002.4183680-1-james.hilliard1@gmail.com>
 <20220906072158.GM1490660@scaer>
 <CADvTj4rCFTZOm0MA+Ph7u8DmjPqgJw39oXqWoxPLWmERRCJrPg@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <CADvTj4rCFTZOm0MA+Ph7u8DmjPqgJw39oXqWoxPLWmERRCJrPg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=JzVD4CAZZUTMjH7jgqgaBOiQTGoJz1pxx1RK+dJSRSo=;
 b=VEx5a8ZPwNEqSp1Fi3LjbVIvAzxCRRAjOzp9yAIMW41uZN7b3Fsb/G74IhlSNFtp+X
 /tg4Cf7ffv5kV0nlU8vtsEUvZrpcv8BA1kq+W1PayQHsERewC3iBXuBi2qlv1wx58X77
 x5K9SC5lPTJAq7hPEXKNwbciz6vHGfw54O5Sy6H7MdJaDwIXQsYS9QjCR7S62dKy3mrM
 7MwimLKU3aUDzhT2xIQpMTJsiS4Kn8t0li2S4VNITL5aOBCv1buTdQWcT/EWvZzraWcR
 BCOnS8wcyKfPsPGcMHQ63noljYHph5kWK3FqHJcfwVbFjCMEcgPzpb03ZcGQnwtBleBk
 ci4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VEx5a8ZP
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: unexport TARGET env variable
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/09/2022 23:15, James Hilliard wrote:
> On Tue, Sep 6, 2022 at 1:22 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>>
>> James, All,
>>
>> On 2022-09-05 14:20 -0600, James Hilliard spake thusly:
>>> If set this can may break package builds in some cases such as the
>>
>> So, this is very probabilistic: 'can' and 'may'! ;-)
> 
> Well I think the breaking behavior depends on what TARGET is set to.
> 
>>
>>> host-icu build.
>>
>> Can you provide an actual error message and an explanation on how that
>> actually fails?
> 
> I had set this in my env(for some non-buildroot compiler testing), and noticed
> it broke buildroot builds unless cleared:
> export TARGET=bpf
> 
>>>> host-icu 70-1 Building
> PATH="/home/buildroot/buildroot/output/per-package/host-icu/host/bin:/home/buildroot/buildroot/output/per-package/host-icu/host/sbin:/home/buildroot/bin:/home/buildroot/.local/bin:/home/buildroot/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
> PKG_CONFIG="/home/buildroot/buildroot/output/per-package/host-icu/host/bin/pkg-config"
> PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
> PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
> PKG_CONFIG_LIBDIR="/home/buildroot/buildroot/output/per-package/host-icu/host/lib/pkgconfig:/home/buildroot/buildroot/output/per-package/host-icu/host/share/pkgconfig"
>   /usr/bin/make -j33  -C
> /home/buildroot/buildroot/output/build/host-icu-70-1/source
> cd ./config; \
>      /usr/bin/make -f pkgdataMakefile
> rm -rf config/icu-config
> rebuilding config/icucross.mk
> rebuilding config/icucross.inc
> /bin/bash ./mkinstalldirs lib
> /bin/bash ./mkinstalldirs bin
> /usr/bin/install -c ./config/icu-config-top config/icu-config
> rm -rf pkgdata.inc
> chmod u+w config/icu-config
> mkdir lib
> mkdir bin
> LC_ALL=C /usr/bin/sed -f ./config/make2sh.sed < ./config/Makefile.inc
> | grep -v '#M#' | uniq >> config/icu-config
> config/icu-uc.pc updated.
> config/icu-i18n.pc updated.
> /usr/bin/make[2]: Making `all' in `stubdata'
> LC_ALL=C /usr/bin/sed -f ./config/make2sh.sed < ./config/mh-linux |
> grep -v '#M#' | uniq >> config/icu-config
> cat ./config/icu-config-bottom >> config/icu-config
>     (deps)     stubdata.cpp
> chmod u-w config/icu-config
> Note: rebuild with "/usr/bin/make VERBOSE=1 " to show all compiler parameters.
> make[3]: *** No rule to make target 'bpf', needed by 'all-local'.  Stop.
> 
>>
>> I've looked at the icu source code, and all I could see are plain
>> assignments and references to TARGET. Variables assigned in a Makefile
>> are supposed to take precedence to variables from the environment, so I
>> am not sure I can see how that can actually fail...
> 
> I assume it's not actually assigned in the makefile then?

  It's conditionally assigned:

ifneq ($(ENABLE_STATIC),)
TARGET = $(STUBDATA_LIBDIR)$(LIBSICU)$(TARGET_STUBNAME)$(ICULIBSUFFIX).$(A)
endif

  There are a couple of Makefile.in where it's defined like that....

  This does look like a very icu-specific thing though, so I think it should be 
fixed in icu.mk itself, by setting TARGET= in the _ENV.

  Regards,
  Arnout


> 
>>
>> See for example commits which describes the actual reasons it fails:
>>      20ca008d0266 unexport TERMINFO to correct ncurses behavior
>>      2e32330c4a49 Makefile: unexport O
>>      d3910057c6ae Makefile: unexport 'DEVICE_TREE' environment variable
>>      6cff741ebaf7 package/ccache: do not force colored diagnostics
>>
>> Regards,
>> Yann E. MORIN.
>>
>>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>>> ---
>>>   Makefile | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Makefile b/Makefile
>>> index bd0b906cde..a82a22a276 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -427,6 +427,7 @@ unexport GCC_COLORS
>>>   unexport PLATFORM
>>>   unexport OS
>>>   unexport DEVICE_TREE
>>> +unexport TARGET
>>>
>>>   GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
>>>
>>> --
>>> 2.34.1
>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot@buildroot.org
>>> https://lists.buildroot.org/mailman/listinfo/buildroot
>>
>> --
>> .-----------------.--------------------.------------------.--------------------.
>> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
>> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
>> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
>> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
>> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
