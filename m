Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC038C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 15:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D550605C8;
	Mon, 22 Jul 2024 15:14:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YcU5KwLeEwRf; Mon, 22 Jul 2024 15:14:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47D84605A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47D84605A4;
	Mon, 22 Jul 2024 15:14:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F9791BF31D
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 15:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A2B460585
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 15:14:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x9y2LhtReUDT for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 15:14:45 +0000 (UTC)
X-Greylist: delayed 441 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 22 Jul 2024 15:14:45 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9362C605A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9362C605A4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=199.89.1.14;
 helo=011.lax.mailroute.net; envelope-from=wdouglass@carnegierobotics.com;
 receiver=<UNKNOWN> 
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9362C605A4
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 15:14:45 +0000 (UTC)
Received: from 007.lax.mailroute.net (007.lax.mailroute.net [199.89.1.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by 011.lax.mailroute.net (Postfix) with ESMTPS id 4WSNtQ4MFkz1XdhJ1
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 15:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by 007.lax.mailroute.net (Postfix) with ESMTP id 4WSNtN0N54zly3Sp;
 Mon, 22 Jul 2024 15:07:24 +0000 (UTC)
X-Virus-Scanned: by MailRoute
Received: from 007.lax.mailroute.net ([127.0.0.1])
 by localhost (007.lax [127.0.0.1]) (mroute_mailscanner, port 10026) with LMTP
 id NyAqQ6ARA9w5; Mon, 22 Jul 2024 15:07:22 +0000 (UTC)
Received: from mail.carnegierobotics.com (unknown [72.22.26.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by 007.lax.mailroute.net (Postfix) with ESMTPS id 4WSNtL2VZdzly3S5;
 Mon, 22 Jul 2024 15:07:22 +0000 (UTC)
Received: from CRL-PGH-EX19-1.crl.local (10.1.7.176) by
 CRL-PGH-EX19-1.crl.local (10.1.7.176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Mon, 22 Jul 2024 11:07:21 -0400
Received: from CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4]) by
 CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4%7]) with mapi id
 15.02.0858.015; Mon, 22 Jul 2024 11:07:21 -0400
To: Baruch Siach <baruch@tkos.co.il>, Woodrow Douglass via buildroot
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH] package/chicken: move literals into text
 section for xtensa architecture
Thread-Index: AQHa3EdxLeGIhJGZ+UGtiNGVDDN4o7IDHDEA
Date: Mon, 22 Jul 2024 15:07:21 +0000
Message-ID: <c11ec3f0-6e70-4e79-bee3-bc7f8f0130f8@carnegierobotics.com>
References: <20240722131117.273274-1-wdouglass@carnegierobotics.com>
 <20240722143100.346659-1-wdouglass@carnegierobotics.com>
 <87a5i9mq43.fsf@tarshish>
In-Reply-To: <87a5i9mq43.fsf@tarshish>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
x-originating-ip: [172.30.0.85]
Content-ID: <15EB303B15DED94F96794F018D4B5BD2@crl.local>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 carnegierobotics.com; h=mime-version:content-transfer-encoding
 :content-id:content-type:content-type:user-agent
 :content-language:accept-language:in-reply-to:references
 :message-id:date:date:subject:subject:from:from:received
 :received:received:received; s=mr01; t=1721660842; x=1724252843;
 bh=b4+ykwB7u/lDZqurn33Nk0wKjwolfM9g1rwwVRuxCVM=; b=r4xwCKrg6x44
 EPjT8ifFr0PbqmL1PaT6LzUsl+M4al3lSqONcQmOgtPvip5sOtg53miaooKipvkS
 ZalAZigoMEWeOZd6ravhwOxtuG5IRENoOdotu8x9YCtaiy64NHVieEC/mv6jggK9
 Wq5zkChBTyoMkDiiu3JsgBHA6vS2D1Smb+1E6nz7Py+ivyYYLvGJHNknk+ujr+cd
 MKSXCRJ0D5IMbAXU19ODvTsrXzi7VqmEhc8XEHC4Kf2rVwij7AHf8CdK4nGrLCaQ
 8w1qDClyQRGIzOHsmfCn3LYhCljPz22lqdkpg2SAaPAVzx+awR5L4cM+WhFQLh3h
 EqbbtyBkGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=carnegierobotics.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=carnegierobotics.com header.i=@carnegierobotics.com
 header.a=rsa-sha256 header.s=mr01 header.b=r4xwCKrg
