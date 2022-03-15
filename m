Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CA5C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64F6184199;
	Tue, 15 Mar 2022 21:43:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gPJwz1UJuSuF; Tue, 15 Mar 2022 21:43:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BBDE84128;
	Tue, 15 Mar 2022 21:43:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6824A1BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6521040221
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:43:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4649JfCt6Zqh for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:43:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C31D401FE
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:43:03 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id b15so507727edn.4
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 14:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sr+YUVKOAJurCfTdg+YulhicbVOYO9r6Hqn0CsDquk8=;
 b=Gj3Z5ilzwAHNSKW07yb2AtOwyqNT0xRGlOPh9K5MiTJSxGgARDfycNHzL2DP8MLhrt
 pjGgU1QoEqPnzcUCsMIDo61/+y9eAlkDDIrpjeO/hWOi9M+T/e4q6Ge+Zc3c84087QuV
 w+qQ1/qZE97LJBlsjvo8Hm9fQa6ufthBpKw77vCXMYDO3gi5qdyj/kYwXvS/7elrCq9M
 C/Yz+ICevk7FDcrTvtujaI/CH2KgHK8+SA/UrTxYaHKnSaFhK3tJ7AN5e0hY/AjyU/cx
 qcUg/QCQvF0x3m/spWJpnJInhGuFolKambP5aiYz2Sanv69nzZ78daljBJqyvoX8GdS/
 a+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sr+YUVKOAJurCfTdg+YulhicbVOYO9r6Hqn0CsDquk8=;
 b=DvOatNke4wt3drsjZnIVMlcij6YrBHvr8zqBmO4nlTXSBPx5KhirjJcqiS8M4/qQ6v
 fDUFV9C48ltjEqaHtBQ0eCYDdzATotFE5liKp5u+t60vyBTQBq0Alk/p1dVqZKuzPk0a
 Z/F2zxArehsJiIkp3VUUCIhvRht5JZOI+anl/rbM5qG7O5ehyi7AdF9dz2HMmmvuq9qh
 zo0wcpeKScvGSuYjxBVg2BgzHRmQ88FY0U0Qa4oQPFuBWmejHXusYOR7yXo2rDrEyLin
 5j7hR77KD91/Nr2xSNM7zujiI906Gh/3GVwCVRsJnE89DakC0JXEqDdUr4ql6GwG701Q
 kThw==
X-Gm-Message-State: AOAM53331iYnUI71lpuimJhM/SftTkqIHHG+FkNXUiQtzZGKSrvpasVn
 /WwgNyTLDm7Xov3zxh5yT1+M+Q==
X-Google-Smtp-Source: ABdhPJyYqRr4Jh3/e7r0wn+ai7QgiwxUA8rd3nApfyRkTzqbhV2QFuFND1XtRcxYVqg7EIIGm9PWrw==
X-Received: by 2002:a05:6402:3489:b0:416:9121:6936 with SMTP id
 v9-20020a056402348900b0041691216936mr27456269edc.249.1647380582101; 
 Tue, 15 Mar 2022 14:43:02 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a1709063e8100b006ce06ed8aa7sm83398ejj.142.2022.03.15.14.43.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 14:43:01 -0700 (PDT)
Message-ID: <310520fc-337b-37d3-06b7-b2c236c585b7@mind.be>
Date: Tue, 15 Mar 2022 22:43:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220308211205.3682-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220308211205.3682-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/boinc: disable fcgi
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/03/2022 22:12, Fabrice Fontaine wrote:
> libfcgi raises the following build failure with glibc 2.34 and gcc
> 11.2.0:
> 
> In file included from /home/peko/autobuild/instance-1/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/features.h:488,
>                   from /home/peko/autobuild/instance-1/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/bits/libc-header-start.h:33,
>                   from /home/peko/autobuild/instance-1/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/stdio.h:27,
>                   from /home/peko/autobuild/instance-1/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/fcgi_stdio.h:18,
>                   from boinc_fcgi.h:19,
>                   from coproc.cpp:22:
> /home/peko/autobuild/instance-1/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/wchar.h:582:24: error: 'malloc' attribute argument 1 is ambiguous
>    582 |   __attribute_malloc__ __attr_dealloc_fclose;
>        |                        ^~~~~~~~~~~~~~~~~~~~~
> 
> RawTherapee has the same kind of issue:
>   - https://github.com/Beep6581/RawTherapee/issues/6324
>   - https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101747
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/232dae62570ed7927a10864d83dccaf9b6214500
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/boinc/boinc.mk | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
> index 7f78c427ea..0d992f136c 100644
> --- a/package/boinc/boinc.mk
> +++ b/package/boinc/boinc.mk
> @@ -26,6 +26,7 @@ BOINC_CONF_ENV = \
>   BOINC_CONF_OPTS = \
>   	--disable-apps \
>   	--disable-boinczip \
> +	--disable-fcgi \
>   	--disable-manager \
>   	--disable-server \
>   	--enable-client \
> @@ -38,13 +39,6 @@ ifeq ($(BR2_PACKAGE_FREETYPE),y)
>   BOINC_DEPENDENCIES += freetype
>   endif
>   
> -ifeq ($(BR2_PACKAGE_LIBFCGI),y)
> -BOINC_DEPENDENCIES += libfcgi
> -BOINC_CONF_OPTS += --enable-fcgi
> -else
> -BOINC_CONF_OPTS += --disable-fcgi
> -endif
> -
>   BOINC_MAKE_OPTS = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
>   
>   # Remove boinc-client because it is incompatible with buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
