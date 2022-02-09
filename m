Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF24C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 22:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35E4F408FD;
	Wed,  9 Feb 2022 22:27:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bqIbCYJe3GVE; Wed,  9 Feb 2022 22:27:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52AAA400F0;
	Wed,  9 Feb 2022 22:27:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7263F1BF3F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 22:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A69C8297F
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 22:27:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GF72VVYjAZwD for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 22:27:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEE76825E6
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 22:27:10 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HvQanYc8Cks1JHvQbnJTi8; Wed, 09 Feb 2022 23:27:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644445629; bh=QQgh+P/9Ql8s2NPTlIpaF7aBuse6w8iX+qwJXFM8PiI=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=PZcrF3i84b/5CR1Td40EXXDXuhLMPqxkZ+vj2308zvYVgYexoJga0Iro7iCiBEy4a
 ocZAd5MGz6sJkyWaXUhWPptLolJDu49tSgzPfRjMfOKA42kn3YPHD5Sv9i4s2VueOC
 r3/rrqqLz+n2t2srGEVhfZZUAArjvRIxf5P2Yjt81q75CuUNr0FkS16bJQ50rQV9Rc
 Gxgw5ixjRDpWI7PDVAb/83vEEHvvfPMUsbSLpQnL+l8Ox3ABeoK4m0hhAk2msgz62w
 1Y8d95fPNzndE3tZrKGcOXrEORslOX98k8HEG2sKxXeO5vN8StQ5bP+XosKqQw/nck
 FOmz3NaFbl3AA==
Message-ID: <8d1e16bc-d34f-1760-74c4-2d98b600321d@benettiengineering.com>
Date: Wed, 9 Feb 2022 23:27:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Pedro Aguilar <paguilar@paguilar.org>, buildroot@buildroot.org
References: <20220208213722.836257-1-paguilar@paguilar.org>
 <5f710ea1-3f98-9435-c033-e73e70e86342@benettiengineering.com>
 <f8202766-058e-25d3-2761-4568ba6c89a1@benettiengineering.com>
 <890b73ae-305c-2674-ed03-c06562983328@paguilar.org>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <890b73ae-305c-2674-ed03-c06562983328@paguilar.org>
X-CMAE-Envelope: MS4wfCSq+WN9poPtl8qfEYOuZOYvhRGYI1FIcdzvYvCcH++EeWwhv9Kgi7aweyof11IrbM5/lcJp0pvjxNqq+lKy+fwhtZqJwIqomJ+w5MzQJHO8byDrsz9+
 7dbKB698ZkD5OnPpgwIe4c4jnZODi7RrPk9lTYzgYEd4AqAgpikwFwLyMVn+DxT87AgpvcwrcYVkfoPIcptWH+Dpnln5HIcT4Htk8ptVPbF6eD8a6Mu/UDnR
 L6KHKHJ6Dn/BpPFtGiqUZZfC3yPqiNRxyNMbWPH3KX0abgoXUrqKvQM589+uLQGK
Subject: Re: [Buildroot] [PATCH v2 1/1] package/guile: Add BR2_ENABLE_LOCALE
 as dependency.
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
Cc: thomas.petazzoni@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Pedro,

On 09/02/22 22:35, Pedro Aguilar wrote:
> Hi Giulio,
> 
> On 2/8/22 23:54, Giulio Benetti wrote:
>> Hi again Pedro,
>>
>> I've reproduced the build failure with your previous attached .config
>> file and this patch fixes it. So below...
>>
>> On 08/02/22 23:06, Giulio Benetti wrote:
>>> Hi Pedro,
>>>
>>> On 08/02/22 22:37, Pedro Aguilar wrote:
>>>> If it's not present, enable libiconv.
>>> Here it's missing:
>>> Fixes:
>>> URL to autobuilder failure
>>
>> ...please provide the autobuilder failure URL and if it doesn't exist
>> than we don't need it.
> 
> AFAIK, the build failure fixed by this patch was not reported by the
> autobuilder, so I'm afraid there isn't any URL to share.
> 
> In a previous email I wrongly mentioned that it fixed an autobuilder
> failure, but all those failures are linked to another issue that seems
> to be fixed by a patch sent by Fabrice, although I haven't tested it:
> 
> https://lists.buildroot.org/pipermail/buildroot/2022-February/636041.html

Ok, so no autobuilder failure.

> May be the commit message of the current v2 patch can remain as is.

Can you improve the commit log a bit? Try to 'git log --grep=' some file 
which has that fix, or git blame it so you can find the commit log and 
imitate it. That's the best way to learn how to write commit logs.

Because "Add BR2_ENABLE_LOCALE as dependency." doesn't mean that much,
and "If it's not present, enable libiconv." doesn't sound so good.

What about:
```
package/guile: fix build failure due to missing libiconv

When building package guile with BR2_ENABLE_LOCALE=n we get the 
following error:
```
In file included from filesys.c:95:
ports-internal.h:26:10: fatal error: iconv.h: No such file or directory
    26 | #include <iconv.h>
       |          ^~~~~~~~~
compilation terminated.
```

So let's fix it by selecting BR2_PACKAGE_LIBICONV and adding libiconv 
package as dependency.

Signed-off-by: Pedro...
```

Can you please a V3 with this also pointing the V1->V2, V2->V3 changes?

Thank you!

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
