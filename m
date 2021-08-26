Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC70C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 21:36:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69D8D60FDC
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 21:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 69D8D60FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F44B4264A;
	Thu, 26 Aug 2021 21:36:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oV5uGQZQPAY9; Thu, 26 Aug 2021 21:36:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDF1E4264B;
	Thu, 26 Aug 2021 21:36:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9DDDA1BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 21:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B663828DD
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 21:36:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tcjj-UthTO2Z for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 21:36:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C9B782796
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 21:36:21 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id x11so9452880ejv.0
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 14:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hoTaHH0YAoJ69gmimB5di7D/ZRXtmEw8D1qiIDJ8DfY=;
 b=bEi5dvgJIaMvjKMUD+De12VvePZXXatuOl7UNWRLC+hmi9ZS0eKWlZLPBdSeoTm6sD
 sbAnSSE32gj9WjCFf7C9FBnQ7bd0wEyewn3Jytw5T2efMKJ9+ZpiwkcA4T4WXw7+OzmJ
 PulV5CECedwvvnupWo09N/UMh5SltHe3qp/S8Wtq5sxjSGHJvFu0j/QpbV/8yuN31pfT
 3Bf5cKkweS2N88ISMzDRquNStT4C8DX/gmGavJWY9tQ0lu4vaqn0p0wHdiTpNIx8OUE5
 vWdtw9RYZ5Pt1UPCLKdsfDB/82r8wO6grL56bFg16QTWEVM+zteA7fqJewOO1seJ8P4K
 MaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=hoTaHH0YAoJ69gmimB5di7D/ZRXtmEw8D1qiIDJ8DfY=;
 b=Nr57E0Cy4V2G4DaRVNurAcVMu/p8Dm9PWE3aOjFzrKdXcF68xdtQi+9ylMa3ZPd8KC
 kzdxZR+yok6oEjOvuAQHQd4qw8WuM/LCG1zOmywP86vH6lqYQewr8IFMTuv04lFnpNXQ
 SIFE2b9Sk5Q8u1wMPZU7QUSWgszCFy6u20tfT4aoLvWdrPrUGrnouckPWnK6VEQgD6+j
 Zbn9ebD7jZkW2v85wXcqdBICU8ValwZs6HyX4u76PfrKCoNWyj4rX+n2M0k0mnk5B5di
 X9aHzH/iz6QOiY3WMUm6A5YZCDrmwh9neXkkPw/MnPqa4CUyoMME8Zga9Tp37fjuQmQw
 C0aA==
X-Gm-Message-State: AOAM530WP0vb1ZO/+F43xh7VhoA35XTnf0u/CH1T1nTrysNp886aIH+D
 nRbMqq4h/XgEKCgPqmaiSW9rcQ==
X-Google-Smtp-Source: ABdhPJw+cmYag+71yaOtUeAw9ywgwjVcP5HLNKKzwQpJj6PpvWQVkF1PUwSgwAlMyRb7LCx8vGcFpQ==
X-Received: by 2002:a17:906:369a:: with SMTP id
 a26mr6393716ejc.539.1630013779432; 
 Thu, 26 Aug 2021 14:36:19 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id bs13sm1913994ejb.98.2021.08.26.14.36.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 14:36:19 -0700 (PDT)
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
References: <20210819131246.38791-1-buildroot@heine.tech>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <4a826a55-5c43-23e4-9f5c-5851bee80f21@mind.be>
Date: Thu, 26 Aug 2021 23:36:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210819131246.38791-1-buildroot@heine.tech>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2] package/boost: bump version to 1.77.0
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Marcin Bis <marcin@bis.org.pl>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Maxim Kochetkov <fido_max@inbox.ru>,
 Fabio Urquiza <fabiorush@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 19/08/2021 15:12, Michael Nosthoff via buildroot wrote:
> * drop 0001-fenv.patch, issue [0] was marked fixed since boost 1.64 (commit [1])
> * drop upstreamed patch 0002
> * filesystem now depends on boost-atomic
> * math broke the build without always lockfree atomic ints, disable for now. reported at [2].
> 
> [0] https://svn.boost.org/trac/boost/ticket/11756
> [1] https://github.com/boostorg/test/commit/cb2a1c2488dc77b9baf1b05781208a9639dfcd69
> [2] https://github.com/boostorg/math/issues/673
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>


 Applied to master, thanks. With a few more changes though:

    [Arnout: improve propagation of reverse dependencies:
     - also update comment of cc-tool;
     - add boost-filesystem to reason of gnuradio, libcpprestsdk, uhd;
     - move dependency to arch-deps of mongodb]

[snip]
> diff --git a/package/botan/Config.in b/package/botan/Config.in
> index 341fa7c622..635fe1836d 100644
> --- a/package/botan/Config.in
> +++ b/package/botan/Config.in
> @@ -18,8 +18,8 @@ config BR2_PACKAGE_BOTAN
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
> -	select BR2_PACKAGE_BOOST_FILESYSTEM if BR2_PACKAGE_BOOST
> -	select BR2_PACKAGE_BOOST_SYSTEM if BR2_PACKAGE_BOOST
> +	select BR2_PACKAGE_BOOST_FILESYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
> +	select BR2_PACKAGE_BOOST_SYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS

 I suspect there might be a problem here. botan will build with boost as soon as
boost is enabled, even if lockfree atomic ints are not supported. So it's very
well possible that the build will fail on an architecture without them if you
select botan and boost (and not filesystem).

 It may be sufficient to add BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
to the condition in botan.mk - but perhaps botan will automatically enable boost
if it is detected (even if no --with-boost is given). If so, the configure
script will have to be patched to add a --without-boost option so we can disable it.

 Can you take a look? Or you could wait for autobuild failures for botan, but
since you're not a developer for botan you won't get mails for it.

 I've applied without attempting a fix, but I'm pretty sure something will have
to be done.

 Regards,
 Arnout

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
