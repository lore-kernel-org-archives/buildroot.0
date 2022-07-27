Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB6AC19F2B
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 17:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C66F4092B;
	Wed, 27 Jul 2022 17:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C66F4092B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JtGcM_o3Kesd; Wed, 27 Jul 2022 17:05:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9265840886;
	Wed, 27 Jul 2022 17:05:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9265840886
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6370A1BF429
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 17:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C0A6827A8
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 17:05:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C0A6827A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0OM8B-n2Q5lk for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 17:05:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CE9681A50
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3CE9681A50
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 17:05:33 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id k11so24960129wrx.5
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 10:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8Tq0XqbLpRWPWBvNzCSvq/hwRY3NCM3Q+LAImdztonw=;
 b=NktyoSW4AlhB6D0t2SqgLP2//q6xP3eeToWpAzh8wyYxwGUcbaXpgdEwngSulA8ysa
 d4t9NyQ95ATY76hhg7Sa5ycCB6t4FqKcl0WKv5E7wX1lG856ibttuDwujo5VqUYzFwyk
 jGNkJB4Ujqsjdp065h+yb2j3nwdMVQy1OkdZ8Wue639n8nWD6jT6nvPqoUacm1rTEEXD
 XIZtrXZ+NxwsCPssboKDjVve8mDclIVQOCgAxGnmQg1pvGU08lfONjKqcpg8LzGRswjW
 HPo2LiwzaMsG9mTtjQaX4TVDyfCPUQXQv2grcS2C+jNPlNvxB2mnJZdWlR+z/lusPfvM
 5IOg==
X-Gm-Message-State: AJIora+iMWf0whOS9JFMu5pJqO+j9Uj9VweSbVFzKMbMy0LhAJHquZY3
 mnMvB14BtR7aiDro7hT1nrEoCzWyBlH9uw==
X-Google-Smtp-Source: AGRyM1sJ9dSr7W37ffaqWRZiNffeR4TWGrI73BqmfN6P85M8sqaQrEelcHzQAS9VfHNeOWy9Ngo6Zw==
X-Received: by 2002:a5d:528a:0:b0:21d:7c04:2ddf with SMTP id
 c10-20020a5d528a000000b0021d7c042ddfmr14266529wrv.422.1658941531884; 
 Wed, 27 Jul 2022 10:05:31 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adfde8a000000b0021e50971147sm17471302wrl.44.2022.07.27.10.05.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 10:05:31 -0700 (PDT)
Message-ID: <28488fd2-ab02-43c7-25da-cdcb3f37d83a@mind.be>
Date: Wed, 27 Jul 2022 19:05:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>
References: <20220109221650.777610-1-nolange79@gmail.com>
 <2288ff34-d140-a1a0-3f8e-86baf04f4dee@mind.be>
 <CADYdroP82ZnJLWzL0=DP1r2T-0nJe3c7xxC4QgwkNtF5dkC_8A@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADYdroP82ZnJLWzL0=DP1r2T-0nJe3c7xxC4QgwkNtF5dkC_8A@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8Tq0XqbLpRWPWBvNzCSvq/hwRY3NCM3Q+LAImdztonw=;
 b=gfy1rYoB055RvhYi9jVzdRFFIteqnH/5czgDOfowJeXGQVTG0ChbLOmruAgP2t+UA7
 0M77GY3l1Me4mE5xB5AzbQ4+FwLNNI+p99tVaYEZGUkmPDLfpzC8f/I2+ck4qPleJ0Pm
 6K93lTBvOHWw2yGvK4aPDDXVUorvnwVilgnREdNxhZ6fEwrdknPevbSr9PqZ5/HdKdi3
 EH3ImsvJJbOoGBRAQhUiesUF5oIW+xDVZDeoD0DEdt06dsL2zrjxiTWkOg+QMiEttL1N
 7inPxfD5MhHMHflYbQLsNviMLMkzP8+QlAzV0HaI3+/O+oLvPXQwBrJztOfu4n22Vo8v
 waSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gfy1rYoB
