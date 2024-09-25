Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B20CCF9E7
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 18:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E68180B8C;
	Wed, 25 Sep 2024 18:16:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hYcQHV_s8xvO; Wed, 25 Sep 2024 18:16:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5699A80AC7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5699A80AC7;
	Wed, 25 Sep 2024 18:16:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E305E1BF408
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 18:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DED646118A
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 18:16:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HrFI4VTRBTZG for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 18:16:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AC09961189
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC09961189
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC09961189
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 18:16:30 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-42cb1e623d1so905065e9.0
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 11:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727288188; x=1727892988;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mxMCvxzZMttL44DQHkRTs026G3IDBewu8L6JW48Vt4s=;
 b=YxbRYUNAPj7JU8ki31fXOS4wlyBMnBdLo9Tgbt+fBs5ZENjvqqAQRDmcd0wpAu5uIk
 lELhM+XK22fqWlH05PqC6nG2zKbOFE0F9Mox8imMxIqi4fjxLDgdtorERgLPno5LTc1n
 1ZZclbdUnj3Rbrvte6pkoohcR2bjgqQIIGWJW+VwMiZrATxubK0rTZc7niJp6DxI3CRg
 V6D5TWdNMnrlXrgO+ygiFz/XG+KBLSa46HXl6yMMLSdWEksbK0twRT4Pw7xEWfwv3GPd
 LkE9yB5jCpn3UHHmAN1nQO53s5pq8yLP5EWwJzXu4+eWg4NZRYg2y+XkZ6vsGMmVZX/K
 6FBg==
X-Gm-Message-State: AOJu0YxKMPlwHBKNps2X9lNXraXlCaPG6/tvOomSqD69ALKoEeGFovlz
 lc+NGMcAdxGI4CpeHkAPZ/8cIQJ0/2NVtk6mKNHxUVSN221sx8g7VitHWSgr4+Nz1cukSM0PnB/
 7
X-Google-Smtp-Source: AGHT+IF1u84eMKIJwQvKGlK7qMe/2PrhGT2B3Pn5KmeEYSUJzDDVvVzsys8mPV3igWpBRYkPSMwypQ==
X-Received: by 2002:a05:600c:1d27:b0:426:61e8:fb3b with SMTP id
 5b1f17b1804b1-42e961362f3mr25582675e9.27.1727288188062; 
 Wed, 25 Sep 2024 11:16:28 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a0d8eesm26090805e9.30.2024.09.25.11.16.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 11:16:27 -0700 (PDT)
Message-ID: <eaaf3c99-164a-49aa-a6e3-327ae1b51c1b@mind.be>
Date: Wed, 25 Sep 2024 20:16:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, Baruch Siach <baruch@tkos.co.il>
References: <6dfb1699dfbfa78e9b6c13701e0ab88dfcc5e8ce.1727283179.git.baruch@tkos.co.il>
 <ZvRJEtRs7CrOPhr8@landeda>
Content-Language: en-GB
In-Reply-To: <ZvRJEtRs7CrOPhr8@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1727288188; x=1727892988; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mxMCvxzZMttL44DQHkRTs026G3IDBewu8L6JW48Vt4s=;
 b=L7v0OBXm7E7r7YxkUWGfuOrR/F6JKFnB7XWy89HGRoLupRrcRc34D5Dm8QNUu+FDiK
 N/Q+fXMYAjWRNaD/lhh6nUmuHOZO19/LikxiuYI8U4wPTpS4N1gq/6IAgxBmsk78wLFc
 P7goxC9R14gf6Kb8bVauGOmoYk2+OmuJSOsUW04ScmYnhEl0kGEDNaIlXJsECfDzJ/Vf
 OHscvLJglpGeltgxVdA3vV8BwPqgsRnY9IqDtP91EWFekFDdo2I8k9HqMet0UaF9ge0W
 5RMT/bx+DK0hxKh/lnFyzE6OtQGph6ulhc8nqSi2sVZnFkAA4bmY7v/IfGVJTyUWBQ6F
 P9YQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=L7v0OBXm
Subject: Re: [Buildroot] [PATCH] Revert "package/cURL: fix static link whith
 openSSL"
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/09/2024 19:32, Yann E. MORIN wrote:
> Baruch, All,
> 
> On 2024-09-25 19:52 +0300, Baruch Siach via buildroot spake thusly:
>> This reverts commit 61d322c3d258072460fddbab0b39c8bf4cc3e0bc.
> 
> This is not a revert. A revert is for when the commit was faulty or
> wrong, at the time it was applied.
> 
> However, in this case, the commit was correct back then. It is just that
> what it does is no longer needed now.
> 
> I've rephrased the commit log accordingly.

  FYI, I like to phrase it as:

     package/libcurl: drop link-with-openssl workaround

     Upstream curl commit f057de5a1a950 ("libcurl.pc: add `Requires.private`,
     `Requires` for static linking") deals with proper pkg-config
     configuration since version 8.9.0.

     We no longer need to modify libcurl.pc in Buildroot.

     This reverts commit  61d322c3d258 (package/cURL: fix static link
     whith openSSL).

(I.e. still use the "This reverts commit ..." pattern that `git revert` creates.)


  Regards,
  Arnout

> 
> Applied to master, thanks.
> 
> Regards,
> Yann E. MORIN.
> 
>> Upstream curl commit f057de5a1a950 ("libcurl.pc: add `Requires.private`,
>> `Requires` for static linking") deals with proper pkg-config
>> configuration since version 8.9.0.  Our local libcurl.pc modification is
>> no longer needed.
>>
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> ---
>>   package/libcurl/libcurl.mk | 5 -----
>>   1 file changed, 5 deletions(-)
>>
>> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
>> index b81e3551951b..9bf7724e7d54 100644
>> --- a/package/libcurl/libcurl.mk
>> +++ b/package/libcurl/libcurl.mk
>> @@ -190,11 +190,6 @@ LIBCURL_CONF_OPTS += \
>>   	--disable-tftp
>>   endif
>>   
>> -define LIBCURL_FIX_DOT_PC
>> -	printf 'Requires: openssl\n' >>$(@D)/libcurl.pc.in
>> -endef
>> -LIBCURL_POST_PATCH_HOOKS += $(if $(BR2_PACKAGE_LIBCURL_OPENSSL),LIBCURL_FIX_DOT_PC)
>> -
>>   ifeq ($(BR2_PACKAGE_LIBCURL_CURL),)
>>   define LIBCURL_TARGET_CLEANUP
>>   	rm -rf $(TARGET_DIR)/usr/bin/curl
>> -- 
>> 2.45.2
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
