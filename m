Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED42AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 09:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FA2B60AD1;
	Tue, 28 Dec 2021 09:44:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LITKPSvBnIZU; Tue, 28 Dec 2021 09:44:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B29F060ACB;
	Tue, 28 Dec 2021 09:44:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EA7E41BF5A2
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 09:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4A2F400AF
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 09:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cyqgLYhxBqYw for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 09:44:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57DD0400B5
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 09:44:23 +0000 (UTC)
Received: from [192.168.50.18] ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 291pn3E79YYTX291pnprVh; Tue, 28 Dec 2021 10:44:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1640684661; bh=HVRG3Ynn4qEb81WnofDLFQt2VrsB3NCAswbm5cOo9UM=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=MgOoAkx0gzA2ZPaySI94OXcHUhpBazd12etiyUHNQDPsqcep/+tN/jyS7GzxCvq31
 9GBKI25SDFrjgKjK4Qe3zGFLZHuupHV+8xtTsjz9S8N6kJRDfvy2rTL1m/VenhRTm/
 E/m8qD4oss0CJF/EyEIHrqi3816D8xcVvBFYdhfPAkjD0wdWpHzHZrFwidZ0ddwBcm
 uxoIo8QWCt1WoI+m/DzysaeXlAYNSR5XGSoYsqDfWCvGChZS2ft6ysL46MmOJLvzH8
 YTfEcR41u6fb5rmh/dOU2qxsJG8NEt9uZfeUVLrMa/Kh/MxYRZI8jacV8gqZ6f/NS8
 /BuZ6kgrYeJBw==
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211218231155.666025-1-fontaine.fabrice@gmail.com>
 <20211219091016.GE2603@scaer>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <aab3aac5-1077-b8c7-ff22-8be756e73b61@benettiengineering.com>
Date: Tue, 28 Dec 2021 10:44:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211219091016.GE2603@scaer>
Content-Language: en-US
X-CMAE-Envelope: MS4wfH2pTjVsrnU/fTGO0VPcEs8K3aZx0zKreBnxNW4hiLViccDjDwkOvhtMhA1qH2OUPjoImNKQl15yeEQVktOQHCNRPRkyjfxE5TkzFWzZ/rqUArvrbeX7
 DYM7X3RX+/bzSxN8Fwxeqi70AwtP7ehvuw2v68DPBv4kjDYJHCUV0t8UoMB3uZyRUf405TqTFUNIHuCCcm6SYTOxyUk2Twyoq42UKQjZZSvleJoDbkbkfnPY
 Yc+Ik7GqManvL+Z9iCMeuwyPH/MWRMHwK9MoP0lF7JE=
Subject: Re: [Buildroot] [PATCH 2/2] package/imagemagick: host SVG support
 needs host gcc >= 4.9
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

Hi Fabrice, Yann,

On 19/12/21 10:10, Yann E. MORIN wrote:
> Fabrice, All,
> 
> On 2021-12-19 00:11 +0100, Fabrice Fontaine spake thusly:
>> host gcc >= 4.9 is needed since bump of harfbuzz to version 3.1.2 in
>> commit 6861933d22006fbe8c961a41506beac826881f33 to avoid the following
>> build failure:
>>
>> In file included from ../src/hb-serialize.hh:36:0,
>>                   from ../src/hb-machinery.hh:37,
>>                   from ../src/hb-common.cc:30:
>> ../src/hb-map.hh:67:18: error: 'is_trivially_copyable' is not a member of 'std'
>>     static_assert (std::is_trivially_copyable<K>::value, "");
>>                    ^
> 
> I replied to the wrong mail earlier, so FTR I'll paste it again below.
> Sorry for the noise...
> 
> Where did you see that gcc 4.9 had it? I looked at the gcc-4_9_0-release
> tag in the gcc tree, and it states:
> 
>      $ git grep is_trivially_copyable
>      [...]
>      libstdc++-v3/include/std/type_traits:  // is_trivially_copyable
> (still unimplemented)
> 
> Whereas gcc 5 has a proper implementation:
> 
>      $ git grep -A1 'is_trivially_copyable' libstdc++-v3/include/std/type_traits
>      libstdc++-v3/include/std/type_traits:  // is_trivially_copyable
>      libstdc++-v3/include/std/type_traits-  template<typename _Tp>
>      libstdc++-v3/include/std/type_traits:    struct is_trivially_copyable
>      libstdc++-v3/include/std/type_traits:    : public integral_constant<bool, __is_trivially_copyable(_Tp)>
>      libstdc++-v3/include/std/type_traits-    { };
> 
> I see that 6861933d2200 (package/harfbuzz: bump to version 3.1.2) stated
> that the requirement on the gcc version was bumped to 4.9 from 4.8, but
> I am not sure how that can be...

Indeed now it came out gcc 5 is needed.

> Giulio, where did you get the info that gcc 4.9 was required (and not a
> higher version)?

Honestly on trial and error with target toolchain, because with harfbuzz 
3.1.2 case it was only target related. And now I know I need to check 
libstdc++ git instead(thank you for pointing me).

So I've sent the patch for harfbuzz 3.2.0 with both host and target gcc 
5 dependency:
https://patchwork.ozlabs.org/project/buildroot/patch/20211228002227.15747-1-giulio.benetti@benettiengineering.com/

That should fix the problem.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Regards,
> Yann E. MORIN.
> 
>> Fixes:
>>   - http://autobuild.buildroot.org/results/89e1194c1659d7e1af9db8ffe5feee770c448f76
>>
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> ---
>>   package/imagemagick/Config.in.host | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/package/imagemagick/Config.in.host b/package/imagemagick/Config.in.host
>> index 671b0995dc..fe0ad9a748 100644
>> --- a/package/imagemagick/Config.in.host
>> +++ b/package/imagemagick/Config.in.host
>> @@ -17,6 +17,7 @@ if BR2_PACKAGE_HOST_IMAGEMAGICK
>>   config BR2_PACKAGE_HOST_IMAGEMAGICK_SVG
>>   	bool "SVG support"
>>   	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # host-librsvg
>> +	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-pango -> host-harfbuzz
>>   	help
>>   	  Say 'y' here is you need ImageMagick tools (like convert)
>>   	  to support SVG.
>> @@ -24,4 +25,7 @@ config BR2_PACKAGE_HOST_IMAGEMAGICK_SVG
>>   	  This is not enabled by default, as it brings quite a few
>>   	  extra dependencies, and thus extra build time.
>>   
>> +comment "SVG support needs a toolchain w/ host gcc >= 4.9"
>> +	depends on !BR2_HOST_GCC_AT_LEAST_4_9
>> +
>>   endif
>> -- 
>> 2.33.0
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
