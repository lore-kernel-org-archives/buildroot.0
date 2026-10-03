Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51222CA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 180DD6108F;
	Sat,  3 Oct 2026 15:57:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M8Y1xD7OeorF; Sat,  3 Oct 2026 15:57:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 317ED6107A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043038;
	b=DsyEZ91gW3OQeg+jMNDYZ1gqsOlPCnLv/C0IPbpBNSRG5tJTBllvUl71cNiqfvSG7ytO
	 IQyiEjtwzcdKmHNhcwhbYl8T/f69ta8dNM0uJifhrIEDSGvDBS2Wctdl55DAnpreoDKrO
	 LzTwE7kEUbfkw9XMYu9PVuWLKwCWfKMKzF2rhm/GzBBPjW7J8rCTt3b7Lg1g4xr3wesTA
	 rbB4Px9wO+u6KP6z95CxEFxdu//9YnaJNMFRggvgvL3EIK2UxBAXr0Iz1G8N+sGigIgKs
	 g0Nr0zVPEGqinP3qhZkGXyDxjKykYmls+g76J10JVX5kpSovuekmYApBNnQGmGLfuVA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043038;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=vNiqVWGR/xtzMD7A+1iIJpTyBSx2zE1meOX1+T6g+9w=;
	b=n+ni0BqzKaJOpK5Tok5M8aZvU09LW1ixSPKoiTOgwDVWOum11SIWLkA4ahEfhc9MjznP
	 328v0B3qrDYJgKeu2OASznCBKC2YSazAUE4NLyWuSlyNi/FZ17z8FOlhDqftcwO6M8lRM
	 nmfnwFoygOz1QT846pce4JrklHvuDOjKiffYNxymo86m3Ekpb1CqgQesyW7vzTIFcjyCs
	 iSxHiW2n/GjrYI6sECv1SIiXxBI3ccFAzz2I8vOoU/s2Bw7VnPb12ZzHywm89h2bE5Qbx
	 JxXbdgr7Vvv74aQNYT/DaE59t050/CDm9zSejcmhyyk9HLpmUzb+SBci4W84hg9fqAA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043038;
	bh=vNiqVWGR/xtzMD7A+1iIJpTyBSx2zE1meOX1+T6g+9w=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=F3wmKUjR6b/l1JiNBqnRWgwkWm3hDLy++6keI9AxH4fbKeL0ZOLdOl6BQO2CbADZz
	 jwvqZQNFuNx7C/hbDhppeIYNvib/vROSvlKFv3keFM/RwQHc0TMqU1MO1HPX3nP+bj
	 VlZnQ7aceUtVnsGYo20YrxLf8pTfRfnvtni56fpTjAptqBcGY7TUi0M4ZcPTA7hvYI
	 C8noq0KQGcdzUxdBJ4vUc7KaxHEf6dZ3b+Ou2gBwGVdKR0dEGmShXYzP7gF4ExaJab
	 6oZO5qKG1TueExVYI4K0oRwdxs0tfafCeHdpiEVl2kA5dwkAOw4SKpgwF2Gd0ifX7o
	 ZVf0aqyx7viiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 317ED6107A;
	Sat,  3 Oct 2026 15:57:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 77C1C335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 695B860E70
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qrfvy8h3gQMy for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:55:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E67C260E67
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042914;
 b=CJ2TF/eInbdM+eAj13eahgAttd9uzWsFE0b+w3mkBSbiHvNiCaRnRzZL0XqIcFB+c+J5
 8iNZTt6c7ZOqOJOnGTqMLGqxhR2Ielgh966txru41BYDqT93WkcCY/mCNNVgDFkrQZc7A
 mfAKV+gzLl1bQumhv0+JDbi3l9avc3VCOOSXop6eUbZ9fO8hnVQmAGPw7eKRaRVOY/XJZ
 LoouSjkzoTkMpaAgZhD9AgIZB8H/ykhS//w73JT7wQVPRXd+60hNLfchFQKKl+Mr4m2vU
 GDRMpTdWhH6KPSXO0yXhtGF/x7uXocYhjqIXLMOLDrnoyR2MEwWYdO+Hv44ZdU6ufwQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042914;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=YSMrbz3gwGmr9EObtsWrd7xBsw8KQmcNMtBocurnmMY=;
 b=k/ODsKEET/knaeegsMAxlVzrgFUijwbh20WjU/TPQAKHZ9feooRLdTGFzTRqt2QQTDrj
 0462gshBAWRKixDTp9/TD3nd9j0lqpt0ETeY3vqhMskkpl8TZVDcP4CTXBKrhcg5Eobtl
 A+21siJ3BcLCjEYmJxv/qhAB9drrXP75OdyHAXX/Rq5nkyhfGJJ9XKydK/6I53IgIIDYp
 zNYqBfdNeJL7MhKZW6gPg+z12jHM3VLhEFldZyuJwztHbWH0W6WW3LhUKVkX22tAhlQim
 x1zrmykIC4MBoAp9afqPXhhq24ykVLCO405RbcfOueVvBH3t4e7sQSGQA2FYy+Y1dGA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=YKhB7UuJ; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E67C260E67
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:55:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B61C11A1108;
 Sat,  3 Oct 2026 15:55:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8882B604FF;
 Sat,  3 Oct 2026 15:55:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 65BF41032840C; 
 Sat,  3 Oct 2026 17:55:08 +0200 (CEST)
Date: Sat, 3 Oct 2026 17:55:07 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>, 
 Manuel Diener <manuel.diener@oss.othermo.de>
Message-ID: <asElPK1sE4Th02yU@windsurf>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 001/114] package/python-apscheduler: bump
 version to 3.11.3
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

On Sat, Oct 03, 2026 at 08:59:33AM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Cc: Manuel Diener <manuel.diener@oss.othermo.de>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python-apscheduler/python-apscheduler.hash | 4 ++--
>  package/python-apscheduler/python-apscheduler.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

I've applied 109 patches out of 114 patches. Fiona had applied another
4 patches. One patch was not applied: python-scipy (legal-info
breakage).

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
