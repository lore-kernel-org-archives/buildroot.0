Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEAFC54F51
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 21:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56E4160689;
	Wed, 29 Jul 2026 21:16:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lWZaBSn8I5mZ; Wed, 29 Jul 2026 21:16:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F7976079D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785359815;
	bh=bUhveofVnqdeW7wlvuoNLst3IzBUCP0rwnXJPOkeHU8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HXcw/hs54TEUNL4BbTohBH49uc2XsNJf6jvWZ3O2D8T+V32Gdzid05tIsWU6j/jT9
	 5HaJ41uf27E2NkxUZvmeR4I1/BNljO1C9zMUlZL0Bzn7RjqU6mLqPc3KB1lywOzt9W
	 yd1UnioNmJH/8FOfCPfbJNPxezUYwmonWJfxxRBm3Iea4S6VQzLLAFXSwxYMJ8xTpT
	 oHltoSdduggKr/FHAWefMQXcEhPuZ7lupU27rnigzwwfnipeplFepXLwoeKv39u+Sd
	 T++2PyrmJGmTAcVNykUUqYyljN/Ta4RuL09CY1RCUQmbVb0DerXdy4khllGUWs2D23
	 ttz6IjzJeKSWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F7976079D;
	Wed, 29 Jul 2026 21:16:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 509E026C
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 21:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36B714009C
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 21:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pRADCN0U0yJp for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 21:16:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 83D2540097
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83D2540097
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83D2540097
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 21:16:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 61FA37803A2;
 Wed, 29 Jul 2026 23:16:48 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 29 Jul 2026 23:16:48 +0200
MIME-Version: 1.0
Date: Wed, 29 Jul 2026 23:16:48 +0200
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <392d9bae-0944-88f7-3312-89d089335596@crashcourse.ca>
References: <20260729202520.1568463-1-ju.o@free.fr>
 <392d9bae-0944-88f7-3312-89d089335596@crashcourse.ca>
User-Agent: Webmail Free/1.6.17
Message-ID: <7716a09cef9c74f0500e3cf333ab9ca0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785359810;
 bh=y7aJ8oWIRLkr2ojDTmjDqUXzL2XNboGQIUMyxtNROOs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C0Rebt1NAWq4ytpgiJ4j8h9QD5pn4AfhPmIISUKzcfc0FYpRRGM9W4DbefZJPt0g1
 RpbYfP2/q2vmEaiGmuGCPmPdqUxxyE2NO8Taflujl2TuXG1RftsJchYogf1tj9qZpK
 IRsoNgLn7eabry0AP5p26jX2xbs4h/AReEZSZKzU7JECM8sjk/PD6uZWYqLliwOBbN
 xM7OpFg1ZPqXrr/WMlyCZKCXLwpX0aPHCQK7dSqhe9G3nXUzjXgCrQzW1QatDYj99k
 eiyHAmViJyoX4tckpTFN9C/gLNPfy3fNgCBNovjtYFtCWHx52KldiVgzgrtK3ZBO2Y
 hVqXczEF60iiQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=C0Rebt1N
Subject: Re: [Buildroot] [PATCH 1/1] package/uboot-tools: fix host build
 without FIT support
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 29/07/2026 22:52, Robert P. J. Day wrote:
> On Wed, 29 Jul 2026, Julien Olivain wrote:
> 
>> Commit [1] "package/uboot-tools: fix host FIT signature support"
>> slightly changed the logic in which the file
>> $(@D)/include/generated/autoconf.h is created.
>> 
>> When there is no Kconfig sub-option selected, the file is no longer
>> created and the build fails with error:
>> 
>>     include/linux/kconfig.h:4:10: fatal error: generated/autoconf.h: 
>> No such file or directory
>> 
>> The issue can be reproduced with the with the simple commands:
>> 
>>     cat >.config <<EOF
>>     BR2_aarch64=y
>>     BR2_TOOLCHAIN_EXTERNAL=y
>>     BR2_PACKAGE_HOST_UBOOT_TOOLS=y
>>     EOF
>>     make olddefconfig
>>     make host-uboot-tools
>> 
>> This commit fixes the issue by simply adding a touch of the file
>> at the beginning to make sure it will always exist.
>> 
>> [1] 
>> https://gitlab.com/buildroot.org/buildroot/-/commit/928cc5dc5cb82e6f2cb43f853488309eb806ef89
>> 
>> Cc: James Hilliard <james.hilliard1@gmail.com>
>> Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
>> ---
>>  package/uboot-tools/uboot-tools.mk | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/package/uboot-tools/uboot-tools.mk 
>> b/package/uboot-tools/uboot-tools.mk
>> index ef8bcabbd9..8a2877333c 100644
>> --- a/package/uboot-tools/uboot-tools.mk
>> +++ b/package/uboot-tools/uboot-tools.mk
>> @@ -124,6 +124,7 @@ define HOST_UBOOT_TOOLS_CONFIGURE_CMDS
>>  	echo "#include <linux/kconfig.h>" > $(@D)/include/config.h
>>  	touch $(@D)/include/config/auto.conf
>>  	mkdir -p $(@D)/include/generated
>> +	touch $(@D)/include/generated/autoconf.h
>>  	$(if 
>> $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),$(UBOOT_TOOLS_ENABLE_HASH_ALGOS))
>>  	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),echo '#define 
>> CONFIG_TOOLS_FIT_PRINT 1' >> $(@D)/include/generated/autoconf.h)
>>  	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo 
>> '#define CONFIG_TOOLS_IMAGE_PRE_LOAD 1' >> 
>> $(@D)/include/generated/autoconf.h)
>> --
>> 2.55.0
>> 
>   for what little it's worth:
> 
> Tested-by: Robert P. J. Day <rpjday@crashcourse.ca>

Thanks for testing. Applied to master.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
