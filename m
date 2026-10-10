Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96BA7CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F17F405CB;
	Tue, 13 Oct 2026 17:53:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lYTPmTyuRmhf; Tue, 13 Oct 2026 17:53:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9871640581
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791913984;
	b=Zf+Joa5L7ExHFqBadcdG272Nzdp4iYTdb6xDRao/dpi5rdu0U/T2Q/wez2rURe4KWWfd
	 btXGGomAZa1mvr/z46xq0gL/CQoRnS0EX3u1nZKn92QJlfKEJ3qpyQOMkpRHGMJD22Vtl
	 0oPEyB4h6fXKLqOPn6NJQRENmLCNrl1rKx3m+SjG24jSceHlv+aOkHxiKS732L+3YYJt0
	 fhrD73110DpgbXVTKgzP0xX2ha/93B4B/WfboDe+86s/lwesVEMO9kIGtNL2S/T8Ke/Oz
	 o3F+uboGvOaOKdGGmLG05d+MIsA3ryVVzPFnmIrkb3yE10EtXpiNRkf2DaPeIOCHHqQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791913984;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=I6jCvojYsLhnHF6WcIsFsOhFo/cLznNjO5kyMjC1kXc=;
	b=ZLc3wfk9/0WUIhWNiHoB3ynnHpbYq2XkyE/KVa5/IidxhWUdEC5zENTkIl1PSCjoqe7G
	 Ui+Rk0gT1OmsSTluneGtdrO4GvIulk+8YOciF7koCdX1DoNOzIYd3qwv6NYeq8Rdq7bFN
	 8qIHK6bSRoT6U3qs7/ipxgPpQN2ZIlRv1Myv3dBShCF/VA+KmjsbUNHY+4aJm8O0smH2l
	 tFV1zSHLSfHOPAkimJdlI64fds8tC+0obshRmsT1+0FOVJsLpVkZx+hEBIdfh5E2+hIsI
	 8gl3xv6K7OREsEibUFub6qHX+qXD4UGrfWl2HSYodAE04wYJDdmSRrtarLN1sld4THA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791913984;
	bh=I6jCvojYsLhnHF6WcIsFsOhFo/cLznNjO5kyMjC1kXc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fcNIJDwie/J1u+4g+IEPUzg2G565C04js1m4uA9qbwDYmDtqY8iepHDHT/GbJzD5s
	 ZnKcKDQSIJPq0+sg9X9r3h2GtRxPW1i5hGInMoH5xFvr2uNofPCYazZfOy33LnbEY7
	 eosyuWR2m8D0Yfmx1w+F/BKZcUY2Ny2uMpaWc07FSnh0GrRY9sZlxsAtI/ajjgjfru
	 KcfNonVsSRxdSxV9r66CqCrG4tpzqJ+6lRoCXwqQyRVw2xBpTtwdSEY5eBwT/T0wYe
	 m/3YjJyCfjsk5kf3kEC52NeHtzTXBZZpPh69YIYmJMn548VbWpaIufNP4wTH1AsqXv
	 zYfrteEOVU03A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9871640581;
	Tue, 13 Oct 2026 17:53:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 55244362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46CDB80AA3
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8xOUWEQPgPX5 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:53:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3ED7680A86
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791913982;
 b=UfXUF7F+GU53YM3WXMIUa783SFD1oiiJvDz0rXq0ieJ0oNTXWUiy9do9lCdz5iCtSWMM
 8o0XT0dKpgt6IDCS9UBHQ/p5aF/Vc+8TzplbiWBc8UXJE3XU/KyzGS8/DbraebdxYplV3
 ohiWr0aA27o9KPZwcQg4v/rhpJkwCX2Sk4SOBoNM0CjklcXBumEX6nyVi7R/66YDb/Qrq
 ViiCFwc7L5BSfwH/S4t/elnCIn02LO1JrnRlxGClnW58TTEnrWSdLEGK0Rmd++zLQHPtI
 TCfHvhv4isMKvWkoDBEH7x4jRmJlG9Li5Ya8Nkev4Lg3G5zZRJ7wcMIMKY6S1UF5AhA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791913982;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=YgbUYCKXgxfiXSiolo2rT81pOO3OKUpppcCMPpt/Ba8=;
 b=Eu18Iglmy/5oCXXLEE5Cw1RgUoTb10yxCVzIzRgI6f8aR4u50uKK+0mXlanKZU30QOtR
 n4op+PrTScSaXLRWFr7ul/IDq9gUJRIehKyOW1bpNCtHn3dSsRbZh2jWnXgtBxGxNxNJE
 OEs5VWuBHYP1zX8E8oforAhBOvQnkDrLNM0b8GBfdrdsn/UdjBWxEelGw4PZel3kB5fen
 BaSYbcwqK98XEsYN+894AKu352h+x7eMpBJkLzNFYwduTmP/fOOHeFQltTfS0fZj3+7hf
 Se5ykwgLnnox7xoxK5GSXep7csudMa9GBKWSObazB6LfNxkUOzOjCVtHtktIESnfTCw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=xfALjwis; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3ED7680A86
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:53:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 61FD24E41215
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:53:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3739960362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:53:00 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id 406E511D718A7; Tue, 13 Oct 2026 19:50:38 +0200 (CEST)
Date: Sat, 10 Oct 2026 11:43:23 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Daniel Price <daniel.price@gmail.com>, 
 Titouan Christophe <titouan.christophe@mind.be>
Message-ID: <asoIoWhVTs2PCT1k@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-46-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-46-bernd@kuhls.net>
X-TUID: 9XEZMVrRDhhW
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 406E511D718A7
X-Spamd-Result: default: False [0.38 / 30.00]; BAYES_HAM(-2.52)[90.70%];
 SUSPICIOUS_RECIPS(1.50)[]; DATE_IN_PAST(1.00)[80];
 MID_RHS_NOT_FQDN(0.50)[]; MIME_GOOD(-0.10)[text/plain];
 BCC(0.00)[]; RCVD_COUNT_ZERO(0.00)[0]; ARC_NA(0.00)[];
 TAGGED_RCPT(0.00)[]; DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 MISSING_XM_UA(0.00)[]; MIME_TRACE(0.00)[0:+];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 NEURAL_HAM(-0.00)[-1.000]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_SOME(0.00)[];
 FREEMAIL_CC(0.00)[buildroot.org,gmail.com,mind.be];
 URIBL_BLOCKED(0.00)[localhost:rdns,localhost:helo,bootlin.com:url];
 RCPT_COUNT_THREE(0.00)[4]
Subject: Re: [Buildroot] [PATCH v8 45/84] package/redis: Fix build with
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

On Tue, Oct 06, 2026 at 06:20:26PM +0200, Bernd Kuhls wrote:
> tls.c:676:5: error: 'X509_NAME_get_text_by_NID' is deprecated: Since OpenSSL 4.0 [-Werror=deprecated-declarations]
>   676 |     int len = X509_NAME_get_text_by_NID(subject, nid, buf, sizeof(buf));
>       |     ^~~
> In file included from ../../../per-package/redis/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/openssl/ssl.h:34,
>                  from tls.c:22:
> ../../../per-package/redis/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/openssl/x509.h:1041:27: note: declared here
>  1041 | OSSL_DEPRECATEDIN_4_0 int X509_NAME_get_text_by_NID(const X509_NAME *name,
>       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
> 
> Upstream PR exists to fix the build problem:
> https://github.com/redis/redis/pull/15227

Can we instead merge:

  https://github.com/redis/redis/commit/8bc1c4e147761e7c9d6ff1bb92248b9d4dda43ab

which apparently is the actual upstream fix?

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
