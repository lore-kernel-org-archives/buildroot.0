Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69096C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 10:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D302F418E8;
	Mon, 25 Jul 2022 10:11:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D302F418E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fRgUwSUI74Up; Mon, 25 Jul 2022 10:11:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31CDF416F3;
	Mon, 25 Jul 2022 10:11:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31CDF416F3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 117C81BF371
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 10:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD6E284B81
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 10:11:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD6E284B81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FZa_gYPhjcqL for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 10:11:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD72A847C1
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD72A847C1
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 10:11:11 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 f24-20020a1cc918000000b003a30178c022so9043782wmb.3
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 03:11:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bts7rek9WrkJahLIz+LmVlQuQGvBBD866bGTX9dcE+g=;
 b=dggB1i3u/mc+t/S4dFwF1fE5mMJH9wWDgEX91y3JEDYYMUEnO6Ro6upL6RH8z+l2Kk
 A/Fa3XTIxOv3LeVjC3KDw+Gh/wXMdmVeH4WLWMBGcnPMfJSZ8EJgdnEHfUJTp2/AJp9e
 4YaVikXIt0FB2rmyxqV7Z8bmqbpalkrMFfHjjqV3QSpjqVb/2KNTmX39jzy4F3AMOlhV
 HgPJfSdCqdTHQZFxEVtlCeqQQ58eRxoFU2begAF/+TFPhCcMNm5Q5BLsFlYeTFGFjP2z
 d/HCMnBwLYUFj0o3/woBqvCCt73/Pxh/Afw7e5jFae3WmydBtVaiq5ej0K+SABcmO8nB
 9iEw==
X-Gm-Message-State: AJIora9PpNY+we6gcMx+sNaaNf/LK8vkodgcHP6K5FCL0Y/9BUyTm84b
 mktsWlg2zl2e+yfj30jf6huTJAGH7QsWgg==
X-Google-Smtp-Source: AGRyM1u4aUT0nyhFeEAErXcX/h0RgMMcYbrzXxmgetZzpDjKenXCE/f2KW+5Oowz2keHTL4qYS2UWg==
X-Received: by 2002:a1c:7401:0:b0:3a3:182f:7be9 with SMTP id
 p1-20020a1c7401000000b003a3182f7be9mr20223309wmc.189.1658743870005; 
 Mon, 25 Jul 2022 03:11:10 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a5d68c7000000b0021e084d9133sm14088237wrw.27.2022.07.25.03.11.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 03:11:09 -0700 (PDT)
Message-ID: <c864e12c-fd3e-1d08-f379-96af711d619e@mind.be>
Date: Mon, 25 Jul 2022 12:11:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220607172526.910675-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220607172526.910675-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bts7rek9WrkJahLIz+LmVlQuQGvBBD866bGTX9dcE+g=;
 b=YuB2jiBUrQZ+/g+9J9NJSjYMA/uan6OJgpwyCwyyskaNW5ydhFyrWKEklch800Y8PX
 LFkdPR1BIKARIjcYNCCwQltUeMWWg/r6ly0WIvGhWxPqcFgGitzL0Z95hKdB/0LXOYd0
 aV8EC4gJHf89DlMw+gmi/dkiJN5iTh0rW89dLAgTnO5s3Hd4GcEp6oQgL7rd5yU2pJ3C
 x+pTF55dyUS+l316Kig07rfJW9xesNbSo3AkDCq0cjiiQKPtb96dZasZ9PwtOMiclZUA
 GLBJXQuTifTu0Eslxjx0HTIr3D/La3cB6Deu/hklQHmIkiNSuCPULBRrpbXait9HmcVq
 ISOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YuB2jiBU
Subject: Re: [Buildroot] [PATCH 1/1] package/dieharder: pass _GNU_SOURCE in
 CFLAGS
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
Cc: Julien Viard de Galbert <julien@vdg.name>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/06/2022 19:25, Fabrice Fontaine wrote:
> Drop third patch and pass _GNU_SOURCE in CFLAGS to avoid the following
> build failure:
> 
> In file included from /nvmedata/autobuild/instance-18/output-1/host/microblazeel-buildroot-linux-gnu/sysroot/usr/include/bits/stat.h:25,
>                   from /nvmedata/autobuild/instance-18/output-1/host/microblazeel-buildroot-linux-gnu/sysroot/usr/include/sys/stat.h:101,
>                   from ../include/dieharder/libdieharder.h:23,
>                   from bits.c:7:
> /nvmedata/autobuild/instance-18/output-1/host/microblazeel-buildroot-linux-gnu/sysroot/usr/include/bits/struct_stat.h:99:33: error: field 'st_atim' has incomplete type
>     99 |         struct timespec         st_atim;      /* Time of last access.  */
>        |                                 ^~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/4609c8e2af24d9536eb33397a4659ad740aca742
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Superseded by [1].

  Regards,
  Arnout

