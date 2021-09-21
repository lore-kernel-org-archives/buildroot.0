Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F04C433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:25:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D451660FDA
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D451660FDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 740A381846;
	Tue, 21 Sep 2021 19:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id usS6dFrT37fr; Tue, 21 Sep 2021 19:25:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB05381020;
	Tue, 21 Sep 2021 19:25:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2FD111BF578
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D5F2403F9
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:25:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vVqqjRDikrvj for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 19:25:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56133400CF
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 19:25:46 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id g8so497989edt.7
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 12:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=t0L7iryphDceFsJ7KOPgzCBHTByKPWtylgG3NgOSOzo=;
 b=cUPXsIN23BpUymRWlz7t8ZTolon82/jhpfZXreBT8ntse/5XkGU/+G+l9ri2A44F+e
 mKhI6m9PDRjwyndT/9Llp/7oOfO1ifC9o0IIDXh2KRIsdg8bDjCVEQFG9Uyxpgmr+KrQ
 bsbbVDcDtJppMs29C0NRpf7mz7hf1LEbUtp19Xf0UYqwqfSC9LgamtZ/D32ibLRh7dSq
 WKaoTRyRzp6xMwuzjzvdfYoBwqxg3rAUbzupIObuRN2SvNm42LmZ9HuwVJ5PMaqgdyvz
 ghBUveRGqEt0EqCxivB7TWT5lYW7hijkNeNnaQQn/gxSQyo3vwe6S9o65X8+/QNxkeQg
 7f/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=t0L7iryphDceFsJ7KOPgzCBHTByKPWtylgG3NgOSOzo=;
 b=3SdqvIr0cnuFvN+U+CRD1mw52OymmRbOQQ9v1dvz7Wev4M98l41q9f2SSZ3Gou66Md
 s7arau2zi7OCAxMBewP0DGpcC7j7o+2gsSWaNbytIaXUWUGun/zxnqmJJ1Nu7A0vQbf9
 yMsn9QzFM8mqNSpArergfjf27quc2G+GGsd+Wxe4XQyhrpZnt65PF9Sm5bW/+GyW8mDb
 Ah73FGlmwyO0vEkWNAzJ5RATUSv1Z0JgTeisnwohOseAB6jZfyEW4q1qlDcm/aI4pVP2
 44RdW3erOJzTNca23sEJc84yGbjk6GVo+B1MxTRhXh/bzMdECp4UfN7ZXd63x/Co7UnT
 Fm2A==
X-Gm-Message-State: AOAM531w8KSwBXCnXj40JjztdyLHwfyidBiAc7gRSrV/A/al/3fqSREa
 2BRmkPgsYfcnRXA6/X8GL31N7mmK2ICzAw==
X-Google-Smtp-Source: ABdhPJwOZReeuEAJEY3zPnsNdMtBtKK1oq4sZUtkQ7uH3jyMux5Ax2Nf4tdlPPDXepogakqhye7Tsw==
X-Received: by 2002:a17:906:f24f:: with SMTP id
 gy15mr35719120ejb.226.1632252344565; 
 Tue, 21 Sep 2021 12:25:44 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id m14sm7943923ejl.74.2021.09.21.12.25.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 12:25:44 -0700 (PDT)
Message-ID: <855b7e76-8f19-6bc9-d801-9578df4a13c7@mind.be>
Date: Tue, 21 Sep 2021 21:25:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
References: <20210912092855.2427158-1-aperez@igalia.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210912092855.2427158-1-aperez@igalia.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/cog: bump to version 0.10.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 12/09/2021 11:28, Adrian Perez de Castro wrote:
> Update to version 0.10.1, which fixes the build when the DRM platform
> module is enabled, fixes handling of absolute pointer events, and makes
> the headless platform optional. Note that while optional, Buildroot
> keeps it enabled (as previously) because the wpebackend-fdo dependency
> is always needed anyway because Buildroot does not include any other
> WPE backend.

  I split this in two paragraphs to make the "Note" part stand out more.

  Applied to master, thanks.

  Regards,
  Arnout

> 
> Release notes:
> 
>    https://wpewebkit.org/release/cog-0.10.1.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>   package/cog/cog.hash | 8 ++++----
>   package/cog/cog.mk   | 3 ++-
>   2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/package/cog/cog.hash b/package/cog/cog.hash
> index 566d30fa2a..3abc5f2c83 100644
> --- a/package/cog/cog.hash
> +++ b/package/cog/cog.hash
> @@ -1,7 +1,7 @@
> -# From https://wpewebkit.org/releases/cog-0.10.0.tar.xz.sums
> -md5  1b0407b6163a3a01afdfc0fb454a7570  cog-0.10.0.tar.xz
> -sha1  911816c00a2b08f4cfd388b1d2e176835c9b4e9e  cog-0.10.0.tar.xz
> -sha256  2c72369c636ca4684370adad1344071b23c9ee2c851eb7d738fa2e1d7092031f  cog-0.10.0.tar.xz
> +# From https://wpewebkit.org/releases/cog-0.10.1.tar.xz.sums
> +md5  b997da3c143bc34ec5e953eb7e7ccefc  cog-0.10.1.tar.xz
> +sha1  f25312141de918f41add3e3c9984faa985cda0a9  cog-0.10.1.tar.xz
> +sha256  aecf546d7b0645119d79559c5574cb5eb68364fc8409dfbd47a4920bd1f221bc  cog-0.10.1.tar.xz
>   
>   # Hashes for license files:
>   sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
> diff --git a/package/cog/cog.mk b/package/cog/cog.mk
> index d373e6e1b6..07b8e245ef 100644
> --- a/package/cog/cog.mk
> +++ b/package/cog/cog.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -COG_VERSION = 0.10.0
> +COG_VERSION = 0.10.1
>   COG_SITE = https://wpewebkit.org/releases
>   COG_SOURCE = cog-$(COG_VERSION).tar.xz
>   COG_INSTALL_STAGING = YES
> @@ -13,6 +13,7 @@ COG_LICENSE = MIT
>   COG_LICENSE_FILES = COPYING
>   COG_CONF_OPTS = \
>   	-DCOG_BUILD_PROGRAMS=ON \
> +	-DCOG_PLATFORM_HEADLESS=ON \
>   	-DCOG_WESTON_DIRECT_DISPLAY=OFF \
>   	-DINSTALL_MAN_PAGES=OFF \
>   	-DCOG_HOME_URI='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))'
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