Subject: Re: [Buildroot] [PATCH v6 1/4] package/dbus-broker: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/07/2022 15:47, Norbert Lange wrote:
> Am Mi., 27. Juli 2022 um 13:08 Uhr schrieb Arnout Vandecappelle
> <arnout@mind.be>:
>>
>>    Norbert, Yann,
>>
>>    As usual, apologies for taking so long to review this. It's because it's a bit
>> complicated. I actually tried to look at it just after our hackaton in January
>> but it was too complicated to quickly get my head around.
>>
>> On 09/01/2022 23:16, Norbert Lange wrote:
>>> dbus-broker is an alternate implementation of a dbus dameon. It can be
>>> used as a drop-in replacement for the system bus daemon, as well as the
>>> session bus daemon.
>>>
>>> dbus-broker is (basically, and as far as we're concerned in Buildroot)
>>> split in two components:
>>>
>>>     - the actual message bus daemon, that relays messages across clients
>>>
>>>     - a launcher, which is responsible for setting various aspects of the
>>>       bus, like setting the policy et al. and opening the socket(s) the
>>>       message bus daemon will have to listen on...
>>>
>>> The launcher can only be used in a systemd setup (it makes heavy use of
>>> systemd facilities), while the message bus is generic. However, the
>>> message bus daemon is useless without a launcher. There does not exist a
>>> non-systemd launcher, which makes dbus-broker actually a systemd-only
>>> package; this can be revisited when/if a non-systemd launcher appears.
>>>
>>> Note, however, that libdbus is not provided by dbus-borker. People who
>>> want to use dbus-broker as the bus daemon, and need libdbus, will have
>>> to enable both, see below.
>>>
>>> There are two cases:
>>>
>>>    1. original dbus disabled
>>>
>>>       Here, we install the config files and systemd socket activation
>>>       units; dbus-broker provides the system and sessions bus daemons.
>>>
>>>       In this case, libdbus is not available.
>>>
>>>    2. original dbus enabled
>>>
>>>       In this case, we do not install the config files and systemd socket
>>>       activation units, or define a user: they all are provided by the
>>>       original dbus, and we piggy-back on those.
>>>
>>>       In this situation, the default system and sessions message bus are
>>>       the original dbus, and libdbus is available; dbus-broker is not
>>>       enabled.
>>>
>>>       So far, we believe it would be over-engineered to provide a way
>>>       to allow choosing the bus daemon in the configuraiton. However,
>>>       users may opt-in to use dbus-broker in a few ways:
>>>         - at build-time: by calling systemctl enable/disable from a
>>>           post-build script (preferred), or by providing drop-in units
>>>           or presets in an overlay (less preferred) or custom skeleton
>>>           (as a last resort),
>>>         - at runtime (on a RW filesystem): by calling systemctl
>>>           enable/disable
>>
>>    I don't know... To me it seems logical that if both are enabled, that you use
>> dbus-broker for the bus and only use original dbus for libdbus.
> 
> Would be fine by me, back then most distros required you to
> manually enable dbus-broker, now it seems they shift to using
> it by default if installed.

  Since we anyway already have the infrastructure to automatically enable it if 
dbus is not included, it should be easy to do that even if dbus is included.

>>    So to me the proper approach seems to change dbus itself so the daemon is
>> optional, i.e. only libdbus is installed if the daemon is not enabled, similar
>> to e.g. libcurl. BR2_PACKAGE_DBUS_DAEMON should default to y because that's what
>> most people want. We'd have to go through existing packages to check if they
>> depend on libdbus or on the daemon - mostly it will be the first. If there is a
>> package that really needs the daemon (I don't actually think so), then we might
>> need to introduce a virtual package for the daemon. Regardless, dbus-broker
>> should depend on !BR2_PACKAGE_DBUS_DAEMON.

  Looking more detailed at it, this seems too complicated. dbus doesn't offer a 
way to install only the library. Also in terms of rootfs size, the only 
difference is the dbus-daemon and dbus-launch binaries, plus a few config files. 
Not really sufficient to make it worth it.

  What I will do, I think, is to include logic in dbus to remove the activation 
units (both the service and the socket) when dbus-broker is enabled. It is 
slightly messy because dbus.mk and dbus-broker.mk become fairly tightly woven 
together, but I think it's worth it from a usability perspective.


> Debian does something similar, including splitting of the xml config files
> and actual daemons into their own packages.
> 
> see [1].
> 
>>> Note about the user: the path to the system bus socket is a so-called
>>> "well-known location": it is expected to be there, by spec. Moving it
>>> elsewhere is going to break existing programs. So, the user running the
>>> system bus daemon must be able to create that socket.
>>>
>>> As we may have two packages providing a system bus daemon, they have to
>>> be both able to create the socket, and thus must both be able to write
>>> in the directory containing the socket. And since they can be switched
>>> at runtime, they must be running as the same user.
>>>
>>> We can't just reference the original dbus user, so we duplicate the
>>> entry. What is important, is that the user be named 'dbus', as that's
>>> what we use in both cases.
>>
>>    If it's a virtual package, then the user could be created by the virtual
>> package itself.

  It won't be a virtual package, so no longer relevant.


> with systemd you probably dont even need a real user for the isolation
> benefits.
> So maybe this would just be necessary if dbus utilities are used,
> you can also just let systemd create that user dynamically:
> 
> [Service]
> ...
> User=dbus
> Group=dbus > DynamicUser=true

  If we do this both in the dbus and the dbus-broker units, then indeed we can 
remove the dbus user.

  If I add this just to dbus-broker, but dbus still creates a static user, is 
this going to give a problem for systemd? I.e. does systemd support a 
DynamicUser=true if the user exists already statically? I think so...


  Regards,
  Arnout

> ExecStart=!/usr/bin/dbus-broker-launch --scope system --audit
> ExecReload=!/usr/bin/busctl call org.freedesktop.DBus
> /org/freedesktop/DBus org.freedesktop.DBus ReloadConfig

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
