Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7262CC6FD18
	for <buildroot@archiver.kernel.org>; Wed, 29 Mar 2023 08:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B88F141DB9;
	Wed, 29 Mar 2023 08:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B88F141DB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I81teAphWiz9; Wed, 29 Mar 2023 08:44:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBE1E41DCE;
	Wed, 29 Mar 2023 08:44:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBE1E41DCE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BADE41BF59E
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 08:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 945E840610
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 08:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 945E840610
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oc77m6_3Wxit for <buildroot@lists.busybox.net>;
 Wed, 29 Mar 2023 08:44:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED9DF4031D
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED9DF4031D
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 08:44:42 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id b20so60237650edd.1
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 01:44:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680079481;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oK+u/TAn8EHUQY3IxCkC+iTJrzayjLA1Zlc+sD5ovHY=;
 b=3G4oVWkrV6Vi5HS6pMcC3JrZvi5PoKtSpMPToDsbij7Uw62cV6h/K6cPlTF0/sXcND
 /yNNfHgWdJB2cdXaQSVlQaEzWvYGb3Mc48PJ64/d57WjxL87qZKznyjLUr1V2oJfNp78
 qLUbJsujINI7QXMgl3ZwdFgkylaA8tTTDseiwub3kyHDMJ4lxrUBp1NG8k/VEu03hCM2
 e4hecCim9V+2N3ylzL5qcX+xiy51LjI5UYqHln+6bGeQPYcLXOXGS5kRgQBJ/HUkJ+B4
 8MpLTxEZykQDbRWaZgyd43ziMXV1FVjJMvcbB33bWwox5/szYjNP51Q4AWn2yn/BJS5P
 CRuw==
X-Gm-Message-State: AAQBX9fY/8028vuMFF4X3NEnNslpHxXX5bhjN1zIOkzN+oGki9EUsruZ
 ZbFJdeEK4tuNFjRn43kdQo88PQ==
X-Google-Smtp-Source: AKy350bIrZH1vmY1X6QOpxG0Q4RqT6O3mzo1U3k98o4vcgS91FsjuFwXbwQGRpTTs2NZUnNnp8wFfg==
X-Received: by 2002:a17:906:3485:b0:922:c4f8:806c with SMTP id
 g5-20020a170906348500b00922c4f8806cmr18211358ejb.60.1680079481017; 
 Wed, 29 Mar 2023 01:44:41 -0700 (PDT)
Received: from [10.1.0.169] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 q30-20020a50aa9e000000b004fadc041e13sm16767358edc.42.2023.03.29.01.44.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 01:44:40 -0700 (PDT)
Message-ID: <c7968ace-cfbb-1c54-bdde-083a37423686@mind.be>
Date: Wed, 29 Mar 2023 10:44:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Florian Fainelli <f.fainelli@gmail.com>
References: <20230326130937.56650-1-f.fainelli@gmail.com>
 <20230328202533.GD3204460@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230328202533.GD3204460@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1680079481;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oK+u/TAn8EHUQY3IxCkC+iTJrzayjLA1Zlc+sD5ovHY=;
 b=ZmJ5ImS+0X2gXhYRnFD9VbJpZjFHCafxmQKxTakRjNsrCWV5zOyDmwsM1qsOt0eBt8
 Ise2nXVaxXuzE2Fyy83VNBYZS8nymj10FPs9/lN7JFLCiw9PdRTWY6l/WbWbMgOYLbrc
 Y0ldugN66QHInG1c2yD/mnXTIZEXt3+JV2re7XSYYbs7JGzU76xIK9p6Oa0v4ll1RNvk
 f5tYuaz215yrfZ2qmvv0HufsUETFBYxGd49UgAS5NWLX+dZ94bxNbveiWbOhV+PP0TSM
 EV8jiL933nFH0OBmqpdEc89Rtik+OR3cQOtgsuh+Qk+yCc+2o1TkiT01Qx3b2Xi4EEWf
 ciOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZmJ5ImS+
Subject: [Buildroot] Indicating upstream status [was: [PATCH]
 package/bluez5_utils: Fix builds with musl-libc]
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
Cc: d.lang@abatec.at, marcin@bis.org.pl,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/03/2023 22:25, Yann E. MORIN wrote:
[snip]
> Please add your SoB to this patch, and a note that it is a blackport
> (yes, the commit log mentions it is a backport, but when we need to
> assess this patch in the future, having the notre in the patch itself is
> much easier). I usually do that with a note like:
> 
>      Original commit log...
> 
>      [yann.morin.1998@free.fr: backport from upstream]
>      Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

  Although I like the []-style, I think we should also converge on a fixed style 
to indicate upstream status in patches, which can be validated by check-package. 
Therefore, I'd like to propose to standardize on:

Upstream: backport [yann.morin.1998@free.fr]

  OTOH we already have a lot of patches with the [] style, so perhaps it's 
better to accept that one in check-package as well. My only concern is that 
there may be some unrelated []-comment in a patch, so it's no sure way of saying 
that upstream status is properly documented.

> Note: if the path header has the upstream commit sha1 and applies as-is
> (possibly with just a bit of fuzz), then "backport from upstream" is
> enough. But if you had to rewrite the ptch, and the header does not have
> the upstream sha1, then add it to the note:
> 
>      [yann.morin.1998@free.fr: backport and adapt from upsteam 1234CDEF]

  So this would be

Upstream: backport from 1234CDEF [yann.morin.1998@free.fr]

  Regards,
  Arnout

> 
> The most important missing part here that I can't add is your SoB, so
> can you please respin?
> 
> Regards,
> Yann E. MORIN.
> 
>> +---
>> + src/shared/util.c | 5 +++++
>> + 1 file changed, 5 insertions(+)
>> +
>> +diff --git a/src/shared/util.c b/src/shared/util.c
>> +index 2f0ae0e86..b466fb001 100644
>> +--- a/src/shared/util.c
>> ++++ b/src/shared/util.c
>> +@@ -28,6 +28,11 @@
>> + #include <sys/random.h>
>> + #endif
>> +
>> ++/* define MAX_INPUT for musl */
>> ++#ifndef MAX_INPUT
>> ++#define MAX_INPUT _POSIX_MAX_INPUT
>> ++#endif
>> ++
>> + #include "src/shared/util.h"
>> +
>> + void *util_malloc(size_t size)
>> +--
>> +cgit
>> +
>> -- 
>> 2.34.1
>>
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
