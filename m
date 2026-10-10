Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A85CC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63567406CF;
	Tue, 13 Oct 2026 17:55:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I81sZ4C3ahxw; Tue, 13 Oct 2026 17:55:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 90BBC406C2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914139;
	b=KFaRJ703+4xMf2W5cMbO9FRUwdADb521CJdxMExDLhlMdTH+jxhh+bRx2lJo+lLe4xsI
	 G69ZP8NDXuYBMZ+8TI0vYnupZ9yUhehgxL72FL7g1ESA1XTiPImLUmwVAMJ4BcxlR0oBK
	 8hWyLmCRbJPFpvWnY0kiJHptdiV/eLaK687EabYjiCu38gScsq3VjGBtgMpDAVQgJc1ou
	 2owimpmw5rE6jNy4B+mD5pLCe5wKzrv3C2KfddDIp/cl+bTQs3hTLdmAAFVAQoriXpijU
	 v7eVPgSzcJqnON0z5Ifapg3P6FftC1LmD0s7gFgZmVErOFaAN62XnGRxM9SdvV0/MoA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914139;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5TpTxcr/PDDMuC3lzNe2M29jYZUxb9n3G0zdYp08UFk=;
	b=oPHYF2oom0ZlDyN/B7+opDAVJcp8CWaNKYYDRrmj26zHeGO9b6dsziStAt2H9EENexAF
	 X6S3OuoFy8NKmFNQMlhWTFYkk6dMUjUAHiT/Mep2Ma8qpYHrr4Yzh76tsdKVvwpFkcbcZ
	 iKVZLHl5MPXxZG6EHPu84YbJsl3SUO5I3j7Swzhh/cMk1YKUXyr3aov700L1NXxW9mZHX
	 IjBnUDqO1tLqCjk5ymaKtVgShg0HsB9H9ZPfLwrvr//s6MkVIkqb4bOTscv67SskB5hQZ
	 7h5fPreM6Piqv7DeULBybBvFAn07GX/o4WwrZ6dipIdaSLX59EpA9Istp2ztWeSXL3g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914139;
	bh=5TpTxcr/PDDMuC3lzNe2M29jYZUxb9n3G0zdYp08UFk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kTxYfSzq9wgiRvOFgBiPFtqiufbzJ5vlRGwt4HonuUKexTevg9VI1xmgEtYfLHMcF
	 hesF5dbkmreY4lDyfDWXGZVrdaYXteZM91qAPhYCy1N+b1lu6zCiquP3De55gr2UMr
	 Vj75I3nJb+vbqF+L07rZrVV1IfyoKfGUPSlLNakU4od54BtmG0Qk6swaSJifQEIgJn
	 aaj+uCrX++bJCeZZRt07I353z04I5KYn0WFMg7qfnpl5OnEoQBl2ektCMnyX72GzsN
	 Zb+z508prnRO324TgtjJpul6vEUcT5MULdvPEffqlHKNOgAg3f6pbH9YlAFMl51yah
	 21vAKpCitV02w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90BBC406C2;
	Tue, 13 Oct 2026 17:55:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3542F788
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 332BF40640
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZMcj0UjKCtZ for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:55:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5830F4069B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914137;
 b=ZWTOCeI+6c6zbmpBIL+AOZCO0CVQR2t1mmyrCFbTcJqSVe7WUMWCZ54MbEF7awNkeeYv
 24h4or2NjAykPvXVsmlnvtJj+a6A4xQMyrAy5+nHG0etp0NVIjA89vmdej5xiJxrGZW0o
 4CVYSOtee0otaYvLQkvB3Vv+x6qzg2Sd1GTBqW+Hz3g29WE/xD4PQ/I9XqqQmJ9dagZWp
 09mx1ZPoZGPPlOvnpnaX3wM6CSAhhGV+fYC6s2l8p80GcYry+E5QCB7YkyxjpV8EtlZrG
 pReE14e4WWY+hzfXPkE5E6y+cozWR+hGBxESsRX5hQEjlnU2dYLCk/s+ZxQzUGeNkBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914137;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=rF0mwvSuquwk8MiGftLtrvldfCQrL3wkP07sVhNz2I8=;
 b=DKGEB9bN9R6KpwxY5rL0cIJB7VrLkHocHDDrgBlkL85uu+l4Np9+LGo92yc/v2MXgap/
 jcYAcHbf1at401Nd6Rf3bBIMbL885jrGI90QUS3sw4v172mM4zNkkSWwkFZ81Ie/iS4Oc
 0pZ8ffV1j2qsyFbLLnvzBO6NJW29BF8ByIxv5wD7YNb8NvEw00lYdBB4tIhdwRCjP+C+R
 avknLnEbosh0Gjzjb30u3KMQLHQJ0/ZRCanEmyr/jE4r34GfJtUv4kFIcKGLm75dUbe6n
 aEWOyp9KiOyqBiyTwC2buJaffuajBx6iQdUJpn55A7Jrh+iPNLxsWE9/hqLdB4U+dXQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=DMSDzJ+q; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5830F4069B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 6385A1A1216
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3829E60362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:35 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id DB43011D71892; Tue, 13 Oct 2026 19:50:40 +0200 (CEST)
Date: Sat, 10 Oct 2026 12:23:51 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <asoSMXRJLllvQ18l@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-51-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-51-bernd@kuhls.net>
X-TUID: 5r2FEwZ/4zZI
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: DB43011D71892
X-Spamd-Result: default: False [-2.06 / 30.00]; BAYES_HAM(-3.46)[94.37%];
 DATE_IN_PAST(1.00)[79]; MID_RHS_NOT_FQDN(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; BCC(0.00)[];
 RCVD_COUNT_ZERO(0.00)[0]; ARC_NA(0.00)[];
 NEURAL_HAM(-0.00)[-1.000]; MISSING_XM_UA(0.00)[];
 DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 URIBL_BLOCKED(0.00)[localhost:rdns,localhost:helo,bootlin.com:url,kuhls.net:email];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; TO_DN_SOME(0.00)[]
Subject: Re: [Buildroot] [PATCH v8 50/84] package/sudo: Add support for
 OpenSSL 4.0.0
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

On Tue, Oct 06, 2026 at 06:20:31PM +0200, Bernd Kuhls wrote:
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
