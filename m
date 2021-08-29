Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0369BC432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 14:59:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7779660E77
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 14:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7779660E77
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26F396060F;
	Sun, 29 Aug 2021 14:59:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8BBkGQ4uFdc4; Sun, 29 Aug 2021 14:59:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A44CB6067E;
	Sun, 29 Aug 2021 14:59:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1AB791BF417
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 14:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0ABDC4046F
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 14:59:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RHIlH7XYDCVj for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 14:58:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECC86402EE
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 14:58:55 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id n27so25353037eja.5
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 07:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=THdvcz7yFsav0b7C/PTNYoT6k5i/veMsDGAsqDN2WIA=;
 b=Fu/gtictxdlqA31kpLmiIVXiux8XBFOE7Re1hwpXzQSyDMEe5HhzdQ4yirO/n81Z8t
 5sE9ge081Z3dWYuyiMjaiBT3BQyAxLzk1TaoSUNe/aVe4rxrXRig7H1o8GKCvdFvLyq4
 wffP4BQVX+DDyrcOQ93WDEjjMyK3Ila8U7/XemUAGnGBpfLzTM8Ae1PyYcfcyIn66rJq
 hXwgoDdjL72BsEsFBIP6H/rrCAWA3Weadtcv6yqRb1eQ1yU0wHInBTUt5AqoQS57dRA8
 NDdVIGQjixKH1PefF/VBMzyW5BiI31/AGO9UbFxTKze5HownHKgzgZXYS30iQGIRdvzZ
 GgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=THdvcz7yFsav0b7C/PTNYoT6k5i/veMsDGAsqDN2WIA=;
 b=GX/Smp8fpewBwWYO0qZnGPUQypsCEHR7y5z5pHD40Hp8MAq7RtoyEXB8ZnDHM9VPgn
 +YqayD4fBlvQ60OvGaWJc4MvOYXkjNGFFnQCyiCW+Ns88VEMWD9HxCS8rjxpBVarOS1H
 0+H18bpHyl/vMXSlzL4rj2NoexcWA0C4YYPN9kBh3KIeCNDJoDIMHjMpVlYSAsk8yxAL
 keHwctbmq8bYtt8t5bCAae2nWrQ9WUWVN5xiNNbaCv1Jb/IG6SGOjqq+rsOk8xzzm8As
 fZWcDE8KoAFTT9sJfMexcVUD/DUK2J3NRBpPC3+2Rn4e7plCwH9MW3NXmGNu0R3aCw69
 LqKQ==
X-Gm-Message-State: AOAM532TGMGKTIBjYMSFsXeOZHkbcuOnVB+f8BYZfJgckzInyDO6xvw0
 94WZeRfeNsumTJsN5jE+Vb0m/Q4jQA4b4g==
X-Google-Smtp-Source: ABdhPJxR1jXzRA8Nr26h8ilnrg1ZsPbvLeA268a5IDhplcaELhRryaYhmpuHWXf71qp+RV+2HIdRZg==
X-Received: by 2002:a17:906:318b:: with SMTP id
 11mr20313047ejy.493.1630249133700; 
 Sun, 29 Aug 2021 07:58:53 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id n13sm5423996ejk.97.2021.08.29.07.58.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Aug 2021 07:58:53 -0700 (PDT)
To: James Hilliard <james.hilliard1@gmail.com>
References: <20210828044626.3170348-1-james.hilliard1@gmail.com>
 <48045f87-380b-6f11-95a4-7fc6e7520936@mind.be>
 <CADvTj4pGvfaCRUoOSGms=ZuNv39Fo_MDVzKSDv31tC0FoFg_ew@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <bc35caa4-6aad-b0d4-183d-2e0ad2ae8d08@mind.be>
Date: Sun, 29 Aug 2021 16:58:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CADvTj4pGvfaCRUoOSGms=ZuNv39Fo_MDVzKSDv31tC0FoFg_ew@mail.gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/swupdate: update service/init
 configs
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 29/08/2021 03:54, James Hilliard wrote:
> On Sat, Aug 28, 2021 at 6:44 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>  Hi James,
>>
>>  "update" in the subject is not really helpful.
> 
> I had assumed these configs were mostly just re-syncing with meta-swupdate.
> 
> I'll split this patch up.
> 
>>
>> On 28/08/2021 06:46, James Hilliard wrote:
>>> Set SKIP_STRIP=y so that the swupdate binary isn't stripped.
>>
>>  We can see that from the patch - instead you should explain why we want to skip
>> strip.
>>
>>  Also, this has nothing to do with systemd configs, so should be a separate patch.
>>
>>  In this case for sure, because I think it might be something for master.
> 
> Ok, will send separately.

 Splitting off just this bit is probably sufficient - I don't want to push
useless work on you.

[snip]
>>> diff --git a/package/swupdate/10-mongoose-args b/package/swupdate/10-mongoose-args
>>> new file mode 100644
>>> index 0000000000..896e66ba86
>>> --- /dev/null
>>> +++ b/package/swupdate/10-mongoose-args
>>> @@ -0,0 +1 @@
>>> +SWUPDATE_WEBSERVER_ARGS="-r /www ${SWUPDATE_MONGOOSE_EXTRA_ARGS:--p 8080}"
>>
>>  Is this correct? The webserver is installed in /var/www, not /www...

 You didn't reply to this...

