Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D2DCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67350813AC;
	Sat,  3 Oct 2026 13:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OF-KQoQrvzsm; Sat,  3 Oct 2026 13:19:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9C1F881373
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791033573;
	b=LBL6Fa0gaDSSzf8PB8RwLYs6XzoqTLgESVRryYJG++wYyCeXxwFIZalriFwvokaa2gV1
	 ZfUFNmyS3JPe5f/zm0PtJQ+axIL77MlzslOJ4NlT9tq6x5YzKa4pDwI+cmX6G30vVg9yD
	 hkwvTDXBuf6Opr/32ZoZCAJtFWavTV7NzMedorltC6AyatvW26p3w02vRSelC8YQ8evNY
	 +/keBSUblHLQPX/1WvfZ5pOk2WBE5jCV4jV8/vL9RwaCcNhQe5hVtYrmppNPBZo30cYiE
	 739BXPigRgHiIQXdbQHBga4nhk3904znSYkEnnoCpO9p23B7ieErhNm8irpQ/7ZdlWQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791033573;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=EQf/jnTLY2ZgRqNf05U/fvZ8tqjXb4UIAP4AjHt4e2g=;
	b=OlWLWGsPRJqufgfII6yo6aEjMqR7pRxw9ur+J30iJY3iImsjEbKThhIOrzxaYT7bBq4M
	 4C1sDqfVhuZ+XWVyPNl/jGIOLYDUc+1vkdTdikMK2D+koBt7O0X0+xHfKrNeSHO33BI6y
	 lWwhZUfDvYbNhmy4YkBTCL3W7QUsiGRAXgVqHw4ZEQt02pqeKqqaGdqyLMZeGsH4Nd8bF
	 n46oa0shjtATYC6UkEOPl+c89uOrtxV8VHfq5DpW3NJA3vQ7zmJm67HZxrnjgL0yMwDZL
	 3T7CJfn0iW40oMe4oSVcve7nMb9aXF/b3AIZuypza9I/4iJopeyBtp78hE2mAZQD8cQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791033573;
	bh=EQf/jnTLY2ZgRqNf05U/fvZ8tqjXb4UIAP4AjHt4e2g=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NcWVs8a3/2c8sSfxpbDMnZ8IMCmVL8RBErwvELrBg96OzjRlNoqFZGWb/oFqaGmTT
	 cGzg4L8taBRRJVQ3yanbZKFdCC6+oOBq+p4UN59m1abOdZz3v+Jb2EMnzBE5+ph6Pu
	 awAeNwZH8ceVkTYpFyVxadn9GEeIEMNFkpNr3wD5HHSrIolvVGbaPBNmeCbj+vPySw
	 jaE2V9mkV8vItYVZlSK5BwKUvW25fWwCJZ9lDU5xqNLIbKnNIeYRufd5mYsYV6/KwZ
	 KYqTKDY0auR0e1Kf0ZEpuFW9Dn85ldsulbQVsj1BHArcmIpvcUHZQ2BkmuJ2qxW70F
	 I9nF5GwB9Skgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C1F881373;
	Sat,  3 Oct 2026 13:19:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 899832E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88F0B4145A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oDL8MEOl0ALY for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:19:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 79CEE41402
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791033564;
 b=EsBZTUYxnLGAlW5JJYah8yBMuCXv/0iMPM6l7ZQBjb8f5O0nvdE3B3c4MqTAwQhlVi0X
 iJkMaVKpR4bQjyWLtDvFHIBFIyDrKcp/Fu01g7wCkGX2kr1Ri7wLewaIh9vO+DYiqpgLw
 iA9d/hLOwOFOBr2jreLiWtyxjQtxakVusQXKXOKQWetCzB26wron5Bw8njjWLxoxehVa2
 qT7a+g7+bxXNfS7qc/clcJO9Sv4Unc8IpKQelSM8vgOevxBlb5Vuvy6JQNvypMY1aYp1S
 3uQHISowbz9NYfiC0XN4iPtWsfb4uorr8lGZLVa6xZySOeAUANwNv1YGLwLkcARPAWA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791033564;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=x3t8XyzW9ku1BGrhW+brf8iYjf8IIzrkF+CJXuM4WYk=;
 b=cIj01NbHrtnYf7xZb5frffOLOWnu93KNX8pSlaEd9uaBg2ZOmDbxeGsfLxl2itdkP/O/
 cUX8qhFgt5nGg2+GVRMu6oxupukASv7ps7CZd30TP9MJeO3ZqWFX+7YWb3xQip0Oe7aV0
 up4WhRSgJQeRRC6mgIwOj7q5Skezy8d7CYeqyciQ01cT6oO4dajEJmazxZB8tseLXCXcB
 bqSdZT4zrcONdS/BYbMEGZdPRcpvstXb5MH51k6L5iuDNH+MKW9dC3RWtP+wVSkb8zzVC
 i/Iw9M7URQjYzmJv8XDwOV9iivC5xBqrCto6FTx8dNWuPN29T8HhE9tX7Z0dQnhuJOA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=XbR5slal; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79CEE41402
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:19:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C679A1A10BF;
 Sat,  3 Oct 2026 13:19:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 95DC8604FF;
 Sat,  3 Oct 2026 13:19:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AEAF2103282A8; 
 Sat,  3 Oct 2026 15:19:19 +0200 (CEST)
Date: Sat, 3 Oct 2026 15:19:18 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <asEA0z8_m0d7fctl@windsurf>
References: <20261003101632.819950-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003101632.819950-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 1/1] package/gawk: Add upstream fix for
 systems without MPFR and GMP
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

On Sat, Oct 03, 2026 at 12:16:32PM +0200, Bernd Kuhls wrote:
> Fixes build error with host-gcc-final:
> 
> options.cc:27216:2: error: #error 0Wabsolute-value does not have a Var() flag
> 27216 | #error 0Wabsolute-value does not have a Var() flag
> 
> $ head -n1 output/build/host-gcc-final-16.2.0/build/gcc/options.cc
>   /* This file is auto-generated by optc-gen.awk.  */
> 
> introduced by the bump of gawk to 5.4.1 with buildroot commit
> aa3db5b4e15c8dd67914d58c8d03ae2df3c92cab.
> 
> Fixes:
> https://autobuild.buildroot.net/results/672/6727e71716af3df8e2175a50740388bc669e5462/
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
