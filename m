Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD2BC982C1
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 19:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DD5460698;
	Wed, 16 Sep 2026 19:49:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wYDwttr32i6t; Wed, 16 Sep 2026 19:49:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1E0926061B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789588157;
	b=UO33hew3ANnOaEJODstoSy0aTZsm2UX/LgyZ8oAe4nZ47DVD0yIwIkY/IXrpnymiOV3l
	 PAnxt4b3gELskXUI6zFE3G+vFe70VwtGMW4g+RHGo3HuizuNxftwoqMPOEbxG1ziSC/RE
	 mG/3GApOkaTPvFvW2eJQHq9nUGVEk2RoJ2uY1WTRZhLc6BgURS/EOzDgZgk6I6+kLoDCI
	 9a80ByiyWgxHaOs3hlTzYLSdRnotHJS3txrDIXItR8+CkUllwcfA6vjNYbjmjn31ThO7b
	 iXmO+WPKX8R5+HXKjwpDOWak62h+LtAZK4aY9M8ROikL5F1fCsRs72Dv+PNjh9e2byQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789588157;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=PmQ0UW82Az2H71uArioyoVhYjQis2r3q0E/W4oCGsno=;
	b=m/SklGonocBE0dvmCqSDl8UwvRgJSqdLPJawWSVdTq6s9JWGt4k0/s7hO3hldmRf1JAS
	 TrVVS7wXkbCvYq/d9JWi94siS0f4fKJ5qbVdL2vqW03rpXpzfzZ1lDY1wLMMxCY6VlDY3
	 eLP4FLNq3+V5+L6mzvgJ3eJ6tSDpqMPBGoK/6HtrgQdYB71PfvOY7545mEtNxXlipVJp9
	 dLxjmbwtMf7K+Wk61y7nPD/6WYg64B/QtBAxCqqbK8/8F2nXy1hEpd/T1gfZgXSN0+Tx5
	 zf1RgZuOtvgTMfarMP2I2JgoYkrFWuz7KVNNR2s1Sj3mjtEwwNL3Yl2aQcVm/pikByg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789588157;
	bh=PmQ0UW82Az2H71uArioyoVhYjQis2r3q0E/W4oCGsno=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=h1C6Xk8TOIi1xeI3atRbNr/kCCA7bQbkzSQdswshs2eJet7EeurZCqk0kFSi4YI7n
	 jJyjI/isKFno18u2+Hds8AelgwkI3OpOeuGvb95AVLo5cgLVExTDLHSyLfGfHVdS2u
	 +/aoeTN35T7RumabZ7aKIgv0Ws0ubejWP0VYfc5sXSECmM8XJL5EntsneeiKPTrX0V
	 LGk+xzfW4uBrWNTvNwoprLAgrLGO1+7hmD0W2pmXw9c/4rxPatfFMwGEIc0j4TGwod
	 g8GYSKXO1D3FBQ0V3KWvpxQwElt24M11HyUeIEY0wMGiJQOqiuGLyo9LCM/CSpRT/N
	 9L6QlbXLdT9/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E0926061B;
	Wed, 16 Sep 2026 19:49:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 52A9B2E3
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4537C40635
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:49:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zvkuMaoPVC-7 for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 19:49:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E95E4404F9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789588154;
 b=YB5HF3BoPk1se48UQxG6CWgLxUSabCmAjyN13DNf4TUDg4gi6hBGI7rgaVyApfhuK0eY
 wKP7iD1gKclEPt81yA3Jjb9LgxWM7tdcZvql86j0CbO9tkiGjvuiakhel1GkLmukEkKL7
 pKpTJ1v4/z4R0Dq2jFInr4AKqpCsIpTZfGryUwnWoeA4I5HGCb8Y6RhKNHCJ33srhJAy2
 OKvZdCF32C6EyhBOCoZNCABqkz5F2BHlShIavR2EtALpMhtrD0DsEBuZ8+RR5eYfn6ovN
 vTn7hSm5P3YnMtBACeikc8Cmmdk8TI/iYLTsmEJVv4WJGSkGro4caeox/nLOiBDIgEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789588154;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=JE8nHHhZs84K8L0wa9oW2IIgFLYfH3/Z6Az5JD9WpBU=;
 b=I1xdBv7LBMKg0LzDQpZyGTE7T//9rYh5m5Rr+FuzTqpfdTEWqKQZA0x8PlDUX47uWWMa
 lmzRDTUHHsDBt/6Yf/T0PVlHscJaY4Y8UmsBAtFPz1DgAgdCS++lGj5wuVkubmJrU3rgX
 BBT3ae3HiEOOx4Jn5e1QfWHZ7rorYNx+Qk1sZ2H+1HzHoGGaLWSmv41H8FzkGofvTB48J
 Td/Tk9EOZDQwPicC/mIZDVtZGxy5B5imBEq0XjLSAh7gb5TkA2Q+zGg1RyCmXNfxLCtKJ
 4YiCD8iYmEZJUcTKhEUGmVs27cshYudxefS3FXMxp4Mtfp52TPEHPEv9rq7RNq1kXEw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=kXJsLNID; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E95E4404F9
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:49:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A1FC44E40754
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:49:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6BC1960337;
 Wed, 16 Sep 2026 19:49:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6425711C7B00D; 
 Wed, 16 Sep 2026 21:49:10 +0200 (CEST)
Date: Wed, 16 Sep 2026 21:49:09 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Message-ID: <aqryrF7eXjR4gEWR@windsurf>
References: <20260908191348.1892945-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260908191348.1892945-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/3] package/libest: fix build with gcc >=
 14.x
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

On Tue, Sep 08, 2026 at 09:13:46PM +0200, Bernd Kuhls wrote:
> Renumbered remaining patches.
> 
> Fixes:
> https://autobuild.buildroot.net/results/149/149aad6f98163faab14232a9d3013c197579cbb4/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
