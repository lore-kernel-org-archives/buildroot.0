Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D371FC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 19:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AB9040477;
	Sun, 24 Jul 2022 19:31:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AB9040477
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oqRiPH0gaDwj; Sun, 24 Jul 2022 19:31:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47DED401A3;
	Sun, 24 Jul 2022 19:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47DED401A3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7527C1BF424
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D11C60FC8
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:30:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D11C60FC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bPLmpu_bfpGX for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 19:30:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1312C60D59
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1312C60D59
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 19:30:57 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id id17so5650969wmb.1
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 12:30:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LaiJ4acwQWw/1IxBxDI9bnxBoPdwyx+LeNn6ZdqXaDQ=;
 b=wouxq6dCO4Aa12mcm8lr+AAyJtWCynA0N/9NrYhoMlCfQjladpOEXw5cyHHTcdwKJT
 yvDjHplB/75tiVUoQKus3rYzZhcalfz01M5EipRXN/DHtVnU11V1896N6+E3hZXMGOST
 +78xZJ5h3kZYGq8/0vTGUJ4hrFqxDaEuW9ubMmMdo5psI2y9vFt6HZkBg45655OJm+Jg
 W94IDVZXzzcSmamGhuyMfL/dtCwSaZoKpxDx+KHv0Fq1N2yuaSOvZTtpUrjWUL7cwg5s
 ZvIhDqD0p/yQMPKUC9Cncuh+jsF0FbWpD9HLkTE/xGN/7/M/tHeon1OmBFPSgjG9pfah
 19gA==
X-Gm-Message-State: AJIora9WPXHLtqFhmuWespxiC6RiQncXAoIjQck3qZVM5efJJOsounij
 gxNnZKJTMNMJYhD6+CVd8+EObg==
X-Google-Smtp-Source: AGRyM1vz69oCgPgrz6NARE9cqzLU42dXKWKXKDSuJ96q28vjQlINAaquoXcKHaBbXJlOeDinAhi/Nw==
X-Received: by 2002:a05:600c:190c:b0:3a3:4293:3710 with SMTP id
 j12-20020a05600c190c00b003a342933710mr8555026wmq.81.1658691055613; 
 Sun, 24 Jul 2022 12:30:55 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a05600c2ca700b003a3253b706esm10319354wmc.34.2022.07.24.12.30.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 12:30:55 -0700 (PDT)
Message-ID: <d3dd1b44-33a2-0260-fe89-e93fb71a0209@mind.be>
Date: Sun, 24 Jul 2022 21:30:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
References: <20220722060936.566534-1-james.hilliard1@gmail.com>
 <20220724153736.GY2641@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220724153736.GY2641@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LaiJ4acwQWw/1IxBxDI9bnxBoPdwyx+LeNn6ZdqXaDQ=;
 b=Gef9EXZuAITubhBJlszhUw2IEstt0e88uT0j93gFJ3gdylRiwTF6WsjmXaZf14SuZ2
 LlsKTXomCq9LosO3v6sZfPelS+/MXfJZ7j3IsvJiR25DADe47zly4mS3uNNbXWFhWXEW
 yKQdRS6x6u4YfZT09prSscaAdPbJqmDXhoiIotcf7vTpFexAMDywVN9TJgZ9lIKmowt9
 RczPqVvZ+uNCuQ/zCCbJiT43sX0MzZ3OEmGguJD19CQiGOBwtucjsFsXsSNa7nGG0RdJ
 QrQluoJqEvWM4hWFoPiqPu9C6U72g6G2z0BRHzsn8WAmKRLrsdbg9wQtGAMisLTt/IK7
 UVqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Gef9EXZu
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
 Norbert Lange <nolange79@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/07/2022 17:37, Yann E. MORIN wrote:
