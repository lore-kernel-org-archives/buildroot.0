Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C827FCC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9407D40744;
	Tue, 13 Oct 2026 17:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WZIvTe1cCMPh; Tue, 13 Oct 2026 17:56:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BA93B406F9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914192;
	b=moHvMULH34DpYV39GvcEeZhkPWcj3T60OVKnkOB50RRzXU9i8tdR+cQWW+gNEjngH13v
	 lfxP4BMjzGQQaKZSbXHWuL6n0zhYmzH9fVaTK9/eONUvtlhLUSaEpYCHYPEEpuz8NBZfG
	 e2i2ZqpZJDxV0ZnNMCn85mECLAw1SXGU8rZC1L0Z8DhadlTLaPzvducX6advmkErnyEEV
	 YQDMf8e5bdGG3tBONpEaKhME0eHbQyVDjHPluvz+cZSeb8m7zKz6OBFmgTHX5NCVy7MoN
	 HXWJKwcfNSq5mYfDc7O3o+IC9MHjLEE/VBz0nCS/GjdbUQLn54PBwb3ykhhB73sWJnQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914192;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZlqGBdweJ6ZVE5Th7HRITQxGzNEw96zAVnLjKP/CKwI=;
	b=EzUBZNVS4Tio7HNu/ocnoj3/EwNTOfUsxxK1PwJVUS4x3lPbiANQYbeSc++IyJSc/7JN
	 dIYT3qf6xKzUHuqfSLjcCpWzQlHzSbAvE138WrE0QjPP8AtQyl0ZCLkoJn5aE3RD2GC0W
	 h4ch6g8LKdff1JFKPm7U6CZ3JwyH288lDqNS8x7U7XieFO/9iGTMleIHSh/porNiXfWMG
	 MXjLvekf/sd4FgEAe0bR1ni36TBuvlz6h04SZnVXbTpaXUXv1lOpnql/IUsf2u8PF/eF0
	 WIss+9E6oOghXmGmFCaiBS4BKrtQEuhFq0IRXILeeWSZ5lTZYQpCUEuo1byfUlu5jYA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914192;
	bh=ZlqGBdweJ6ZVE5Th7HRITQxGzNEw96zAVnLjKP/CKwI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sqF6mYoZRy+hJbmfWXxsDViGThpILGemr/vFY2dQ8OZKLVxycR8QycIRQwEfTusvV
	 Sf21ywHdX4Yk1nHLP6uxJioR7RSEvlr0SHobygYrfiK94UYQf/iJyihMCyQfRqaqQz
	 agd/rBiKjnNNvRDLGscz0cc1fG7kifbmMrvoJz12mjNyfHqXmcZk7907x46AaFM+ax
	 2M+CHKI3Iarg8J6gdx+BkQtI3H5HeXc3C+haucVvZ3DvBlBTSq37apHOa11tmo8ViK
	 wA52jqzQaXkak9hzqY5RjN9kqatsK6//8LNtZqR8idW962sPYCcU0Vt3ktIiTbO5Yb
	 oz9azneSiWA7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA93B406F9;
	Tue, 13 Oct 2026 17:56:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 47205362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 390BB406ED
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5XpvvCCOTLbc for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:56:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4AA044073F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914188;
 b=b2aMebCxn9lxu6wsWo9+FBDuKJkhL+tXQ0joWuzERSBGAP4zFX5nInFBoet+DjiZV3li
 0FW0RSwIKFTI7+F4zxWt8RzmdXORl0bm/upFymwtppJND1+QgakyWF0eKR8HaWP4Irn1I
 zosj8iOSnYCfE+3XrH9JhM40ee28oIR8MwizM61LZImhTI8f5q2G2ObC9Vg18uqXx7xcj
 3mgKG0TSIxa4jsiuLD1zQzav70E0fZwwaPQ5ZRCrxIWdqr3EIYPTmGV5SrgWEUj5ESTG6
 64ST1a167ocWY+DMnri2vRZBnYLJsmUoC3kOtjovN6wL2QD5tp8wH4wTcwz9bOuFQVQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914188;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=1ZwlEajqgMzu7CY+G/UUtGZerrFGC9FDEUw8mrqkF0A=;
 b=sXyQjOqI/dT+Oef/K1UiDP2weLaS/c35NJ1B907U+pVeteen3+Rh+FZUQqtARbtfpy+x
 aLZOnaSl0ObVPjZGneaWHRFdcX10ncPTxK4njHNM2YGj0FdSVzXKLNRN7uLOIFugtbhLa
 2esAXEv71yS2mn0Mog5QUYjLNSL66mzGyM6zr+4qq6PtgkqbZVD+Ydg3aAw37jtOVOXiU
 WE7uYWwdc0k5BUXM1NY0a7u2mtLd1n0qZI8NS0lhTmLmIT17w+pTmbbqBhelom7ug1DbT
 CNdX+X2iAGBMLLpci4E8j39g7SIBmxbwaGfIlTD7n+anGmRtlVIaNiVZjmsazNcV2GA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=RrKj2wpn; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4AA044073F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 582F01A1218
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2C36D60362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:26 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id C579611D718B2; Tue, 13 Oct 2026 19:50:30 +0200 (CEST)
Date: Sat, 10 Oct 2026 10:37:40 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <asn5T4Z7RHeG-bgI@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-34-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-34-bernd@kuhls.net>
X-TUID: e8xNkttcvI2j
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: C579611D718B2
X-Spamd-Result: default: False [-1.15 / 30.00]; BAYES_HAM(-2.55)[90.86%];
 DATE_IN_PAST(1.00)[81]; MID_RHS_NOT_FQDN(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; BCC(0.00)[];
 RCVD_COUNT_ZERO(0.00)[0]; ARC_NA(0.00)[];
 NEURAL_HAM(-0.00)[-1.000]; MISSING_XM_UA(0.00)[];
 DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 URIBL_BLOCKED(0.00)[bootlin.com:url,kuhls.net:email,localhost:rdns,localhost:helo];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; TO_DN_SOME(0.00)[]
Subject: Re: [Buildroot] [PATCH v8 33/84] package/ibrdtnd: Fix build with
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

On Tue, Oct 06, 2026 at 06:20:14PM +0200, Bernd Kuhls wrote:
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
