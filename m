Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27991C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 12:24:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7114761073
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 12:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7114761073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3ABC380E41;
	Thu, 26 Aug 2021 12:24:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z9AZYYSIHmNX; Thu, 26 Aug 2021 12:24:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00E5D80E97;
	Thu, 26 Aug 2021 12:24:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 014011BF580
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 12:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E380142559
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 12:24:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JV_uacZ6Thsi for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 12:24:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6C664261C
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 12:24:12 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id x11so5999020ejv.0
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 05:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UUMkyEvZpylsb5CUzw8mEIOU/xVS51//6GbW2PxFZFU=;
 b=ZYcyX919jDY6ifXs6ZVmxRilBWNBv+Nczf9xhMVB0ZYN6dnzL52wLuwMLrGIK7oC5C
 nVy9xeZYS70V/Sk/BMe3g6rT7QPS0F0Kdby0uBVEr9JqiOFDGNTjUaj2tjUiMWx1KHux
 Z1hTmv91RZ65221O5VKMt1HBWN/ZFtBdbO4M7Pk9GbsmtwBg6XlDU0p8T4Yje3gwSnHF
 lSVAli2rX15a0YIP9VDxNF2ZB7ew9bT9sWKl9z86Xz9AZA4L6s2uVLtVkGgXGvDyQD6n
 YxEY9n3oeWaSqQwsRWfZlLoXluZ9Qmy9kWqX4Nj90dbuJKcvnFGKIEq5seUzG0ydvFAd
 yKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=UUMkyEvZpylsb5CUzw8mEIOU/xVS51//6GbW2PxFZFU=;
 b=SFOT+gRwsOtytdDfNwFZKbCgqA6+VuRX+E58CqXaLYpy1B2lWDNhHvVeNZphIpJOUY
 LOIGXmAH8z0fMuOA5GJpb6hyZejxj6FaJEckAGAJDHvhxZ/aObmhoEkyeJOaPbEvGBCB
 9MCf6CMu0o9LdO4+DEgtzr5pv3NIRuG0hcLDK+l049Y0lGhbXbAQyGOFmSwwb3QJNwD4
 uUBdYFgubQ03pCunX8q4ZdH42fQA/JKXgZkZZ4ysV8W7naLM5aYoGc/5pzvu5PnusQ0g
 mL6U2b2YZDHdykmv2TQ61kkEVsBDPW8aRzjML5mJEw/NRRrYQ9v8YGzZVvgJBWL+ymKG
 8CwA==
X-Gm-Message-State: AOAM531eFqkiL3ias63rldsK0jHd+6Lnly1XPcHU0rn9sr2irn537Tny
 0aNueAZwYW0zjI2FZJfCcrZ5bg==
X-Google-Smtp-Source: ABdhPJyqEPh3I+MuJP/qKzr8GGutXDg5eMzfUyTPa5bgiHVmp3zePocTiJynoLoYsao5FfqJH3Eg+w==
X-Received: by 2002:a17:907:3f91:: with SMTP id
 hr17mr3915662ejc.496.1629980650732; 
 Thu, 26 Aug 2021 05:24:10 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id m6sm1648451edc.82.2021.08.26.05.24.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 05:24:10 -0700 (PDT)
To: Baruch Siach <baruch@tkos.co.il>, Jonah Petri <jonah@petri.us>
References: <20210824203841.1554763-1-jonah@petri.us>
 <e8372342-ccd7-9be9-5e78-da1a31ad9162@mind.be> <87fsuwa16g.fsf@tarshish>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <900b3187-f679-5331-c344-634bdf78abbd@mind.be>