[1] 
https://patchwork.ozlabs.org/project/buildroot/patch/20220725100745.2878896-1-arnout@mind.be/


> ---
>   ...RCE-for-uint-and-M_PI-with-musl-libc.patch | 28 -------------------
>   ...0003-Add-static-to-inline-functions.patch} |  0
>   ...ch => 0004-Remove-defunct-rgb_operm.patch} |  0
>   package/dieharder/dieharder.mk                |  6 +++-
>   4 files changed, 5 insertions(+), 29 deletions(-)
>   delete mode 100644 package/dieharder/0003-Add-_GNU_SOURCE-for-uint-and-M_PI-with-musl-libc.patch
>   rename package/dieharder/{0004-Add-static-to-inline-functions.patch => 0003-Add-static-to-inline-functions.patch} (100%)
>   rename package/dieharder/{0005-Remove-defunct-rgb_operm.patch => 0004-Remove-defunct-rgb_operm.patch} (100%)
> 
> diff --git a/package/dieharder/0003-Add-_GNU_SOURCE-for-uint-and-M_PI-with-musl-libc.patch b/package/dieharder/0003-Add-_GNU_SOURCE-for-uint-and-M_PI-with-musl-libc.patch
> deleted file mode 100644
> index d71cd57445..0000000000
> --- a/package/dieharder/0003-Add-_GNU_SOURCE-for-uint-and-M_PI-with-musl-libc.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 526510a27ef47a16699dd34a2373ad9b6bb5e8f3 Mon Sep 17 00:00:00 2001
> -From: Julien Viard de Galbert <julien@vdg.name>
> -Date: Sat, 14 Jan 2017 14:19:47 +0100
> -Subject: [PATCH] Add _GNU_SOURCE for uint and M_PI with musl libc
> -
> -When building with musl libc _GNU_SOURCE need to be defined
> -to provide uint type and M_PI macro
> -
> -Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
> ----
> - include/dieharder/libdieharder.h | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/include/dieharder/libdieharder.h b/include/dieharder/libdieharder.h
> -index d98b758..c1a5023 100644
> ---- a/include/dieharder/libdieharder.h
> -+++ b/include/dieharder/libdieharder.h
> -@@ -17,6 +17,7 @@
> -
> - /* This turns on uint macro in c99 */
> - #define __USE_MISC 1
> -+#define _GNU_SOURCE 1
> - #include <stdint.h>
> - #include <sys/types.h>
> - #include <sys/stat.h>
> ---
> -2.1.4
> -
> diff --git a/package/dieharder/0004-Add-static-to-inline-functions.patch b/package/dieharder/0003-Add-static-to-inline-functions.patch
> similarity index 100%
> rename from package/dieharder/0004-Add-static-to-inline-functions.patch
> rename to package/dieharder/0003-Add-static-to-inline-functions.patch
> diff --git a/package/dieharder/0005-Remove-defunct-rgb_operm.patch b/package/dieharder/0004-Remove-defunct-rgb_operm.patch
> similarity index 100%
> rename from package/dieharder/0005-Remove-defunct-rgb_operm.patch
> rename to package/dieharder/0004-Remove-defunct-rgb_operm.patch
> diff --git a/package/dieharder/dieharder.mk b/package/dieharder/dieharder.mk
> index cbf28922fd..e15bac6bbe 100644
> --- a/package/dieharder/dieharder.mk
> +++ b/package/dieharder/dieharder.mk
> @@ -36,9 +36,13 @@ endif
>   # parallel build fail, disable it
>   DIEHARDER_MAKE = $(MAKE1)
>   
> +DIEHARDER_CFLAGS = $(TARGET_CFLAGS) -D_GNU_SOURCE
> +
>   # Too many fixes needed to build with -fno-common which is default since gcc 10
>   ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_10),y)
> -DIEHARDER_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -fcommon"
> +DIEHARDER_CFLAGS += -fcommon
>   endif
>   
> +DIEHARDER_CONF_ENV += CFLAGS="$(DIEHARDER_CFLAGS)"
> +
>   $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