>>
>>> diff --git a/package/swupdate/90-start-progress b/package/swupdate/90-start-progress
>>> new file mode 100644
>>> index 0000000000..3b0eb5e7d7
>>> --- /dev/null
>>> +++ b/package/swupdate/90-start-progress
>>> @@ -0,0 +1 @@
>>> +exec /usr/bin/swupdate-progress -w -r &
>>> diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
>>> index f601e45fcd..6b832cfcbf 100644
>>> --- a/package/swupdate/Config.in
>>> +++ b/package/swupdate/Config.in
>>> @@ -60,9 +60,16 @@ config BR2_PACKAGE_SWUPDATE_CONFIG
>>>         I you wish to use your own modified swupdate configuration
>>>         file specify the config file location with this option.
>>>
>>> +config BR2_PACKAGE_SWUPDATE_WEBSERVER
>>> +     bool "swupdate webserver"
>>> +     default y
>>> +     help
>>> +       Enable update from remote using a web server on the target.
>>> +
>>>  config BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE
>>>       bool "install default website"
>>>       default y
>>> +     depends on BR2_PACKAGE_SWUPDATE_WEBSERVER
>>
>>  I could be mistaken, but isn't the website perfectly usable with an external
>> webserver as well? You just have to provide the upload endpoint IIRC.
> 
> The webserver is also the upload endpoint and is thus required, sure you can
> proxy to it via nginx even but it's not optional for the update
> website to function.

 So I was indeed mistaken :-)

 I thought I made a comment somewhere that maybe the
BR2_PACKAGE_SWUPDATE_WEBSERVER isn't needed (but now I can't find that comment
so maybe in the end I removed it). In case I did make that comment: ignore it
:-) The explanation above makes it clear that it really *is* needed as a config
option.

> 
>>
>>>       help
>>>         Install the provided website to /var/www/swupdate.
>>>
>>> diff --git a/package/swupdate/swupdate-progress.service b/package/swupdate/swupdate-progress.service
>>> new file mode 100644
>>> index 0000000000..0d464bb420
>>> --- /dev/null
>>> +++ b/package/swupdate/swupdate-progress.service
>>> @@ -0,0 +1,9 @@
>>> +[Unit]
>>> +Description=swupdate progress service
>>> +After=swupdate.service
>>> +
>>> +[Service]
>>> +ExecStart=/usr/bin/swupdate-progress -r -w
>>> +
>>> +[Install]
>>> +WantedBy=swupdate.service
>>
>>  I suspect this is copied verbatim from meta-swupdate... It's good form to then
>> add a comment in the beginning of the file that specifies the upstream copyright
>> and license (in SPDX) and an upstream link.
>>
>>  Same for all other files you copied, of course.
> 
> Hmm, I'm thinking the best option would just be to add a comment to the makefile
> indicating the source of them, they are MIT licensed which is already a license
> listed for the swupdate package.

 An SPDX-License-Identifier comment costs nothing and can be very helpful for
people who have to analyse licenses. We haven't this discussed it at all so it's
purely my own opinion, but I believe we should require that on all files.


>>> diff --git a/package/swupdate/swupdate-usb.rules b/package/swupdate/swupdate-usb.rules
>>> new file mode 100644
>>> index 0000000000..b4efd0b733
>>> --- /dev/null
>>> +++ b/package/swupdate/swupdate-usb.rules
>>> @@ -0,0 +1,2 @@
>>> +ACTION=="add", KERNEL=="sd*", SUBSYSTEM=="block", ENV{ID_BUS}=="usb", ENV{ID_FS_USAGE}=="filesystem", TAG+="systemd", ENV{SYSTEMD_WANTS}+="swupdate-usb@%k.service"
>>
>>  Hm, I wonder if it's a good idea to install this unconditionally... It feels to
>> me that this is a possible attack vector that the user should be aware of - and
>> the best way to do that is to make the whole thing optional.
> 
> Maybe, although swu files should typically be signed.

 With the default installation, there is no signature check - you need to change
the swupdate.conf and install a public key for it to work. So, if you're going
to that trouble, it's no effort at all to also install the udev rules for
automounting USB. That is, of course, assuming that it's documented - which
currently it is not. Which is why I made the suggestion to instead contribute it
as upstream documentation.


>>  But really, I kind of wonder if this is something that Buildroot should
>> provide. Ideally, this should be part of the swupdate documentation, and if you
>> actually want automatic updates when a USB storage device is plugged in, you can
>> put that stuff in an overlay.
> 
> Well it's included by default in the meta-swupdate layer, but yeah I
> should probably
> add a config option for it.
[snip]
>>> diff --git a/package/swupdate/tmpfiles-swupdate.conf b/package/swupdate/tmpfiles-swupdate.conf
>>> new file mode 100644
>>> index 0000000000..4743672fcc
>>> --- /dev/null
>>> +++ b/package/swupdate/tmpfiles-swupdate.conf
>>> @@ -0,0 +1,2 @@
>>> +X /tmp/datadst
>>> +X /tmp/scripts
>>
>>  Why are these needed? Are they only needed for systemd? If not, the S80swupdate
>> init script should also be updated to create those directories.
> 
> These directives prevent systemd from deleting those folders, they are
> not needed
> for non-systemd setups.
> 
> See:
> https://www.freedesktop.org/software/systemd/man/tmpfiles.d.html
> 
> Specifically:
> X
> Ignore a path during cleaning. Use this type to exclude paths from clean-up as
> controlled with the Age parameter. Unlike x, this parameter will not exclude the
> content if path is a directory, but only directory itself. Note that
> lines of this type do
> not influence the effect of r or R lines. Lines of this type accept
> shell-style globs in
> place of normal path names.

 Thanks - TIL.

 Regards,
 Arnout

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
