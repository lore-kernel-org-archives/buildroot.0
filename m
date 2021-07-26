Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA0CC4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 06:24:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C736B60F38
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 06:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C736B60F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3C9A401C8;
	Mon, 26 Jul 2021 06:24:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8UDVDRIGZUri; Mon, 26 Jul 2021 06:24:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D88E84028A;
	Mon, 26 Jul 2021 06:24:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E10411BF3A8
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 06:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC681835CF
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 06:24:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hGbkLQ6ohvkO for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 06:24:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5630F835C8
 for <buildroot@busybox.net>; Mon, 26 Jul 2021 06:24:40 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id hp25so14620644ejc.11
 for <buildroot@busybox.net>; Sun, 25 Jul 2021 23:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LsXrpVngqZlPo0Ne5XVFeqos6RqmmMF47+WIMT1n3s4=;
 b=Z9YOtp8FODIt9KnVp1qNwETGLxD2fgFuiLLMV1YUFNrOk8BRv4QoILfwqge6+GBjrZ
 Tw0rVxxvbLsfKjp3YUhE5SHIjaKj+lkFLEowbsYQU/rha3Be9Lo2THiO97fzxd2ZyBcr
 1lwC2RYOpVTX+dq4XjiGBKS4b1nVfdhaDnwUKB8TkzO8LBcsNBhEs3+BHy12/TRieaZP
 Ojq0c3/lotaTjbh9Xc+Lwbe4qq34J50a/Fv3bWZrzUJfUHxp6RbGrhEuM+0Y5tQl9Eca
 AAB+jyTSEnrcDFzojomuv6RvgU9RB6cirBvdJOHN1CcaQgk2Zs6trxlHCZTjQNC0fO4w
 vZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=LsXrpVngqZlPo0Ne5XVFeqos6RqmmMF47+WIMT1n3s4=;
 b=KjKmIw0xhtodm7sl4yGUO0QiJevZv96K09W+X6H/KQQZueHQ2C/60yfkaqHPFo9Lom
 5dqO0yRVKE1f3VXI9iIbKBd7DdOwZ4raPc793ozEkZ6zWbYFopDvywH9Tn1e0HPIr6jX
 ShnKhSdzzCTg42aeLv3b60Kxh4cpvR7XPlkEXm5461m38jZSK3HEu/sumF2Oqd63dXgS
 Lt3mJ2kPIt0D9AD1Z/gpx/fhRvWEEwRgD+TL1nMbWQN7b0Cla0sNFdrw+osvIFtEHf7U
 DvFqA1+8QqxaXJoPFzDWCfJRSnuy7iQkRZkfFyybpwmrrWk4vewDjvwOMhoG4wvPh0c1
 q1ng==
X-Gm-Message-State: AOAM530ilpzc/dkdswKX1TqmpiWwSoM20Ho8UbQ3ubHg3pPMHdLoODyl
 zUFTjB24UJhS476La+MSavkzzZpUPy9Tv2i5
X-Google-Smtp-Source: ABdhPJwrpdZUJLPboX4ekcbcJnW8id3Gom1etnFDkik0gBIgUzMSsFu8G324C9xA9/9ZAKvmfz6Mhg==
X-Received: by 2002:a17:906:3915:: with SMTP id
 f21mr9525632eje.178.1627280678510; 
 Sun, 25 Jul 2021 23:24:38 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f5sm13760930ejj.45.2021.07.25.23.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 23:24:37 -0700 (PDT)
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>, buildroot@busybox.net
References: <20210725111231.359830-1-arnout@mind.be>
 <20210725111231.359830-3-arnout@mind.be>
 <20210725175709.7338b4a5@x230_1.trabucayre.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <fd67895e-5c9e-62bc-7a4b-dd41bed13c0d@mind.be>
Date: Mon, 26 Jul 2021 08:24:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210725175709.7338b4a5@x230_1.trabucayre.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v5 3/3] package/armadillo: allow to select
 between lapack or openblas
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



On 25/07/2021 17:57, Gwenhael Goavec-Merou wrote:
> Arnout, all,
> 
> On Sun, 25 Jul 2021 13:12:31 +0200
> "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> wrote:
> 
>> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
>>
>> armadillo can use lapack or openblas as BLAS provider. LAPACK support is
>> optional.
>>
>> This patch
>> - adds an _ARCH_SUPPORTS variable to check if one is available
>> - adds an option to choose lapack or openblas as BLAS provider
>>
>> The choice is required since applications may potentially need lapack.
>>
>> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
>> Changes v4 -> v5: [Done by Arnout]
>> - Consistent naming of BR2_PACKAGE_ARMADILLO_OPENBLAS (Yann E. Morin)
>> - Remove double dependency on lapack/clapack (Yann E. Morin)
>> - Remove stray 'endchoice'
>> - "Solve" circular dependency by removing clapack
>> Changes v3 -> v4: [Done by Arnout]
>> - Split off lapack/clapack arch depends in separate patches
>> - Simplify the comments (no need for the powerpc complexity)
>> - Remove the choices because clapack/lapack choice doesn't work. Keep a
>>   single config for openblas.
>> Changes v2 -> v3:
>> - drop all default statements for choice (Thomas)
>> - add explicit -l since blas libary is called liblas for (c)lapack and
>>   libopenblas for openblas (Thomas)
>> - add a choice for lapack selection between lapack, clapack or none
>> Changes v1 -> v2:
>> - add openblas as blas provider
>> ---
>>  package/armadillo/Config.in    | 34 ++++++++++++++++++++++++++--------
>>  package/armadillo/armadillo.mk | 18 +++++++++++++++++-
>>  2 files changed, 43 insertions(+), 9 deletions(-)
>>
>> diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
>> index b2b61a3233..7aed4fd02f 100644
>> --- a/package/armadillo/Config.in
>> +++ b/package/armadillo/Config.in
>> @@ -1,20 +1,38 @@
>>  comment "armadillo needs a toolchain w/ C++"
>> +	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
> blas may be provided by lapack too: maybe it's required to add the same condition
> as armadillo itself ?
>>  	depends on !BR2_INSTALL_LIBSTDCPP
>> -	depends on !BR2_powerpc
>> -	depends on !BR2_m68k_cf
>>  
>> -comment "armadillo needs a glibc toolchain w/ C++"
>> -	depends on BR2_powerpc
>> -	depends on !BR2_INSTALL_LIBSTDCPP || BR2_TOOLCHAIN_USES_UCLIBC
>> +comment "armadillo needs a toolchain w/ fortran, C++"
> fortran is only required if lapack has to be used: if lapack is said as optional this is
> maybe not required ?

 Oh, I intended to insert a comment there but apparently forgot: We need either
