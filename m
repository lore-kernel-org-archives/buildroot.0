Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBF4C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 20:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCE3941BBB;
	Fri, 29 Jul 2022 20:15:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCE3941BBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id udAv3gkBzsgZ; Fri, 29 Jul 2022 20:15:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E76F41BA7;
	Fri, 29 Jul 2022 20:15:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E76F41BA7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 984211BF35D
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 20:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 734E084038
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 20:15:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 734E084038
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8FvWWmSljH74 for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 20:15:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDB5A83F1B
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDB5A83F1B
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 20:15:45 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id mf4so10382895ejc.3
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 13:15:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BCtn30av7417doHshc7NzrVZoAQRHsFJUvNNGJLX4Vo=;
 b=KBOUue9TtGJ2dP7/4JsvdCnYOx1pNlXeN5GdP8bOFfzb0xwaPxYVgtHTdTEY+sCIxo
 SE7i2H4k2+Rii3CF5iSClE0Ma0WFGnzmxSmtQRNn8FJvh/vpBDVYqvjWaixbf1CBeMkl
 GvjROam0H4mcyJof2bEc1zyqeFrk3EMNN4IYC1+h7dnsYauQd0hxUiP+h2JuetN5+xm2
 ZJ22U8ZqkwOzQyH2RRh1Du9lL5cihEiP0oHlzYh5DagGT09Z0lkcyllKlIvoDEecsgEk
 T43SPbrPMrxGot6yiAQbz/fI5EIerrHesAzHUFlG4VSuajbeAoN8f9vADlN0uCUcqQ4Z
 i9wA==
X-Gm-Message-State: AJIora/Ld+xnlGDnnbkCYdF8KIb2Nxp+LH7rMc0b73IpigPFY6Hn8hFR
 qWJSxHCo+aGVfh1Kes3bzy8vvA==
X-Google-Smtp-Source: AGRyM1tYR9pGLB2CmDWe3P32Ghru7q38pQgbMors0g050zux8Nu1TMpkSmGUw2ZPBFfLwa4KSzRjQw==
X-Received: by 2002:a17:907:2ccb:b0:72b:52bb:fd51 with SMTP id
 hg11-20020a1709072ccb00b0072b52bbfd51mr4066692ejc.118.1659125743772; 
 Fri, 29 Jul 2022 13:15:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a17090653c300b00730223dc5c0sm1589709ejo.206.2022.07.29.13.15.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 13:15:43 -0700 (PDT)
Message-ID: <ccaf4a5f-fc14-2391-1ed5-3f50c72c41c5@mind.be>
Date: Fri, 29 Jul 2022 22:15:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Andreas Ziegler <br015@umbiko.net>, buildroot@buildroot.org
References: <20220729091323.2933595-1-br015@umbiko.net>
 <20220729163718.58963-1-br015@umbiko.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220729163718.58963-1-br015@umbiko.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BCtn30av7417doHshc7NzrVZoAQRHsFJUvNNGJLX4Vo=;
 b=bxuZO391X352Hsp7V78oyv5No9kFGrgFagouvx+wVdKpS3QJ/fvbCA3C1ExTf8q1Tr
 85oENMdlWND/4+l4en+DeSkzK1K1yP7E+O9OKX6j0mLjRpdaTUN9LOfqOl4qv/k+P23o
 0qBI0yoY4/sSergjnoqNXsD5oOh9M+IMfaMSddN+qwXFEvjf7Yq5Z6Hm6n8SIiS9HEqw
 VnzhbIDNkyVbNUvv4o/nbS7v5wvcU5pwEGTPXvxztBXOuTd7FX1eFHAardnBl4mWzjNs
 Hg1kkPNxk8K2WWW64J8p8d4xVyw42pJKVo8AFV22nvBiMASakJcroCtFyehfThmv7xix
 817Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bxuZO391
Subject: Re: [Buildroot] [PATCH v2 1/1] package/zziplib: create symlinks
 only if target is missing
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
Cc: Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/07/2022 18:37, Andreas Ziegler wrote:
> Symlink creation to base file names is only needed for versioned libraries.
> Modify CMake rules to prevent overwriting existing libraties with recursive
> links.
> 
> Fixes the following autobuild failures:
> http://autobuild.buildroot.net/results/dd1/dd1974dbc1a22a96a3cedb117417e66119821514/
> http://autobuild.buildroot.net/results/df8/df8406402ccff7cec34ae5858b8da57d1a4ae9c1/
> http://autobuild.buildroot.net/results/743/7433a2ad111e2f014c81f196d3d1e2f63dffa858/
> http://autobuild.buildroot.net/results/79f/79f88e9ec14cda7d07cf689eee864791ba949892/
> ...
> http://autobuild.buildroot.net/results/892/8922efbbbfe79e8286a411acce4086b5c77c57c0/
> http://autobuild.buildroot.net/results/dfa/dfa8ade3a4c1750e6dd58e652f60af2a44f80dd8/
> http://autobuild.buildroot.net/results/9cd/9cd4147486f32d642513ba14efca3a02d5745ab9/
> 
> Regression test cases:
> http://autobuild.buildroot.net/results/ba7/ba711034c0abe980f677e26de41739223e2f66e9/
> http://autobuild.buildroot.net/results/032/032aaff121fb114f388c67dbca3ad2b02f670e38/
> http://autobuild.buildroot.net/results/6c5/6c56b645a2b723920f07b98474452824fba5e2c1/
> 
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>

  Applied to master, thanks.

