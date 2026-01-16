Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E09C982FE
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 20:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FB9341A5A;
	Fri, 16 Jan 2026 20:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oqzXJ9D6sngM; Fri, 16 Jan 2026 20:59:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A22F441A50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768597173;
	bh=v6TW6uVcSqAS46HThyLBchVAeC8w+jEeSFCrfmg13cY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IEbL0tOuJmicjtGnsnsUNc/Jweoch3B6eWmHzb4uV6WUMhEY7jtV8kUNl4QIuWqcF
	 qocssUMf40NmYKugJG2eDp1bYQDDIlQVzuzwDOeXkqx2K39FQScWt6Qwql5zfDq/C6
	 e8dtmilhjCcAbjOYfvGuSEdaVqIwqsoOEvrCX/x2IjDMdB0ttQkRkwZ4S3IMiPRjDA
	 w3icujtQv40zhmfuF5YUissGMG1yTpzkikSsDgJA+OmGsc45Jj2kqIRFvGAjI1mxtY
	 +4Fih7NZ2c44mjDifOAeul6wrHIHnedsTJ7iyZbSYD+5O1jwGyofVd3b6uS90F+bq7
	 gpvuX9adXHzfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A22F441A50;
	Fri, 16 Jan 2026 20:59:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 165A9223
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF82660B99
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kYuS4dw4n7mK for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 20:59:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1D08B600CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D08B600CA
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D08B600CA
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:59:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 131CB1A28C8;
 Fri, 16 Jan 2026 20:59:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D5363606F9;
 Fri, 16 Jan 2026 20:59:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3779010B68E15; Fri, 16 Jan 2026 21:59:27 +0100 (CET)
Date: Fri, 16 Jan 2026 21:59:27 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aWqmjLla7OosDc32@windsurf>
References: <20260106200115.1985522-1-bernd@kuhls.net>
 <20260106200115.1985522-2-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260106200115.1985522-2-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1768597168; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=v0poUBjwUjl5QzXa6QdPYJM3UJopV8bYhWWN4+3IKFA=;
 b=c4dQWj1Ct+zuYBdKoZOMM7o+WF2jYhU/pUM8Equ2HnMPDn+xvfk3K+7DNDPPCAcExzMVza
 LKIk/NLmha0/zPpJ+p8MSmZ6qYjQhMw/T2T6+6N4/j+XCVD4RSaDQAYGiEXkFeK1Ca0Piz
 lz84yVoElqqw9P8Dqf5O6CksrhfW9zLqosmZeln7XyLv7yLhz6LGz7coRU6Mmd8lCLR6kW
 4XrqQSa+EhNl5jTgeL+uKvuAOY5K9MxT2BYvZ/ZzRZZk92qb1Lczj+wQ2Y9bzawlLfHgJy
 XKuclvFvvTRkI2QKxGZYEfXs7FplDWMyN/bX2fWoWUBR9HXVwl7Oo+p4AQjNUQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=c4dQWj1C
Subject: Re: [Buildroot] [PATCH v2 1/9] package/libsvg-cairo: remove package
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

Hello Bernd,

On Tue, Jan 06, 2026 at 09:01:06PM +0100, Bernd Kuhls wrote:
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> This package is no longer maintained, no release since 2005, and its
> dependency libsvg has build issues as it uses too old XML APIs:

Thanks, entire series applied to master. There were some minor issues
on two patches, I'll reply to them individually.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
