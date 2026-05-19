Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA250CD4F3C
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 18:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DCB88194A;
	Tue, 19 May 2026 18:43:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OBYfsmBNVkI4; Tue, 19 May 2026 18:43:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 131E281990
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779216213;
	bh=rzlHiQ5AYoIOuTHQWKaW7BtYwMJtfgl0okb/a0l8tXw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=laG9FVJkci0quwdvC0WhY+HIuuLpmZBimPqrMztXPc5r4FE6uLsI4NUPnqqVNX0AM
	 YqUE99Ndlrk6jIVzjKgfd4DQPwH4zZh+wt94kN16K0Y54GOI1DMBs+h7mEA31Q+1vW
	 plfwUKaVhykHA/r8+WEs6QeIqtaKJOyEWvkVm+0/kqi8/1izVBrBr0JhjEJCULDG0X
	 /PWfoIZ428nWgJIamUj2mbqiZej1DKa2AAtTWGJJ0lXCRiPotetEedd8FvHiaWJ/DZ
	 2g4KYGB1l1p0Qw2YKmMLs953Mno5Js96yGij01jsGl0BGp/jnOhgvD5NESDYRV4y/J
	 ffNBxhX7iQq9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 131E281990;
	Tue, 19 May 2026 18:43:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 760A71B2
 for <buildroot@buildroot.org>; Tue, 19 May 2026 18:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BADC81951
 for <buildroot@buildroot.org>; Tue, 19 May 2026 18:43:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7HDS4Mrg9i_D for <buildroot@buildroot.org>;
 Tue, 19 May 2026 18:43:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=and@gmx.li; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 77274818D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77274818D4
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77274818D4
 for <buildroot@buildroot.org>; Tue, 19 May 2026 18:43:29 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MSt8W-1wn4o13gvG-00XdMD; Tue, 19
 May 2026 20:43:23 +0200
Message-ID: <a72de0b2-c770-4e02-9174-ed2d19ac8276@gmx.li>
Date: Tue, 19 May 2026 20:43:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Baruch Siach <baruch@tkos.co.il>,
 Andreas Mohr via buildroot <buildroot@buildroot.org>
Cc: Pascal de Bruijn <p.debruijn@unilogic.nl>
References: <20260518220229.17936-1-and@gmx.li> <87lddgt7a7.fsf@tarshish>
Content-Language: de-DE, en-US
In-Reply-To: <87lddgt7a7.fsf@tarshish>
X-Provags-ID: V03:K1:ckXKZ2enFJsELfhhXylxUL7D0ZUifWxDaT95TWI1a1+7leFvcO1
 OyBHOaTqHlCOKp7Cun4oUKh/rvnSVrgdv4Wa/tPcW6IK4cQ5L2VPybzaanLMvJwc7sX9tHv
 9vhl1Tlu2oKGUVd2zKEtVT9xsTWESLdy8NpSYq86VGq7GNX39Qt+nVPCy12ABblkL2NkauN
 EwotmWwaAsjRy5lWCViHA==
UI-OutboundReport: notjunk:1;M01:P0:Any3xZlWBzQ=;kXGbFpuqvnZ7kHvRLjNvcEGy8bh
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.li; 
 s=s31663417; t=1779216204; x=1779821004; i=and@gmx.li;
 bh=fDH7/w5MGlKep/0++91OueBDjCI2BXg/TlLxu5HuTB0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=SWf94SO/Y6MBgHwMTflNDTqIFt24xFc+72goIvZCHkqdrXxEdnEJjHbzEgp5zm2A
 fhr89y/KoCh+c83Bfna+FbrV+Sd2uCKRhkZHrY3FiVoIDU6UzS1MZfvYweKlzQbCy
 9chzTrktzWqcZ9B4nnI9LwUXBAV24CGAf1Iy8c/D71ezn5Q05njp279UnpYx3NFoP
 rL8QStT5DZJh7CeTMAuqAD2OBeWbmDd/W7/C9z0BJYqP9mYUUbgTvpStltTZcwcr/
 kahuVFmV/WUPiD60QGW4qW/w4c+1n4VhHmj0U2pHN8hlTVkSf86079G2w/8SM/XW7
 m30X3SM1vpNiJJUmFg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.li
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.li header.i=and@gmx.li
 header.a=rsa-sha256 header.s=s31663417 header.b=SWf94SO/
Subject: Re: [Buildroot] [PATCH v4 1/2] package/libargon2: conditionally
 shared/static build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Andreas Mohr via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Mohr <and@gmx.li>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi baruch,

Am 19.05.26 um 05:20 schrieb Baruch Siach:
> Hi Andreas,
>
> On Mon, May 18 2026, Andreas Mohr via buildroot wrote:
>> Add static build support of libargon2.
>> This will allow dependent packages like cryptsetup to build static as well.
> The comment in package/cryptsetup/Config.in needs update, then.
>
> Can lua-argon2 build statically now? If not, the comment in its
> Config.in pointing at libargon2 needs update as well.
>
> Same goes for python-argon2-cffi-bindings.

Yes, in a future patch set, once the libargon2 static build patch has 
been incorporated.

> baruch
>
>> Signed-off-by: Andreas Mohr <and@gmx.li>
>> ---
>>   package/libargon2/Config.in    | 5 -----
>>   package/libargon2/libargon2.mk | 6 ++++++
>>   2 files changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/package/libargon2/Config.in b/package/libargon2/Config.in
>> index 6bba74cf..73c1e0d7 100644
>> --- a/package/libargon2/Config.in
>> +++ b/package/libargon2/Config.in
>> @@ -1,12 +1,7 @@
>>   config BR2_PACKAGE_LIBARGON2
>>   	bool "libargon2"
>>   	depends on BR2_USE_MMU
>> -	depends on !BR2_STATIC_LIBS
>>   	help
>>   	  A modern password hashing algorithm
>>   
>>   	  https://password-hashing.net/#argon2
>> -
>> -comment "libargon needs a toolchain w/ dynamic library"
>> -	depends on BR2_USE_MMU
>> -	depends on BR2_STATIC_LIBS
>> diff --git a/package/libargon2/libargon2.mk b/package/libargon2/libargon2.mk
>> index b3f6e1b2..8ca0071a 100644
>> --- a/package/libargon2/libargon2.mk
>> +++ b/package/libargon2/libargon2.mk
>> @@ -23,6 +23,12 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
>>   LIBARGON2_OPTS += NO_THREADS=1
>>   endif
>>   
>> +ifeq ($(BR2_STATIC_LIBS),y)
>> +LIBARGON2_OPTS += LIB_SH= LINKED_LIB_SH=
>> +else ifeq ($(BR2_SHARED_LIBS),y)
>> +LIBARGON2_OPTS += LIB_ST=
>> +endif
>> +
>>   define LIBARGON2_BUILD_CMDS
>>   	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
>>   		$(LIBARGON2_OPTS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
