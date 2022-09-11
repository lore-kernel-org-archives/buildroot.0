Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485DAECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 11:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B528083EA1;
	Sun, 11 Sep 2022 11:22:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B528083EA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9dDtfvPB2VHX; Sun, 11 Sep 2022 11:22:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D1D283EB2;
	Sun, 11 Sep 2022 11:22:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D1D283EB2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 127D81BF2B5
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 11:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5E066FB09
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 11:22:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5E066FB09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HdPaTH-SCpKl for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 11:22:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D80D6102C
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D80D6102C
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 11:22:41 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id 29so8950997edv.2
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 04:22:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=yX0fH3HG3tj9vKIFeAluiqapBKSsZtv8UK2W6HeAUZI=;
 b=f9ZykgfvdYLp1QvtwY2o+25Gkmg3+AtnhNtkB4oMkACMawx1/ePt4tSxdEujdiLbXr
 hzJIR40a9nItuwkUoyGjr3f2TxembF+x2j3v6ilXb9ncw40wXNcWQeDP6Rre59Ny4dBG
 Vwn+GMV2Bv+jnDOcPkT2NCde1APQB2kU5X/uqQ0tGaptx7VMT/A7YQx3Bzmzi4t3iaNk
 E6Q3NlAxon8KQVjC0zwQt+ZLAMKvvjWrantuMpJBWQgymPlaxy1RKcy+TxyJYgoV/mv2
 vEu+mVtIdeeqzlwluIeUQQAeN0C4wVBdEkavoiF5l3lRx5z7iOa4Zzt95s53JMpdetFg
 YvXA==
X-Gm-Message-State: ACgBeo0A5PFvZsgr6JlLPdKx4lWsjmI/wFbUYFpaQvHPasmqVcSrc/sQ
 lbWviOBJ67yXJAUSST9n8aAE4YRIl3tNhsB1
X-Google-Smtp-Source: AA6agR7gUTHfDb4pXzoDxmEFBq3b5OMRTuG38Eofb1lzN+3ayQCC4+kVqFLZJr9f+QGHbgQe51L9iA==
X-Received: by 2002:a05:6402:428c:b0:440:8259:7a2b with SMTP id
 g12-20020a056402428c00b0044082597a2bmr18195891edc.329.1662895359141; 
 Sun, 11 Sep 2022 04:22:39 -0700 (PDT)
Received: from ?IPV6:2a02:8070:4182:37a0:97b2:fd91:46b3:8d3a?
 ([2a02:8070:4182:37a0:97b2:fd91:46b3:8d3a])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a170906415500b0073d7ab84375sm2864581ejk.92.2022.09.11.04.22.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Sep 2022 04:22:38 -0700 (PDT)
Message-ID: <75e277ba-99aa-78f3-a60d-5e8cf2c1b9a8@gmail.com>
Date: Sun, 11 Sep 2022 13:22:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220904124315.12728-1-raphael.pavlidis@gmail.com>
 <20220905115121.GC1490660@scaer>
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <20220905115121.GC1490660@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=yX0fH3HG3tj9vKIFeAluiqapBKSsZtv8UK2W6HeAUZI=;
 b=ammuJTrDbPWt6DMB6c3GqaoJ7PKbM4lZUcak6ZJc7+/IZmjyHlEi3FQ5c9CJZsEO/8
 qIJzPkYsjvHaqoc1dOXgiET4/5iE+V4t1toOECEGLkz//XVf6XWD54Xa446yP+p1/Aoq
 cD2vBVICWeUzOtuqzBfIsm7UvqKpYVB1gFt8MUwgV/HmrOvGhIJ0kTEI2P5EW46Errnw
 bCV/MX6kN33aGhqrAlzOQ/8sbgJh6MeHAcCfGbxxebsi0/YsxzdTAM05cuy6tJrflt2l
 FXOuILgDRVy+Yjit2syeGo8zFR8cCXxWlD/nD3E7oMpWpjY+2G2OC7xAVzTu2p/vFGe3
 oNNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ammuJTrD
Subject: Re: [Buildroot] [PATCH v2 1/1] package/shadow: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann, All,

