Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0AA5C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 16:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A15B403C2;
	Sat, 12 Feb 2022 16:57:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FOQwxDJc8yic; Sat, 12 Feb 2022 16:56:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D9534038D;
	Sat, 12 Feb 2022 16:56:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 48EB21BF34F
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 16:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37A5860AE5
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 16:56:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ruwgGqMKCli for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 16:56:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB07860A7B
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 16:56:53 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id IvhbniFi8ks1JIvhbnrTiF; Sat, 12 Feb 2022 17:56:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644685011; bh=R7eF1aIlydKNfPgODnB548RPvTyzAXPcSMRc+4zAHF8=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=cj9CqDrVDDYqVEkp07T3M0LCfMDcT5zGHYCNdFVxJdd0UnjVzO13MHLSpI3YTEyYF
 3CizOgj07gBcv/tCbPIcEOmD4xyjUuB/rM6qO+EgRbuM4DgSkW7ZC5kAllykcCjazB
 EWh6Bud96sf64fTmNDMTl0KZxxZJRBGAkXSad+I2aXrNEtelWvUbRjCUcGAxZGQZiP
 578jg1+8M4O34yHK0yOj+fSupHePVu8M+wCl0O6fSs8FVh2db19LSSNWafx9yoY7U8
 2RvlTu4FhnWhlIJA59XAOvNUo9u80MqiaJKJEbCGLhF8IZIB2iYzL9DEFq0kNu+zF3
 Jod4QRjBXzBgQ==
Message-ID: <f9e79526-887f-9677-33d5-62cf383db198@benettiengineering.com>
Date: Sat, 12 Feb 2022 17:56:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220128110542.1101197-1-giulio.benetti@benettiengineering.com>
 <20220128110542.1101197-2-giulio.benetti@benettiengineering.com>
 <20220212164951.GE3752867@scaer>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220212164951.GE3752867@scaer>
X-CMAE-Envelope: MS4wfCBm79trEt8Lz81y+Lp5xR6TNwdUFP8aRy6coeJWjWn4O5sUpg4WvExtF5wTNYLn7i5mLYMuV2f8b4jUGALQicA76HohT4S8zvXeD1Yo9vYpML6ZtasA
 vrkPS1oP16uXlh+zvZp8fYv0pJ1A3mTqjLhav55gikeHkdOQ8VhOeA/5xsiQotvKQT4zXvJDnXN16LjPtHakK/YUXUtUE58RgHnO/dn4NScy6YQjtKKvpn3e
 sePYOvZsdmQqFdrgEKEH2u6fa4XGs3SPTY55mX82BcLPggLwGwbxz36PDekX7ylnMobeyKGJ5/jgQrrw7xAAHg==
Subject: Re: [Buildroot] [PATCH] package/libcamera: fix missing comment for
 binutils-bug-27597
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Pierre Ducroquet <pinaraf@pinaraf.info>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/02/22 17:49, Yann E. MORIN wrote:
> Giulio, All,
> 
> On 2022-01-28 12:05 +0100, Giulio Benetti spake thusly:
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   package/libcamera/Config.in | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
>> index 23a0040abf..88db054975 100644
>> --- a/package/libcamera/Config.in
>> +++ b/package/libcamera/Config.in
>> @@ -92,7 +92,7 @@ comment "lc-compliance test application needs a toolchain w/ C++, wchar, threads
>>   
>>   endif # BR2_PACKAGE_LIBCAMERA
>>   
>> -comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 7"
>> +comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 7, not binutils bug 27597"
> 
> Bug 27597 is inherently an architecture-speific bug, which is always set
> for NIOS2, so there is nothing the user can do about it except switch to
> another architecture...
> 
> The comments are meant for when the user has an alternative option, like
> chossing a different version of a component.
> 
> In this case, there is nothing the user can do, so we don't add it to
> the comment.

Aaah, right, like hidden options. Ok, so let's drop this patch.

Thank you!
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Regards,
> Yann E. MORIN.
> 
>>   	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
>>   	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
>>   		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
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
