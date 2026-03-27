Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AC910F2867
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 18:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DD2783E3B;
	Fri, 27 Mar 2026 18:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J9dzwbBsHWkE; Fri, 27 Mar 2026 18:34:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAD1F83E2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774636479;
	bh=sZQq5t0J2FB48ZIYeTpi3vGomJA8kCgl4iqjk9oLjbE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iRZELhmNU6hAmPzU6oh6tL7Q7X3Ba/4w4fS+gm7A9vaUxWozgR54H04YhgtMp9W9Q
	 ezGsBs5GM/GD6ylE0dNzhg3imcMZReT+7Tm11yZfJEtuSNQDOdHWHNqrtqajyvMat4
	 54RHEDGLfpdT2r0hq8Y+0BPLkzRYa35KzEra6cG/FuCncjjWkSSP7xW0hxbJnCt6mg
	 9qiwy671GEDl4zR/Oz12PFaxeGlaQ4nRnTjSsx9ptnedcT+ZmWVclhPAXlSkII2rql
	 wYBxU1J/fO3V4OO88DDfnVvzO1ce22vfnF4psBdP5fe+QSNxQ00XOGFbh3/TVtsSAH
	 L8l2PcvzekV7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAD1F83E2D;
	Fri, 27 Mar 2026 18:34:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 020FD2AA
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCB03411F3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:34:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bNnoCIJNw8we for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 18:34:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EFC7D411F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFC7D411F0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EFC7D411F0
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:34:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id C3A5B20039C;
 Fri, 27 Mar 2026 19:34:33 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Mar 2026 19:34:33 +0100
MIME-Version: 1.0
Date: Fri, 27 Mar 2026 19:34:33 +0100
To: cp0613@linux.alibaba.com
Cc: buildroot@buildroot.org
In-Reply-To: <20260327125731.1037-1-cp0613@linux.alibaba.com>
References: <50127bcac46304384fa17899ac8fd5c6@free.fr>
 <20260327125731.1037-1-cp0613@linux.alibaba.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <7a012a0d387773a024892d95919e08d5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774636474;
 bh=EB1lGKOO0hl+9Nx4qqlpU8nf0SabPWqEuMzS5WxBFZU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LCYtCE2ESvMr2WubncMtdFIBX2uDqEYv1PHywEyhtrdjVVu8sySeRgjYnOnyRowa7
 ZzG7NBq00hrfzsbaHW+tMoa9nmjMgoFePg+TBAb9hHZ6hAUKYd4d5ugZvI0bAlaAwa
 erz95fdodymDpNpLOAfzYvOEyN98QBv+BvRTbUlZyGd78uEiu6hVryK/aeiteFPScJ
 vaRXNEqYk8ZIkQw9nD4r1RzE3/t8XQ+9l+Gc6040PrOXGTXcl85moGzIK87IPxxoX/
 UaDFBL3lCuEVtn2jpmPpMm9o1GguSLF1aqjWrEmrQ/zFe6vFBxWwTDOb+kbWCovLv0
 C0ZT9r+PD+T1A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LCYtCE2E
Subject: Re: [Buildroot] [PATCH v2 1/2] package/ndctl: new package
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

Hi Pei,

On 27/03/2026 13:57, cp0613@linux.alibaba.com wrote:
> On Thu, 19 Mar 2026 21:51:18 +0100, ju.o@free.fr wrote:
> 
>> > From: Chen Pei <cp0613@linux.alibaba.com>
>> >
>> > A "device memory" enabling project encompassing tools and
>> > libraries for CXL, NVDIMMs, DAX, memory tiering and other
>> > platform memory device topics.
>> >
>> > Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
>> 
>> Applied to master, thanks. For info, I relaxed the minimal
>> toolchains headers to 5.10. Looking a bit more into this,
>> I realized this was backported to 5.10 and 5.15.
>> See:
>> https://gitlab.com/buildroot.org/buildroot/-/commit/039c1ae13ec12f7cebddf86f37080d0a1fee28e6
>> 
>> Doing this review, I also saw that a new v84 version was
>> also released, in case you would like to update:
>> https://github.com/pmem/ndctl/releases/tag/v84
> 
> Hi, Julien,
> 
> Thank you for your review and help. I did notice that a new v84 version 
> was
> also released. However, I will wait for the next version (which should 
> be
> v85) to be released before updating. I have already fixed the upstream 
> bug
> in ndctl that you found during my code review, and it has been merged. 
> See:
> https://github.com/pmem/ndctl/tree/pending

Thanks for the heads up.  We'll wait for the v85, then.

> Thanks,
> Pei

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
