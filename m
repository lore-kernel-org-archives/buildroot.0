Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB7AC88E77
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 19:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E268404EE;
	Tue, 15 Sep 2026 19:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hrfHyg9U43P1; Tue, 15 Sep 2026 19:08:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3B0F4404EF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789499281;
	b=YjguxI2WGKPC0sb8JP7LiUDtkrxHOHGlM1LVokyYFdEl8aJq3mW/G4u1NaGbMEQcqx1E
	 1/+1nSs1gEo3rG9Kvqe48nlNAkYDB4sZx7dUltj85BwVjFOEqUzZqfz67cIhJdUANsYes
	 PU5L8D7aLLsJowMv0QeI8yuOPhzkISJgF5zNQE1kJKjqMiuEjEZpWKrdAl+HlRSkEHx7b
	 XbtWWBWsetxJPQnY8lDqMKToKOjlNTxauWHjdQzkXnj8CtdO6h2XOS/+sFreLJMg5MmP0
	 wNgB6ZszRfGVvE6t3O92YGJmQeJke7qgoZy9NcvM/8mbo7JVwt4ZI3ezH0VpwBdEjhA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789499281;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=BO6EVTx33SPgcuZtM6lqOdWRkBUhyd6u2Ln/wE0VanQ=;
	b=bhAZelsfh6wvWjP+7SSAFJROvOYc7oL4CF+nyhGLvViAehiALCiPPtNpanmtzwcZZoZM
	 GsjiwSqXoJAVEQrdncuUaaxSlQs4irm2GCj+2162xpopUgzu/J+KwhxfP7Nl10WW+F11n
	 +gbug+3Fd+oTQWmvzNYmW1dEX/KWXT8xviovMYehOpA2qNvGVFlVNyd2PJfsNYP6lCyrO
	 xthQT8zjANmfFN6imUHV1n6/wBcmd8h4UuHr/DkOn6Xh/oLA9HbSMkk6mZCAv6208lgG7
	 d9JiH4W2UTJ0B8Afh8lTmN/bWYH6PJYA9ITBxIlplyGDVA3Nz79AojpSD7QM3ru+dDQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789499281;
	bh=BO6EVTx33SPgcuZtM6lqOdWRkBUhyd6u2Ln/wE0VanQ=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=ackH20AnBJ/r6TRACHJQ22GQkbSoLcmo6I2jsomn2OhFjcqbhHc9ptehwDm1Ne63M
	 G7cIoGo5UrySIX/9Fo71Dv9Oy3HmW51CXnesWC18Kg9QPBx/BtTh4DDnXE9VSpknhQ
	 KvS2pEciH/1cI/9OhFyKxNwUwkn+SZ8ILmlNH8PaszkoXOmfeMp4X+rdl0kAhdhiyD
	 y9xXeUzXcyK5+lDfekJ+vQ/4Bw+WZXI5S/Sir86vEk6f5UxQyUo5MUQUFdAMTEIZet
	 gSniO4j50QmEs5G+WDYjzb5A+Jxk4WU8AhLbAMBs/h4ka9g4KruwJkjTkhD5Mmbz49
	 te6XAtviavbSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B0F4404EF;
	Tue, 15 Sep 2026 19:08:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 683742D0
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 19:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59A70404EF
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 19:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B2pfeweM_67m for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 19:07:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CEE1A404EE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789499279;
 b=mciLpEzEN9BuyeGtpW0rc0CSrSnrqmFf4aYDTF3gei+28rOIflRXaNFU/MUSwBKIdm1S
 MoQBid2px2u9VBtQK6rX1emrXDBvgBrIeaRzK/y3xWJp8d4ZVxREA7ojNNdOfVZ2k9zCf
 SHSZYq2GIySRnE1gRWFpsy+k0aBQ+ouLQHWh8kjp9kxII+d+JY9nPGRIZVyj160+e1C7t
 z6AkUWyS4DfWLgRPcaHJDXpSSALQHb1TyLyg3XCRIxsSuXa9PkwT4IsK+qQdd0e9kKzQX
 a5Pcd5ZEzoqBc0w7c3/W3EVX7CsIgh1kjLkBFIQGO1cwQjne8VwwHOmudQeomsglXkg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789499279;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:References:From:Content-Language:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=qJv/E7V75VY2oEEPH1coSTbVoe9n9T0/VSAm8hE57ng=;
 b=myKj9nwrnk+BzOd5+fwa8PDdYulaz7Vic0QVzYASsW8Lo0wVAWKefT3J1NjsRTCy6z6z
 k+0aRXzB3f/3uj53uQCdsfh6CskTmyFVbo3Bw+NroO7PPkuP+iu3B6cFxrXRn2nVpvKyJ
 dILEagekDbX1J3GrJKcF6RN0ojJLgnp9W5G3hzbik48ubqiwPippqdS2YuTnoRLUYmawZ
 m4PMVPeglRwh4ZrMBplD5gUZPxkqOh39DoBIq0e+XpLnFzWc4FVg0+KYUerDKambN3TOW
 qX6NekRnejIYDJsayF1O+sV5yDAoqno4X0xPYfVMz5749/aPLTCLg7KK8sNSBLJBVtQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=rnout.be; 
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=IXiCmVDq; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CEE1A404EE
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 19:07:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 377BBB9796B2; Tue, 15 Sep 2026 21:07:50 +0200 (CEST)
Message-ID: <3312f26f-4be9-4012-9954-310067e1e3f6@rnout.be>
Date: Tue, 15 Sep 2026 21:07:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <aoGuKjDayPKtSpxp@waldemar-brodkorb.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <aoGuKjDayPKtSpxp@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] Is it possible to depend on internal toolchain when
 uClibc is in use?
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Coming back to this old mail...

On 16/08/2026 14:33, Waldemar Brodkorb wrote:
> Hi Buildroot maintainers and developers,
> 
> now that my uClibc-ng patches landed in git master I would like
> to enable some packages, which were disabled because of missing
> features inside uClibc-ng default config (fenv, uchar).
> 
> When I would add f.e. quickjs it would fail in the autobuilders
> because of external bootlin toolchains, which does not contain
> these features, yet.
> 
> Is there a way to describe this situation in Kconfig language?

  There isn't, unless we add a symbol _HAS_FENV.

  What I propose instead, is to assume from now on that external uClibc 
toolchains have fenv and uchar. For the bootlin toolchains that is the case now, 
and we no longer use any other external toolchains in the autobuilders.

  It does mean that people who have an old toolchain won't be able to reliably 
use it anymore with modern buildroot. But I don't think that's a problem either, 
in particular because there's also the 2026.08 release as a boundary.

  In other words: go ahead and enable packages that need fenv.h for uClibc.


  Regards,
  Arnout


> So depends on buildroot internal toolchain if uClibc is used.
> 
> Thanks in advance for any help.
> 
> best regards
>   Waldemar
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
