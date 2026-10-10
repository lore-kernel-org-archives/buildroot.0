Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF01CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0D0B60745;
	Tue, 13 Oct 2026 17:54:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VbenliF4um2T; Tue, 13 Oct 2026 17:54:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3B65160791
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914056;
	b=EgOfGLr9H1SiWQRAEOohQR+Vx0GpzD0AsA7/05uSFlLBZwJy4oKCXdS9vDMJEZd4Frbj
	 HDjirSgqVxZljaTUcSzpuW71qCTxuqCpQlK1m5WR6p6IirlRQu+NemWIfFeXu+fS78dq2
	 T7sRdFr6zV11xmjjmfCksElY1wZs4SJUAqRgWRDkhmlqSoQVPdPdBTRUBhAVEaFWBBUj5
	 WNJHJMoHXyrKt4vAb9RyGNnYBoanTEWVEFOgum4sZCF31oDN5yHX8W7hvlEGMgyWiTkwH
	 lzTK41k7Sl7QnTq1ylsx/5gYObz9hVABH4OlTuq/flb9iFmMtpvqQIJMAVA6FSgDLVw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914056;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=c/pkpAdQlUU/dd3SAuS4mP8IfWXueUe6tvVLmSX05KA=;
	b=PRRqty0OCnXRIq6hu7OvXKDWZGxvoGWzL49Xm9Lc7qanmJ7+4D5V6m5R1KZfkuV/wshf
	 kgoSr2HWoI/oLn92/e/eI5tbHlikeqEuJBHCILtAIAYYvwj7QokPL7GOK/eoLWDHYMVlG
	 C8bp6X/A95M0sDUnez8E8Ed3m8Tg+ReyKXjGIycMdTv5MWKG6HYH84wQsymbwBt9c7v35
	 YqwCczpDddAsArxY6CbHqjh0C6mvRkecq25rdWQdJiTMAqU2UQQ2EcfvyYBbFsaetac1a
	 2JTMXZSem0/EXRpuMSa4lPj4LrbonnlSo1bcEH66VLusgFMD1+k5QJe8ep+uSAyMHGg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914056;
	bh=c/pkpAdQlUU/dd3SAuS4mP8IfWXueUe6tvVLmSX05KA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W6/a6sxIK6wSzP1xvGrV7rq8bCDUIqtg7y5u2EKoICNRMagYq8midZgGd9m2eMlgf
	 N+b96Vh29JYzq+xHJuBk/q4Uz4uz7vIks9mJzRsISO6EbRCL/c8MHXkL+OvotA3hAF
	 qzRekwul9ogmh9av6qfzT5zRL8EOEbqyXMqrkSg6tvbLHYj4N6rj6fgLFlPinyyTPt
	 DnaPGRq5m9/hedtME/knXDust7FAj+lPBoYX95BoZUDhcSrce1FmY59xQYxBNLCQTp
	 gvrealYUEUYYtio2vt2zQ5s9Opgb/lNNGr3I1729IgDBZeWBnJ9pobe3PN744GBDzA
	 zq2P+3GOIJvlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B65160791;
	Tue, 13 Oct 2026 17:54:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 94CBD2AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B971403A7
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ooeDerI4SEa for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:54:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A66834059A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914050;
 b=lkvW4aT/aokQqTu3sBgm7lwum6C+/07xQfm9sLKzdhTS1b435185rO162uCZB8KW2Qwx
 JslkdmUh1Ef3MXrRPt1uLAt7JyMcm3c1kzYJvRTD4H0UwdBtCnXyy+TIaxJUMIQFC8uqW
 mdBOzkkKRHRRbEwawvi1t78u9KBBXKIriMBVuHS+BY1nSuw+HIlFeT8pe4ETUdl6kTRlK
 NJaNhbhwXLkApwi7EGAYEFEAUu3IntPPd9lAxooM9XP11YWyPr4eFDSiRfvscoSGzSO6i
 pPBYE3lmLUiSv9McAqdb2g9fBl5hUWE7wL3/i1D9j2cCj/Hrovo+31P6CwRzfKki4BA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914050;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=mAyBOzeubIvhKOClASfdbvWT+WxewFBRd/MKav/S+WQ=;
 b=HE5YXmYbYQ5yEyDBcgbZeYFvyAQFht1UZVTkCWOCb0H07R8Tt99YljY2/+cozdz69qaQ
 rSyAlsP4OyGuYXEe/eBp4pdCGXpYORXr78kx2Pp6RkvF1Mp5s9piIhqJhuGV/CNmFgStF
 E1sBADiepdibEeE9Djcn9bMU+Gkf1n9kFxhvkkGUyAcJ5lmHumibqNfZP4OLewggaYA7k
 8WqLEZG3d6geooyjwEgsgd3LB91B93Cw5+OJgAl78kkkd7//CMSGIyikuOYtLZ+bUpTWS
 fjEE9dD30C1BHVdF7M+upo+izLdTl7aSR6igUYPj6r73a+bXvaP9QcmTJJJdRxwrRrg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=l4niB6LM; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A66834059A
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C416C4E4120F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 999A760362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:08 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id 2C67F11D7188E; Tue, 13 Oct 2026 19:50:34 +0200 (CEST)
Date: Sat, 10 Oct 2026 09:36:22 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <asnq8aZg7_HYYncJ@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-29-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-29-bernd@kuhls.net>
X-TUID: HTB2Bb0jet4U
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 2C67F11D7188E
X-Spamd-Result: default: False [-1.72 / 30.00]; BAYES_HAM(-3.12)[93.17%];
 DATE_IN_PAST(1.00)[82]; MID_RHS_NOT_FQDN(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; ARC_NA(0.00)[]; BCC(0.00)[];
 MISSING_XM_UA(0.00)[]; RCVD_COUNT_ZERO(0.00)[0];
 TAGGED_RCPT(0.00)[]; MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 NEURAL_HAM(-0.00)[-1.000];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_CC(0.00)[buildroot.org,gmail.com];
 URIBL_BLOCKED(0.00)[localhost:rdns,localhost:helo,bootlin.com:url,kuhls.net:email];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; RCPT_COUNT_THREE(0.00)[3]
Subject: Re: [Buildroot] [PATCH v8 28/84] package/boinc: Fix build with
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

On Tue, Oct 06, 2026 at 06:20:09PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>

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
