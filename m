Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B789CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 17:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34C53408B2;
	Sat, 10 Oct 2026 17:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MBBFo9juVybi; Sat, 10 Oct 2026 17:25:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6810B408AC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791653142;
	b=qVGVWbvvCQaTxcGqmSVeLlVREA/EASBoLHAjrCP31tglvs8sI5gxzYne6C9TT0ymdQe/
	 cjv/WBGgCE0/ZXUVmxLzgKN7sUZ1MchaB9hDEB8u/Y63D4+q2YP0pKtU3R4E+RMmZW2vR
	 I6yvq/gpxbRyeFX+LaMGaJNcJgeTDomZIDgiEtpEKjMvVykuJ0OMse/kvGjgc30gXi7LX
	 xW2EY7UjZUNzEmNNt8y6fWAG24WhPTwUWYiOK4JMTHhgk+/1sZwvfk6kc4RMbX0W5LaZD
	 NTgvtp/nyA2jONHwmm3zFw7vH618mIoe39QeKnPLU7RjsTbkCkuJ7fAqQGg5QClGBGQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791653142;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=GYloSboTJHBTLrU8TCTUyRysAnmph9d28M6JDseWJsE=;
	b=TMKuCtUnMvQBbMxfth2WlzuUA8YPt58w9Is+auaIOcUqQdaO8bJq9hikRI4xH5sYaSPi
	 uxXciaDTZQCGw3kDCg54tTZ5DK56yMn1qoLY83+ZGA+/HA6LArjvt8CYe+Dmvl6pwkg4k
	 GDucRCwf+0SociNY1zyxC/NtRHasBE4wP5WvVkvry47nUltaMd0EQsDABjLMI8rrpgaQo
	 ffRtCsSL6DVLC5XADQQQ9xvBh4Dq91GEENJPE0JIYbe7GHwjN/iVMVAOI1XBgQUcc00nH
	 iavaDRHqhGT2To7R+lTJ+XZkRIg5bPlkZiWzLfZ60Mb6pwSRtWOGOD65C7ZAf7OhTDA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791653142;
	bh=GYloSboTJHBTLrU8TCTUyRysAnmph9d28M6JDseWJsE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Q6eQT4he1Wdvge8rSzlM4dcRJby8zWkGjc2H1jasNLfsnCqxW1Wn0THqtOPaW9g2B
	 Mymzjb6KgPWB19m+G0Y/yJ9jTZiA6dMw+uPM4haNOAs8ifyccEkf9kx3KpXClUyHUQ
	 aRRttbYi46vA83Uv1cZpJBCcUepaLQ2jKryRdVaEvEBZi/whrcCC51LhU6DMnVJcGc
	 wZ9N8MFkuaMgwb9x9gPMlS/LsqYXwUCpQtk+kvzPmv7fHClnqTCJV+sH9mQKErdwyv
	 DNcnX0Q0SAh7e7B2XX0yv94HVL2+FxBdsDaB5FbqZDbFz+OgiIRLbn0/Td7XTQv8Up
	 Q9Ur/ab0vlDow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6810B408AC;
	Sat, 10 Oct 2026 17:25:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A677317
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 102294005E
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E0pxDcaMUsG7 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 17:25:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2A8CB40004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791653140;
 b=GkjUlm4+bKu5YZepYMXXp05OELS9zZwtKtj7lLpQNCF5uKSaH+otnvsuiO6nLKMyFRNy
 jsrXDwdKdFMUqwU61f138wybeOzOwI7NOOoP/hOUrs1PS+vAJIUT4N3ETRycKGAGWbd/x
 MqNGlYjBJl9fE2Lej4Out0Hn19Mj6kQEG7gAZTs1Kv3C/w51GRZ5yjLqM5QWKjxvpJgKd
 whvLKiQMIE445rRMPyFGxLWbcZnacWmaft0iXWdWZSoJSvbtWvHlfEtYSf3Lv718aa3jy
 KcMn8tkvf2pxS/ArOfJfsaZG9DC/gfu+9oVLXEmgyy4KtKQrSHIAZzSnjfYy5xKUbTw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791653140;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=g86q2n3MQIgEbXxy664trdkNSHGO5yfnRg0bwh3wmcQ=;
 b=OZp+aoUuZ+fV9LCi/QdELgPNa47Rjpt5VDeJ/Cp9i5xkEGVO/JCNU2aKVzlY/+6sSx0U
 1GE/GG+JbLEJV9VhbvWDsHpIoJ+F+os6XHJhDiq2nVHOahgamRgIe7cPqSjeEjX1rQmrl
 2AXsUfq17nIj3s4ZnzutasgcDFjGdBQmQaPbLIZm0oO48nAKydfbvmokwq9ZK6D74r3L9
 2RyWPLpIWri1dEf+oV9+tiHyX7cW3GOVsRJett18Xe5NJwp4gzffNthjp3X5eH6/ntC4E
 jARsoOk9dy6CiCDaHmo9W4tf15g/VDgun84oxSoCkCHJeDXP3pxTsXmnhNhgm/xVqCg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=sx4AbGNb; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A8CB40004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:25:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9D9251A11C7
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:25:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7398F6075C;
 Sat, 10 Oct 2026 17:25:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6415711D706A3; 
 Sat, 10 Oct 2026 19:25:36 +0200 (CEST)
Date: Sat, 10 Oct 2026 19:25:35 +0200
To: Alexander Shirokov <shirokovalexs@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asp1DOd3I3TD8xWs@windsurf>
References: <aq_C_jltc2dsvVi-@windsurf>
 <20260922131858.103751-1-shirokovalexs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260922131858.103751-1-shirokovalexs@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [v2 1/1] package/nnn: add BR2_TOOLCHAIN_HAS_THREADS
 dependency
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

On Tue, Sep 22, 2026 at 03:18:57PM +0200, Alexander Shirokov wrote:
> nnn links against pthread. Specify the dependency to avoid
> unexpected build failures on toolchains lacking thread support (e.g.
> br-arm-full-nothread).
> 
> Fixes: 7856e41685a179fdda7b21a10455e52fe5fa5cb0 ("package/nnn: new package")
> Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>

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