> ---
> Changes v1 -> v2:
>   - correct file name in generator expressions
> 
>   ...reate-symlinks-only-if-target-is-mis.patch | 59 +++++++++++++++++++
>   1 file changed, 59 insertions(+)
>   create mode 100644 package/zziplib/0002-ZZIP_LIBLATEST-create-symlinks-only-if-target-is-mis.patch
> 
> diff --git a/package/zziplib/0002-ZZIP_LIBLATEST-create-symlinks-only-if-target-is-mis.patch b/package/zziplib/0002-ZZIP_LIBLATEST-create-symlinks-only-if-target-is-mis.patch
> new file mode 100644
> index 0000000000..1fe4824a83
> --- /dev/null
> +++ b/package/zziplib/0002-ZZIP_LIBLATEST-create-symlinks-only-if-target-is-mis.patch
> @@ -0,0 +1,59 @@
> +From 5977725ecea038f32a86938703ca1ed2b080b31c Mon Sep 17 00:00:00 2001
> +From: Andreas Ziegler <br015@umbiko.net>
> +Date: Fri, 29 Jul 2022 12:32:27 +0200
> +Subject: [PATCH] ZZIP_LIBLATEST: create symlinks only if target is missing
> +
> +Signed-off-by: Andreas Ziegler <br015@umbiko.net>

  This was missing some detail about exactly what is going on, so I just copied 
the text from your upstream PR and added that here.

  It was also missing the upstream URL.

> +---
> + zzip/CMakeLists.txt | 18 +++++++++++++++---
> + 1 file changed, 15 insertions(+), 3 deletions(-)
> +
> +diff --git a/zzip/CMakeLists.txt b/zzip/CMakeLists.txt
> +index 4fa6b9c..dd1e56a 100644
> +--- a/zzip/CMakeLists.txt
> ++++ b/zzip/CMakeLists.txt
> +@@ -350,8 +350,12 @@ if(ZZIP_LIBLATEST)
> +   endif()
> +     get_target_property(libname libzzip OUTPUT_NAME)
> +     get_target_property(librelease libzzip RELEASE_POSTFIX)
> ++    set(libzzip_target "${lib}${libname}${dll}")
> ++    add_custom_command(OUTPUT ${libzzip_target}
> ++        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzip> ${libzzip_target}
> ++        )
> +     add_custom_target(libzzip_latest ALL
> +-        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzip> ${lib}${libname}${dll}
> ++        DEPENDS ${libzzip_target}

  This is actually not really great - it will not create the symlink if the 
unversioned file exists already, but that may in fact be a leftover from a 
previous build. The correct way to do it would be to add a condition that it's 
only done if target_file_name != liblibname.dll

  But for buildroot it's good enough (since the version will always be the same 
anyway when you do a rebuild), so applied to master as is.

  Regards,
  Arnout

> +         )
> +     install(FILES
> +         ${outdir}/${lib}${libname}${dll}
> +@@ -359,8 +363,12 @@ if(ZZIP_LIBLATEST)
> +     if(ZZIPFSEEKO)
> +     get_target_property(libname libzzipfseeko OUTPUT_NAME)
> +     get_target_property(librelease libzzipfseeko RELEASE_POSTFIX)
> ++    set(libzzipfseeko_target "${lib}${libname}${dll}")
> ++    add_custom_command(OUTPUT ${libzzipfseeko_target}
> ++        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipfseeko> ${libzzipfseeko_target}
> ++        )
> +     add_custom_target(libzzipfseeko_latest ALL
> +-        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipfseeko> ${lib}${libname}${dll}
> ++        DEPENDS ${libzzipfseeko_target}
> +         )
> +     install(FILES
> +         ${outdir}/${lib}${libname}${dll}
> +@@ -369,8 +377,12 @@ if(ZZIP_LIBLATEST)
> +     if(ZZIPMMAPPED)
> +     get_target_property(libname libzzipmmapped OUTPUT_NAME)
> +     get_target_property(librelease libzzipmmapped RELEASE_POSTFIX)
> ++    set(libzzipmmapped_target "${lib}${libname}${dll}")
> ++    add_custom_command(OUTPUT ${libzzipmmapped_target}
> ++        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipmmapped> ${libzzipmmapped_target}
> ++        )
> +     add_custom_target(libzzipmmaped_latest ALL
> +-        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipmmapped> ${lib}${libname}${dll}
> ++        DEPENDS ${libzzipmmapped_target}
> +         )
> +     install(FILES
> +         ${outdir}/${lib}${libname}${dll}
> +--
> +2.34.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
