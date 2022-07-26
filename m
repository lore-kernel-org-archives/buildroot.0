Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53985C43334
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 07:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3A7B83FEE;
	Tue, 26 Jul 2022 07:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3A7B83FEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bnLJlZf453xG; Tue, 26 Jul 2022 07:31:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A179883FE8;
	Tue, 26 Jul 2022 07:31:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A179883FE8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 26B2D1BF280
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 07:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F176241B92
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 07:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F176241B92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0PNDm7JOfEcW for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 07:31:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AB4941596
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0AB4941596
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 07:31:42 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id b6so8172950wmq.5
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 00:31:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=kBzM9HlBmMkrm+1rwmwz/pfZkXTaraWyFjvhLb1wgNc=;
 b=fv/+W8ZCLkUqJtaDXLqD9056YmV6FjaDHGBCJRYimH/JT7GXg6Qb1Vg8KRE0XDkbhe
 mqXwBAMb6YdDR4Ct/0uy5g2T3/zNnFJOX7etwzeJ6Q+c9U8GM9srCWO97zmPdxRYGey8
 LYAa1vlM93Yli/SFcR3EHSrJ9nTdsX0Rp9SRH5xlSRC6qBWcqDx7OHthudCNHc1OgMXW
 7DZLbzwjS3d5/10T+QC7dNVsRx/uGxuuJmrKEnQO9rPBVjohz4dUNVjRYVaY6+WjfT4b
 2qetTVUc6kfh/+Ei2EA/ePldeHH6YNV9MTKHvObULNCGZkErysB+cE9CLxahpog86TVo
 Ec0g==
X-Gm-Message-State: AJIora91M24/J+ZOwTzRxiKKxyMHUinIlhVyDj/SSw7Eu3FH5n4W6UxW
 UX0ysHe358vMTBS7msnSGsgVsw==
X-Google-Smtp-Source: AGRyM1vGcDEM/oBnY9sM6lH0YFoibz2+NJrSoQrDjdQ5HJEDzIOdU61SqwvcRxRyqKBiQtFdI1NKRA==
X-Received: by 2002:a05:600c:35d5:b0:3a3:2490:c984 with SMTP id
 r21-20020a05600c35d500b003a32490c984mr25086423wmq.162.1658820700455; 
 Tue, 26 Jul 2022 00:31:40 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 h17-20020adfe991000000b0021dd3e2fb60sm16524948wrm.0.2022.07.26.00.31.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 00:31:40 -0700 (PDT)
Message-ID: <23a6eba2-06fd-8579-9815-214b3656daf7@mind.be>
Date: Tue, 26 Jul 2022 09:31:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220722060936.566534-1-james.hilliard1@gmail.com>
 <20220724153736.GY2641@scaer> <d3dd1b44-33a2-0260-fe89-e93fb71a0209@mind.be>
 <CADvTj4ps6SNy2oQ0UFYYkkjK39ubTiBtFd4RSp4hMvjdB1ywPA@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADvTj4ps6SNy2oQ0UFYYkkjK39ubTiBtFd4RSp4hMvjdB1ywPA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=kBzM9HlBmMkrm+1rwmwz/pfZkXTaraWyFjvhLb1wgNc=;
 b=U2y6ghoqtXcvY15saB6QyLDd9AnMi0rbWr3G5fawWjwqRJMLU4M++s3DEoWsaz0/X9
 pyzomGwsIW0jEVBSx2cI1ofEMJsZlxHWAEC5ctq53aCBTXsW/Xe8lM3ZTkgJZ7GaOYrE
 Cj6oTju8XU5MaOv7xyGGaaK7zmO1k9QhWQEi2sVA7sBlHqyrUyQYbEV+byl7JSjTlNt9
 bmADZt/+e/VE23O93LtrGc8J/B/CQzLaqJLVFDAAiEyME7ad4UuN/foyYyOSYwkt60Wp
 fZeLip5PttCudRSceBF2q+vCcb590TnDhTkFHH7UxNT+z4GbHP8Eg+UAk1hIw3WjmBah
 lMCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=U2y6ghoq
Subject: Re: [Buildroot] [PATCH v3 1/1] package/pkg-meson: use meson to
 build/install packages
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
 Samuel Martin <s.martin49@gmail.com>, buildroot <buildroot@buildroot.org>,
 Norbert Lange <nolange79@gmail.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/07/2022 06:59, James Hilliard wrote:
> On Sun, Jul 24, 2022 at 1:30 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 24/07/2022 17:37, Yann E. MORIN wrote:
>>> James, All,
>>>
>>> On 2022-07-22 00:09 -0600, James Hilliard spake thusly:
>>>> As of version 0.54.0 meson has had the ability to build and install
>>>> packages rather than having to run ninja directly as before.
>>>>
>>>> This will allow us to use features such as meson install tags in
>>>> the future which require meson to be used for the installation.
>>>>
>>>> It appears we need to ensure the cmake prefix path is set for the
>>>> meson generated relocatable pkg-config format to work properly.
>>>>
>>>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[snip]
>>>>    * +FOO_NINJA_OPTS+, to specify a space-separated list of targets to build. By
>>>
>>> Now that we use meson to build and instal, does it still make sense to
>>> have FOO_NINJA_OPTS to be the list of targets to install?
>>>
>>> I mean, isn't there a way to tell meson what to install, instead?
>>
>>    FOO_NINJA_OPTS could theoretically be used to control other things about
>> ninja, e.g. warnings and debugging. Though I don't really see why you'd ever
>> want to do that in a buildroot package.
> 
> There might be some use cases in which it makes sense to use it to control
> what gets built...I figured best just keep it for now.

  If it is used to control what gets built, then Yann's remark applies - it 
