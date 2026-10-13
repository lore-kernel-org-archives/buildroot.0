Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7346CA9ED2
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 08:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C355404C8;
	Tue, 13 Oct 2026 08:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AdsVUJRRsH8C; Tue, 13 Oct 2026 08:30:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4E5EB40656
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791880210;
	b=f6iioqaWTdtwP5qhexriSVdTnFBNMU5WG/GfAtBZnucWpskbfh3BtJyg8FwVvVuhNQpi
	 idoGGKyyOjgv/4sRYt1Epq9dpWvZeUvEZBiOpbrHGrUwtaAUy5/hiSNBft9MVl5RkpQWX
	 GqV19vmdhtLiHiHZVZb0w5a1EpO3MfQtPjJQs1IjDxPtyBpEF2V7V9JOwyHbaFViLrVaZ
	 du69/AxuebSptTnp/cgiauNkd4tzSLD34Kyr1q8/RPLo0z22PH6mHeUHn+yXvU29WbfC9
	 Gc7ebA6eIbyc7FPycZmCFTipg2eceN7x1TBt1BpktAsOXeHMFzPIw5lTYMJaqtfvVuA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791880210;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=TA4zyykWn57JyVHBtSduMNtz+C/3gD9B2VwvfAS5tMg=;
	b=CO0fEv1V5s8UobWMXYsfLBi7iD/dAJhBSlMqSlkwGwy5zLE+q5So1Frzut4wwdo4KcOz
	 vrw1WrSIUyRuzBhBeoAb4U6zORhOcpIPxfz0G8FCt7WrE2ZRoKLStLZ7oJdmkBwnUhv9i
	 a12Oj6wLNiqaA1T/nLcuVN+9c/UCYbGWjSTYb0t0gIT4MQ5u01rlsfyyQ1xLWsDdtfeT6
	 Sa38LXyJcxVICNm61sOa5emS+ulF2Jb5VLVE2NwRbClvqSmRy02sArFPFuvtpO/ulmh5d
	 SRX5c9psUCUbJ4Lo5tV7ywArb1KeunPag4s2Nm+Muq4jjLzdVFBFMHmqLtjoGR37wsg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791880210;
	bh=TA4zyykWn57JyVHBtSduMNtz+C/3gD9B2VwvfAS5tMg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cSGSbIsOHMo8ze0Xbq66TVB6JEUZscuv/cP1YfCc9CRR1XZ/LnArwd47RcFMrDiHg
	 YpmAEo1R68LL8JaI+OLQbBoZUTcZ27Qcufov9fovdY1NLDfrE8I7zbqeU1Qxd6PatD
	 H+zSNyNTeXCxVp/SxZ0cZtDFYWTgnVE14kgh7V3AKXAFf2UPRTeHzCLcsXfuVQgDc0
	 8ZnaTvan4WSsfAknjTXMGEBeeiFNWHJOwsSdwAhrqzsLQjVnBw71Ctpp0RvGeuu3Ex
	 Jfxo9Rpo5EFpebM/pTBkFA/NPjfaBrKSVIcVqW96D75GjIXgMxCndxwKE3RfsU38kY
	 gIXMxfhkYlI3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E5EB40656;
	Tue, 13 Oct 2026 08:30:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 541601E9
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3444980A88
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:30:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M-W8YjsdkfOy for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 08:30:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C15E38096E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791880207;
 b=BOka47g/3Cax/Wsy0z4k2ycAMDz0CeXHlbM+JHN8Xy0ee85GrAjdf0YJsw8hibseT/xp
 sG7eBmcCiU4aLcJqzGaXgt9xWYxZESzZGZqihdTNq9E49eYbCWUJNmpNZ8dkzXaOIbU5P
 oNFdQUW2nohxZmOUW7EtzfU8VivK0SBR80XEHGZ22j72J/QryGY5TF8jQ7D3VGWHfd0nK
 4a31nKhkrKQBICwdJ2Cng7TeT0lW0B5C0LG5mTVLeJr358VyMkEAwV/KT2AMQDwHYAOgW
 YNcpNWqJO0Y/eLn+6kJ6v2UV+ZTBcd4IWHYq/lGoLBg/UFg3mmlK7MX1QvOvwI/IdNg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791880207;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=D7hFVxND4KmZ56TDfERKiHtN8OVoZR6Fm5QmWMUKa88=;
 b=d0k109znA/z+ON4gHL1vSPoQ4RrhP6JFdAnuruUrSVmlmWwv4rzDcwP6t6x5loqfV/Qt
 SvJKRv6fvHTaTFE2uacQy1E7la7iXWasDpQhV2HOuh1aIi+grSFse8SecsRg6anju24MK
 u/6wk8eMQwjcWqWSvr5aTKaDZHjDs+h/oFQmgO3ffq+GCVBOXKT2hirf55LaFfLdeVkH9
 aJp3IZ9zq6zjpd7xJVq/nPecJUGCD3eqy7QnptK/GvgqockbFKdUrmY/AOQQsIWo0DDyp
 /nUJoD6FXEu+qTR5lYSumkWb6YiKPSvZeTCWXGo1GRvfBINntKy3ozZxKDnuE7UP0Tg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ToUfDxq6; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C15E38096E
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:30:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9A4234E411E8;
 Tue, 13 Oct 2026 08:30:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6FC1060362;
 Tue, 13 Oct 2026 08:30:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1781F11D70CA4; 
 Tue, 13 Oct 2026 10:30:01 +0200 (CEST)
Date: Tue, 13 Oct 2026 10:30:01 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
Message-ID: <as3sBMTyVZrg4lJP@windsurf>
References: <20260607213030.1509913-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260607213030.1509913-1-romain.naour@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] configs/sipeed_licheepi_4a_defconfig:
 glibc needs gcc >= 15
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

On Sun, Jun 07, 2026 at 11:30:29PM +0200, Romain Naour via buildroot wrote:
> The sipeed_licheepi_4a defconfig doesn't build since the glibc version
> bump to 2.43 [1]. Glibc increased the minimal gcc version for riscv
> w/ ISA RVV in commit [2].
> 
> Select gcc 15 in this defconfig to be able to build a glibc based
> toolchain.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/14728914049 (sipeed_licheepi_4a_defconfig)
> 
> [1] 227378b5930b681c79a13476ae60a98753a98a03
> [2] https://sourceware.org/git/?p=glibc.git;a=commit;h=47975914fb106b83c42bc0baf6435a0944a23d30
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

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
