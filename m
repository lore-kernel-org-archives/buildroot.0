Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0432BC54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 08:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD642408DB;
	Sun, 18 Sep 2022 08:57:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD642408DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iChuTwXGCuJh; Sun, 18 Sep 2022 08:57:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B55F5404A1;
	Sun, 18 Sep 2022 08:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B55F5404A1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF0531BF282
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 08:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A1FD84055
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 08:57:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A1FD84055
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NpErG6JiitKk for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 08:57:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A614384000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A614384000
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 08:57:05 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 v185-20020a1cacc2000000b003b42e4f278cso2544754wme.5
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 01:57:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=lmM67BqZWxwruQLcu6zPgdXc9ob+A72rThJuhx7MLKE=;
 b=BGh3ndM1Sbgxptdfro8VENMHtY5UMPHMrfnYwWyw6aDj/2m8Zmvo3svkZG5PDklvrE
 gIBTYy3YMynrfIkwMFgD/KOE+lZMYqYPYME5H0weg5YRLT6/6R9rrsAMxK7us4vrljsT
 8NyRFTJFg2OyFH55j2oM5PXZ+crImWNiCS3D2U4q+84k1Y4jKT/BurwYhrOoj8MAfTlk
 DEvFCjQvqgIZRceVuemah5OLlNupyzCoP44K+qxa0ADTnjVKLbkOhKXzwqRf4mVzH5G4
 ctMYfP3EiqDwTM6jCdIcb55iiGHO/2NgnFS8dg1jsZjfiJ0Oceq452OhXo/rlKvhzUeB
 xW2g==
X-Gm-Message-State: ACrzQf39UMjmT2NNq+wVbxYvrvyijQ1UplptRzS0+iTUNQRYFReHFFX7
 EGHYfnMse8O+MhsA61v34PntNA==
X-Google-Smtp-Source: AMsMyM7SphXyNAHr+ChA7f0lZxVp0Mo8GRdLkdtes6b1gRrZA8laWOcjv1nEJLTkDHExd0BnlbogjA==
X-Received: by 2002:a05:600c:1906:b0:3b4:c979:e686 with SMTP id
 j6-20020a05600c190600b003b4c979e686mr3698610wmq.107.1663491423668; 
 Sun, 18 Sep 2022 01:57:03 -0700 (PDT)
Received: from [172.23.97.104] ([79.140.217.34])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a5d4348000000b00228d8420f57sm10138749wrr.95.2022.09.18.01.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 01:57:03 -0700 (PDT)
Message-ID: <95ed1fd5-7c46-c59e-dc5e-bca4fbd5958a@mind.be>
Date: Sun, 18 Sep 2022 10:57:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <cover.1660931225.git.yann.morin.1998@free.fr>
 <212daefb880a3c5e49ff4aa8278cc4c3bc67360e.1660931225.git.yann.morin.1998@free.fr>
 <d707dd32-af74-0d63-c890-7d81e29ca454@mind.be>
 <20220917211914.GB1127102@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220917211914.GB1127102@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=lmM67BqZWxwruQLcu6zPgdXc9ob+A72rThJuhx7MLKE=;
 b=gHZKhJ0uAImNa8q59bALGXERpzToe9zbY4/rNyx+sZTT4bnAA6IoyXcxNjQrqDqUho
 lXjXFmxTvTXjQlvhWdetXcafMePbBaLaR/nNEKC7XN9M5lgvM76nd4ZwY184acFa9hop
 Alal8qU7mHjirEaEYQxt/9laAsyU3fcuxw9jJpIFNhu9p8lPWauYP1/SwqIJLYswH+QL
 G1q8SAxc9oDOMv/ZmDnEHf/M6EkQSxKqinERm4RfHbjnQNe2sEhC6IBcPXXihobuOs49
 KIdiPUu/47+oCY8ES8ZoXyuKUhGg7tc7fO0ixFT7F5awXbTrnfsbkxhdWfYCBgqmsIXu
 5cOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gHZKhJ0u
Subject: Re: [Buildroot] [PATCH 2/4] package/dracut: allow users to provide
 their own modules
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
Cc: Adam Duskett <aduskett@gmail.com>,
 Thierry Bultel <thierry.bultel@linatsea.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/09/2022 23:19, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2022-09-17 22:17 +0200, Arnout Vandecappelle spake thusly:
