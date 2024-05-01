Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEECC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 20:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E8EB4031F;
	Wed,  1 May 2024 20:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BBCc_hd7vBTb; Wed,  1 May 2024 20:28:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96C72405E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96C72405E9;
	Wed,  1 May 2024 20:28:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 63BB41BF3D6
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F9EA406BD
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NHFtmCGIsy-9 for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 20:27:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 114E940696
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 114E940696
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 114E940696
 for <buildroot@buildroot.org>; Wed,  1 May 2024 20:27:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id C16D819F733;
 Wed,  1 May 2024 22:27:54 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:50258])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 01 May 2024 22:27:54 +0200
MIME-Version: 1.0
Date: Wed, 01 May 2024 22:27:54 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20240501215523.5bc7ce23@windsurf>
References: <20240420132251.1349622-1-ju.o@free.fr>
 <20240501215523.5bc7ce23@windsurf>
User-Agent: Webmail Free/1.6.5
Message-ID: <f5ecc25e82957dfe5938eb52af816eaf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714595275;
 bh=NdOELaA58BJupl5YfzxWwLkrLFFMaYPyE8nZwGL47V4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MzKnQpj+mPCruOvt/BrTDG+4b+yNf/hfa/J5KYYj7W/RUjSQHrPAG7j/TGU69QUoW
 PZTVBtDYwnEPrB0ZiDZZXBbowddjRPXo+LUWJhhhvEbT++4Fc+q9aQoFe81iBxFYy5
 9CANLK01NjVmJYzW6GYb6e8Q0BYDjvT8rZWYUpYjfn/G3s6AthsagdvyQz3wRqSmTR
 vO+0gfrCsSnYLRZ8aEVW1d5VSUa9+oF+GSxObT5V1btG7Av2bhPmR801bM2bvFTEyz
 5lgKiut92JDXkiSqlJd4wBH6fOSGuTOJxqV3ql6aMt6gjnJ30F4Ee0GMr/HeV+7iYN
 fMgSFf6BqbIaA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MzKnQpj+
Subject: Re: [Buildroot] [PATCH 1/1] package/fwts: disable parallel build
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

Hi Thomas,

On 01/05/2024 21:55, Thomas Petazzoni wrote:
> On Sat, 20 Apr 2024 15:22:51 +0200
> Julien Olivain <ju.o@free.fr> wrote:
> 
>> fwts randomly fail to build in parallel with error:
>> 
>>     mv: cannot stat 'dtcompilerparser.tab.c': No such file or 
>> directory
>>     mv: cannot stat 'prparser.tab.c': No such file or directory
>> 
>> This is a known upstream issue. See:
>> https://github.com/fwts/fwts/issues/7
>> 
>> This commit workaround this issue by disabling parallel builds.
>> 
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
>> ---
>>  package/fwts/fwts.mk | 3 +++
>>  1 file changed, 3 insertions(+)
> 
> Hm, I don't see any failures in the autobuilders. Did you encounter
> this issue personally? Why don't we see it in the autobuilders?

On my side, I see those failures on systems with with 20 cores and more 
on an
idle system doing only the Buildroot build. Maybe the autobuilders have 
a
different load, or less cores?

> 
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
