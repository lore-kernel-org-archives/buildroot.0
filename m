Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83764CD1292
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 19:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27C19403AC;
	Sun,  7 Apr 2024 19:21:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8wvWEkL_w0Wy; Sun,  7 Apr 2024 19:21:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2679440B74
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2679440B74;
	Sun,  7 Apr 2024 19:21:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 482D91BF473
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3141340875
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:21:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 99vjSAqxyHux for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 19:21:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B7A6840876
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7A6840876
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B7A6840876
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 19:21:45 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-343c2f5b50fso2435684f8f.2
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 12:21:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712517703; x=1713122503;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6BpjLGeGoDJr87RJPyoHcKItHc0A/Dc7OoM6cCHBeJc=;
 b=NUb08GzTZERhPukwD5O+ObrrfOcHNZCAk4i95HcfeSNn8gzoRjbObGz0xYdDzdqTtb
 qmy6PNNBbd0hzmKfMy6Ar4FvZQw1PCSMmihpJdCVDCJogqNmAx3oeRyRqukGk0Qw0xFr
 MbyQ32in9qbnZimZuQgdmP+NicqdhhKD92tdFmRZ7do1rOfwxm+Yf+lcCdhlvKb4NrUA
 cfbIMAdpzdEOv5EhO+TqJAWWjt2rPfm6KpY+pJfb/Tma3w10O+Hb64uW6bJc42UtO1c4
 omM6J4a0tLyLKKyFVrEnKRgmL7l8mHwUg9Y9GkT+tf0NRaNCOxfC5GLsGVGIpxQtsyd0
 80TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2PG+NAtz2LtjKvbTMpafwsJpOOVTN6pOA5FeTyThQrBZacFOY3cRdEYx0ET74SSBi+7kcVT322DY4zl84AP6ZHoSjPL/0Uw==
X-Gm-Message-State: AOJu0Ywiw/Gpm/hQNHIDX9OQSrGCDaLQskFHL+u2EDIYt1I78yNWXQKi
 1yHq5wd7TlV7bEy0xPtOG97J8rMI1j5S07cjKn41mPvZFGnKba7Q+8ZFsH7ZIvf/5wOTBHsVD8F
 P
X-Google-Smtp-Source: AGHT+IFcgatErqg9JURI/tzqv/i0z8OGc9AZ2m+nWv7Ccg/My1mggC43QohN2mbAl0K8IWjQ2b1wlg==
X-Received: by 2002:a5d:4bc6:0:b0:343:6e18:5f09 with SMTP id
 l6-20020a5d4bc6000000b003436e185f09mr4567417wrt.12.1712517702852; 
 Sun, 07 Apr 2024 12:21:42 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 w18-20020a5d4b52000000b00343723c126asm7198053wrs.48.2024.04.07.12.21.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 12:21:42 -0700 (PDT)
Message-ID: <5ac0b14d-9df3-44a6-a7b6-490df5533a9d@mind.be>
Date: Sun, 7 Apr 2024 21:21:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Perale <thomas.perale@essensium.com>
References: <20240404124329.768546-1-thomas.perale@mind.be>
 <20240404124329.768546-3-thomas.perale@mind.be> <ZhLbfkgliWC2sR19@landeda>
Content-Language: en-GB
In-Reply-To: <ZhLbfkgliWC2sR19@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712517703; x=1713122503; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6BpjLGeGoDJr87RJPyoHcKItHc0A/Dc7OoM6cCHBeJc=;
 b=X0GhGXKhl+JmiL7nCw7p2G6+mbTBMSq8h4AkgZfGRIcGpuA3jvfC9k4U2mZN49bzXs
 K1EjTy8Q1mwl4UU8u6/39VfN5bBUESKZLnl4wutnLFJUEG7o9UXxBDOjW0y7LX3ZqMiv
 rSIDK8mV7iNsu0Wzp8uAKRhy0DLAJ0k/WazL9rPrHpP0XlHlq9ZTOCo9p/eT8VW8eItZ
 kVhyLOJ0m59eeHHDAr8s3qBC16XyMidTIpUnNti/zL+Q9NJKRX0XlN9I8Edt5LMEwmhx
 u9P0RKHyB7vxTCaN9FCUai9ndS0BALmw3XGdm+m8Xmu2cXuX3bd4dRMx5JyVrbsvIf+j
 S96Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=X0GhGXKh
Subject: Re: [Buildroot] [RFC PATCH 2/5] package/pkg-utils.mk:
 urlencode/urldecode macros
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
Cc: Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/04/2024 19:44, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2024-04-04 14:43 +0200, Thomas Perale via buildroot spake thusly:
>> This patch introduces two new macros:
>>
>>    - urlencode
>>    - urldecode
>>
>> URL encoding consists of converting ASCII characters into
>> a percent symbol followed by a two digit hexadecimal code.
>> And the other way around for URL decoding.
>>
>> The macros encode/decode a string passed as an argument by
>> escaping the following characters:
>>
>>    - '%' is replaced by %25
>>    - 'space' is replaced by %20
>>
>> The characters covered by this patch is non exhaustive.
> 
> Not sure what you meant with this sentence... Can you elaborate?

  It means that not all characters that normally are urlencoded (like /, :, #) 
are handled by this patch.

> Or did you mean that we can add more chars in the future?

  So yes, that.

  Regards,
  Arnout

> 
> Regards,
> Yann E. MORIN.
> 
>> Because the Make language treats spaces as different entry of a list,
>> the aim of those macros is to provide a well known encoding method
>> to escape text containing spaces into a string that won't be
>> treated as a list by the Make language.
>>
>> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
>> ---
>>   package/pkg-utils.mk | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
>> index 723bbe4e24..b8cfb85fca 100644
>> --- a/package/pkg-utils.mk
>> +++ b/package/pkg-utils.mk
>> @@ -329,3 +329,15 @@ define NXP_EXTRACT_HELPER
>>   	find $(@D)/$(basename $(notdir $(1))) -mindepth 1 -maxdepth 1 -exec mv {} $(@D) \;
>>   	rmdir $(@D)/$(basename $(notdir $(1)))
>>   endef
>> +
>> +# urlencode -- returns an url encoded string.
>> +#   - encode % into %25
>> +#   - encode spaces into %20
>> +#
>> +# $(1): text
>> +urlencode = $(subst $(space),%20,$(subst %,%25,$(1)))
>> +
>> +# urldecode -- decode an url encoded string.
>> +#
>> +# $(1): text
>> +urldecode = $(subst %25,%,$(subst %20,$(space),$(1)))
>> --
>> 2.44.0
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
