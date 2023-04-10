Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E767C76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 19:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F13361379;
	Mon, 10 Apr 2023 19:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F13361379
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3iY8AKsL3aJ1; Mon, 10 Apr 2023 19:11:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7487E60E92;
	Mon, 10 Apr 2023 19:11:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7487E60E92
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B3BE11BF316
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CEB58210E
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:11:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CEB58210E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WDq2-o3jITYg for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 19:11:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8580F82033
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8580F82033
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 19:11:19 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id jg21so14374935ejc.2
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 12:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681153877;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XefkHwmmM6cXUesk/2eSmCbsgI6nouATo1DjUgZxIaU=;
 b=arKI45noOqqoD218QNW0oWg0JJpdyCBWhpx/NHj4iT9NuShbSJUAmDHj/bJJ5ie3s+
 6X3nW/MCMxsb+GGJm2ebsmq/Him8/foVZvQ9m3M8mdu/6q7uCfm68hVKH4W1y/uMP5ch
 9Xuf1sCdXiSLVGcWr546RpSU+8cvFbzJnzo7aHL1KLCrTpob63DIQ1OajpJugzqogeNz
 CDXEPjgx7H5p3fp8F6QT2wFPsIQVC0wrT3B5Xs8tzoszCTKeHIee3FT9kLRhwM0nLpz9
 xYHfMo1OKZ8JY2WD84a4fZHf6kSHsOZJvgNCMqAYllOq+Uc28usDJo7POsITmRxZ1eaF
 rgRg==
X-Gm-Message-State: AAQBX9ez74t/YEENtwRwY3olKGw4CLyhasBGdrM0blMJBmjPYx6qvGtq
 mD7ROMhCUrbB9iwzXz7tzP3TSQ==
X-Google-Smtp-Source: AKy350bpBKEdl545lXp8MTSIt5ZwTEaOWd0HdAT4YsvlTwJYsJ+eb2nFelXWRzSBhPcQz+YBTWRGDw==
X-Received: by 2002:a17:906:2706:b0:947:71bf:ca19 with SMTP id
 z6-20020a170906270600b0094771bfca19mr7005751ejc.65.1681153877607; 
 Mon, 10 Apr 2023 12:11:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a170906768e00b0094a64196ed6sm1975214ejm.54.2023.04.10.12.11.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 12:11:17 -0700 (PDT)
Message-ID: <c6a363fc-beda-6046-dfa9-46d90ad79886@mind.be>
Date: Mon, 10 Apr 2023 21:11:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, Vincent Fazio <vfazio@gmail.com>
References: <20230403013530.3502-1-vfazio@gmail.com>
 <20230410174428.GH2819@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230410174428.GH2819@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681153877;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XefkHwmmM6cXUesk/2eSmCbsgI6nouATo1DjUgZxIaU=;
 b=gIV4NN77G06kAUbQqninbuJAHWwIzC/fD0Gkn+o8gn1TE+dVusTEqX3w+DqObGor51
 dzVPt5joNup9NyL6y0gKUBXHpH5zVc5GQUCTVcGQ04yH5HSR5R5PcRuzdmA5gRAmWCcS
 E098jN+1ORj48L2a6nNOPz5yJSdzR2wOFwrasVxR6M53G/vH5yFy7Rvo0rknc0ABOmRu
 qxuR+eaz8J2QfRwuvf7CnFjFD14/VJ5bsQwLf5jY4Ds0/G/j74TNEG/QlfoGfqda+DJB
 fYWJWRavr3/O7R55t/nl2L6N1GPpbQJ4nVanZn1IrZpcYsa1eJL2RPHUw7o6q/24POtW
 JXgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gIV4NN77
Subject: Re: [Buildroot] [PATCH] utils/check-package: drop six usage
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/04/2023 19:44, Yann E. MORIN wrote:
> On 2023-04-02 20:35 -0500, Vincent Fazio spake thusly:
>> The shebang in check-package now defines python3. There is no longer a
>> need to maintain support with python 2.x.
>>
>> See-also: 02b165dc71 (check-package: fix Python3 support)
>>
>> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
>> ---
>>   utils/check-package | 10 +++-------
>>   1 file changed, 3 insertions(+), 7 deletions(-)
>>
>> diff --git a/utils/check-package b/utils/check-package
>> index 98a25bd0b2..46f2897b51 100755
>> --- a/utils/check-package
>> +++ b/utils/check-package
>> @@ -6,7 +6,6 @@ import inspect
>>   import magic
>>   import os
>>   import re
>> -import six
>>   import sys
>>   
>>   import checkpackagelib.base
>> @@ -218,12 +217,9 @@ def check_file_using_lib(fname):
>>           if fail > 0:
>>               failed.add(name)
>>           nwarnings += warn
>> -    if six.PY3:
>> -        f = open(fname, "r", errors="surrogateescape")
>> -    else:
>> -        f = open(fname, "r")
>> +
>>       lastline = ""
>> -    for lineno, text in enumerate(f.readlines()):
>> +    for lineno, text in enumerate(open(fname, "r", errors="surrogateescape").readlines()):
> 
> Err.. This leaks a file object, no?
> 
> Even if the script is short-lived, it is better to properly close()
> files once they are unused.

  It doesn't leak. It just doesn't close the file until some unspecified time in 
the flow. In this case it's actually pretty well specified: it closes after the 
readlines() call ends because the file object has no more references.

  So no, a context manager isn't really needed here.

  Regards,
  Arnout

> 
> Here, I believe using a context manager is adequate (and relatively easy
> now that we do no longer have to deal with two ways if opening the
> file):
> 
>      with open(fname, "r", errors="surrogateescape") as f:
>          for lineno, text in enumerate(f.readlines()):
>              ...
> 
> Regards,
> Yann E. MORIN.
> 
>>           nlines += 1
>>           for name, cf in objects:
>>               if cf.disable.search(lastline):
>> @@ -233,7 +229,7 @@ def check_file_using_lib(fname):
>>                   failed.add(name)
>>               nwarnings += warn
>>           lastline = text
>> -    f.close()
>> +
>>       for name, cf in objects:
>>           warn, fail = print_warnings(cf.after(), name in xfail)
>>           if fail > 0:
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
