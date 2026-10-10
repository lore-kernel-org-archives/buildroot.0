Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19921CC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8BFE60818;
	Tue, 13 Oct 2026 17:55:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJ4OJgj4C4U1; Tue, 13 Oct 2026 17:55:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F36DE6080F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914142;
	b=rO2P5ulR9V+Ms+y7+lXaDjN6rBZpfp1aFhSwTFlPVIMmFBcK7L5h8956vHQtOfNNxwNm
	 8kNQL4v6keGgid25t2CE2xkVMsWqyAVi4SsWxWXQ3dtT3YHzlsmOd2V7sKKEmMBNgbHN7
	 hrTFrkI1yNVcWzPPYF7rjf11lFaX4jxGiRJ4uo/7XbnSEEVIE6HC5D3xa5hMK+6se86JB
	 DoNFILRaKklB2aigym1w2Eq8xA5lZHW20xSPCXbGsE603249lYHC0KXaU2u+yc4B9RE5h
	 1kOZWbJtnhofeX0UQ52ZVjg44xiIK8MFQ//GWBNgubyRRMAl7nvpNRIkeTYthqcTx/g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914142;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PgckVFASRrPuC2sY7quVW2IY14GvlHXBLvThSycO7B8=;
	b=jZJANG9RRoB09mEProeEI8UKTCdCHJlpw+zs+Q7gPXqCykwj1uIMWxzNhxMXQSZcq2+V
	 WJXwasgfqszO0dhWC9zvu4ehdCVQpVVrZ+ikzC2CqvFCxrj0LGa4YGqQFBIrNsqn1JZpV
	 jn5QxEjub9KOOFuangAe0aOonEG1og2kTnYE+/Vb2GOU5Oq6wI/ae5DhGZ+7NMfoA69Y/
	 wAYlw0GQ3JmINDShPxbXOfHMK0GwsJpIrr2isxp4IcHb2nBCjQkvxCIKLrPdUybLe/K/S
	 qVR8f5bbmBx3PoqC2L9ZsywMArYI8bkRJGkeLueWAqSb3YhYORlZRGvVAgYg8Gh+BCg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914142;
	bh=PgckVFASRrPuC2sY7quVW2IY14GvlHXBLvThSycO7B8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Zf2xxxYDnD02wO9WvTVWa2JWjLUGNPjjsA6samCCGrnr+yita6h+5aiZsMaNSsxym
	 jdQVVIxtXuVJkGuLgYPdL1sWtt803zv0IztBdyMX7gWKAUwlvRZy/GoxgALnbq9rPm
	 B0td/kAba0sBlApK5FmYJfdD04uH1ZF44Bk9gEEYEnIEcnwXc8cCm1AghV2sUHmAik
	 P9YQ5tiOzZ6xNejDPGBkXnuzR002B7GKHGZQA9++M/+kMl100WBRbNRbaR7nVyhrLR
	 /Ew01WcF4cihaD9QRPzju21W+jfmPJiNGlkYG2My2WnoM5W+dewrIMBg9tgLXZ0+bO
	 EFhWlAotPlWcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F36DE6080F;
	Tue, 13 Oct 2026 17:55:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D0745362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2882402EB
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JXADgSb5tIHX for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:55:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D804A402E6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914140;
 b=hcwSSmTdaNB+y9muJKRaBvjvLJ4HCOLQaG5PnCnBlIbWNgJFzlrdcqcyAARQ71zI/lyx
 fuNvCQmFDNQAEI95YEHsamDDbVYEJBu2KINLhQOKeQDHbOgwebkBnsGQWGD3+Rfr0+i4C
 hd2QWp6Q6z85pb99YQFCDTvRQL7Z+KVGnJUzjCjiuHStojZrrTgvK08Sqr0EMslZpQPik
 eVOs8/6T7tLIXozmlQwCjU6I6B5p325X5QOpe244hIo2nvkUrV7P7caKdJxX6Jckml5NH
 Hs+YiuJdKiCFqmYgU0yh47xBhQi4Yn2eBuIVi2fBot4rMxSWXx1rWnWHteXxMYazOoA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914140;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=OP0DmNx00ypuQUUOIdeaniC55MKj+kwAVAulQpqJW0w=;
 b=r2M5mR3yidMpqFD0NyVpcwQdXRG0lLyxDf+dWOQz3IrncshxGQZzBEwalLCBz0re3E3j
 DbCH1/ggt2Zy8kFouVZhEFhOSKZFMysHEnBSZZT2mc8ExyM66Nog90phjceOGe8yLb7w3
 ACOVMoyO33pLYlarA9akC5hk+ajk52nr3EVO4Exg/vs15HCPd6k/BFgQagrSrmCRunSZu
 2xS5tgXsH42GtA13IbpWIqw/Z0K1ZCviIurextIBUKbXtlD07gEJeTo2D1tDCB3RQuE8D
 4nWQroIUMj0ZbJAZi7oUdTC1bxogirjCUev3wdcO/3JvMUGKaeuERuazxdvwQLGnMlQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=FNLzT5yC; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D804A402E6
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 2B062C653FD
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8AF4160362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:37 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id 280E111D71892; Tue, 13 Oct 2026 19:50:34 +0200 (CEST)
Date: Sat, 10 Oct 2026 09:32:06 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <asnp74Lqkv_yjZux@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-26-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-26-bernd@kuhls.net>
X-TUID: MuyX9ifz8xfR
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 280E111D71892
X-Spamd-Result: default: False [-1.72 / 30.00]; BAYES_HAM(-3.12)[93.16%];
 DATE_IN_PAST(1.00)[82]; MID_RHS_NOT_FQDN(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; ARC_NA(0.00)[]; BCC(0.00)[];
 MISSING_XM_UA(0.00)[]; RCVD_COUNT_ZERO(0.00)[0];
 TAGGED_RCPT(0.00)[]; MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 NEURAL_HAM(-0.00)[-1.000];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_CC(0.00)[buildroot.org,gmail.com];
 URIBL_BLOCKED(0.00)[bootlin.com:url,localhost:rdns,localhost:helo,kuhls.net:email];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; RCPT_COUNT_THREE(0.00)[3]
Subject: Re: [Buildroot] [PATCH v8 25/84] package/snort3: Fix build with
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

On Tue, Oct 06, 2026 at 06:20:06PM +0200, Bernd Kuhls wrote:
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
