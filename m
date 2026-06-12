Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374B0CD98CF
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 20:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C4016131F;
	Fri, 12 Jun 2026 20:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bg69tTkHydWa; Fri, 12 Jun 2026 20:45:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BBD861317
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781297128;
	bh=s+z817QHq3iamQbrhUBzOjQ7/B0yLvw+/WpzvJ6w/tg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Pd4MF3y33y0sJFAP6r/lLPJ1fvsyuYxG1L6Pf/OqM0yxhY2HbElGuoEkciz2+uCvD
	 0aLS2oRKIHvTF9oiHUkleY2OcWfxUuAFBd8Ml8AQrFVf+/VzG+j7I7tkBI3i5GCZ//
	 9Ifdz5Ra/IKkCH9M810KXEgx/1C2aKTTiDBTEKFnq+IinW3TMEBcI9cz9TCrW4lsmc
	 MWtm+g6DUZGM8FveA+C1tNua9DdKRsCZd14CoiF3MtSLR5Np0erDDbaQYW+BK2wqwu
	 +ag7iV6nnMqJ7VQ7+pKuvS4jehIxunPD4XGC9M8yn79v3WuAA5o82UnI2JJbPzcs6K
	 pHvyTpsDo/UlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BBD861317;
	Fri, 12 Jun 2026 20:45:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BA21A237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A063083BFB
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2neKoxdX_Bv for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 20:45:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7659483C03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7659483C03
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7659483C03
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:45:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 68BCC2003C8;
 Fri, 12 Jun 2026 22:45:21 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 12 Jun 2026 22:45:21 +0200
MIME-Version: 1.0
Date: Fri, 12 Jun 2026 22:45:21 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>, buildroot@buildroot.org, James
 Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <01b7e4fe8d7439f53154b75cf5b3ed41@free.fr>
References: <20260324172659.4834-1-flaviu.nistor@gmail.com>
 <01b7e4fe8d7439f53154b75cf5b3ed41@free.fr>
User-Agent: Webmail Free/1.6.16
Message-ID: <a436c44c8ae6f08c4fe2038f7e44a1cd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781297124;
 bh=UydUwbbE3ovXQ+w61GX5qExHRFQg1Gk1A9oQeA97MxA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PRnRio11+1ex3tu5WQc3rsbTgbmhcDy2RkBxDnf2A7524uJQvWeySYy/1Lzhc4Qym
 aE9QMpaasXs93j0K0irTMdvF0xyLPrmAwmmA/+WPABrhJnB5Hm18WnHKfGYc7oAz0Z
 6dEemZNEUsrXM8b+jeRSJiRJISkOFJ/BvgdfwUt8WrRL3ZhS99rTlb3z/Go5UWZdax
 hdw9tAnbi5ykD48T/iWGtqkJKrmjU3Fk4Q5yYEItsJOUWEo4tmIGZVME2afEUrWVoF
 idsoULKM6LATEyxGWvkaPrO7yWmGREyZ+qp90pwnGCFTj57cU4YVBJCK2MUZT0zgj1
 SfVJ8dFYnzfdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PRnRio11
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aenum: bump version to
 3.1.17
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

On 28/03/2026 12:57, Julien Olivain via buildroot wrote:
> Hi Flaviu,
> 
> Thanks for the patch.
> 
> On 24/03/2026 18:26, Flaviu Nistor wrote:
>> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
>> ---
> [...]
>> diff --git a/package/python-aenum/python-aenum.mk 
>> b/package/python-aenum/python-aenum.mk
>> index 4b59216722..49cba84990 100644
>> --- a/package/python-aenum/python-aenum.mk
>> +++ b/package/python-aenum/python-aenum.mk
>> @@ -4,9 +4,9 @@
>>  #
>>  
>> ################################################################################
>> 
>> -PYTHON_AENUM_VERSION = 3.1.16
>> +PYTHON_AENUM_VERSION = 3.1.17
> 
> It seems there is some confusion upstream about that 3.1.17 version.
> PyPi publishes it, while there is no tag on the corresponding github
> repo. See:
> https://github.com/ethanfurman/aenum/issues/53
> 
> I'll wait for clarification from upstream before merging this patch.

Since this release  was confirmed by upstream in
https://github.com/ethanfurman/aenum/issues/53#issuecomment-4676585397
I applied this patch to master.

>>  PYTHON_AENUM_SOURCE = aenum-$(PYTHON_AENUM_VERSION).tar.gz
>> -PYTHON_AENUM_SITE = 
>> https://files.pythonhosted.org/packages/09/7a/61ed58e8be9e30c3fe518899cc78c284896d246d51381bab59b5db11e1f3
>> +PYTHON_AENUM_SITE = 
>> https://files.pythonhosted.org/packages/07/e9/8b283567c1fef7c24d1f390b37daede8b61593d8cdaffb8e95d571699e83
>>  PYTHON_AENUM_SETUP_TYPE = setuptools
>>  PYTHON_AENUM_LICENSE = BSD-3-Clause
>>  PYTHON_AENUM_LICENSE_FILES = aenum/LICENSE
>> --
>> 2.34.1
> 
> Best regards,
> 
> Julien.

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
