Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7646CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A91F0405E3;
	Tue, 13 Oct 2026 17:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5CyXP_fkwG_P; Tue, 13 Oct 2026 17:54:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EE7764059A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914053;
	b=P+C5ERrsyDaymCA9T8nAqjuuwLbr+nEWHTjfeMavEswcrGvkYVCQTmiji1eRliYg/ciD
	 jNsebaZBcaolOp1NsrXHGKvxWfWamkvuXpLfFe1H7xzH+b83Cs4FLhhm0wETRWQJxkvVg
	 VtQTcjVydQDJKGUAwK9m6MJ58wjDqUaRVN0yGP2R47E21clMnnZeRMG9u9ZChxlj7Ko8w
	 BgZEWMe0rR7k8T8PGBHx3kDNrQKOWdqQS0pAanrYtpFd3mwWL9MUVKX7QlVV+xu80qznl
	 +iXDN9GQmMtb7KjKl02aqBvwFvH/xyPEbdHbmFp5MgVENDGH9CiTA073/n7nxCVN3Jg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914053;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HEVJdHoUoBDeOCjlVmBGJxgL2kE3/w8RtjQPVjVBFX4=;
	b=TdXVNkPU5nHe87bABW1RuH3t0ECxJmmNl9j96qzJsJAhSKizckRohns+zY+AZldWAuAK
	 pJuB67N0h8kISHXPAtIVKyX+rxnvFIzuMXN0opr+io2s9kRqk1yukwJbHD7wOjcwKhKVG
	 8OgoA/nPphKcj4suI0QgzGMINAqdNrKC22iDlUBv7V0FB9tVwJTKMuJLqkRv962Am4O1V
	 9/wU8hwpOPvtiCsdOoCtKeje6hHka40c38KdqU1eu9PTbriWNuX5UUpUB/qVKwN6vCEVo
	 PNmFh5Z8f5TyTO/R5l01Hjx90S4YTr2rMMAvqgrBa+PgCgyD9Gls32MDx+eKmKwqr9A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914053;
	bh=HEVJdHoUoBDeOCjlVmBGJxgL2kE3/w8RtjQPVjVBFX4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ELOJC5R3CzQyBfJMKtPXU2FYOa9F91N0Yqdk++fqnYnWZGKxjdLd6CK53i9T68QzN
	 4SRYSCwvUIg78Lhb5fobJe3guFvIYCAxJL+AKqpQQsaYwwRxxMGuioJ2R6AMaZP5tr
	 JtfzcwreaAWcy9ENFqANIbOvBKkrYyh0+WSAfd4wMswP/v2Z71d17H9nRDqUnOScu6
	 dUqsxlqK7ft89LWOxp0XvadrlXao5LUQ+dLgHFFfS825+ZjcI6HeWz6s5mShkd/6bu
	 ZrMbxW4RQndm2lcuZRNEIHAtdGjTK0RhRENnAGXgeIv59JuSQOpSpoLAe3ojWwlmSc
	 +NgJuCYaxwlLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE7764059A;
	Tue, 13 Oct 2026 17:54:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 59A0A362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F3E180AE6
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m1NQhgKKRVqZ for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:54:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6735780AA3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914049;
 b=LyshT6lq8x8Z4fUPGF11A7FIcoebNB5duwmyN+rmoCDvJAVzJTcLH0MtyMvkayMjwK8L
 dEEKO2ZKyRQTtf+1+ipATK8edX4ymdL3NE/n2Sp02BWTBbSXXT2d6YhKtRS98O65p9hZc
 Y+X/eYBzJr1o0cmvyhVKPJ08AbPxdA8GWacr+LQw34si1KMvGHZ4rKp9YmSBxgWBsB6oJ
 0eOdTpgD6/LH51OvSTtSRcDmO/NzcBoj+wnDm4D65MF/BAFrsHbO/HRqk8Msx3Ev9Rbh5
 6vQBXGaaSbGk7UUf3O6hNDy2b/zKcg4INXdMvlg//2/BUlokS5F2gO+bf4wwptR9GEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914049;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=6Qr6QOygRrYXUkdoQQEOav1KZCbD6rHv+NmPL1JdOOM=;
 b=jvWxezkq2TlYDN/pMvyPBSgIE5WjHelAUNd0qQaFFkZFgqBYpLM2NhwNYBJiRS9QPJjF
 XYC4YVkyLhyh8DF9hPGVtEAa2Q3v598uZhBdRo5QGQYdxQjzKbidh52Kq5Rucc42JxnH7
 ooxXeEaYsYLLbyc5U+XMsi65KgTyWvLK+R18ZrAYkmGl+Qy6aRjuXF9NCKfNRn6n0MTOj
 M0mNxzgqZWe7sk7dkgGnumnuR0kLtoZ7EofOxE4q+CBtaXF+HtBSYgQ84pt1CzaeRnUOC
 S0gJkoCv4L6mIJIuznHzzyat75lFufGPX35wCe+RvfrKcRIwRUwlBeMrtG4YMUGpVGw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=GPkrWcKt; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6735780AA3
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 214BFC653FD
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 811DB60362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:06 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id 0574111D71892; Tue, 13 Oct 2026 19:50:39 +0200 (CEST)
Date: Sat, 10 Oct 2026 12:06:55 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <asoOOQU67NAvfPqC@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-49-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-49-bernd@kuhls.net>
X-TUID: JaxOjHkBr5sg
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 0574111D71892
X-Spamd-Result: default: False [-1.72 / 30.00]; BAYES_HAM(-3.12)[93.17%];
 DATE_IN_PAST(1.00)[79]; MID_RHS_NOT_FQDN(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; BCC(0.00)[];
 RCVD_COUNT_ZERO(0.00)[0]; ARC_NA(0.00)[];
 NEURAL_HAM(-0.00)[-1.000]; MISSING_XM_UA(0.00)[];
 DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 URIBL_BLOCKED(0.00)[bootlin.com:url,localhost:rdns,localhost:helo,kuhls.net:email];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; TO_DN_SOME(0.00)[]
Subject: Re: [Buildroot] [PATCH v8 48/84] package/softhsm2: Fix build with
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

On Tue, Oct 06, 2026 at 06:20:29PM +0200, Bernd Kuhls wrote:
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
