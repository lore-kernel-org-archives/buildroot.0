Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB502CC6B1E
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8417340718;
	Tue, 13 Oct 2026 17:56:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dl4CgouWpu8h; Tue, 13 Oct 2026 17:56:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9C1D54070C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914167;
	b=SzVeUdNnU8zQcGAJ4CI5N034vrE8vE8mntkKfNbkcUMOkJBSAAaKz3A8r+IYjbltXzKO
	 brc2CusFy+BJ138+6o1E2F8dDbB7OtOE5bDif9xBvROymcbw8oYPh9bJ/QROJw+XtJGEU
	 KMIZQDYvrwI2AbAopPUrd3DTzFL3CJj8BSWHUGLjhKu5Kniew+jmuPdP31w7O0OB220Pp
	 b9I1jPMrUlhrGWjaVGnZD8WPHESZYJ+xX0mJcYklYe/kayjhGhoW82omGe4jHERra25U1
	 845DjA7CQeB90QBw/IENy+0WQGxE6viDs1FtM22hFWFHPwTn5yqoNhyrCZ7up2DU6yQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914167;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JVe065+cHejk7oW1jQepbInWUMwzpTDk+V7waiQILa0=;
	b=S9vArijrPgMQUYrlHv3Ujh4ioQ8OoZBxuuVwbA7Dak2ty/ilkGEINZ9npOVPa50RlAyC
	 NCrd7r2f+Izd+LqGUqlsamUemaC2hSWAJT592zzwPMCiwb8lbas0GRWoHvHWxvKwIysXy
	 0sWchm87BIyhZweNTCVCEaFex7YeLE/uW9Q6jnka0/1qUCWduLf9ypTtr5PuHrtBlQaoK
	 STx9BfKNP4JWG9sA08Mw+NUlJZcfFJ2i9ktwaj0AeLf/DtoH4FPVYAm7CqufnBR2q2DGL
	 rbmLs+jVVnrcwNDBbSu68kxlh1r+p2gEuN7o3G2/qxtXzpFxCBhfDKqAh/iApL0Zwyw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914167;
	bh=JVe065+cHejk7oW1jQepbInWUMwzpTDk+V7waiQILa0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=K1J6uqwX4o2D1wMSiK1IQxGStKC47LMpMcDKLHzOz0KBaf2a4QlsbMSh2ajnyqvVH
	 589hl7OuNvCQTUaTmRb7txpnYwZEmG+VvnIjVopeNKjL0ooieElWLwVgcCWhsPyQ4J
	 PpFSEPYnZ7WgJFifRQD6mWfXpo6yuYklI+Iw+mfKQfsiS+U28cAi53Zqxx6kGf3/QW
	 X8dgEy0m733DdAKiOZJIz3uzm9JwCSvBasvTvn8UXqulyM9LBq6ZJoDBrpSKVwINU6
	 vRwMIKbOZiqafazQ59IjNyNrm9ouH3uzCcsb27FogNquVjoc2oFcBy1nGkbr6J2XeM
	 KAt1dmxlSZyHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C1D54070C;
	Tue, 13 Oct 2026 17:56:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D190362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EE2660803
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j0mOh-Vj7-iq for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:56:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3D133607EA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914163;
 b=VzKU+VKNTqYhTl1ced8iFDoBafyabx8JoXEYyLEhtnXQyizEdpJbxTObDJiwe8zlw8W6
 5+h+88J6OgN+rtzwtYcwIPo/gN1sYG21kzW7JfAndWyShBz1WH5WdmRbu0SHu7xAW5chs
 N/RQifmIlFHIRqN0MyiYt2LDyd6hagM8bGJYO72+HIDGwjM9x0omwdGUkJxHLmFKrvOlV
 5CxC7O7UN7dZNNNU4Y1cZtMcVkGGHr0EtB6l/9oFw/cKSdEJbqR1h6NnPOA2nDY5waC0M
 sHmIVv5c7VYFcAM0T4kxgiq2xM1s3RYyCahte9DYwd6jXJGXfvMb9UxmtHGosPNgb9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914163;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=4Vx4GagPGJAGM2L3Qv8HOKuSotV6k0dVaD01NZnXi00=;
 b=OrSPM8OmFBoTy+G49J17cCWLefXbQ73oeaHjCHKt/pIPfCguMHv7OSyFIWZEm3X6XMaS
 7zB7JHJusVGPjR+vJ3klmkYOaAc4LbBIGpKJUvs7ywJtMA/UNOrwunM/wICL1+0V+K2L9
 PikkXsBoUYPchSha7BklPavs69CaqnzQvjT83V3vYns4zS1RW3LT1nJ2gcyB/EjiIN5oB
 RnR0BWznFtK8sj10pI6LRvEfjwmHtcdxgYmFiGyS2VYATMvvRvGVNXfj+qA4OfxDEFHhU
 YMOlvawJPaddC4XtR62Ty/1g941xZBWkWviZl7vzr4AFKEfajAN12tQFUc+tTfLUZfA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=yAcqMOYg; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D133607EA
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 43CFE1A1216
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 11DE360362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:01 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id 6D97411D718C9; Tue, 13 Oct 2026 19:50:22 +0200 (CEST)
Date: Wed, 7 Oct 2026 10:00:48 +0200
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org
Message-ID: <asX8GPy_7Rn3fsp9@windsurf>
References: <20261002075640.2350126-2-buildroot@heine.tech>
 <20261002075640.2350126-4-buildroot@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261002075640.2350126-4-buildroot@heine.tech>
X-TUID: LUSS7sa8ds8r
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 6D97411D718C9
X-Spamd-Result: default: False [-0.68 / 30.00]; BAYES_HAM(-2.08)[88.52%];
 DATE_IN_PAST(1.00)[153]; MID_RHS_NOT_FQDN(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; BCC(0.00)[];
 RCVD_COUNT_ZERO(0.00)[0]; ARC_NA(0.00)[];
 NEURAL_HAM(-0.00)[-1.000]; MISSING_XM_UA(0.00)[];
 DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 URIBL_BLOCKED(0.00)[heine.tech:email,localhost:rdns,localhost:helo,bootlin.com:url,gitlab.com:url];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; TO_DN_SOME(0.00)[]
Subject: Re: [Buildroot] [PATCH v2 3/4] package/sqlitecpp: needs threads
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

On Fri, Oct 02, 2026 at 09:56:32AM +0200, Michael Nosthoff via buildroot wrote:
> SQLiteCpp has an unconditional dependency on threads.
> 
> fixes:
> br-test-pkg/br-arm-full-nothread
> https://gitlab.com/heinemml/buildroot/-/jobs/16865965420
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Thanks for the patch. Since this is a fix, we need to know which
commit introduced the issue, so that we can figure out whether it
needs to be backported to our LTS branches or not. Which version bump
of sqlitecpp started requiring thread support?

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
