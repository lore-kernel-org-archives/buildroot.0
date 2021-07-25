Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE47C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 14:55:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79E2360F35
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 14:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79E2360F35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C4EC40137;
	Sun, 25 Jul 2021 14:55:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aqfvSGB7haOc; Sun, 25 Jul 2021 14:55:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FB9D40147;
	Sun, 25 Jul 2021 14:55:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2AC521BF34C
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 14:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 199A4403B9
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 14:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4lqBvcq5YwbR for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 14:55:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7D1F403B2
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 14:55:37 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id oz16so3410162ejc.7
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 07:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XgsFTRpMA4k7grbtYevzzPmI2zDFnodBJyi6codWAvA=;
 b=UVx6d86BJOBNgngbQ/iKq8Md2h/qjdaJIBUdXgsfOxdac3HXRq9CUXrvpqG8R3Q4oU
 GD4U/RsTvXSbXZDXjQ124Fu3PhWh2mXdZ5aS2HkZMaR+1D45HsUu16P/jMXNXJskOWaY
 f0cX6Qec/7J7T7MT+li4L7QzmDf8eimvosFI77GKSW39tJ8TKKmay+0e4NeH2OzAoQWG
 ZT07S2cf+MnTl9oYY+dvn7V0YstNI7kGAYXOY1FvxGbki7ZyqJe7pUp/nO+LDr4NQm0t
 6iJqTu2+zhXeU230flj2XoTNzeIl95CRnbGiFN3uEdN23rl3yMPbsVmKNoWRLE2wpMBV
 01zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=XgsFTRpMA4k7grbtYevzzPmI2zDFnodBJyi6codWAvA=;
 b=tQ8BEqJpriNEMgxmuT90o1okEHtr5xY0WaVmnWO/+8AHdIk9TMZoBlzPQoAAxf+yf9
 OT2dodDKgTu0eY0g50k408WUpM2BFywmA6d9tr/j/5sL9PQOr1enaRYbPOQD2+BXNmH1
 fIim9Wn2eH0u5BNknulD8ETxWbjuhI6uM6Enjgc/1D+ancHj1HNxwnxY5vxkzgJBp48L
 ktS4IcM8RpctNhw1N91s/Q6ayYruIZ/yoCnVbI8lOl79PEqxvlP/3PiP8DsfRtrqb9gf
 SWJWtyyDzBfFjDil7HbzZX1PLR9i/uuf1pfgcPqMZVmseSyPlFLPOgMoCjA4pbO3LZgQ
 0aAw==
X-Gm-Message-State: AOAM531QZRCTSPXbJUmjyjUdwA6LBjkjgt8+UKaVw9/APtvmd9q/9K/f
 NFooNB83qcesDb63terl+F78Ng==
X-Google-Smtp-Source: ABdhPJxyviPa9A/Hja3yvPzVFBxO866zlpgGLoFdAdx0vlQltzX+f5MtmCpwwZ/rdsJO2/5qnMtluw==
X-Received: by 2002:a17:907:e9e:: with SMTP id
 ho30mr13542135ejc.114.1627224935847; 
 Sun, 25 Jul 2021 07:55:35 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id w24sm17595921edv.59.2021.07.25.07.55.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 07:55:35 -0700 (PDT)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Gleb Mazovetskiy <glex.spb@gmail.com>
References: <20210103171525.2323323-1-glex.spb@gmail.com>
 <20210717094350.GK12203@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <7d492a63-4c52-2f45-a27a-b2d1ff1a6ade@mind.be>
Date: Sun, 25 Jul 2021 16:55:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717094350.GK12203@scaer>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v5 1/1] Makefile: Parallelize glibc locale
 generation
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 17/07/2021 11:43, Yann E. MORIN wrote:
> Gleb, All,
> 
> +Peter, Thomas, Arnout: for review. I was too involved in setting up
> this change, so I am not in the best position to correctly review it.
> 
> Of course, if anyone else want to review/test this, they are welcome to
> do so!
> 
> Regards,
> Yann E. MORIN.
> 
> On 2021-01-03 17:15 +0000, Gleb Mazovetskiy spake thusly:
>> Parallelizes locale generation based on `BR2_JLEVEL` setting.
>>
>> Locale generation always runs during the finalize stage and can consume
>> a significant amount of time. Parallelizing it greatly reduces that time
>> on multi-core machines.
>>
>> To parallelize it, we first invoke `localedef` for every locale in
>> parallel with the `--no-archive` option. This creates the intermediate
>> locale data instead of writing to the finally archive directly.
>>
>> Then, we invoke `localedef` again once to create the archive from the
>> intermediate compiled locale data files.
>>
>> We have to do it this way because `localedef` does not do any locking
>> when writing to the archive file, so calling it without `--no-archive`
>> concurrently could result in a corrupt archive file or an archive file
>> that is missing some locales.

 Applied to master with a number of changes.

 First of all, I extended the commit message with the following two paragraphs:

    While we're at it, make two additional improvements:
    - Remove locale-archive before adding to it. Otherwise, repeated
      applications of target-finalize will keep on growing the file.
    - Sort the locales when creating locale-archive so its contents are
      reproducible.

    We use `find` to collect the installed locales rather than LOCALES. This
    makes it possible for something else (skeleton, overlay, custom package)
    to create and install additional locales and still have them added to
    locale-archive.

 I hope that that's correct.

