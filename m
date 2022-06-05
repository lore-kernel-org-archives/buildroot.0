Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C994AC43334
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 12:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54DAE40A4B;
	Sun,  5 Jun 2022 12:50:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WwMbeZVdO4eo; Sun,  5 Jun 2022 12:50:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B0B3404D3;
	Sun,  5 Jun 2022 12:50:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 556281BF311
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 12:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52A0084047
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 12:50:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tpm.dev
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B_Gw4fOK1-2I for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 12:50:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from delivery.mailspamprotection.com
 (delivery.mailspamprotection.com [185.56.84.32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A6A683FA8
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 12:50:14 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se29.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1nxphj-0000u4-3j; Sun, 05 Jun 2022 07:50:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tpm.dev;
 s=default; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Uaohi7ku/jCLRKTNVcUwxIF6eRpQeTlRcbg/Sj5pcX8=; b=L+WnAGXNbLnZQi2IGU/u7prh8g
 rDBkHfjB0rd//dmyMGAmG7imnt4q/5qM3jxo9EX/ZUXf3LwmnOjvoFCsgjRr6Ofvdqx4pgJZUY696
 athgO50RgQmO+XoV54FDpr8PD0VcDTPBXb2YYmtR+LSxOBJc35+5Ncd04Mnek6Zca5C+Vp1J2gL6m
 gQuEnrJr4MnuMmCIt8WbpvMNrlARivOGCBM7NrF2ABsdfq74EvzX8isThxYzaAR+p9ai+sC12d6BL
 zo0XvVW2gs+tUfeR1tVsY1YfbZaVouNgF4jPpq5sGlzLgxf7vjbKzskQJlFqb4qsXTGI0cZNfWGMF
 f50nGEFQ==;
Received: from [127.0.0.1] (port=31136 helo=es87.siteground.eu)
 by es87.siteground.eu with esmtpa (Exim 4.90-.1)
 (envelope-from <dimi@tpm.dev>)
 id 1nxphf-0002hj-Mf; Sun, 05 Jun 2022 12:49:59 +0000
MIME-Version: 1.0
Date: Sun, 05 Jun 2022 15:49:59 +0300
From: Dimi Tomov <dimi@tpm.dev>
To: Baruch Siach <baruch@tkos.co.il>, Martin Bark <martin@barkynet.com>
In-Reply-To: <30bf207a13340e40cf083e6721d71460@tpm.dev>
References: <cb76d24abec40b2e48d3d1dd2964b720@tpm.dev>
 <9251c4c3977f236b6c70e2c26f65a6c9@tpm.dev>
 <cefa8f258208ca9c1335d03895508b16@tpm.dev>
 <1ab54b30b3c2de10bcdeaa57f69c478b@tpm.dev>
 <d39ac782ff917689120b241a052b11cc@tpm.dev>
 <30bf207a13340e40cf083e6721d71460@tpm.dev>
Message-ID: <0c50966fe0107ebc22de3f502828dc8d@tpm.dev>
X-Sender: dimi@tpm.dev
Organization: TPM.dev
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
Authentication-Results: mailspamprotection.com;
 auth=pass smtp.auth=35.214.247.6@es87.siteground.eu
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.12)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT8ZSS4OfhpvmWhykY//texNPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5wyeMQO2X8Cp3nJ8z20Bm48mXQcXvgBwdPsgckLs23xIr8w
 OUqZ8/5fiNSm31Ip1nAjpx9soHOVwxRcKgX1jeW+/P2KA68bOYt0CoeAhNOZvwljaxkFYrj3R1cr
 17AAs23KLMyCg2dNZJAK3gbNiIydjJKA7haz4rV6833Ny7pzTusBUwxLei5WfbYOwlA1j/PBI128
 r/Kn6gLOF3Dw0+51JU5pcJpt3JK/347T3ddDszVDPx49snBmt3mvjVEu1KMeigMttP/SK296THSN
 fG84WjgK8eSXaqvTogT9d22Zfp6J39DcTGtLC4s9xWFKM57e+VBAT7/iDvIuA8y8AC5BBP18vW6o
 drfO8cAzSdWUJ3ILXkRib82L43HIepkyRmrt3JsC5e/DlYVV9jqBtc/t9a3fvBg8I7q5hFKojyxx
 cVkDWpg3cUqnTXK7+jR2jt1xuwt6BW/LqWzUw+fkjzpuRAwX31WVY5lWjWxuGSRuxeH/U9irS6S/
 4tPpWmJbHa138B2VLS1CpJIOW6O9dEv0FdiB1wGsIwp1rfFVK4orKL/MkTXVmMpAWIpXwTCeSh3C
 kdUpn8A2iMkLHL7hKRavnHl2TRtBFGxCwNLr/WIXTv9XXirEnIovV1DgiaRl4uEzrxMg36Jn7L4U
 IiMZgOGil2hsR99u5gXb6tWyU4Ig+a0jiD6XqsJZtjQxlyCdsezvfgASqYV08/XDEBcYDPz+CtbE
 guydx7+/OTtKDkewxUbHZyvxaoDHZu3kDSHQAYn0ueve0JZHC9g7yTKUVX5S119UJTC3pWi+xSvF
 azC0736kYH3pTkh+9N3RpnPTg4ilB88zIHaAzJ1MM+Uac+Gb8IwZYeUO3SdHOBIA/+dOcHeV3Rut
 woCbl6bePDUokDH0le6nwMqBTZPoY6UyWfs4xpom9HS037lCR5IYTfOPGxhgHWAwnOQo7d0zx9fP
 9IUGe36LUkbq4uQ60WnRcdcrUNzSCKdUMUA8EmOuGIUG5/B4agWOBURF9vZZEPKbP7axnH8IQOGl
 0OK9YQosYvUVGBt96cyC792PGPnCwto+jc3SLvmmH08hpnUWu8Jz3L6MyGnDIpSchlco6RIDoNg/
 DowYF5X92G1XxuvnCFAIOBFH5+voV8F0lWqCjvQnQq6JWFW8yhJ2Btz1sCvfhP6Q
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
Subject: Re: [Buildroot] libcurl ignores default buildroot CA bundle
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
Cc: Buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Baruch,

Please review the patch that fixes this - 
https://lists.buildroot.org/pipermail/buildroot/2022-June/644127.html

Thanks,
Dimi

On 2022-06-05 01:04 PM, Dimi Tomov wrote:
> make libcurl-dirclean forced a rebuild with  wolfssl as the crypto
> backend, however --with-ca-path does not work. Error below:
> 
> checking default CA cert bundle/path... configure: error:
> --with-ca-path only works with OpenSSL, GnuTLS or mbedTLS
> 
> How to enable buildroot CA bundle for libcurl when using wolfssl?
> 
> Thanks,
> Dimi
> 
> 
> On 2022-06-05 11:32 AM, Dimi Tomov wrote:
>> I think I found another issue:
>> 
>> $make libcurl-reconfigure does not change the cryptopgrahic provider 
>> for curl.
>> 
>> I change the option using make menuconfig and I see it reflected in my
>> buildroot config.
>> 
>> ps: about curl w/ openssl, my board had its date set to May instead of
>> June and this was the issue.
>> 
>> Thanks,
>> 
>> Dimi
>> 
>> On 2022-06-05 11:16 AM, Dimi Tomov wrote:
>>> I forgot to mention that I have updated the system clock using data &
>>> hwclock -wu and the issue with libcurl and ca-certificates packages
>>> persists.
>>> 
>>> On 2022-06-05 10:24 AM, Dimi Tomov wrote:
>>>> Hell Martin and Baruch,
>>>> 
>>>> Issue persist after building my buildroot image with libcurl and
>>>> openssl as a cryptographic provider, ca-certificates package 
>>>> installed
>>>> properly and in default location. Error message only changed a bit:
>>>> 
>>>> # curl https://google.com
>>>> curl: (60) SSL certificate problem: certificate is not yet valid
>>>> More details here: https://curl.se/docs/sslcerts.html
>>>> 
>>>> curl failed to verify the legitimacy of the server and therefore 
>>>> could not
>>>> establish a secure connection to it. To learn more about this 
>>>> situation and
>>>> how to fix it, please visit the web page mentioned above.
>>>> 
>>>> ^the above page mentions that a CA bundle is missing.
>>>> 
>>>> However, /etc/ssl/certs is deployed properly by the buildroot make 
>>>> and
>>>> sdcard image.
>>>> 
>>>> Any ideas?
>>>> 
>>>> Thanks,
>>>> 
>>>> Dimi
>>>> 
>>>> --
>>>> Founder of TPM.dev
>>>> 
>>>> On 2022-06-04 09:16 PM, Dimi Tomov wrote:
>>>>> Hello Baruch,
>>>>> 
>>>>> I may have found an issue with the libcurl package.
>>>>> 
>>>>> The libcurl.mk file lacks CA path when built with wolfssl instead 
>>>>> of openssl.
>>>>> 
>>>>> ifeq ($(BR2_PACKAGE_LIBCURL_WOLFSSL),y)
>>>>> LIBCURL_CONF_OPTS += --with-wolfssl=$(STAGING_DIR)/usr
>>>>> LIBCURL_DEPENDENCIES += wolfssl
>>>>> else
>>>>> LIBCURL_CONF_OPTS += --without-wolfssl
>>>>> endif
>>>>> 
>>>>> I tried adding LIBCURL_CONF_OPTS += --with-ca-path=/etc/ssl/certs 
>>>>> in
>>>>> the above if case and rebuild, but this did not solve the issue. 
>>>>> Could
>>>>> you please take a look?
>>>>> 
>>>>> Thanks,
>>>>> 
>>>>> Dimi
>>>>> 
>>>>> On 2022-06-04 07:43 PM, Dimi Tomov wrote:
>>>>>> Hello Buildroot community,
>>>>>> 
>>>>>> I have a STM32MP1 target and my buildroot image has both the curl 
>>>>>> and
>>>>>> ca-certificates package installed. However, curl fails to 
>>>>>> authenticate
>>>>>> any https requests:
>>>>>> 
>>>>>> 
>>>>>> # curl https://google.com
>>>>>> 
>>>>>> curl: (77)  CA signer not available for verification
>>>>>> 
>>>>>> 
>>>>>> Do I need to do some extra buildroot configuration for libcurl to 
>>>>>> use
>>>>>> the CA bundle in /etc/ssl/certs?
>>>>>> 
>>>>>> Thanks,
>>>>>> 
>>>>>> Dimi Tomov
>>>>>> --
>>>>>> Founder of TPM.dev
>>>>>> _______________________________________________
>>>>>> buildroot mailing list
>>>>>> buildroot@buildroot.org
>>>>>> https://lists.buildroot.org/mailman/listinfo/buildroot
>>>> _______________________________________________
>>>> buildroot mailing list
>>>> buildroot@buildroot.org
>>>> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
Founder of TPM.dev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
