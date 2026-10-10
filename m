Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94746CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 17:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D9E1408D3;
	Sat, 10 Oct 2026 17:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tmF88Lnc3GrS; Sat, 10 Oct 2026 17:24:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E8CDE408AC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791653066;
	b=dPxFvU68Tndb1NQz0Q+nP0vWdmv0yT9VwbBWK0LR6v7IaHFuQnW8HK0S7C1uDTf8VKFM
	 6uHbwjTvqA3xcig4bPDxwhFKzjgyZioRakqz7RSyUER4MNKGJ3ph+3NFrYyK1kxatureI
	 IDfArd68Y5wlVz45s/g4rDf9XTqMbFAN5WnqkfYXS381UgINZdddbvC+CifI6EI5OODEu
	 1yqhZFx5jIPlY0W0oKs2vftDhfvfNWxBnkQL2te0vMyfMMqm9R0VtnYjj3kvCBaplIlzk
	 xNGylA6J2mts+TOXC0A1ai84ppMUKss1uI/vUuwq6Pa5hRnCeCPsUm/Q6a9eyo3fVZw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791653066;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xZNpSzvxdVJMksEuWGETlj+mpnIF0O5w1L4yHWctnFk=;
	b=Q8N/rzEfaUN0rNWnjq6s6ndgTDfIgr6ea05NKKtoSPz/5g5yrVu0T2KR7WYgWnilbmBK
	 g5UWxuXyeGQacbo6jwOL56PXOPB6qV9nDim7bXGWw796hBOfJWRgcExNzkZnbcShQ1Pit
	 JuaR8xo/COsKfKZrNBqiAQwxPAPuvt+EAJBnntnW0ECQzeSt7TwKlSVfj6zMoJiHHoShA
	 nApnZyUIyoBVlkNnURa0aXND7pRhQqOHQMGxJCyB3Xv0lGWSUiTus+RcHv8EonHo38Q8G
	 hTtwEieaMYS6psOpZh991D+e2SMWRUSCeGgnARhtieyWQtacJ6BkWfHjnOwwmOpVCNQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791653066;
	bh=xZNpSzvxdVJMksEuWGETlj+mpnIF0O5w1L4yHWctnFk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=muyqahoobg9k0BSQOFT/+qhtjbFUXZLUcHmMTRKEetC/9YwRt4HoVCa66kQ6dQkNu
	 ddux/2Wh1Ha4ffo0arx2IrznQSHIX6oTQDfJGSjSz3i2CGrmOTVp/8KdL0FZr1TXA9
	 3mSDjGG5rACI1AGnWkRaT/Wp6wftOK4g7Zl0BkwpGpfxpP55Vt7JTs07t5mSeYRp3T
	 RJKZYy+O31gheuPi3IGER3MJXSxV5gtrAGB2KVBEUkN+zYauxA+qcWQvu3nG/AGcoP
	 z8YPtIchWGuR7WlzBZq3eWOSpnpR0ZaIbuy6CzVI1OMIPelHG95r6915sCk0Q/gSlG
	 AQ+kMEkDnKmJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8CDE408AC;
	Sat, 10 Oct 2026 17:24:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FBC41A6
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11CE04005E
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R_EePwrcGwLk for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 17:24:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 82AAF40004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791653063;
 b=GYEf2qFFE8YlSM+zpsrA5jiSDWCnrTaHLLAzk4iJDa90NEOFGQSE76U4kwN4RfLqPKVY
 I4FJWfOq0C25eKaSw8kCcRjrSBapZTFhqnEXvFJyyPLmCXwpY6pMhVWnQYdIO9vA4iZ8f
 5CLYhigFv7eAJbpiRPnCSfLGzTbQjnXH77erTaQrk5buPPI3+dtK/jg2OGwQfl2POJ9mI
 sVob1lcr6CmPOSE+9kz92yUsFJXIxLYbnNu9EU2BWa1zyoP2frSezCB3CIFgVe26m8/Lk
 ra4h4jvUfqYyxCbAex4Quzcr1uRnJxhPRqdOBjEUkm8Z39cprSaF3zmWZlW+8taKLSQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791653063;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=k4PvesoXgpD04+GoOiem5OhCp0UXAMVZO5nsDFV9BRg=;
 b=grxWnjSgAl7lx0/Ql08NwNIp8Iy076qVFEdueEF12xJcxUad+YMfHFZ+WhTl22LdCaaC
 Gv3PcOzIG3ECKbsGyaQ4r+eehg1qoXeQOC4FoErsiCALLoFQXpu8QkHoutDzbaOqMyCi/
 oPY00s4wrpRLUv2Cbsbl/ORU31GCANuW3QDrd1M5uPAXjVoEDQItCTfQNf09cK6/AlLRj
 yt8XjAPkDUKBlBQS6qIoWDZiRnvtaB9oCNXekDA8ic3CtGEq7/4cpHcevlccxar7RZgj/
 kBKauscCkjyKuGjx5CTVWahewO5Y67KKJhaMhB2okV7HGPc37N9fjeLsyJenpbDuENQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ETUWnVoI; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82AAF40004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:24:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 5B6371A11C7
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:24:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BD9D76075C;
 Sat, 10 Oct 2026 17:24:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 56E9211D706A3; 
 Sat, 10 Oct 2026 19:24:16 +0200 (CEST)
Date: Sat, 10 Oct 2026 19:24:15 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Petr Vorel <petr.vorel@gmail.com>
Message-ID: <asp0sl4uKknBA7jS@windsurf>
References: <20260922132648.3229462-1-yegorslists@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260922132648.3229462-1-yegorslists@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 0/2] package/iproute2: fix musl/uclibc build
 failure with libtirpc
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Sep 22, 2026 at 03:26:46PM +0200, Yegor Yefremov via buildroot wrote:

> Yegor Yefremov (2):
>   package/iproute2: add optional dependency on libtirpc
>   package/iproute2: fix build failure due to missing
>     BR2_PACKAGE_LIBTIRPC_RPCDB

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
