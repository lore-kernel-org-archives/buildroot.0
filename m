Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1469CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CE2D406E1;
	Tue, 13 Oct 2026 17:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ctyk-uy05MFh; Tue, 13 Oct 2026 17:55:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AAC2E406E6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914153;
	b=SqTd5k2Ikwz5BppN7p/aRCR+ENQfHJpNTVhTtd8fodiVSzl0ThaSUkrfB4DY315FKITg
	 s8UiU5NqnPwqes8NJDgsUBwgDRto6bX7nIj34078d8/fJnMq1rLxB6Qcxo6jQ1QXHodZE
	 1EB99YY2VX2vkj3d1elm0+hN5B1NlDsu7j+1hF/qpGjRFqymWd1ySOoPbmrCLo59bpz/c
	 kot6eQRNzjoy5Xgvpv2Ar7TNnKPbjsve/zAeGqDiVGoX630JNcZNtHmrAaGpyyMT8Pfqm
	 BrQGQPWAl7NCwELrGgyrlQjAbM4Ux6SJ6Lz8nZ+Fm9f0e3z1NMF3W5hdhiXmNHTTXCA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914153;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8bhSyWub50QbZzOzgRE+W60aSKF9dHdZyLfoTeqsiEM=;
	b=eo9aoDOoTRRm5EWVA3Av5Yg6/WpE1zwoMPYxVhcoAZJ1QiNw4C+xlNPozmsf1+05acjn
	 aprRMes0UdSaxqkPC8SCKyo/fItqSYkMSjmEvS5uLETxfSngwSuDhyYfPBev49p7g16OK
	 UxVwCazO4OfD5mJmOLg8ptATUAEqwY4UW7oNe0IbZIpp45f1qGm7DYHrykd7JmDjo35TC
	 i65juT+7ezW6o93WKcHcZPt2XS8+AJQ81ja7am30G9O2r82xV19AERPxF2K7CUR7FganO
	 oavGzgG4Icv2folR/nP5f63zZuqnmFWy60tzFMSgGwBFAidY0JmqiQpdw1QBi//C97w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914153;
	bh=8bhSyWub50QbZzOzgRE+W60aSKF9dHdZyLfoTeqsiEM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=X5FfaRy3jiboNRSrmBc/6B78gEl1oN9a1fWw+WYhb5JjInJlRm9/WJf4vVf79yhc4
	 JlRjRyvuc2uQWYxvJlWdhDUBRZGDjiE5xMC6r9SjmKxBZj2ui7KncuHlbP4IvBTSdO
	 T+M8O2klATDIqVvCDZUbjrlw7uI3ZZsuZ3GLKY8HevHlbXrFBTN62YSrQ9IYpleWCZ
	 vJJElDeJEK16QTy3XQZumsZ0+05oOvPPYePrj2APxGu0EaFCjJZ+Cp1u4aghubqsK9
	 ppHGzQC0NC0KwkR4zEp3/NoM9QIpKRzetrR8pv5FR+CPbpIV07RectDkj9GeNTcgTM
	 07g1oquPQLx3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAC2E406E6;
	Tue, 13 Oct 2026 17:55:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0172A2AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6E3960810
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rnd6PVHtVr-Y for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:55:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 176136080C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914151;
 b=KzSFTgbXyUVhszrYwzUGt1VkCxvwrrh9qEfffVk3plBMhIXGCfko6R5jrjCL1SgE6O1a
 UdhoDoTi68BQs2D2XpuD+ei5q8lHtzZPl2oYJktN8Lc3lRfMYqtc1BxyyaGnycNSYA7fE
 v/pI0BrKR/56ng0+PBrhEjZDw2hf10129jSW0ZBByJzisu8JL/tUjekdsyz8DV6Eb9zB5
 EY5lERyIQzvdKodZ3HhTXw9ur+wGNfPwbia18Du/nl3gwv44/aMoXEHWgBZTTOscTt2LQ
 gCb73qUYXmHh7jSZK8HwY7kbfHaOfUaTAN7SyuoEKQrba8hPiwimf/bd9gSWJ4lmDqw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914151;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=dKCo0j0gv9PFv6sjHgVHX8D0oUvIRx4ytzMTDIlJVm8=;
 b=prwf/Xo7uVFThGtV2qV6u/qTZtT4iSpGuaQsqm44m4NBcFnZOqnn+DDZguVXKxY6cGE7
 X1TcstnySU4sqFChTjDGjgfqqBfn90jzVlV18yqdYTP9VJcJ6aHDN4N4seUzB2nKJKFDQ
 Whsk31afZnBOa7WzDsoX5Un9FZnJ+FcDBDbspwPySrGTchis9zCqhm+eb3wajcVez1qH9
 v2TqQOKYeNBYmzBORcmySK0QqVuucQJ1/EqHdM1N7+15huNTv8zIfOILconGxrMVbCPBX
 fsED7iFU6r2R0eB7uVov1a5bioDs39cynnQJCyISxn4K/9maWBp2Bf80RJTWri2rqHA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=JqIebsSL; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 176136080C
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 15DFEC653FE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 755F460362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:48 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id E8B7711D718C1; Tue, 13 Oct 2026 19:50:38 +0200 (CEST)
Date: Sat, 10 Oct 2026 11:59:46 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <asoMjfCgKRogz-ei@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-47-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-47-bernd@kuhls.net>
X-TUID: NH7g74p0jLn+
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: E8B7711D718C1
X-Spamd-Result: default: False [-1.33 / 30.00]; BAYES_HAM(-2.73)[91.59%];
 DATE_IN_PAST(1.00)[79]; MID_RHS_NOT_FQDN(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; BCC(0.00)[];
 RCVD_COUNT_ZERO(0.00)[0]; ARC_NA(0.00)[];
 NEURAL_HAM(-0.00)[-1.000]; MISSING_XM_UA(0.00)[];
 DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 URIBL_BLOCKED(0.00)[bootlin.com:url,kuhls.net:email,localhost:rdns,localhost:helo];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; TO_DN_SOME(0.00)[]
Subject: Re: [Buildroot] [PATCH v8 46/84] package/socat: Add support for
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

On Tue, Oct 06, 2026 at 06:20:27PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Baruch Siach <baruch@tkos.co.il>

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
