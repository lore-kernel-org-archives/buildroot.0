Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B938F364B6
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 20:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAFDA60B22;
	Thu,  9 Apr 2026 20:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rcEgn29E_8pp; Thu,  9 Apr 2026 20:44:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7E9B60623
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775767494;
	bh=B4kkdpNCTRVo+9L42KdPISJtVjNbf5TjvTOYey9mwsM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JJ8m94WxZez5Jk1DCCwnq1s9ixLI9Qpf74Y+lhjRkscSkN3efqV7ltocdmiKjVHQs
	 qtK9byQ8AzN5n8r0WzMP6yPrPtWshESmxe5Bzo+1uVCnKHRp0ARGPy+jvlLLy6Huoz
	 tVVmAgXoCJGvJ/kejBB53fR5JwYeOG64TC8k4z3x4D1dFkTqMw5X2/QsKCmLWLwAgs
	 9oQj9iC4LAVST/83UkdKOnbjhDrfvS7jJ8e2vdFfNkNWeaiinihxe8jBjzkCH/CpKq
	 wiVkTDk5Uiil3C7G+aOLIVbr/Kt2uqJvKlkMNrKXO238wt0GYIYFBIzJlzsseUsLbt
	 xHacaOhfuTbwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7E9B60623;
	Thu,  9 Apr 2026 20:44:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EC8B194
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84EA180B08
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id noSryyQ2EVCY for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 20:44:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1CEEA80A8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CEEA80A8A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CEEA80A8A
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:44:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id DA42978035B;
 Thu,  9 Apr 2026 22:44:47 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 09 Apr 2026 22:44:47 +0200
MIME-Version: 1.0
Date: Thu, 09 Apr 2026 22:44:47 +0200
To: Gary Bisson <bisson.gary@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260408-nitrogenfix-v1-1-fc4471caaff2@gmail.com>
References: <20260408-nitrogenfix-v1-1-fc4471caaff2@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <25d0f6f195a6d3e37d7f4f71894b7a86@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775767489;
 bh=JB15fuwcPtOeFld3e0PE40G2OFZ/Ul1BNL+VXjejpnQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uYYbdlT/8UeEOObrlYuLNInFBs4xdJux+6evFxZeGV5JYa7o/1F7gETKA5q+fLFWb
 lJd7ELAM94pSoSy1KJjZWjtgbJRvsH4Z1dZWga0icdZ+SDspXLdaSkGgLoAs7fOzIU
 Mm2J6tClrLuaQQ3Rn0oTjPQexAWbWuCKYfgEnnz167BFSt5FK6RAp/EYH6fXvmS7z9
 uFaYyUD+VtG6UO3yDnFQW2t113y20cRpSuqpR29jEeDC44TC9H+7t3CizNwNdDrje9
 EXW5xX8SVohB6AsPCwPZD7oiZYdT5ofYav7HB26mcvdXtTzBVx4MS/CWU/m7Pa9s0g
 SHT773ib4JiRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=uYYbdlT/
Subject: Re: [Buildroot] [PATCH] configs/nitrogen*: bump u-boot revision
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

Hi Gary,

On 08/04/2026 10:33, Gary Bisson wrote:
> - update nitrogen8mp SMARC rev2 support
> - update LPDDR4 init to match latest NXP spreadsheet
> - update binman support for newer python versions
> 
> Fixes:
> - https://gitlab.com/buildroot.org/buildroot/-/jobs/13768764611
> - https://gitlab.com/buildroot.org/buildroot/-/jobs/13768764638
> - https://gitlab.com/buildroot.org/buildroot/-/jobs/13768764687
> - https://gitlab.com/buildroot.org/buildroot/-/jobs/13768764734
> 
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>

Applied to master, thanks.

Could you consider switcing those defconfigs to use Bootlin external 
glibc stable toolchains, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
