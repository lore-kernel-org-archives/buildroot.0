Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50790C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 20:59:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF19A61008
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 20:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF19A61008
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB43480C52;
	Tue, 17 Aug 2021 20:59:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PYEhmdFQm_YS; Tue, 17 Aug 2021 20:59:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29C6780C5E;
	Tue, 17 Aug 2021 20:59:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA46B1BF215
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 20:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 981154078A
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 20:59:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xsfeo6it3zxR for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 20:59:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9242400DE
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 20:59:33 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id qk33so196914ejc.12
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 13:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Lw5s5WmQdUEgvFnhHRG30ZL9C0BjTASbotRaNMAw2NA=;
 b=apPJR9t1DTf8OoIl5awad46XQ/ozSUbFnmXiPTHGIFE2Gl4qAQertfCll3b2oMsxPT
 8gQgyhrX2RDXM4sg5c5kfQmoIuuHnnzdKk3HUJRO1lCi8cziHeTaHUyHvBd0A4K1jddO
 8QuQwDXqNW6FgasGBQ6m/kU9NANT7UXJQfJS+Dwbgnxi8WvsReN2Viyd1++Bwb5He0LO
 7gwRE5Oy6tl5QzA2KXrYTvBDFZ6Jn4bKfDjdzKSiTIKfIVFgEi0bkRhdNe4hWIV/kj3k
 iCl1mMC5yQki+kGF8Mh5AL439daRYQASU47DkBhVgiNSC1x8uk3/1AE3hFSm7rA8x6iw
 wwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Lw5s5WmQdUEgvFnhHRG30ZL9C0BjTASbotRaNMAw2NA=;
 b=gVDVq0bSH57i1O2c7v43cHEGJYpP9UUNXMwFR/OPLFrt4hZUnO7rS5DaFaZIpWlQib
 5HHtzIjahrY8HC9fwv02fx6cQuleh96b1WDmPLAzWgT9FOjDAwci0iuMX4txG2wdl+qB
 tFL30TiFxfQEQxUiXXsBgqIN1ulxVxiDKQuYMMdBIwFL8SA3zIylD3nK6VJfxyQdlb6j
 VfA4fGoFAubHHENBRV9Brlh/HEljCzFIHtvcX+DppXKbiqzQfdlmwC4+cdjvGU3EECyF
 GJENrhOTSQPP1wEGrTR49rko0zTLj3t9vdrnUiIjfZyMcxtWtXJynSCdF6MCgRdgGS1c
 aX6Q==
X-Gm-Message-State: AOAM531SziBfNx7nudhUy2ku9mcL0KAdX1Fl/Cr6aOTxPdyBPpdnjdxP
 We4ATYAV//btxQVw9dSXkM8JLQ==
X-Google-Smtp-Source: ABdhPJwBZKjxq6u1QmM006YX5yVQtMER2y/CQAcSh0t82SkBXdSnT2WN5aLzKVoFSZTHoVdHfJY4LA==
X-Received: by 2002:a17:906:b0d1:: with SMTP id
 bk17mr5924401ejb.59.1629233971864; 
 Tue, 17 Aug 2021 13:59:31 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id z10sm1178649ejg.3.2021.08.17.13.59.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 13:59:31 -0700 (PDT)
From: Arnout Vandecappelle <arnout@mind.be>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20210726235656.1df4ddeb@windsurf>
 <20210726223435.2906458-1-giulio.benetti@benettiengineering.com>
 <20210726223435.2906458-2-giulio.benetti@benettiengineering.com>
 <b89f7acd-3549-f167-f984-b08a5a597a18@mind.be>
Organization: Essensium/Mind
Message-ID: <6b386418-ca54-3b34-1f61-b765ccbd5939@mind.be>
Date: Tue, 17 Aug 2021 22:59:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b89f7acd-3549-f167-f984-b08a5a597a18@mind.be>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2 1/3] package/libgeos: fix build failure
 due to missing -mcmodel=large
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
Cc: Michael Nosthoff <buildroot@heine.tech>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 17/08/2021 22:34, Arnout Vandecappelle wrote:
> 
> 
> On 27/07/2021 00:34, Giulio Benetti wrote:
>> When building libgeos for or1k -mcmodel=large is needed to link, so let's
>> add that gcc option in case we're building for or1k.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>  package/libgeos/libgeos.mk | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
>> index a355732af8..43211d0434 100644
>> --- a/package/libgeos/libgeos.mk
>> +++ b/package/libgeos/libgeos.mk
>> @@ -23,6 +23,10 @@ ifeq ($(BR2_arm)$(BR2_armeb),y)
>>  LIBGEOS_CONF_OPTS += -DDISABLE_GEOS_INLINE=ON
>>  endif
>>  
>> +ifeq ($(BR2_or1k),y)
>> +LIBGEOS_CXXFLAGS += -mcmodel=large
> 
>  According to git, -mcmodel was added to GCC after the 11.2.0 release. Are you
> sure that this works?
> 
>  Oooh, we have a patch that adds it. But that patch is missing for 11.1.0 for
> some reason. Romain, you apparently didn't carry any of our patches when you
> added GCC 11 in 2ab88dac293aed5adf2504e8b182f9d8a306b935. The commit message
> doesn't say anything. Do you remember anything about the patches? The patch was
> added to master on May 21 and you only submitted the GCC bump on June 12, but
> perhaps you already had it lying around for a while?
> 
>  Giulio, maybe you can port the patch to 11.1.0?

 ... and now I see you already did that in [1]. Thanks!

 Regards,
 Arnout

[1]
https://patchwork.ozlabs.org/project/buildroot/patch/20210815180359.1575824-1-giulio.benetti@benettiengineering.com/


> 
>  Regards,
>  Arnout
> 
>> +endif
>> +
>>  LIBGEOS_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(LIBGEOS_CXXFLAGS)"
>>  
>>  $(eval $(cmake-package))
>>
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