Date: Thu, 26 Aug 2021 14:24:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87fsuwa16g.fsf@tarshish>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2 1/1] toolchain: handle toolchains with
 multiple ld*.so.* files
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 26/08/2021 13:24, Baruch Siach wrote:
> Hi Arnout, Jonah,
> 
> On Wed, Aug 25 2021, Arnout Vandecappelle wrote:
>> On 24/08/2021 22:38, Jonah Petri wrote:
>>> Some 3rd party vendor toolchains have multiple files which match
>>> these glob patterns.  In this case, the shell script failed.
>>> Switching to use find and xargs solves the issue.
>>>
>>> Signed-off-by: Jonah Petri <jonah@petri.us>
>>
>>  Applied to master, thanks.
> 
> It looks like this breaks the ARM aarch64 external toolchain. Both ld.so
> existence test and ld.so listing command are broken. See this libnl
> failure:
> 
>   http://autobuild.buildroot.net/results/afe/afe44f4b6a3c53e5864cfb10b04529011e72cf5c/
> 
> I have no idea why we don't see much wider breakage in the autobuilder.
> 
> The patch below fixes the build here, but I'm not entirely sure it is
> the correct fix.
> 
> Since this is a risky change and we are close to release, I'd suggest to
> revert this change in master, and consider it again for next.

 Reverted.

 There's indeed a lot wrong with this...

> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 5ed149d57d31..3aefd1d0096e 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -135,8 +135,8 @@ copy_toolchain_sysroot = \
>  			$(call simplify_symlink,$$i,$(STAGING_DIR)) ; \
>  		done ; \
>  	fi ; \
> -       if ! find -wholename $(STAGING_DIR)'/lib/ld*.so.*' > /dev/null; then \
> -               find -wholename $${ARCH_SYSROOT_DIR}'/lib/ld*.so.*' -print0 | xargs -0 -I % cp % $(STAGING_DIR)/lib/; \
> +       if [ ! -e $(STAGING_DIR)/lib/ld*.so.* ]; then \
> +               find $${ARCH_SYSROOT_DIR} -wholename '*/lib/ld*.so.*' -print0 | xargs -0 -I % cp % $(STAGING_DIR)/lib/; \
>  	fi ; \
>  	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
>  		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
> 
> baruch
> 
>>> ---
>>> Changes v1->v2:
>>> 	Add SOB
>>>
>>>  toolchain/helpers.mk | 6 ++----
>>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
>>> index dfb2581ed5..5ed149d57d 100644
>>> --- a/toolchain/helpers.mk
>>> +++ b/toolchain/helpers.mk
>>> @@ -135,10 +135,8 @@ copy_toolchain_sysroot = \
>>>  			$(call simplify_symlink,$$i,$(STAGING_DIR)) ; \
>>>  		done ; \
>>>  	fi ; \
>>> -	if [ ! -e $(STAGING_DIR)/lib/ld*.so.* ]; then \
>>> -		if [ -e $${ARCH_SYSROOT_DIR}/lib/ld*.so.* ]; then \
>>> -			cp -a $${ARCH_SYSROOT_DIR}/lib/ld*.so.* $(STAGING_DIR)/lib/ ; \
>>> -		fi ; \
>>> +       if ! find -wholename $(STAGING_DIR)'/lib/ld*.so.*' > /dev/null; then \

 With no path, find defaults to the current directory. However, STAGING_DIR is
the full absolute directory, so wholename is never going to match it. It should
probably be

find $(STAGINGDIR) -wholename $(STAGINGDIR)/lib/ld*.so.*

 In addition, however, find's exit code doesn't say anything about whether it
was found or not. So we instead have to use the printed output and check if it's
non-empty.

 Finally, as an optimisation, we could use -quit to make sure it exits after the
first match instead of needlessly continuing.


 As Baruch said, however, this is too risky for master, so if a v3 comes it will
be applied to next.


 Regards,
 Arnout

>>> +               find -wholename $${ARCH_SYSROOT_DIR}'/lib/ld*.so.*' -print0 | xargs -0 -I % cp % $(STAGING_DIR)/lib/; \
>>>  	fi ; \
>>>  	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
>>>  		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
>>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