openblas (which doesn't require fortran) or lapack (which does require fortran).
Therefore, on architectures which do support openblas, we should have a comment
that just says "C++", while on architectures that don't support openblas (but do
support lapack) we should have a comment that says "C++ and Fortran".


>> +	depends on !BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS # otherwise, see comment above
>> +	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
>> +	depends on !BR2_TOOLCHAIN_HAS_FORTRAN || !BR2_INSTALL_LIBSTDCPP
>>  
>>  config BR2_PACKAGE_ARMADILLO
>>  	bool "armadillo"
>> +	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS || \
>> +		(BR2_PACKAGE_LAPACK_ARCH_SUPPORTS && BR2_TOOLCHAIN_HAS_FORTRAN)
>>  	depends on BR2_INSTALL_LIBSTDCPP
>> -	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC # clapack
>> -	depends on !BR2_m68k_cf # clapack
>> -	select BR2_PACKAGE_CLAPACK
>>  	help
>>  	  Armadillo: An Open Source C++ Linear Algebra Library for
>>  	  Fast Prototyping and Computationally Intensive Experiments.
>>  
>>  	  http://arma.sourceforge.net/
>> +
>> +if BR2_PACKAGE_ARMADILLO
>> +
>> +choice
>> +	prompt "BLAS implementation"
>> +
>> +config BR2_PACKAGE_ARMADILLO_OPENBLAS
>> +	bool "openblas"
>> +	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
>> +	select BR2_PACKAGE_OPENBLAS
>> +
>> +config BR2_PACKAGE_ARMADILLO_LAPACK
>> +	bool "lapack"
>> +	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS && BR2_TOOLCHAIN_HAS_FORTRAN
>> +	select BR2_PACKAGE_LAPACK
>> +
>> +endchoice
>> +
>> +endif
>> diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
>> index 624b842ef6..dcac2bf8cd 100644
>> --- a/package/armadillo/armadillo.mk
>> +++ b/package/armadillo/armadillo.mk
>> @@ -7,11 +7,27 @@
>>  ARMADILLO_VERSION = 9.900.2
>>  ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
>>  ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
>> -ARMADILLO_DEPENDENCIES = clapack
>>  ARMADILLO_INSTALL_STAGING = YES
>>  ARMADILLO_LICENSE = Apache-2.0
>>  ARMADILLO_LICENSE_FILES = LICENSE.txt
>>  
>>  ARMADILLO_CONF_OPTS = -DDETECT_HDF5=false
>>  
>> +# blas support may be provided by lapack (libblas.a) or openblas (libopenblas.a)
>> +ARMADILLO_CONF_OPTS += -DBLAS_FOUND=ON
>> +ifeq ($(BR2_PACKAGE_ARMADILLO_OPENBLAS),y)
>> +ARMADILLO_CONF_OPTS += -DBLAS_LIBRARIES=-lopenblas
>> +ARMADILLO_DEPENDENCIES = openblas
>> +else
>> +# Since BR2_PACKAGE_LAPACK is selected in this case, the dependency on it is
>> +# added below.
>> +ARMADILLO_CONF_OPTS += -DBLAS_LIBRARIES=-lblas
>> +endif
>> +
>> +# lapack support is optional and can only be provided by lapack, not openblas
>> +ifeq ($(BR2_PACKAGE_LAPACK),y)
>> +ARMADILLO_CONF_OPTS += -DLAPACK_FOUND=ON
>> +ARMADILLO_DEPENDENCIES += lapack
>> +endif
>> +
>>  $(eval $(cmake-package))
>> -- 
>> 2.31.1
>>
> It's an open question:
> until now armadillo was always built with blas and lapack support provided by
> clapack. To avoid breaking current behaviour (lapack support) why not
> considering selecting lapack package unconditionaly and let user choise for
> blas support? I know the main issue is the dependency to fortran...

 What you're basically saying is that in the choice between lapack and openblas,
lapack should be the default, right?

 Can you maybe explain a bit what your original reason for this patch was?
Armadillo basically hides the BLAS implementation, so unless it's buggy, you
shouldn't even notice which implementation is behind. Also, the lapack package
itself says that you should not use its BLAS implementation but you should use a
better one instead.

 Regards,
 Arnout
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
