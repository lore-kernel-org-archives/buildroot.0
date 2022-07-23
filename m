Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEEABC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 12:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 625D5418C2;
	Sat, 23 Jul 2022 12:48:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 625D5418C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sZPIFJnNo0yU; Sat, 23 Jul 2022 12:48:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A9A341813;
	Sat, 23 Jul 2022 12:48:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A9A341813
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0D7891BF36E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9B7741813
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:48:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9B7741813
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eowpFQ5ff3VK for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 12:48:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8743E417D1
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8743E417D1
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:48:51 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id h9so9854207wrm.0
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 05:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=S+LtUsSUQ16I2bnMmNrUGbcHY1VpKt8Z00kbUKLsM3E=;
 b=qO5M9DO6H2nA5MPKs7nLNa22JlgE7RcoBLUxiiVyPimoZnvqj4qu2xngGR4x7viKHz
 yKoZ9eguAVj0MXzZqrk42aTZ7NM+6ipT5fh4FJI3T8orlmlNh5imeLlTxkooNKV+ethM
 tyP5Nqa40J2WutAsJLso3e89hmToZImnqiwlvys+SOh4UzMLT78OEU9d21HAw0hJ9ZMG
 fmPsD2d2gNx51mrFrzy868blYMfqH+zNlBqOTelto6ipIOBW4JTYHyNcTHNstIko4zsY
 J5PH+y3zm9F7Uc8bsHpLCi7BZ4d9laEqJz9vRHYGci3MXkLXllwKldqDpwoUawtJ8HIP
 fwvg==
X-Gm-Message-State: AJIora91q5Cdexo+vgHyYUaVCfy26ucB7t8sB1SXIjqEGN6DB3RYCTCH
 SnjHe67k2+yNxr6DRIpAFtzezQ==
X-Google-Smtp-Source: AGRyM1sIGIDsik/oUnfiveCh5cF1TZX7EeJitYP58FvbNDoYv8OAFJYLJ34Y1+PN+t0/pyfx82MKHg==
X-Received: by 2002:a05:6000:18d2:b0:21d:6661:60b5 with SMTP id
 w18-20020a05600018d200b0021d666160b5mr2781193wrq.475.1658580529758; 
 Sat, 23 Jul 2022 05:48:49 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a1c4603000000b003a2d87aea57sm11945628wma.10.2022.07.23.05.48.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 05:48:49 -0700 (PDT)
Message-ID: <dd2ffacb-ca35-33b3-7016-dad7fb27bb21@mind.be>
Date: Sat, 23 Jul 2022 14:48:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220722060504.566262-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220722060504.566262-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=S+LtUsSUQ16I2bnMmNrUGbcHY1VpKt8Z00kbUKLsM3E=;
 b=gsPwz/9+CUTa7U2d1dDDLpeSm2UTxBkV6ev7uUmVtpBeIj+c9JLzY9XS11kC1i9yH8
 dt+st1BH2GGqipadch3DHsKrOw62LgN+zWy4ptkgHjDZ7gPze4oSE9CVFn6j5tT8WWQJ
 B5Xdg+/rRA2KeW3arv8K78WExqvxGLXkF9sMt70Kxc6rrNzWN8AgZMYPlDnUfwiturNW
 SDW+bC6L+anert9uWBo52lmDokf4igzM3NvoFQzGo1+F4wKoVMuinljwpJcOjyAstFkv
 7DmC0SW34KntH/PKY+VhMppk4pptdLJ44F4RSgrY7qeP3586C0osH9tWFF/Vmpe3L5gq
 CTvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gsPwz/9+
Subject: Re: [Buildroot] [PATCH 1/1] package/poppler: set
 g-ir-scanner/g-ir-compiler paths
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/07/2022 08:05, James Hilliard wrote:
> The g-ir-scanner/g-ir-compiler paths don't always get picked up
> properly by cmake.
> 
> Fixes:
> [ 98%] Linking CXX shared library libpoppler-glib.so
> [ 98%] Built target poppler-glib
> [ 98%] Generating Poppler-0.18.gir
> /bin/sh: 1: /home/buildroot/buildroot/output/per-package/poppler/host/aarch64-buildroot-linux-gnu/sysroot/home/buildroot/buildroot/output/per-package/poppler/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig/../../bin/g-ir-scanner: not found
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/poppler/poppler.mk | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
> index 18c044a9f6..b54262e7c4 100644
> --- a/package/poppler/poppler.mk
> +++ b/package/poppler/poppler.mk
> @@ -44,7 +44,10 @@ endif
>   
>   ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
>   POPPLER_DEPENDENCIES += gobject-introspection
> -POPPLER_CONF_OPTS += -DENABLE_GOBJECT_INTROSPECTION=ON
> +POPPLER_CONF_OPTS += \
> +	-DENABLE_GOBJECT_INTROSPECTION=ON \
> +	-DINTROSPECTION_SCANNER=$(STAGING_DIR)/usr/bin/g-ir-scanner \
> +	-DINTROSPECTION_COMPILER=$(STAGING_DIR)/usr/bin/g-ir-compiler

  For meson, we define those in the global cross-compilation.conf file. But I 
guess we can't do that for cmake because there's no standard variable name for them.

  Applied to master, thanks.

  Regards,
  Arnout

>   else
>   POPPLER_CONF_OPTS += -DENABLE_GOBJECT_INTROSPECTION=OFF
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
