Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A04DC433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 22:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B495141CA0;
	Fri, 22 Apr 2022 22:19:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J4TYIQ32VHhZ; Fri, 22 Apr 2022 22:19:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 813B041C93;
	Fri, 22 Apr 2022 22:19:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5691F1BF2BE
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 22:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BC5E40AFC
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 22:19:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E5LhyuZnzper for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 22:19:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3003840195
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 22:19:31 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id a1so6365616edt.3
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 15:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OoUeMhtxIxnR8YS20mAQBg/nmtNRmmYh/SbTklcEkjg=;
 b=UUvr1au+GZhOymioh62L8ruqmz3gkbkWmrC9c5IkyfC01klfpjxQ2WX1vaMslO+ipf
 zm42+KAr6i82THTbuExrB+uYrAKQ89Cx092OlqvcADh560wu7gTLfq1UJqGfc8eW60Hy
 SuEFjTyix8hoFvDhglCRVfBgdqpdD+PUa7m+Dg/CZ1zRRtUz4ie9oqbS/fxn22Us+VB1
 bNzj5HCWOTUbmQGp2t56akpULNqXp1xCfLSRjDOY8Wlr3z8h3+KYTZepRbEj8Ow6Xnm0
 2vBUDlgpRF9CjRHKwHUA4wA62lQDv+qwQjw4J+tCV96JIyho/bFV4+62LxRUxGgMzoHW
 VY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OoUeMhtxIxnR8YS20mAQBg/nmtNRmmYh/SbTklcEkjg=;
 b=z1nbRCb/XuePmT++N7UEfC19o7iwnyzwRMIMmT85jJVsb2EobztR5ogIcSnGJM405d
 hZDsHP2aWvjSsU40YUPDTEHKQx0y3wKoJfZUPbYVH2Os1keba6jz7zbpPRQFUuuPD5BS
 Vh3WL1+Ol6X9vrMCcuV7rWzZk9aiqZxDu2CNPu9B0L3tsUHEyNI24ktPYoZTu0cO3UDd
 n90EkmVpqg6jnAtLoNycDVmeRXzBc0FYspcJ0huLXpOnQMWjpxR313WBSMhBjThcts0m
 vJqChvKCQB6Q65kcDpL39JsdOQxgCF7UcgjZVQM+QiL9oP0Y3Y1T0f2eTa0QrgiysuWo
 YLeQ==
X-Gm-Message-State: AOAM531wqQK5nBkWf11vaWaBGqq7vURPwNqVaCElYPisdAL0fq2EGvLB
 cBVu/TIycpq+DfuTboGxZ2Ie8A==
X-Google-Smtp-Source: ABdhPJzJq6rKhfOmqO0q0cIfhweOP59apJYHCEYfujmYKxTtysWFICb7kUXY5jJ/kmMNvm8Cw7F41Q==
X-Received: by 2002:a50:d087:0:b0:41d:7ea6:462a with SMTP id
 v7-20020a50d087000000b0041d7ea6462amr7236739edd.355.1650665970115; 
 Fri, 22 Apr 2022 15:19:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a056402231100b0041d98ed7ad8sm1404840eda.46.2022.04.22.15.19.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 15:19:29 -0700 (PDT)
Message-ID: <8f21f80b-07ae-24ce-a84c-94666edb0381@mind.be>
Date: Sat, 23 Apr 2022 00:19:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Joseph Kogut <joseph.kogut@gmail.com>
References: <20220422181418.2411463-1-joseph.kogut@gmail.com>
 <20220422181418.2411463-2-joseph.kogut@gmail.com>
 <5eced090-c6ac-21fb-3206-f3c0ff0f2e74@mind.be>
 <CAMWSM7hkKNzn4SysPsa-9R51GZq-T67HAAh0fkBEY1zGRZt5yA@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAMWSM7hkKNzn4SysPsa-9R51GZq-T67HAAh0fkBEY1zGRZt5yA@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 2/2] package/libcurl: add host-nghttp2 to
 host deps
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
Cc: Matt Weber <matthew.weber@collins.com>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/04/2022 00:09, Joseph Kogut wrote:
> On Fri, Apr 22, 2022 at 2:56 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 22/04/2022 20:14, Joseph Kogut wrote:
>>> This fixes building host-libcurl, which otherwise would fail with
>>> undefined references to nghttp2 symbols.
>>>
>>> /usr/bin/ld: ../lib/.libs/libcurl.so: undefined reference to `nghttp2_pack_settings_payload'
>>> /usr/bin/ld: ../lib/.libs/libcurl.so: undefined reference to `nghttp2_http2_strerror'
>>> /usr/bin/ld: ../lib/.libs/libcurl.so: undefined reference to `nghttp2_submit_request'
>>> /usr/bin/ld: ../lib/.libs/libcurl.so: undefined reference to `nghttp2_submit_rst_stream'
>>
>>    I guess this happens because it somehow finds libnghttp2 installed on the host
>> but then fails to link with it? In any case, we don't actually need host-libcurl
>> to be built with nghttp2 I think. So just pass --without-nghttp2.
>>
> 
> It seems so. I think either providing the library or disabling it will
> work fine, I just didn't want to assume what other users need here.
> I'll respin with that config, thanks for the review.

  Actually, host-libcurl was only added for host-cargo. When host-cargo was 
removed, we should have removed host-libcurl as well.

  So the even better solution would be to simply revert commit 
736e0fc5d6103300fb5d6b0cde5e22ce978b8a80.

  How did you even run in to this error? There should be no reason to build 
host-libcurl...

  Regards,
  Arnout

> 
>>
>>    Regards,
>>    Arnout
>>
>>> <snip>
>>> collect2: error: ld returned 1 exit status
>>>
>>> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
>>> ---
>>>    package/libcurl/libcurl.mk | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
>>> index 97857954db..d5805a1d32 100644
>>> --- a/package/libcurl/libcurl.mk
>>> +++ b/package/libcurl/libcurl.mk
>>> @@ -173,7 +173,7 @@ endef
>>>    LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_TARGET_CLEANUP
>>>    endif
>>>
>>> -HOST_LIBCURL_DEPENDENCIES = host-openssl
>>> +HOST_LIBCURL_DEPENDENCIES = host-openssl host-nghttp2
>>>    HOST_LIBCURL_CONF_OPTS = \
>>>        --disable-manual \
>>>        --disable-ntlm-wb \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