> James, All,
> 
> On 2022-07-22 00:09 -0600, James Hilliard spake thusly:
>> As of version 0.54.0 meson has had the ability to build and install
>> packages rather than having to run ninja directly as before.
>>
>> This will allow us to use features such as meson install tags in
>> the future which require meson to be used for the installation.
>>
>> It appears we need to ensure the cmake prefix path is set for the
>> meson generated relocatable pkg-config format to work properly.
>>
>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>> ---
> [--SNIP--]
>> diff --git a/docs/manual/adding-packages-meson.txt b/docs/manual/adding-packages-meson.txt
>> index 029c8c2488..c8aed65c2f 100644
>> --- a/docs/manual/adding-packages-meson.txt
>> +++ b/docs/manual/adding-packages-meson.txt
>> @@ -125,8 +125,8 @@ will therefore only use a few of them.
>>     +c_link_args+, +cpp_args+, +cpp_link_args+, +sys_root+, and
>>     +pkg_config_libdir+.
>>   
>> -* +FOO_NINJA_ENV+, to specify additional environment variables to pass to
>> -  +ninja+, meson companion tool in charge of the build operations. By default,
>> +* +FOO_MESON_ENV+, to specify additional environment variables to pass to
>> +  +meson+, meson tool in charge of the build/install operations. By default,
>>     empty.
> 
> IIRC, the topic of what to do about external packages that set their
> FOO_NINJA_ENV, was raised in a previous iteration.
> 
> I understand that the conclusion was basically "the probability is low,
> we don't handle it". This should have been noted in the commit log.
> 
>>   * +FOO_NINJA_OPTS+, to specify a space-separated list of targets to build. By
> 
> Now that we use meson to build and instal, does it still make sense to
> have FOO_NINJA_OPTS to be the list of targets to install?
> 
> I mean, isn't there a way to tell meson what to install, instead?

  FOO_NINJA_OPTS could theoretically be used to control other things about 
ninja, e.g. warnings and debugging. Though I don't really see why you'd ever 
want to do that in a buildroot package.

> 
> [--SNIP--]
>> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
>> index 3b1db35fb6..4fa620080d 100644
>> --- a/package/pkg-cmake.mk
>> +++ b/package/pkg-cmake.mk
>> @@ -90,6 +90,8 @@ define $(2)_CONFIGURE_CMDS
>>   	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
>>   		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
>>   		-DCMAKE_INSTALL_PREFIX="/usr" \
>> +		-DCMAKE_PREFIX_PATH="$$(STAGING_DIR)/usr" \

  Wouldn't it be better to put this in the toolchainfile?

>> +		-DPKG_CONFIG_USE_CMAKE_PREFIX_PATH=ON \

  This one as well, I guess.

> 
> But doesn't that needs to be in a separate patch? I mean, does it not
> make sense opn its own?

  +1.

  The commit message of that patch could also explain better what it does exactly.

> 
> [--SNIP--]
>> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
>> index 0835e08e3a..de5817d5da 100644
>> --- a/package/pkg-meson.mk
>> +++ b/package/pkg-meson.mk
> [--SNIP--]
>> @@ -138,6 +138,7 @@ define $(2)_CONFIGURE_CMDS
>>   	$$(MESON) \
>>   		--prefix=/usr \
>>   		--libdir=lib \
>> +		--pkgconfig.relocatable \
> 
> Please explain what that means and why this is needed in the context of
> a target package.

  And also it should probably be a separate patch - pkgconfig stuff should be 
done at configure time, not at build time, so using meson to start the build 
shouldn't really be related to it.

> 
>>   		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
>>   		--buildtype=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) \
>>   		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
>> @@ -156,10 +157,11 @@ define $(2)_CONFIGURE_CMDS
>>   	mkdir -p $$($$(PKG)_SRCDIR)/build
>>   	$$(HOST_CONFIGURE_OPTS) \
>>   	$$($$(PKG)_CONF_ENV) $$(MESON) \
>> -		--prefix=$$(HOST_DIR) \
>> +		--prefix=/ \
> 
> It is very weird that host packages are configured with / as prefix, and
> then installed in HOST_DIR set as DEST_DIR.

  It's not weird, it's wrong! There is no reasonable explanation how this can be 
correct. We are really installing stuff in that specific location, any paths 
should refer to that location and not a path beginning with /.

  If for some reason meson doesn't work when the prefix is not / or /usr or 
/usr/local, it's a bug in meson, really.

  Regards,
  Arnout

> 
> I guess this is working thanks to --pkgconfig.relocatable a few lines
> below?
> 
> This must be explained in the commit log (and probably a little comment
> above $(2)_CONFIGURE_CMDS for host packages.
> 
>>   		--libdir=lib \
>> -		--sysconfdir=$$(HOST_DIR)/etc \
>> -		--localstatedir=$$(HOST_DIR)/var \
>> +		--pkgconfig.relocatable \
>> +		--sysconfdir=etc \
>> +		--localstatedir=var \

  These two could be correct, however, since I think they're taken relative to 
prefix (the default values are absolute because the default prefix is /usr and 
sysconfdir is /etc, not /usr/etc - but in our case a relative path is fine).

  Regards,
  Arnout

> 
> Ditto for etc and var?
> 
> So, to make it easier to follow, I'd change the ordering:
> 
>      --pkgconfig.relocatable \
>      --prefix=/ \
>      --sysconfdir=etc \
>      --localstatedir=var \
> 
> Regards,
> Yann E. MORIN.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
