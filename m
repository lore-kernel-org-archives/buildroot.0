Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714A3C636D4
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 21:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 116674179A;
	Wed, 15 Feb 2023 21:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 116674179A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9KdnOPZugTT9; Wed, 15 Feb 2023 21:46:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F395C401D6;
	Wed, 15 Feb 2023 21:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F395C401D6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EF8511BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8F6B61082
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8F6B61082
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PAWomTDWa7Dn for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 21:46:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED53960BE6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED53960BE6
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 21:46:24 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id t24so479418eji.4
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 13:46:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AVrPQFJWJq7XGTmNfV/gMaFjgmXESxvMXUHY8IYjBSY=;
 b=O23BvhJCGSii6rhLQsG10q4wMw2D2GhMLMSUNzjktVzPRHgC6QjJwtAhPLGAJDn6Gf
 uf7AdwhKqs93Tdt3eDkpTQwPj3DH8DAqJpz+/m/zNHC0YJUdlhrjzrxJCYvwa8MwTsSd
 Uz8VdmuxY28T6A81DftEQor72kQ0+GXdxRNHOnmLSfVS2UcRNBFrTFDthnlI5E4TbtJQ
 M5kb0WDE3OfFdRr9yyxlNoll00RmoUP6G6sntYWeUSrqtXGx6yE3t5OS0ZubfVwDij2M
 Beaxw8vgVxFGgdTNPrlv9B7nKq2kn4BgrCBm0JqTIvcTwyVRbMmz8zxpT1wEGCHDSk3u
 9zeA==
X-Gm-Message-State: AO0yUKUfMNf+e2BHtJ1VbaEtv9ZI3jM3hKFpdvTwmAT13jzvFDgkBVyM
 npMlp+tkoNqZYAXnaaB4uyfx3LWWRId7eZBr
X-Google-Smtp-Source: AK7set+LTh9W/rLjEtzZfiuLmw0wFsoMI5NPpNHZh6lmNlrU9Iv9skkqu19CxTGuuE8KrEQilkKqBA==
X-Received: by 2002:a17:907:2bcf:b0:886:843b:e695 with SMTP id
 gv15-20020a1709072bcf00b00886843be695mr3672757ejc.22.1676497582805; 
 Wed, 15 Feb 2023 13:46:22 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a170906841100b008b149e496e5sm998690ejx.163.2023.02.15.13.46.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 13:46:21 -0800 (PST)
Message-ID: <5ee9bd2b-3a6e-7de3-9bc8-168e0639c5af@mind.be>
Date: Wed, 15 Feb 2023 22:46:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>
References: <20230215211531.331246-1-james.hilliard1@gmail.com>
 <e581867a-6166-3a05-1d6a-af4373610f39@mind.be>
 <CADvTj4ocjP2JLa8UC6-shMf0rGGxF+T2NkAGOsdjiXeVYXTFLw@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <CADvTj4ocjP2JLa8UC6-shMf0rGGxF+T2NkAGOsdjiXeVYXTFLw@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AVrPQFJWJq7XGTmNfV/gMaFjgmXESxvMXUHY8IYjBSY=;
 b=FQHe3o04IwITXjsebHDBroQHkgbfhLztndUTYFzwg1N89k/4wliEs/ncdPD3MbYMic
 ktGBlstftkre81zcREqfq26Jb50faO/2RnOU5d6pX2vUa92Qc/DMAd1cCApmH3l7PFdt
 Sqrqc+DxLxrMofcjwEKjnUt3zHFw5tG7i1z5PCDrPbDSdFtPBJPmF/uwmx0fYcGrQEKG
 tQzZ2L3M8Bx488hfjLW3FJe/VFwuVx2yrBF35UbMUTsoMVBP5eVX38W+Hh8ANLVTlQcZ
 v6dtTEL0ErkjxeN7CwxyslJsbwS8n3ZG1jQHKh2tc+FVVrFOg7e1a1A7eq8hlMX+nQcI
 RO1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FQHe3o04
Subject: Re: [Buildroot] [PATCH v2 1/1] utils/genrandconfig: make default
 toolchain_csv path absolute
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



On 15/02/2023 22:29, James Hilliard wrote:
> On Wed, Feb 15, 2023 at 2:20 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 15/02/2023 22:15, James Hilliard wrote:
>>> The default toolchain_csv path is a relative path to the buildroot
>>> directory.
>>>
>>> If we run genrandconfig with a cwd that is not the buildroot directory
>>> the default toolchain_csv path will be wrong.
>>>
>>> To fix this make the default toolchain_csv path absolute.
>>>
>>> Fixes:
>>> FileNotFoundError: [Errno 2] No such file or directory: 'support/config-fragments/autobuild/toolchain-configs.csv'
>>>
>>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>>> ---
>>> Changes v1 -> v2:
>>>     - set default path as absolute
>>> ---
>>>    utils/genrandconfig | 4 +++-
>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/utils/genrandconfig b/utils/genrandconfig
>>> index b3576f8a51..3552b83694 100755
>>> --- a/utils/genrandconfig
>>> +++ b/utils/genrandconfig
>>> @@ -801,7 +801,9 @@ if __name__ == '__main__':
>>>                                    dest="toolchains_csv",
>>>                                    help="Generate random toolchain configuration",
>>>                                    action='store_false')
>>> -    parser.set_defaults(toolchains_csv="support/config-fragments/autobuild/toolchain-configs.csv")
>>> +    buildroot_abs = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
>>> +    parser.set_defaults(toolchains_csv=os.path.join(buildroot_abs,
>>> +                        "support/config-fragments/autobuild/toolchain-configs.csv"))
>>
>>    Sorry, that's not going to work either (if it was that easy I'd done it myself :-)
> 
> Under what scenario would this break?

  I have ~/src/buildroot/utils in my PATH, so I just run 'genrandconfig' from 
path. If I want to run it in a different worktree (e.g. ~/src/buildroot-next 
which tracks the next branch), I would go to that directory and run 
"genrandconfig", so it would use the one in ~/src/buildroot, not the one in 
~/sr/buildroot-next. In that case, of course, I want to use the 
toolchain-configs.csv from the next branch, not the one from ~/src/buildroot.


>>    buildrootdir can be set to something else with the -b argument, and we want it
>> relative to *that* one of course.
> 
> Using buildrootdir is cwd dependent,

  The default value is cwd dependent; the value you give with the -b option can 
be absolute or relative.

> the approach I used is not as it uses the
> absolute path of the genrandconfig file to compute the default toolchain_csv
> abs path.

  And my point is that it should be relative to the buildrootdir given with the 
commandline option, not relative to the place where genrandconfig happens to reside.

  TBH, I think genrandonfig has too many options :-)

  Regards,
  Arnout

> 
>>
>>    Regards,
>>    Arnout
>>
>>>
>>>        args = parser.parse_args()
>>>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
