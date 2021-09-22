Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F0F5C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 19:27:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06FEC60EE0
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 19:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 06FEC60EE0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0B8B83FFC;
	Wed, 22 Sep 2021 19:27:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tYOJG5SdDizT; Wed, 22 Sep 2021 19:26:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 000A283FDD;
	Wed, 22 Sep 2021 19:26:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F1871BF321
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 19:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C32483FDD
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 19:26:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uXqucjB4bDgg for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 19:26:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13DED83F6E
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 19:26:57 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id dj4so14234488edb.5
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 12:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YmkIcQnHJjmRh4vYGiavj12M2oJMWEk+hYIPveiQ4HY=;
 b=YVGwFTkgiWNRx0UaIbGpbRvsn7ODcKkveYPUCeeFRhL5Z1mVH4oYr9SBqp4G1TVQ1/
 vWTPV7mDifCUE/j8RBldxcHqdaSeDujPYMlkLkfuT0Z8HxGm/WMA/2D7kbI+9mjcZrLu
 5x3ysI9EIfA2xJKd4i6kIbIWY3gxYW3wXRMhl4o1kaTDyilExT3leTH24bVks8oQz7Y9
 k7w5wbt/Rj2LxI3HJ2ElwInJZrCLajlNGd1CvTSJJhTH7oAlINnmsC6CQ21uo1M/xbmw
 Zp2ZjefjpR4aYrh5OAE+FO2ntPastPj+rJd3iPKpzwuk+l0z9aRz7I/h0fdhlvPTuajN
 rfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YmkIcQnHJjmRh4vYGiavj12M2oJMWEk+hYIPveiQ4HY=;
 b=IM5u6aUy8dwrz4Bl9sCzrNr/lmI9Pdl6cg8yF5EJoD4UkUjtg58FZsIhPipn+BuPIS
 QKriF17ozk+C+6pLIrVz0FxjIUa6PFZ/KA4xQhRDs5pB/9/lndlYS1VHtydG8erudiwQ
 Mp4XvOpNqiPfAhQJJj/3H5tc4neU74aQa8tZakaLC9+nWxGvNXSjDXBwiVLPN0lZ7zkm
 xQExTUx8kxwvBFLkiF5kV74M2npy/BaMf3jalulUMQQ1wMBM+Zc8ZwDaWxrvD2gprNAe
 VoUiFCxGOlLePj+8Jk+na5chE09QNjGXZjyDGQO7rnVEZ6S0yA4se7DnTuvOeH1tI5rM
 KgCg==
X-Gm-Message-State: AOAM531V13b1KuDemxnsgaW+EGA/r+hTf+F0ntUnEgtCXq2gVgCehBJe
 LUkP7yix8Hxtf2f1KZHv5e2QAikxTEhjzw==
X-Google-Smtp-Source: ABdhPJyzA5sf2ahHIZsV3MO1QoIY3oLl6trm3d++BK3s72lfqwlXXuUK6tSZoYbTUypSlqDEOOk1dA==
X-Received: by 2002:a17:906:ece4:: with SMTP id
 qt4mr999512ejb.250.1632338815100; 
 Wed, 22 Sep 2021 12:26:55 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id s18sm1457116ejc.52.2021.09.22.12.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 12:26:54 -0700 (PDT)
Message-ID: <f9d48aff-646c-00b7-465e-c6049b4e3fd9@mind.be>
Date: Wed, 22 Sep 2021 21:26:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20210920220235.3119-1-peter@korsgaard.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210920220235.3119-1-peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH] package/xen: security bump to version 4.14.3
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Alistair Francis <alistair@alistair23.me>,
 Matt Weber <matthew.weber@collins.com>, Jan Beulich <jbeulich@suse.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 21/09/2021 00:02, Peter Korsgaard wrote:
