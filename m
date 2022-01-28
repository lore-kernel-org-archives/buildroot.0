Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA28C433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 09:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6B4841677;
	Fri, 28 Jan 2022 09:15:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rZu6lxp8VKaJ; Fri, 28 Jan 2022 09:15:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D2D941663;
	Fri, 28 Jan 2022 09:15:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B6E3A1BF3A1
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 09:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A57D6605B5
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 09:15:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=kalray.eu header.b="ugYGiEPz";
 dkim=pass (1024-bit key) header.d=kalray.eu header.b="C/clWrV3"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iamEIywCruUR for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 09:15:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fx405.security-mail.net (smtpout140.security-mail.net
 [85.31.212.145])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4404560597
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 09:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fx405.security-mail.net (Postfix) with ESMTP id 933BE323864
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 10:15:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1643361304;
 bh=dJt8nvFvwFKbe8BtZvZE17UFPPbxMk0GCt15aYoSCBA=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject;
 b=ugYGiEPziWxaJgeJ7Y8oA8tut+QJ02MsBr/hUlkHCtM6eMF63BJQHHaeSt4jMOB4p
 nd2StebVMLqiqnCGS7/nMho4ra5o1RJ+y+dqzmTqIOuq2Plkmj127IMzWzzwAUIBbi
 cQsaDvFZEz7cc4nPwxkaUGDFeyPYKkAwWTaFfl1s=
Received: from fx405 (localhost [127.0.0.1]) by fx405.security-mail.net
 (Postfix) with ESMTP id D751C3238EA; Fri, 28 Jan 2022 10:15:03 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx405.security-mail.net (Postfix) with ESMTPS id 71382323701; Fri, 28 Jan
 2022 10:15:02 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 50B5727E034A; Fri, 28 Jan 2022
 10:15:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 3711027E03FE; Fri, 28 Jan 2022 10:15:02 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 QF2L3yDJRvLv; Fri, 28 Jan 2022 10:15:02 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTP id 2552227E034A; Fri, 28 Jan 2022
 10:15:02 +0100 (CET)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <1b20.61f3b416.6fc5f.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 3711027E03FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1643361302;
 bh=5lKpau1Y7ooQAGTaJKU2hRg8Pou3ZWqwyiybwzvj90I=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=C/clWrV3r3M+GeHSkmaNduBKVCStkwwuyRMT/edLhx0fvo+zL2CyEckcLIPHX30Qg
 vmkqd8mdXqtF6j4IirzV4hBc2eIS3EMFHfX0JND3QsICXq3X3F/dMfwduBYq3g2heJ
 8t5an9qCD82f2CbS73UesD5o5svniLwJgt82xUZ8=
Date: Fri, 28 Jan 2022 10:15:02 +0100 (CET)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <519255027.1854303.1643361302026.JavaMail.zimbra@kalray.eu>
In-Reply-To: <20220127211819.GR457876@scaer>
References: <20220127135339.25430-1-jborne@kalray.eu>
 <20220127135339.25430-2-jborne@kalray.eu> <20220127211819.GR457876@scaer>
MIME-Version: 1.0
X-Originating-IP: [192.168.40.202]
X-Mailer: Zimbra 9.0.0_GA_4126 (ZimbraWebClient - FF95 (Linux)/9.0.0_GA_4126)
Thread-Topic: package/binutils: remove libiberty from target install
Thread-Index: ekv7Dor2HROHRHOpTzYWrCTrFY/qfQ==
X-ALTERMIMEV2_out: done
Subject: Re: [Buildroot] [PATCH 1/1] package/binutils: remove libiberty from
 target install
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
From: Jonathan Borne via buildroot <buildroot@buildroot.org>
Reply-To: Jonathan Borne <jborne@kalray.eu>
Cc: ysionneau@kalray.eu, jmaselbas <jmaselbas@kalray.eu>,
 Baruch Siach via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



----- On Jan 27, 2022, at 10:18 PM, Yann E. MORIN yann.morin.1998@free.fr wrote:

> Jonathan, All,
> 
> Thanks for this new iteration. :-)
> 
> On 2022-01-27 14:53 +0100, Jonathan Borne via buildroot spake thusly:
>> In BINUTILS_INSTALL_TARGET_CMDS, libiberty is installed
>> to STAGING_DIR
>> 
>> This is not necessary since libiberty is already
>> unconditionally installed to staging in
>> BINUTILS_INSTALL_STAGING_CMDS. Furthermore the presence
>> of STAGING_DIR path in TARGET_CMDS is confusing.
>> 
>> Moreover libiberty is static only. Static libraries
>> are only used at build time, not at run time so
>> we do not want to install libiberty on target.
>> 
>> This commit removes the unnecessary libiberty
>> install in TARGET_CMDS and add a comment to clarify
>> why we do not see libiberty installed on target.
> 
> I've slightly reworded the commit log, and rewrapped it closer to the
> usual 72-char width.
> 

That's perfect. I will think about the wrapping next time.

>> Signed-off-by: Jonathan Borne <jborne@kalray.eu>
>> ---
>>  package/binutils/binutils.mk | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
>> index 13f61be035..32ca70d325 100644
>> --- a/package/binutils/binutils.mk
>> +++ b/package/binutils/binutils.mk
>> @@ -95,6 +95,8 @@ BINUTILS_MAKE_ENV = $(TARGET_CONFIGURE_ARGS)
>>  
>>  # We just want libbfd, libiberty and libopcodes,
>>  # not the full-blown binutils in staging
>> +# Static-only libraries such as libiberty are used at buildtime in staging
>> +# but are not installed to target.
> 
> I believe the comment in fact makes more sense closer to the
> _ISNTALL_TARGET_CMDS, so I moved it there, and reworded it
> appropriately.
> 

I hesitated a bit about the right place to put this comment but
that's definitively cleaner this way.

> Applied to master, thanks.
> 
> Regards,
> Yann E. MORIN.
> 

Nice! Thank you very much!

Best regards,
Jonathan

>>  define BINUTILS_INSTALL_STAGING_CMDS
>>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(STAGING_DIR) install
>>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=$(STAGING_DIR) install
>> @@ -106,7 +108,6 @@ ifneq ($(BR2_PACKAGE_BINUTILS_TARGET),y)
>>  define BINUTILS_INSTALL_TARGET_CMDS
>>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(TARGET_DIR) install
>>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=$(TARGET_DIR) install
>> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
>>  endef
>>  endif
>>  
>> --
>> 2.17.1
>> 
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> --
> .-----------------.--------------------.------------------.--------------------.
>|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
>| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
>| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
>| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> 
> 
> To declare a filtering error, please use the following link :
> https://www.security-mail.net/reporter.php?mid=16157.61f30c1f.e3bf2.0&r=jborne%40kalray.eu&s=yann.morin.1998%40free.fr&o=Re%3A+%5BBuildroot%5D+%5BPATCH+1%2F1%5D+package%2Fbinutils%3A+remove+libiberty+from+target+install&verdict=C&c=175bda5746a47a6dc86efbf686983009e1fe0acd




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