Subject: Re: [Buildroot] [PATCH] package/chicken: move literals into text
 section for xtensa architecture
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
From: Woody Douglass via buildroot <buildroot@buildroot.org>
Reply-To: Woody Douglass <wdouglass@carnegierobotics.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Baruch,

Thank you for pointing this out! I incorrectly assumed this was a 
different spelling -- I'll revise and resubmit in a few minutes.

Thanks,
Woodrow Douglass

On 7/22/24 10:57, Baruch Siach wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender.
>
>
> Hi Woodrow,
>
> On Mon, Jul 22 2024, Woodrow Douglass via buildroot wrote:
>> This solves a build problem -- by default xtensa-gcc puts literals in a
>> different section of memory then the program text, and chicken is a very
>> literal-heavy program, so they don't all fit there. This avoids that problem.
>>
>> Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
>> ---
>>   .../0001-xtensa-text-section-literals.patch   | 30 +++++++++++++++++++
>>   package/chicken/chicken.mk                    | 14 +++++++--
>>   2 files changed, 42 insertions(+), 2 deletions(-)
>>   create mode 100644 package/chicken/0001-xtensa-text-section-literals.patch
>>
>> diff --git a/package/chicken/0001-xtensa-text-section-literals.patch b/package/chicken/0001-xtensa-text-section-literals.patch
>> new file mode 100644
>> index 0000000000..b93aaf9e21
>> --- /dev/null
>> +++ b/package/chicken/0001-xtensa-text-section-literals.patch
>> @@ -0,0 +1,30 @@
>> +From e8d177f4d4e1c6bc41787ea1621e323ff4ad493e Mon Sep 17 00:00:00 2001
>> +From: Woodrow Douglass <wdouglass@carnegierobotics.com>
>> +Date: Mon, 22 Jul 2024 08:50:37 -0400
>> +Subject: [PATCH] Move literals into text section for xtensa architecture
>> +
>> +Upstream: https://bugs.call-cc.org/ticket/1840
>> +Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
>> +---
>> + Makefile.linux | 5 +++++
>> + 1 file changed, 5 insertions(+)
>> +
>> +diff --git a/Makefile.linux b/Makefile.linux
>> +index b628cda4..e97c2b94 100644
>> +--- a/Makefile.linux
>> ++++ b/Makefile.linux
>> +@@ -52,6 +52,11 @@ USES_SONAME = yes
>> +
>> + # architectures
>> +
>> ++ifeq ($(ARCH),xtensa)
>> ++C_COMPILER_OPTIONS += -mtext-section-literals
>> ++LINKER_OPTIONS += -mtext-section-literals
>> ++endif
>> ++
>> + ifeq ($(ARCH),x32)
>> + C_COMPILER_OPTIONS += -mx32
>> + LINKER_OPTIONS += -mx32
>> +--
>> +2.39.2
>> +
>> diff --git a/package/chicken/chicken.mk b/package/chicken/chicken.mk
>> index 2667f7823d..d0e456f92a 100644
>> --- a/package/chicken/chicken.mk
>> +++ b/package/chicken/chicken.mk
>> @@ -11,9 +11,19 @@ CHICKEN_LICENSE_FILES = LICENSE
>>   CHICKEN_CPE_ID_VENDOR = call-cc
>>   CHICKEN_INSTALL_STAGING = YES
>>
>> -# If ARCH is not set, it attempts to autodiscover. But it is anyway not used.
>> +#Chicken only uses the "arch" variable for some special-case compile arguments
>> +#If it's empty, it tries to detect the arch host
>> +#Handle some cases, but in most cases the normalized arch is fine here
>> +ifeq ($(BR2_NORMALIZED_ARCH),"i386")
>> +CHICKEN_ARCH="x32"
> Are you sure about that? x32 requires the 64-bit extension for x86
> processors (https://en.wikipedia.org/wiki/X32_ABI). i386 is for 32-bit
> capable processors.
>
> baruch
>
>> +else ifeq ($(BR2_NORMALIZED_ARCH),"x86_64")
>> +CHICKEN_ARCH="x86-64"
>> +else
>> +CHICKEN_ARCH=$(BR2_NORMALIZED_ARCH)
>> +endif
>> +
>>   CHICKEN_MAKE_OPTS = \
>> -     ARCH=unused \
>> +     ARCH=$(CHICKEN_ARCH) \
>>        C_COMPILER="$(TARGET_CC)" \
>>        CXX_COMPILER="$(TARGET_CXX)" \
>>        PREFIX=/usr \
> --
>                                                       ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>     - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
