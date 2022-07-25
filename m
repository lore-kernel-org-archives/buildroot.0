Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E08C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 15:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B381260C0D;
	Mon, 25 Jul 2022 15:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B381260C0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id plI0H_77TIR2; Mon, 25 Jul 2022 15:03:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17CA16129A;
	Mon, 25 Jul 2022 15:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17CA16129A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 38B721BF3AA
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 15:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F31A61299
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 15:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F31A61299
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O6hfgxmdFWoo for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 15:03:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6B4061298
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6B4061298
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 15:03:12 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id u5so16384422wrm.4
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 08:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ztz1PfjOjhQ6ik5dx3k2wgAr4r/eL/mWdbChkk5dQtA=;
 b=y5y6FTomZtvHqq2U+GEak3mD0VmN4VYxqRmXSd9jw+UA9fDZtvzSz/2c3+0N9qzm2m
 OBZOm/E41zUpMck5hkiEhaoqQPKRvmkydogVjZp9bLbcncvnKX1NtNjdvosbEynytCIw
 jd7XAJEaCLD0H6vO3hDpS5CT0YRKs4IOwf9NKBk0Zh0hGNXZMZz1roFvDTHy/UAzdqwl
 yed1IiJvVUJ2fyHWSNKVlmOzjqDY4RPEFdiyD5iBsOP4uP+LxDBnUbY/dc/iqZNvPjjw
 N8vaMYIXVS9FDB9RdESnBeDFaahdVx8dzd3gF4yyDY2DkrONEzzWHnW7IXqljYVDL2HR
 buZw==
X-Gm-Message-State: AJIora/6CDH6mLC9Nh7Wma4oLmrseRzGP18OykkfLPU5/PFMaapmTla1
 SwqYclU4D61QpK4av5ANJaYJIg==
X-Google-Smtp-Source: AGRyM1vVIHDQzWjgcDFNcutr/8Q+FLj9gX2EigK0e21Ir7Hze4Mg8CuWFtI9k4IInAaTuRXctGKmtQ==
X-Received: by 2002:adf:f5cf:0:b0:21e:2ebc:4126 with SMTP id
 k15-20020adff5cf000000b0021e2ebc4126mr8113572wrp.195.1658761390426; 
 Mon, 25 Jul 2022 08:03:10 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 q9-20020adfaa49000000b0021e7e050404sm7369755wrd.117.2022.07.25.08.03.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 08:03:10 -0700 (PDT)
Message-ID: <1dcaf0d5-b00e-b5cb-0c14-f064a90bedb8@mind.be>
Date: Mon, 25 Jul 2022 17:03:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 TIAN Yuanhao <tianyuanhao3@163.com>
References: <20220725120927.348160-1-tianyuanhao3@163.com>
 <20220725142854.GF3168@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220725142854.GF3168@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ztz1PfjOjhQ6ik5dx3k2wgAr4r/eL/mWdbChkk5dQtA=;
 b=Mtdd50RXbwoawfabd+6/xpQF3pd7TrVnHuPcLK4vsEGF5Nw/kb9h/futGPwJerenNJ
 HxMIwlwqZHQWZypYA7MB+E4/Rgn8+JNx+oqDM9qp8tViLrT5t50oFDze2g9Y5SOacHHc
 UsR9sX8CQLwVjQd17oo6jineL7Fl4A/fmo/aRg2Q/JlVebUdzQb93Y2B1401Yub1PNdw
 8+F1rO4J7CKbCAz8vLy2iIDai8OJQsN73+iAamEX925TYhCihFc5GumPDXTLwBmekpDj
 xFv9jT4DJeKwNkVHDxjqGiOK/rd97vl4cz4PFEErQLWpVsr18QtQWntiJm143eJxJ8JE
 c06Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Mtdd50RX
