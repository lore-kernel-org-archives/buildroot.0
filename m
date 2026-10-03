Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489FECA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 16:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CBCD6067F;
	Sat,  3 Oct 2026 16:25:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pii87UeEZgcA; Sat,  3 Oct 2026 16:25:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EBF606068A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791044700;
	b=Ph0dHOzYOudcgQkQAJQBdILml41fWNx5q59ziEWAYO0QnIZF0iDDGRfbwetZvzvy4mXx
	 de5C3Jirg5zjFia2VRUvXkC4ZvrKiCSBYIdJp+dJbgtfb618YGoEwiiEv5FmZAmIuTUl1
	 kfoZS6zdi//8EIkNz+G4sin9niniiEn5czjzwq+lCMjImw0R5Y2kXLEeQzlH6OoaWjOOA
	 Oesm4YvXLrsXKbEp1ANF5jrETZP+5auAHXN8dEWo/tcWe45QbN083KBMMXO1STmK7srRC
	 5Yi9+RNIb+QFJVVumTf2NC26youWaoUWrzenij7AqxQQiNmQVtzxLAT7KERDxXHOwnw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791044700;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2scc1tVHFgSWShOn3eVeldbuTHYEOTm5zBG8LUqiIAY=;
	b=iFSEIjze9mw3Sl5mcfwk61FipkYHwATRYWwuENG+H1Kv6kg4dxLRCZYI9zDgKablCTGT
	 u6ITX2XRfSf0dAkuYf+Z8YI9n3QH4x1lqtMUK/3iMr0XsD33/Ola208GzwvlaJuTpLlBS
	 yAps2514+GM/xYRdBLjJvuVSUGQiJKlkHTx7HCKqy+GHUFKa0w1/jP+WOkqbNpAg3xOVK
	 9iYQAFlB5Nm8RS2IaJpY+WCDYXACenYjoMdykbOi+tn6VXtIOrVUPdxrEUUnFSLTSt2k8
	 LHjQjj9MAOH3ItSg4rPgj4DZUnY6NEJh91YbXALOU36HjFzqV1hWmAlievXUIZV+wzA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791044700;
	bh=2scc1tVHFgSWShOn3eVeldbuTHYEOTm5zBG8LUqiIAY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VGnO1GHQqjd83bf4pT9muFquk+o+rQM+nGXxSjfX4AYHov6Bw8hhp4U5BnpaiPQNF
	 x9yyOcXENdtIdZjLOmyw2huEsWTq1ARnUXq638VFSjhpl5e+ghHNDYEwG4lYS/+VkZ
	 SpLH+JJhsKrleYW4JVoyLLRZ+/sBE665hl1j4eUSrhUFi6Mc2xQ2iEfjAvG0i/f0Ft
	 bAQW4IoV0WeCOtjQrRMr/jHm8bwsxOKV++6U3S8przz9zlgwQGdVkG6Dre3WhDfy4w
	 k66z1rhBHnFp2LTGkbjj37GLFyW+T1tgs7/d6tG484NET2S9sKDrXOsjoR3Fael7Jl
	 eW8NQDny+XW3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBF606068A;
	Sat,  3 Oct 2026 16:24:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 84F63335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76A2280F7B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:24:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nsS2W2rJLQhV for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 16:24:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1092580F85
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791044697;
 b=cEXY7TsvYv4W10uyFsrf+jIKK+aIEtU4YMgqvOkvULP6TEcp3+QjPRWTHOOS74D8Vf03
 3mgxW+HTkss08mpsCrlL4yX/z8gC894glTcGL1uK+70B3dbVwnCJ3WJQLYQZMu3jG/Yzp
 +TxKpT1CZv+yElIZCDHiI31l2dof6dIqctEEcglDma5iOcdwLR89vsXVvkCfntDYOTdgf
 D2rYcEmo8lduST+N0esogmcnTfP3Xab8fXDwzedULJwVlwpd3Y0B3z+A+4FMZjwzvfmN/
 jQt8+0wNMno56pIPlI5q9i8o6fyhikfOBBWDFFngc2tlRmzkLlyC99XSVfvsNVF8yQg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791044697;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=e7b+bYNvgRp6x+jaa0VoZsgQdgsxkm5TXUOaTHHLc6c=;
 b=RUmSp286IwZRhPG2ApP0J7MkQsZ7M9tM8gpBg6ZKENXqGv/mfYFaDr1SfZnAqdYm4+kR
 /Ddm1DUqxZRYITZOWohag8jQZknAb5EDnrkjcpbZuRlMRALnedQXqNqiPaAadXdc+7UUH
 xTXzD7emnHJG8qT+FSSOUJ5nBHj8FwcSV/oQQcm7IClJbI3Vg3MO/pqAkURQT7fnuusOR
 slA3rmCubeqxIjwQXzV2IyYgD5tJliZ/0+2uI13fU23XvvXbmjqMLOWl/hIq6tJ5ylspE
 vXCZqZnnVZPcxmp5UaBIxlY2s5Wd10IIMD66j6NUdyu3A/EuFf/8Wa2o7y3ElImEXvA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=BqA9WNwz; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1092580F85
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:24:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 562661A1108;
 Sat,  3 Oct 2026 16:24:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 10D05604FF;
 Sat,  3 Oct 2026 16:24:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 37F2510328170; 
 Sat,  3 Oct 2026 18:24:50 +0200 (CEST)
Date: Sat, 3 Oct 2026 18:24:50 +0200
To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, Norbert Lange <nolange79@gmail.com>,
 Sen Hastings <sen@hastings.org>
Message-ID: <asEsTXwiwLELdPJB@windsurf>
References: <20261003154624.2746137-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003154624.2746137-1-ps.report@gmx.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v1] package/eudev: bump version to 3.2.15
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

On Sat, Oct 03, 2026 at 05:46:24PM +0200, Peter Seiderer via buildroot wrote:
> - bump version to 3.2.15 (for details see [1])
> - move group 'render' back from systemd to common udev (see [1] and [2])
> 
> [1] https://github.com/eudev-project/eudev/releases/tag/v3.2.15
> [2] https://github.com/eudev-project/eudev/commit/dbfd3002979539a3dc9a1f20250e3229b048d090
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

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
