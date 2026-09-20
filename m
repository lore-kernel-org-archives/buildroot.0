Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026EBC982CC
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 10:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E83A605E3;
	Sun, 20 Sep 2026 10:12:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wd4rc9CcR6rf; Sun, 20 Sep 2026 10:12:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4CD0E60611
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789899166;
	b=kg9d4UJqtrY0AfkgT7aIrtAir4xMDSYP1dakUbQFpx+hqFJ/XqNxnEv6hxNfY8gDEdL1
	 +hawjWuKYgcy/aj+JQUvddmIkB6ZuYxfywjiUuCT6pXL96DB1/Weu0YtRauj8OJ5LyI7s
	 S1adWDeFO86j8upfSQGyRYDq//vnr4eKrC1xpGWMRmlsQ1B9qB0+wDt/knJylGkgVEd3H
	 urF+4zYu2wZ7hvzllssw0WP8fjnho/sR+2228PkhdetlrFbkcPM6EVPw+srg2huYAoFyN
	 lKnnnAZRUiLlP8DO57ORQz5bGWzxq6s9oodILGIHOCztbbBYW9kobG+bVNXhOppcB4A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789899166;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wiSxJzOQb/kgir1lHMRdnGOFTPkePBQWCA6rX8oLfYE=;
	b=fqutFyMxHf7DKphJPg6uiBmqKXotzGNoVkw6yJjz7gj+OVfj6RZSAeP3aby+GbkVun3a
	 piaw7sREQtRqfvlMXMz2vIWHW/Xm4TiDkrz1QtLd0E+6jPvr/J5Cw08iA+hBgoDEdeKFx
	 QgPTGds2/DWgE67A31y1ohS4W3mHZ5L0cGOFgpr9pvXbAwMEnR8oB+5vNQTR9i1WgtQ3V
	 Kc6TRnx88wNNTxI+LiG1f6Rd6xGgzguItJo9/XOzfyvQ9duH3OiVv5QAcW5hKuHnwPiGq
	 LU42Kz0rOQ9ripGJrRIY/2NQ+Y3FcwvUPAXhoWmHFebQ7s1KbPhfUHxYEBdFvJKBL5w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789899166;
	bh=wiSxJzOQb/kgir1lHMRdnGOFTPkePBQWCA6rX8oLfYE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MEUmaM6g70mv6ub8fXdKNkAkxPoPiwZ/eR5oV+nHIQ5Dwwf8Lwrd3vNp5Sp9kw81x
	 oW8lw4BHh9O2cR1U8GchwvuezJzJRmBWGWma2mi46QPqzIK6tA3fO9TiZ1dhVZRgGb
	 m9ne+vQwFVznlsF2L67kqoeJSzHxR24Twptup2TodJsPJLOGNL9SxdyIJfu6rlgRYA
	 YdKlGzOlUNrQ8KfdUePdhInfnoPKybovnZaThPoGJ4kw1wQof4Zaj1MNTeS3vfiBkb
	 FnP/9rgmfgWDLefSgmXa44urSBdCEQlUYsaE2J59bGkeDI1AU8NduNumBpNnr381/a
	 hfFaJ2sXjSmEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CD0E60611;
	Sun, 20 Sep 2026 10:12:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BEC57371
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4AEC40062
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:12:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_xU88RR04TJ for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 10:12:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org F12E84005A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789899163;
 b=nyfrPcwXBu4+wtDAS6LChis3KLu8dDhxAnTJnsyyF7fDoKib0zVyq8pE7Ex9rDM1gawi
 CEi9lz2W1aSt6MyAk5X0m5R0JV+qSL7l/pbbt3Ut6onvA2mCrqbbubiX2Y38hcfpMY1n6
 FMonBmodF8Lq47klgqO987JgG5P0aLeXplEFMYGdlEua+qMMDZNLnaWLfH5STK/8dQXjV
 TWuSMknkk9uafiXQbcN7ho+vbKlBowTW8rNk/7uutZc4PMZ2c0VQeHcqskCBDkgJ+xMSO
 XVHPnFC/E77afx+hcPbPAuV31r6fnZb5L1DCXWLpwZgP/8O3wa1Zu1pEnAwkFjaPKvg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789899163;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=WsPTzeSAFb5Z3uljo5siUMs6LWc5y2+BR2GEL721nYQ=;
 b=AVe3dAM0yOthm+CH+SpDvFQ2vaayV+HyQkIbxzQBGUUu4mlTn9ILhMQuj/0Evyw+nVDE
 WoeryNcUzVZMXijIg0Cv2N8TDDGQuTpyGOorViAsNR96vvTupl2AZt2FUngeyCZfh3jhl
 FrPiyQgC7b2MwFdgoyfumsKOpOYUeGa5jsIPiJeFMYSZ3gicY4pfnPS+hSxC07E6D1Zi0
 /Mrdzu5eGdKr0mhD2voqWd1msdMrre1VcegQURLafyumvmPWYPgN5HNLuPyAvdEybQj9J
 TYppQj3EbkinYdPfqS8c7ZNeM5+O0FDJoPACs2X+BDPD3ImmU0tcW9p3yvNyEvFoBfQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=jSihM8l2; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F12E84005A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:12:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 23E99C51468;
 Sun, 20 Sep 2026 10:13:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 78C37604C9;
 Sun, 20 Sep 2026 10:12:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7C0E310328D5B; 
 Sun, 20 Sep 2026 12:12:38 +0200 (CEST)
Date: Sun, 20 Sep 2026 12:12:16 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <aq-xI2hUSAjajzbx@windsurf>
References: <20260221081458.865721-1-chakrabortyshubham66@gmail.com>
 <20260810165106.3930140-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260810165106.3930140-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/libmpeg2: fix build with GCC 15
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

On Mon, Aug 10, 2026 at 10:21:05PM +0530, Shubham Chakraborty wrote:
> GCC 15 defaults to C23, which no longer supports K&R-style empty
> parameter list declarations used in libmpeg2. To avoid carrying intrusive
> patches that rewrite legacy K&R-style declarations, pass -std=gnu89
> to CFLAGS to restore the older compiler behavior.
> 
> Fixes: http://autobuild.buildroot.net/results/53d/53daf0b4bd8b476252ca219e53a966405ece7e51
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Thanks to the input from Bernd, I was able to reproduce the
issue. Except that the issue also occurred with GCC 14.x, which made
your commit log and comment in the code not quite accurate.

Turns out that GCC 15.x indeed defaults to C23, causing the problem.

But since the bump of autoconf to 2.73, when GCC 14.x is used,
autoconf injects -std=c23 in the CFLAGS... also causing the
problem. There are even autobuilder failures reported for this issue.

So I applied your patch, but after rewriting the commit log and
changing the comment in libmpeg2.mk.

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