Subject: Re: [Buildroot] [PATCH] package/pkg-utils: prevent
 KCONFIG_ENABLE_OPT from changing =m to =y
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/07/2022 16:28, Yann E. MORIN wrote:
> TIAN Yuanhao, All,
> 
> On 2022-07-25 05:09 -0700, TIAN Yuanhao spake thusly:
>> The KCONFIG_ENABLE_OPT is intended to enable a required kernel configuration
>> option when a package requires it.
>>
>> However, this will often override an existing enabled module with `=m` with `=y`
>> which overrides the module to be built-in instead of separate.
>>
>> This is undesirable behavior; we often want these as `=m` and not `=y` to reduce
>> the size of the kernel image.
>>
>> This patch changes KCONFIG_MUNGE_DOT_CONFIG to prevent changing `=m` to `=y`.
>>
>> Signed-off-by: Christian Stewart <christian@paral.in>
>> Co-authored-by: TIAN Yuanhao <tianyuanhao3@163.com>
>> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
>> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
>>   package/pkg-utils.mk | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
>> index 7d1aea7710..2edd542ba9 100644
>> --- a/package/pkg-utils.mk
>> +++ b/package/pkg-utils.mk
>> @@ -22,12 +22,17 @@ KCONFIG_DOT_CONFIG = $(strip \
>>   
>>   # KCONFIG_MUNGE_DOT_CONFIG (option, newline [, file])
>>   define KCONFIG_MUNGE_DOT_CONFIG
>> -	$(SED) "/\\<$(strip $(1))\\>/d" $(call KCONFIG_DOT_CONFIG,$(3))
>> +	$(SED) '/^\(# \)\?$(strip $(1))\>/d' $(call KCONFIG_DOT_CONFIG,$(3)) && \
> 
> This change should not be needed. We now check that the value is already
> set, and if it is, then we do not touch it. So, if we hit this code, it
> means we will want to remove any line that has that option.

  It's still called from KCONFIG_SET_OPT and KCONFIG_DISABLE_OPT without any 
condition.

  It's true that removing the old line is not strictly needed because the new 
line is appended and thus takes precedence, but you get an ugly warning.


> Additionally, since the option is enclosed with \< and \>, then only
> full-word will match. I.e. if option if DOO, then none of FOO_BAR,
> BAR_FOO, or BAR_FOO_BUZ would match, so we don't need to optionally
> match the leading comment symbol.

  Didn't you yourself give the example of

CONFIG_FOO="foo"
CONFIG_BAR="$(CONFIG_FOO)"

where the original expression would also match the CONFIG_BAR line? Arguably, 
however, that's a separate issue from what gets fixed here.

> 
>>   	echo '$(strip $(2))' >> $(call KCONFIG_DOT_CONFIG,$(3))
>>   endef
>>   
>>   # KCONFIG_ENABLE_OPT (option [, file])
>> -KCONFIG_ENABLE_OPT  = $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=y, $(2))
>> +# If the option is already set to =m or =y, ignore.
>> +define KCONFIG_ENABLE_OPT
>> +	$(Q)if ! grep -q '^$(strip $(1))=[my]' $(call KCONFIG_DOT_CONFIG,$(2)); then \
>> +		$(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=y, $(2)) || exit 1; \
> 
> The return code of an if statement is the one from the last command in
> the list. In this case, KCONFIG_MUNGE_DOT_CONFIG expands to a single
> (compound) command, so if it fails, the if statement will fail, and so
> the if statement will fail. So, the  "|| exit 1"  here should not be
> needed.

  Still, it's defensive programming to have it. Otherwise, if someone later adds 
another line in the condition, they have to remember to add the || exit 1.

> Additionally, if we ever change KCONFIG_MUNGE_DOT_CONFIG to be multiple
> commands, the  "|| exit 1"  would only apply to the last, so that would
> not catch all failures either.

  That, on the other hand, is a valid argument.


  Regards,
  Arnout


> 
> Applied to master, after:
>    - reverting the SED match
>    - dropping the || exit 1
> 
> Thanks!
> 
> Regards,
> Yann E. MORIN.
> 
>> +	fi
>> +endef
>>   # KCONFIG_SET_OPT (option, value [, file])
>>   KCONFIG_SET_OPT     = $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=$(2), $(3))
>>   # KCONFIG_DISABLE_OPT  (option [, file])
>> -- 
>> 2.25.1
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