On 05.09.22 13:51, Yann E. MORIN wrote:
> Raphael, All,
> 
> On 2022-09-04 14:43 +0200, Raphael Pavlidis spake thusly:
>> shadow provides utilities to deal with user accounts.
> 
> You will probably have more explanations to provide in the commit log,
> to explain how the pacakge is integrated in Buildroot. See the qustions
> below...

How about using the description of the GitHub repository? Or is this too 
long? Also, using it as a description in the Config.in?

"The shadow package includes the necessary programs for converting UNIX 
password files to the shadow password format, plus programs for managing 
user and group accounts. The [snip]"

[--SNIP--]>
> As Arnout noted, shadow, or ony some of its utilities, may come
> conflicting with busybox' provided applets.
> 
> So, we also need a dependency in Config.in:
> 
>      depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> 
> Note: *if* only sub-options of shadow do conflict, then the dependency
> should be moved dow to those sub-options.

Can you explain, what exactly this option 
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS does? I did not understand it, I 
apologize for the inconvenience.

[--SNIP--]
> 
> We usually have no option that defaults to 'y', and when we do, there
> is a reason for that, so please explain that in the commit log. This
> comment is also valid for all the symbols below that default to y.

All default values and description of the option were taken from the 
configure.ac file of the repository. The intention behind was, that the 
developers know best which option should be activated on default.

[--SNIP--]>
> When there is a single symbol that is conditional, I think a singluar
> depends on is better:
> 
>> +config BR2_PACKAGE_SHADOW_ACCOUNT_TOOLS_SETUID
>> +	bool "account-tools-setuid"
> 
>      depends on BR2_PACKAGE_LINUX_PAM
> 
> Also, I was wondering if that should instead be a select rather than a
> depends-on. I.e. is account-tools-setuid something that "manages" PAM
> settings, or is it something that uses PAM to amanage accounts? If the
> former, then a depends-on is more appropriate, but if the latter, then a
> select is better.

As far I understood it, it uses PAM to authenticate the callers, so the 
user and group management operation should be executed. So, I will 
change it to a select. Thanks for the suggestion.

[--SNIP--]
>> +	bool "utmpx"
>> +	help
>> +	  Enable loggin in utmpx / wtmpx.
>> +
>> +config BR2_PACKAGE_SHADOW_SUBORDINATE_IDS
>> +	bool "subordinate-ids"
>> +	default y
>> +	help
>> +	  Support subordinate ids.
> 
> An help entry that just repeats the prompt is totally useless. If there
> is nothing better than to repeat the prompt, then don't provide a help
> entry. Otherwise, provide actual help.

The help entry was taken also from the configure.ac file. I will remove 
it. ;)

> 
>> +config BR2_PACKAGE_SHADOW_SHA_CRYPT
>> +	bool "sha-crypt"
>> +	default y
>> +	help
>> +	  Allow the SHA256 and SHA512 password encryption algorithms.
> 
> Note: the is a very good and terse help entry.
> 
>> +config BR2_PACKAGE_SHADOW_BCRYPT
>> +	bool "bcrypt"
>> +	help
>> +	  Allow the bcrypt password encryption algorithm.
> 
> s/bcrypt/blowfish block cipher/ and you get a better help entry.

I will change it. Thanks

[--SNIP--]
>> +
>> +config BR2_PACKAGE_SHADOW_GROUP_NAME_MAX_LENGTH
>> +	int "group-name-max-length"
>> +	default 16
> 
> Does it really make sense to have this be configurable?
> If so, why is 16 the default, rather than unlimited?
> 

Oh, my mistake. The default value in the configure.ac is 32. Is it okay 
to change it to 32 then?

I also think it should be configurable. The developers provide this 
option, so we should also provide this option to the users of buildroot.

> And if we keep it, then the prompt should not have dashes, but be a
> sentence (i.e. it is not the name of program installed by shwadow):
> 
>      bool "max length of group names"
> 

I will change the name.

>> +	help
>> +	  Set max group name length. (0 equals infinity)
>> +
>> +config BR2_PACKAGE_SHADOW_SU
>> +	bool "su"
>> +	default y
> 
> This one will definitely conflict with Busybox' own su.
> 
>> +	help
>> +	  Build and install su program.
> 
> This does not provide much help, so I'd just drop the help entry.

