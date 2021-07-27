Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F3D8C432BE
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 21:18:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E9FA60FEA
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 21:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E9FA60FEA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BCA3600CC;
	Tue, 27 Jul 2021 21:18:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T93kFaLwqVcA; Tue, 27 Jul 2021 21:18:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 695F2605E1;
	Tue, 27 Jul 2021 21:18:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9CD341BF2B1
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 21:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 967D9605E1
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 21:18:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id esKuKhf9VOsz for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 21:18:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5BAAE600CC
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 21:18:12 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id v21so1040964ejg.1
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 14:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZFmARwAerr3Bb/brR2+DbiHAFAbBAtsKS91d0bx7CN4=;
 b=ck+kPavuvHNlSFcP5LRw7BN2cwLQdSHgftkQf7o5rEe4kOWZbq+/b+/crSOEr0P31G
 ZpngA9gdXHr4CHxjKx3LXUugWYU/CW3xHdVeilQS8eQE4jsxuRGLovGp9tmMwAlmEAQW
 3awasKZM1d7MGhMB0S081LF6R648RHFa/Iq0F3sOM++3DMlL9IyLHZVTAoYGiwy/uFjl
 35w43WCOh3E/wszljrXAkguTsFHK4JgjddbGdGzM4kg5fnALv+IXjmIRCxFUZbxZaLVn
 qxoj8oHxfMtWChBHc5KJYufhYtcr98v1u6e6yh7iiOso5mmIqScImDA3kjdatJ+CETZC
 J9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZFmARwAerr3Bb/brR2+DbiHAFAbBAtsKS91d0bx7CN4=;
 b=cg/DniEiml/Ax36/MyaI5t/bQeMqmY2h8h8XAGeqPmD0TC9f9SHGAxmheAbNZm7LHo
 iaeRfqcBILMHETdjdGd/eeD3tl9PWTCvgf65Y6NW7/btWZtvYvwZTvsLhLlQ2Q2BCT6B
 Y1rGE1Qz640lzz9sXhx7RZUNTAqIpUgkX0KRq8G0nLY7DbswWSdWnUUmDTmQ8xjXYpb3
 xul0yKEifGKVkcx/gSubYIUXOgCoczrVgfBMIQrf9we78QcfoBcmmDdrjfhnaFGMK1Ps
 eEOpqERCcY76iT4yPv9EugzKjayju1LAzJ7MNVSldEAasCuSe7ZwXO/rUh8RJmfzsl3D
 beQQ==
X-Gm-Message-State: AOAM530qNu3d0q9ULxa8TMzzf3E6l5F46rVILWDTgNYeMi69adlHbVlx
 ozQOZJXd44/ccX/jfgrOPsVDDuzbydfP6Z7T
X-Google-Smtp-Source: ABdhPJy7Pzq+Aoe3s5ULiFnkMKN+0nds+cJe2M+CQpVmaH3TzKFQJHMApcEx1vYPqR+iAD7QXjQrfg==
X-Received: by 2002:a17:907:d09:: with SMTP id
 gn9mr23820718ejc.447.1627420690337; 
 Tue, 27 Jul 2021 14:18:10 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g10sm13117ejj.44.2021.07.27.14.18.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 14:18:10 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20201226104259.356911-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <b44b3ee0-bcfa-c1b4-ecae-f02a78ef7381@mind.be>
Date: Tue, 27 Jul 2021 23:18:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20201226104259.356911-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2,1/1] package/opencv4: new package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 26/12/2020 11:42, Fabrice Fontaine wrote:
> opencv4 is not fully backward compatible with opencv3 as "a lot of C API
> from OpenCV 1.x has been removed.": https://opencv.org/opencv-4-0.
> 
> Moreover, it should be noted that layout of include files as well as
> pkg-config filename changed since
> https://github.com/opencv/opencv/commit/a95673287433fc810eda2d88b94bb234298c4cd5
> 
> All these changes mean that most of buildroot packages (e.g. vlc,
> ffmpeg) are not compatible with opencv4.
> 
> Here is the most important changes between opencv3 and opencv 4.5.1:
>  - License is Apache-2.0 (https://opencv.org/opencv-4-5-0)
>  - openjpeg is an optional dependency (enabled by default) since
>    https://github.com/opencv/opencv/commit/0384eb7d8c1a31831704e31b8bdbfbc6ff854281
>    jpeg2000 can be enabled through openjpeg or jasper
>  - pkg-config must be enabled with OPENCV_GENERATE_PKGCONFIG since
>    https://github.com/opencv/opencv/commit/e755a2a6e48ae02dd5136a628cc4148566a08225
>  - cmake is not installed in /usr/share anymore so hook can be dropped
>  - C++11 is required since
>    https://github.com/opencv/opencv/commit/d4688e6474dcd59c1d66736b744a8049f386a90b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>


 Applied to master, thanks. With a few remarks.

[snip]
> +	depends on !BR2_PACKAGE_OPENCV3

 This is very annoying. Now it's OK, but it makes it a lot harder for another
package to select opencv4 - it quickly leads to circular dependencies (I
experienced that with lapack/clapack).

 Unfortunately, I don't know a good solution. A choice doesn't help either. The
best is actually if we can make the two side-by-side installable. The only
conflicting files are the .so symlinks. So, we could install the opencv4 .so
symlinks in a different directory and add an explicit -L to the dependent packages.

 On the other hand - opencv3 is dead, so mid-term we're going to remove it
anyway. So I guess we can live with packages depending on !OPENCV3.


[snip]
> +config BR2_PACKAGE_OPENCV4_WITH_GSTREAMER1
> +	bool "gstreamer-1.x"
> +	depends on BR2_USE_MMU # gstreamer1 -> libglib2
> +	depends on BR2_USE_WCHAR # gstreamer1 -> libglib> +	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer1 -> libglib2

 These two are redundant with the dependencies of opencv4 itself. Normally I
like to keep them anyway, but since it also allows to remove the comment below,
I removed it in this case.

 There was another one like that as well.

> +	select BR2_PACKAGE_GSTREAMER1
> +	select BR2_PACKAGE_GST1_PLUGINS_BASE
> +	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
> +	help
> +	  Enable gstreamer support.
> +
> +comment "gstreamer support needs a toolchain w/ wchar, threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS

[snip]
> +comment "opencv4 needs a toolchain w/ C++, NPTL, wchar, dynamic library, gcc >= .8"

 4.8

[snip]
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