>> On 19/08/2022 19:50, Yann E. MORIN wrote:
>>> Dracut modules can only be looked for in HOST_DIR/lib/dracut/modules.d/
>>> and dracut does not offer the possibility to look elsewhere.
>>>
>>> Installing files in HOST_DIR/ can do done either from a host-package, or
>>> via a post-built script; there is no overlay like there is for target/.
>>> This is a bit cumbersome.
>>>
>>> Add an option to the host-dracut package, so users can point to a list
>>> of modules to install.
> [--SNIP--]
>>   Although I agree that conceptually this extra modules thing belongs with
>> the dracut package itself, from a user, practical point of view, you
>> actually want it in the dracut option of fs/cpio. If you use host-dracut
>> without the cpio-dracut fs, it means you are using it in a post-build
>> script, so it's not so weird to also install the extra modules in that
>> script. On the other hand, if you are using cpio-dracut and you need extra
>> modules (which is quite likely), then it extremely annoying that you have to
>> go first to filesystems->cpio and later to hosttools->dracut...
>>
>>   In other words, I think this should be moved to cpio.
> 
> I beg to differ (of course!). ;-)
> 
> Extra modules change the features of dracut; they change what dracut can
> do. They are not like config files, which actually describe what the
> filesystem is to be assemble from.
> 
> Besides copying extra modules as done in this patch, a user could also
> patch dracut to add those modules. So, semantically, extra modules from
> a patch or a local directory are the same.

  There's no question that semantically they belong with host-dracut. That's why 
I wrote "conceptually they belong with the dracut package".

  However, looking at it from a usability point of view, that is no longer the 
case. In the head of the developer, what they want to do is to make sure the 
right stuff ends up in their cpio archive. They don't actually care if the 
dracut package is used for that.

  Perhaps compare it with the gcc and libc options: we put them in the 
toolchains menu, even though they actually belong to the gcc/uclibc packages.

  A middle ground would be to duplicate the option, having one in the 
host-dracut package that has the one from the cpio fs as the default.


> When adding new modules, you will indeed have to add config files that
> reference them (or one of your config files already references one and
> you missed it). Probably, indeed, the modules will be developped in a
> more-or-less closed loop with the config files that use them; but that's
> incidental.

  From the user point of view, that's pretty essential, not just incidental.


> If they were part of the cpio filesystem, they'd be copied on every
> invocation, though, which is conceptually not very nice either (but
> probably very low overhead).

  I was actually thinking of just putting the menu entry there, but keep the 
logic in dracut.mk. Again, similar to how we do it for gcc (although there we 
have the actual menu in package/gcc as well).


> Finally, even if using from a post-build script, it is still nicer to
> expose that option in the menuconfig, rather than require the user to do
> the copy in their script.

  That is true.


  Regards,
  Arnout


> So, local modules should really belong to the dracut package, not the
> cpio filesystem.
> 
> Regards,
> Yann E. MORIN.
> 
>>   Regards,
>>   Arnout
>>
>>> +
>>> +endif
>>> diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
>>> index 2b6a144aac..96fa7db6ba 100644
>>> --- a/package/dracut/dracut.mk
>>> +++ b/package/dracut/dracut.mk
>>> @@ -19,6 +19,15 @@ define HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
>>>   endef
>>>   HOST_DRACUT_POST_INSTALL_HOOKS += HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
>>> +HOST_DRACUT_EXTRA_MODULES = $(call qstrip,$(BR2_PACKAGE_HOST_DRACUT_EXTRA_MODULES))
>>> +define HOST_DRACUT_INSTALL_EXTRA_MODULES
>>> +	$(Q)mkdir -p $(HOST_DIR)/lib/dracut/modules.d/
>>> +	$(foreach m,$(HOST_DRACUT_EXTRA_MODULES), \
>>> +		cp -a $(m)/* $(HOST_DIR)/lib/dracut/modules.d/
>>> +	)
>>> +endef
>>> +HOST_DRACUT_POST_INSTALL_HOOKS += HOST_DRACUT_INSTALL_EXTRA_MODULES
>>> +
>>>   # When using uClibc or musl, there must be "ld-uClibc.so.1" or
>>>   # "ld-musl-x.so" symlinks, respectively - else the init process cannot
>>>   # start
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