Okay. :)

> 
> [--SNIP--]
>> diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
>> new file mode 100644
>> index 0000000000..140d830cb9
>> --- /dev/null
>> +++ b/package/shadow/shadow.mk
>> @@ -0,0 +1,171 @@
>> +################################################################################
>> +#
>> +# shadow
>> +#
>> +################################################################################
>> +
>> +SHADOW_VERSION = 4.11.1
>> +SHADOW_SITE = https://github.com/shadow-maint/shadow/releases/download/v$(SHADOW_VERSION)
>> +SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
>> +SHADOW_LICENSE = BSD-3-Clause
>> +SHADOW_LICENSE_FILES = COPYING
>> +
>> +SHADOW_CONF_OPTS += \
> 
> This is the first, unconditional assignment; it should be a simple
> assignment, not an append-assignment.
> 
>> +	--disable-man \
>> +	--without-btrfs \
>> +	--without-skey \
>> +	--without-tcb
>> +
>> +ifeq ($(BR2_STATIC_LIBS),y)
>> +SHADOW_CONF_OPTS += --enable-static
>> +else
>> +SHADOW_CONF_OPTS += --disable-static
>> +endif
>> +
>> +ifeq ($(BR2_SHARED_LIBS),y)
>> +SHADOW_CONF_OPTS += --enable-shared
>> +else
>> +SHADOW_CONF_OPTS += --disable-shared
>> +endif
> 
> So, first, both options are already passed appropriately by the
> autotools package infrastructure, so why do you need to pass them?
> 
> Second, --{en,disable}-{static,shared} is supposed to drive the build
> of static or shared libraries, not the fact that anything is shared or
> statically linked.

Oh, I did not know that. I am relative new here, sorry. I will drop it.

[--SNIP--]
> 
> Use a define here (also, the other two conditional permissions end with
> _PERMISSIONS, so do it here to):
> 
>      define SHADOW_ACCOUNT_TOOLS_SETUID_PERMISSIONS
>      	/usr/sbin/chgpasswd f 4755 0 0 - - - - -
>      	/usr/sbin/chpasswd f 4755 0 0 - - - - -
>      	/usr/sbin/groupadd f 4755 0 0 - - - - -
>      	/usr/sbin/groupdel f 4755 0 0 - - - - -
>      	/usr/sbin/groupmod f 4755 0 0 - - - - -
>      	/usr/sbin/newusers f 4755 0 0 - - - - -
>      	/usr/sbin/useradd f 4755 0 0 - - - - -
>      	/usr/sbin/usermod f 4755 0 0 - - - - -
>      endef
> 
> Note: ditto for SHADOW_SUBORDINATE_IDS_PERMISSIONS: use a define rather
> than a multi-line (and I suspect a multi-line does not actually work...)
> 

I will change it. :)

[--SNIP--]
>> +ifeq ($(BR2_PACKAGE_ACL),y)
>> +SHADOW_CONF_OPTS += --with-acl
>> +SHADOW_DEPENDENCIES += acl
> 
> Pet peeve of mine: I prefer that dependencies be listed before config
> options. Indeed, semantically, we need the dependency to be fulfilled
> before we can use it; it also more closely match the unconditional
> dependencies and config options.

I like the other way, but if this is required then I will change it. :)

> 
>> +else
>> +SHADOW_CONF_OPTS += --without-acl
>> +endif
> [--SNIP--]
>> +ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
>> +SHADOW_CONF_OPTS += --with-libpam
>> +SHADOW_DEPENDENCIES += linux-pam
>> +else
>> +SHADOW_CONF_OPTS += --without-libpam
>> +endif
> 
> Is the dependency on linux-pam only needed for account-tools-setuid, or
> can shadow also use linux-pam for something else?

As far as I understood it, shadow also use linux-pam generally, but is 
required if account-tools-setuid is set.


[--SNIP--]
> 
> This is supposed to also be already handled by the autotools-package
> infrastructure, see:
>      package/pkg-autotools.mk@201
>      package/Makefile.in@392
> 
> So, why is it needed to explicitly handle them here?

Oh, I did not know that. I will drop it.

[--SNIP--]

Thanks,
Raphael Pavlidis
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