should be passed to meson itself, not to ninja. That is, assuming that "meson 
build" does have a way to specify what gets built.


>>>> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
>>>> index 3b1db35fb6..4fa620080d 100644
>>>> --- a/package/pkg-cmake.mk
>>>> +++ b/package/pkg-cmake.mk
>>>> @@ -90,6 +90,8 @@ define $(2)_CONFIGURE_CMDS
>>>>       $$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
>>>>               -DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
>>>>               -DCMAKE_INSTALL_PREFIX="/usr" \
>>>> +            -DCMAKE_PREFIX_PATH="$$(STAGING_DIR)/usr" \
>>
>>    Wouldn't it be better to put this in the toolchainfile?
> 
> So it seems we just need to remove this from the toolchainfile instead actually:
> https://patchwork.ozlabs.org/project/buildroot/patch/20220726044425.72570-1-james.hilliard1@gmail.com/

  The problem is, the toolchainfile is not only meant to be used in Buildroot 
itself, but also by external builds (using the SDK). The idea is that it should 
be sufficient to call cmake with an option pointing to the toolchain file to do 
a build externally. That's why we have the pkgconfig setting in there.


>>>> +            -DPKG_CONFIG_USE_CMAKE_PREFIX_PATH=ON \
>>
>>    This one as well, I guess.
>>
>>>
>>> But doesn't that needs to be in a separate patch? I mean, does it not
>>> make sense opn its own?
>>
>>    +1.
>>
>>    The commit message of that patch could also explain better what it does exactly.
>>
>>>
>>> [--SNIP--]
>>>> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
>>>> index 0835e08e3a..de5817d5da 100644
>>>> --- a/package/pkg-meson.mk
>>>> +++ b/package/pkg-meson.mk
>>> [--SNIP--]
>>>> @@ -138,6 +138,7 @@ define $(2)_CONFIGURE_CMDS
>>>>       $$(MESON) \
>>>>               --prefix=/usr \
>>>>               --libdir=lib \
>>>> +            --pkgconfig.relocatable \
>>>
>>> Please explain what that means and why this is needed in the context of
>>> a target package.
>>
>>    And also it should probably be a separate patch - pkgconfig stuff should be
>> done at configure time, not at build time, so using meson to start the build
>> shouldn't really be related to it.
> 
> This is inside of $(2)_CONFIGURE_CMDS so it is done at configure time AFAIU.

  The patch is about "use meson to build/install packages". It is very weird 
that calling meson instead of ninja in the build step would require to do 
something different in the configure step.


>>>>               --default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
>>>>               --buildtype=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) \
>>>>               --cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
>>>> @@ -156,10 +157,11 @@ define $(2)_CONFIGURE_CMDS
>>>>       mkdir -p $$($$(PKG)_SRCDIR)/build
>>>>       $$(HOST_CONFIGURE_OPTS) \
>>>>       $$($$(PKG)_CONF_ENV) $$(MESON) \
>>>> -            --prefix=$$(HOST_DIR) \
>>>> +            --prefix=/ \
>>>
>>> It is very weird that host packages are configured with / as prefix, and
>>> then installed in HOST_DIR set as DEST_DIR.
>>
>>    It's not weird, it's wrong! There is no reasonable explanation how this can be
>> correct. We are really installing stuff in that specific location, any paths
>> should refer to that location and not a path beginning with /.
> 
> Well from my understanding when using relocatable mode/meson install the
> prefix is appended to the destdir similar to how it works for target/staging
> directories.

  As Thomas explained in the v4, it is not at all similar to target/staging.


  Regards,
  Arnout

>>    If for some reason meson doesn't work when the prefix is not / or /usr or
>> /usr/local, it's a bug in meson, really.
> 
> I think the issue is in how prefix and destdir get combined.
> 
>>
>>    Regards,
>>    Arnout
>>
>>>
>>> I guess this is working thanks to --pkgconfig.relocatable a few lines
>>> below?
>>>
>>> This must be explained in the commit log (and probably a little comment
>>> above $(2)_CONFIGURE_CMDS for host packages.
>>>
>>>>               --libdir=lib \
>>>> -            --sysconfdir=$$(HOST_DIR)/etc \
>>>> -            --localstatedir=$$(HOST_DIR)/var \
>>>> +            --pkgconfig.relocatable \
>>>> +            --sysconfdir=etc \
>>>> +            --localstatedir=var \
>>
>>    These two could be correct, however, since I think they're taken relative to
>> prefix (the default values are absolute because the default prefix is /usr and
>> sysconfdir is /etc, not /usr/etc - but in our case a relative path is fine).
>>
>>    Regards,
>>    Arnout
>>
>>>
>>> Ditto for etc and var?
>>>
>>> So, to make it easier to follow, I'd change the ordering:
>>>
>>>       --pkgconfig.relocatable \
>>>       --prefix=/ \
>>>       --sysconfdir=etc \
>>>       --localstatedir=var \
> 
> Reordered in v4.
> 
>>>
>>> Regards,
>>> Yann E. MORIN.
>>>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