> Includes a number of bugfixes and the security fixes up to xsa-384:
> https://xenproject.org/downloads/xen-project-archives/xen-project-4-14-series/xen-project-4-14-3/
> 
> Drop the now upstream
> 0002-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-prototype.patch, and
> renumber the remaining patches.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ... 0002-Fix-build-with-64-bits-time_t.patch} |  0
>   ...osdep_xenforeignmemory_map-prototype.patch | 33 -------------------
>   ...libs-light-fix-tv_sec-printf-format.patch} |  0
>   ...ibs-light-fix-tv_sec-fprintf-format.patch} |  0
>   package/xen/xen.hash                          |  2 +-
>   package/xen/xen.mk                            |  2 +-
>   6 files changed, 2 insertions(+), 35 deletions(-)
>   rename package/xen/{0003-Fix-build-with-64-bits-time_t.patch => 0002-Fix-build-with-64-bits-time_t.patch} (100%)
>   delete mode 100644 package/xen/0002-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-prototype.patch
>   rename package/xen/{0004-libs-light-fix-tv_sec-printf-format.patch => 0003-libs-light-fix-tv_sec-printf-format.patch} (100%)
>   rename package/xen/{0005-libs-light-fix-tv_sec-fprintf-format.patch => 0004-libs-light-fix-tv_sec-fprintf-format.patch} (100%)
> 
> diff --git a/package/xen/0003-Fix-build-with-64-bits-time_t.patch b/package/xen/0002-Fix-build-with-64-bits-time_t.patch
> similarity index 100%
> rename from package/xen/0003-Fix-build-with-64-bits-time_t.patch
> rename to package/xen/0002-Fix-build-with-64-bits-time_t.patch
> diff --git a/package/xen/0002-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-prototype.patch b/package/xen/0002-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-prototype.patch
> deleted file mode 100644
> index 170d1c22c2..0000000000
> --- a/package/xen/0002-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-prototype.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 5d3e4ebb5c71477d74a0c503438545a0126d3863 Mon Sep 17 00:00:00 2001
> -From: Anthony PERARD <anthony.perard@citrix.com>
> -Date: Tue, 1 Jun 2021 16:41:47 +0100
> -Subject: [PATCH] libs/foreignmemory: Fix osdep_xenforeignmemory_map prototype
> -
> -Commit cf8c4d3d13b8 made some preparation to have one day
> -variable-length-array argument, but didn't declare the array in the
> -function prototype the same way as in the function definition. And now
> -GCC 11 complains about it.
> -
> -Fixes: cf8c4d3d13b8 ("tools/libs/foreignmemory: pull array length argument to map forward")
> -Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> -Reviewed-by: Jan Beulich <jbeulich@suse.com>
> -[Retrieved from:
> -https://github.com/xen-project/xen/commit/5d3e4ebb5c71477d74a0c503438545a0126d3863]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - tools/libs/foreignmemory/private.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/tools/libs/foreignmemory/private.h b/tools/libs/foreignmemory/private.h
> -index 1ee3626dd278..5bb0cefb0987 100644
> ---- a/tools/libs/foreignmemory/private.h
> -+++ b/tools/libs/foreignmemory/private.h
> -@@ -32,7 +32,7 @@ int osdep_xenforeignmemory_close(xenforeignmemory_handle *fmem);
> - void *osdep_xenforeignmemory_map(xenforeignmemory_handle *fmem,
> -                                  uint32_t dom, void *addr,
> -                                  int prot, int flags, size_t num,
> --                                 const xen_pfn_t arr[num], int err[num]);
> -+                                 const xen_pfn_t arr[/*num*/], int err[/*num*/]);
> - int osdep_xenforeignmemory_unmap(xenforeignmemory_handle *fmem,
> -                                  void *addr, size_t num);
> -
> diff --git a/package/xen/0004-libs-light-fix-tv_sec-printf-format.patch b/package/xen/0003-libs-light-fix-tv_sec-printf-format.patch
> similarity index 100%
> rename from package/xen/0004-libs-light-fix-tv_sec-printf-format.patch
> rename to package/xen/0003-libs-light-fix-tv_sec-printf-format.patch
> diff --git a/package/xen/0005-libs-light-fix-tv_sec-fprintf-format.patch b/package/xen/0004-libs-light-fix-tv_sec-fprintf-format.patch
> similarity index 100%
> rename from package/xen/0005-libs-light-fix-tv_sec-fprintf-format.patch
> rename to package/xen/0004-libs-light-fix-tv_sec-fprintf-format.patch
> diff --git a/package/xen/xen.hash b/package/xen/xen.hash
> index fd0310c921..e30db09516 100644
> --- a/package/xen/xen.hash
> +++ b/package/xen/xen.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  e35099a963070e3c9f425d1e36cbb1c40b7874ef449bfafd6688343783cb25ad  xen-4.14.2.tar.gz
> +sha256  a3dad76a772393a1875e8f44a6059a95fea4bde40f97b800966969ac6f3a498d  xen-4.14.3.tar.gz
>   sha256  ecca9538e9d3f7e3c2bff827502f4495e2ef9e22c451298696ea08886b176c2c  COPYING
> diff --git a/package/xen/xen.mk b/package/xen/xen.mk
> index b84214ed16..b635996afb 100644
> --- a/package/xen/xen.mk
> +++ b/package/xen/xen.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -XEN_VERSION = 4.14.2
> +XEN_VERSION = 4.14.3
>   XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
>   XEN_LICENSE = GPL-2.0
>   XEN_LICENSE_FILES = COPYING
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
