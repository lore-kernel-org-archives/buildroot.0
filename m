Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F372CA5FF0
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 08:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0D6560699;
	Tue,  6 Oct 2026 08:26:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id An1DIGgE3CGc; Tue,  6 Oct 2026 08:26:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EBB4A606DC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791275161;
	b=hpdX+3LZO93i+91Bk9w+9BXZ8sWtQ8c+WQqMPfH7G7XYUUbrsR4sXwZ8PHhijVprTN7C
	 f1wwvkPuAXBjnA4e710k1Sh5gVzDQwZOeT2nON6O9cVZR8QYp9zXMbmTqOSs8qkSE3Rx2
	 kYmaujx7ELee+E3TBJIZXVZYLWzhc+cIj80VHsYZflPcMHAlLZ151eNpP/SdChlsNMUK+
	 QqDz5OEOEw/UeeqYCQHlvPIjvbhZN47dkLKeLD85D1QpDsKJtQPGMYLMGdcoADgSKvUII
	 1YwOi3ZMZasnbXV+LmNkILled5wXfeH3OgWjFe3DDvhbLbDe1hv0xzfc0ieIlasd8BQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791275161;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=XhGplrtNSEghoUAz72SN0Y89fpQh8DZ/HOSEApNiSqU=;
	b=NzoFVKL1y6ZzC3tW1DSJhSjIaZAFUgB7dj9seYs++SiYh8bgMWcogUP9oXIVnV3xLeG7
	 LdKokf4SprmbFD2H8eQ9+ZsmP8L5H0CcsrF/2p0HHRZHPNQPy9JpPeef0NyStjbDFQls7
	 4EfOa9hrIaju4+DVL2Sx09CxdKbi3qeY5rlS6wpNl0nSdB1G4Tujx1bfnoCEVNIx1C2fC
	 +fxMD+S9Z7P3Hh7/nOpMx5defh9S/udJthUPxmvP+0Kvuoj74W54EKBAZ48iQsxz59MMB
	 TYcrebHi7AiMOzGNMHmO618Mw9Y0Lbv0R2QINHousbegUvcyjmLa2qY1AulhU4uh7wg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791275161;
	bh=XhGplrtNSEghoUAz72SN0Y89fpQh8DZ/HOSEApNiSqU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=suebXjj+BfI1v7a7vka3IAYQkXdyTm1pJ2c4ve4mR45/BPoTJ/3xx90u9DlwTOFaY
	 3rlh4o4JlyJNuzFBljhkNVp916kZUkkVYWDkos5mqXtqcPoR/neZr1YgTeH63sf0Xo
	 Wyy5Bhi/J5Ko6afx9wASRsJ9DSU2R1eBLDpVpHgPyflAPmE2CBcBQFEwyKRx8hM83Q
	 KhyWWDV+9Kj7EgOGxCE98amXkndN52m7DelKmJb7kwoeqZe7rqQtbt/YyTMvAAXBLs
	 hU2E3yScgUBG01sA+cT1EzPJabh4/CuYyFu7VMbf4CDLwTqSgWOJUY15SwQTkgs7Lu
	 N/sUh/asZpkYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBB4A606DC;
	Tue,  6 Oct 2026 08:26:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 16687282
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 08:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1358960608
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 08:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nbpddiqlgTqO for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 08:01:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B4E73605D8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791273669;
 b=Xq+e6QYqXe4JC5uQbJZTY24MoEuR7oh1+Lzg7ntmeIeKvQP4ob1FLRmSxGS84IuAzYxs
 dZzQMgIHcPZAaxAA2NZdEcH36e/zL/RxTLE7FWlExBvkS2fz30gd+NpxURq87M1WB5f3/
 CH94M/lj3GudjV5rAdz1DyXniL8v7IBlmy+p03X0MRSpvYeNoDGM34grB/jUpWyFD7gNZ
 +ESHVv3zRYdllkqAItfJdgbE4eo+ufurqxbbm34w9U/Z0ApDHmBSQXWFj2RnNrgc6Izv8
 R0omuS+Nlpx29v8/UpxPi41nwZl2sYghyGkP7AFN3l/yoZWiu+1GgmMP+QMKr2r0HtA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791273669;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=u5v2qy2lwbBJB7H1wOAs5cvRkPhoNH924ohKuDnt2VA=;
 b=ajEdhFCjd8MLROY35M2HcyW54KQDiHPSUYBU7T5dlfUe4Xnphg71uNDce1leut6mwhfJ
 ZPwwq4BsrWqToBs4tjMaB4toczAdXp5j9jze0SrJu+gnBy8yY3jfjUrkstC1AFzElroO9
 q3+SagcMXBjdc74CGf83Lrq2J5G+97tUjzmxv8wqvh3Di31O7CkUR06fmuGFLSMwFYz0M
 qUjDnaQWTFSM54OEhVgX5ykyCFs5M4KrH6NrKeAliwFyxkkMPnT6uZ4T+jZGBlKiFkJQX
 i0D+Pun9WjyFu5lDP94rw4MVfbNGglU41LYi+COkyFZ1b0MrrKl7wlVPZ7mmwrKznPQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="y2lmn/pa"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B4E73605D8
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 08:01:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 18BE84E411A2;
 Tue,  6 Oct 2026 08:01:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DF05A60553;
 Tue,  6 Oct 2026 08:01:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 76422103308C3; 
 Tue,  6 Oct 2026 10:01:01 +0200 (CEST)
Date: Tue, 6 Oct 2026 10:01:00 +0200
To: yann.morin@orange.com
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
Message-ID: <asSqt66flNtbPy6V@windsurf>
References: <2948b55509525f0a19b4bd9ad26757d53261cc00.1791263777.git.yann.morin@orange.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2948b55509525f0a19b4bd9ad26757d53261cc00.1791263777.git.yann.morin@orange.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/gpsd: backport security fixes
 for CVE-2026-58459
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

On Tue, Oct 06, 2026 at 07:16:17AM +0200, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Bernd Kuhls <bernd@kuhls.net>
> 

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