>>
>> Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
>> ---
>>  Makefile                          | 29 +++++++---------------
>>  support/misc/gen-glibc-locales.mk | 41 +++++++++++++++++++++++++++++++
>>  2 files changed, 50 insertions(+), 20 deletions(-)
>>  create mode 100644 support/misc/gen-glibc-locales.mk
>>
>> diff --git a/Makefile b/Makefile
>> index 4d334adcd6..dbeabf9e61 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -661,32 +661,21 @@ endef
>>  TARGET_FINALIZE_HOOKS += TOOLCHAIN_ECLIPSE_REGISTER
>>  endif
>>  
>> -# Generate locale data. Basically, we call the localedef program
>> -# (built by the host-localedef package) for each locale. The input
>> -# data comes preferably from the toolchain, or if the toolchain does
>> -# not have them (Linaro toolchains), we use the ones available on the
>> -# host machine.
>> +# Generate locale data.
>>  ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
>>  GLIBC_GENERATE_LOCALES = $(call qstrip,$(BR2_GENERATE_LOCALE))
>>  ifneq ($(GLIBC_GENERATE_LOCALES),)
>>  PACKAGES += host-localedef
>>  
>>  define GENERATE_GLIBC_LOCALES
>> -	$(Q)mkdir -p $(TARGET_DIR)/usr/lib/locale/
>> -	$(Q)for locale in $(GLIBC_GENERATE_LOCALES) ; do \
>> -		inputfile=`echo $${locale} | cut -f1 -d'.'` ; \
>> -		charmap=`echo $${locale} | cut -f2 -d'.' -s` ; \
>> -		if test -z "$${charmap}" ; then \
>> -			charmap="UTF-8" ; \
>> -		fi ; \
>> -		echo "Generating locale $${inputfile}.$${charmap}" ; \
>> -		I18NPATH=$(STAGING_DIR)/usr/share/i18n:/usr/share/i18n \
>> -		$(HOST_DIR)/bin/localedef \
>> -			--prefix=$(TARGET_DIR) \
>> -			--$(call LOWERCASE,$(BR2_ENDIAN))-endian \
>> -			-i $${inputfile} -f $${charmap} \
>> -			$${locale} ; \
>> -	done
>> +	$(TARGET_CONFIGURE_OPTS) \

 TARGET_CONFIGURE_OPTS are not needed here. They just make things terribly
verbose...

>> +	$(MAKE) -j$(PARALLEL_JOBS) -f support/misc/gen-glibc-locales.mk \

 -j$(PARALLEL_JOBS) is already part of $(MAKE) so not needed.

>> +		HOST_DIR=$(HOST_DIR) \
>> +		TARGET_DIR=$(TARGET_DIR) \
>> +		STAGING_DIR=$(STAGING_DIR) \

 Those three variables are exported so don't need to be passed explicitly.


 Regards,
 Arnout

>> +		ENDIAN=$(call LOWERCASE,$(BR2_ENDIAN)) \
>> +		LOCALES="$(GLIBC_GENERATE_LOCALES)" \
>> +		Q=$(Q)
>>  endef
>>  TARGET_FINALIZE_HOOKS += GENERATE_GLIBC_LOCALES
>>  endif
>> diff --git a/support/misc/gen-glibc-locales.mk b/support/misc/gen-glibc-locales.mk
>> new file mode 100644
>> index 0000000000..3db1e0dc11
>> --- /dev/null
>> +++ b/support/misc/gen-glibc-locales.mk
>> @@ -0,0 +1,41 @@
>> +# Generates glibc locale data for target.
>> +
>> +inputfile = $(firstword $(subst ., ,$(1)))
>> +charmap = $(or $(word 2,$(subst ., ,$(1))),UTF-8)
>> +
>> +# Packages all the generated locale data into the final archive.
>> +#
>> +# We sort the file names to produce consistent output regardless of
>> +# the `find` outputs order.
>> +$(TARGET_DIR)/usr/lib/locale/locale-archive: $(LOCALES)
>> +	$(Q)rm -f $(@)
>> +	$(Q)find $(TARGET_DIR)/usr/lib/locale/ -maxdepth 1 -mindepth 1 -type d -print0 \
>> +	| sort -z \
>> +	| xargs -0 \
>> +		$(HOST_DIR)/bin/localedef \
>> +			--prefix=$(TARGET_DIR) \
>> +			--$(ENDIAN)-endian \
>> +			--add-to-archive
>> +
>> +# Generates locale data for each locale.
>> +#
>> +# The input data comes preferably from the toolchain, or if the toolchain
>> +# does not have them (Linaro toolchains), we use the ones available on the
>> +# host machine.
>> +#
>> +# Uses `localedef`, which is built by the `host-localedef` package.
>> +$(LOCALES): | $(TARGET_DIR)/usr/lib/locale/
>> +	$(Q)echo "Generating locale $(@)"
>> +	$(Q)I18NPATH=$(STAGING_DIR)/usr/share/i18n:/usr/share/i18n \
>> +	$(HOST_DIR)/bin/localedef \
>> +		--prefix=$(TARGET_DIR) \
>> +		--$(ENDIAN)-endian \
>> +		--no-archive \
>> +		-i $(call inputfile,$(@)) \
>> +		-f $(call charmap,$(@)) \
>> +		$(@)
>> +
>> +.PHONY: $(LOCALES)
>> +
>> +$(TARGET_DIR)/usr/lib/locale/:
>> +	$(Q)mkdir -p $(TARGET_DIR)/usr/lib/locale/
>> -- 
>> 2.27.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
