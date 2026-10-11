Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0A4CC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4949E60810;
	Tue, 13 Oct 2026 17:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nze6jpYzyPvf; Tue, 13 Oct 2026 17:56:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6019360803
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914165;
	b=o2BgeiITWEggn80Z6iIJ0sqhzJTwvZAledQSrdbcZngmYj+XmARVMMFD7G7I97AMRmcM
	 nRqr8H1kyn8vgLnZyLpZH6ZLT9hKVFz/2DhwG1ds4Cnxn1HDTmN4FGiCwhEvOzB9eZapx
	 I4lhWWVvxz0UR5YQBfz7BugZWcMIngoEoSpB0V3POlwvtaBhdJUSF6S+C17ctzQ/WKvKj
	 yfsSOVIvoU1gdTyu43XHQp+DDrvzQqrI/9JM1/jtmcRceUz4Pm6tx1w90aVCgVCzrVGYS
	 yQtNF8Qb0jOo+rqYieNDko+RufywEBwWFq0MBLstZG73npiSYfMFDu7oSPYOt4HR1mA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914165;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=OA8ouHINmvj5xfK35s8Q/ibSrz1gUyjaai4vGXfkZmo=;
	b=PyRR8gXQP9Wve62VtXcnz1Q5TVKvEwOk2+9Lggn7Hf3tL8YpGx6ZJSeKwt8xOSuktP9Q
	 gpGJJH5dZiKYTowc5PRIuBVeRbH5wjOnmu08nxaoylBpikfJj48o8qyYKgc2i2UvEoUsL
	 dhTDjdtE7RIpZ7Pj7Uq3YiD33YdXOS2FDr3YEpPgs13ZE5fgGSs4kwneme/WpQpdM96Fy
	 44aVNESzXVDo1U+1pMgu6ypuCXNnizbzIOR0yQ3sTqefNzVHgRw+2v3wC+5UG9rCq5JLG
	 MEAYSjMMTrpGFXo8G4ZuIHtG3LZd8iv9pPU6m5t/m9XuET61RqXnbCMEi14fioTy9Kw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914165;
	bh=OA8ouHINmvj5xfK35s8Q/ibSrz1gUyjaai4vGXfkZmo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nRIXFgWdJIagB56DoU/Qo+zQ4HyXPLtUn9Rwe3lf5k52RUHLDAd4YFF3n+yaSIlG7
	 OaQR+um2NoNioVUipSMrci3TRnPUCvmk2jhAp9zcEZuDXOexHmqpqPKUUbP9ugB8uV
	 gb8iBoCaQcSGwgpT/EffN1dXeqcJi+NkO1YE+urMTO7+1cbLsbI361nAqEsLWh5qLe
	 fQ7HBjjFjJlxaMOFFhSR8MJCnjzm0fhqfynlOuhGYN9I8nPhkXr3U/mdIMwrim3CsP
	 pznMQBt4aofBSc2PCI2VJC5oYXxLcYABJ5LUWpoF55DSbMkBn6jlh93AZ9s3cKFCFI
	 1o+UQ9YQfdHtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6019360803;
	Tue, 13 Oct 2026 17:56:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ED856362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF00B6080B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Zoxh0k4cbQg for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:55:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0150A607EA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914159;
 b=BalUPjRZDG+898cRn5yDcHVRWg56Qi2YKtgRU7sKsW9Ryo4aYwFstbrZ0jyKmEBU4M6d
 Mbq2SQ5v1VX/NFnGO1/cVsb+tclUO+Ba94CComG28uvr4SDI7odI6pWAFquDlnaLW8TbG
 7vS2fpLcGR4kDCuvU4mM9GACSDOQ8XQlwTdYyv9929r/+Ez2bdzzwXd/84/WJAj8G31OQ
 AElE8Ya7GM6v5iYlGMwmdWrdGIbtWlLnfKgQeKx+VoeBCrBrtSRONNV2/s/kG0lXDKsDT
 q8y0mfInG/R04FD+JizxXPO4aRflLaxLqGdyFwl9+Vh+/gTXhzo3fm5Pf23E5vQBlJg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914159;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=hWGrwC0EfSrSn8ePPPDWqeWDGH0ZO+0jn7ZxB95ExOw=;
 b=HHcOIHE1JHOx1AGKXxGCRzIARTGVigj4TBoVzG0j86cifnpGoQx2mk9Y7QeWt6WwdHqz
 /EAOZ+wMQ96Bo+DzmVpjAEPGxtfPKZy/QEWkQnCDUOxNSkLjB/89nOyEo1cmmDoE8OpJQ
 lQ2L7SOmrb31oL5Nq38HcpLUmCje8G6lJvEfLKnUZ4r/b3iB9LWPQbqIqDfJ1rkPCf6fj
 0k7i/xEW3wXoPVegY0QZJQhFyK1coDSKZr+VyjbhbLE4opWdv4P4fyM5LcHJV9RexAhZL
 y9YDQrNGdebTrTHSG45DsSkpgaPtE2I6N4v1lCMwaBUfAvLvSYxvUfn9RGhhUf0wICQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=lhv6NEGS; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0150A607EA
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 506D1C63A0D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B0F8860362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:56 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id 6345811D718C2; Tue, 13 Oct 2026 19:50:49 +0200 (CEST)
Date: Sun, 11 Oct 2026 15:14:42 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
Message-ID: <asuLaEzdxsd2CIt2@windsurf>
References: <cover.1696522656.git.yann.morin.1998@free.fr>
 <f57167b1488b3c5ad76362dd8bca1b12d281aa19.1696522656.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f57167b1488b3c5ad76362dd8bca1b12d281aa19.1696522656.git.yann.morin.1998@free.fr>
X-TUID: s5wjtp9w6e3o
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 6345811D718C2
X-Spamd-Result: default: False [0.10 / 30.00]; BAYES_HAM(-1.30)[83.50%];
 DATE_IN_PAST(1.00)[52]; MID_RHS_NOT_FQDN(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[free.fr]; MISSING_XM_UA(0.00)[];
 RCVD_COUNT_ZERO(0.00)[0]; BCC(0.00)[]; MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 NEURAL_HAM(-0.00)[-1.000];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_CC(0.00)[buildroot.org,free.fr];
 URIBL_BLOCKED(0.00)[bootlin.com:url,localhost:rdns,localhost:helo];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; RCPT_COUNT_THREE(0.00)[3]
Subject: Re: [Buildroot] [PATCH 1/2 v2] support/runtime-test: add helper to
 test graphics rendering
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

On Thu, Oct 05, 2023 at 06:17:40PM +0200, Yann E. MORIN wrote:
> In 4edb0e3456ef (support/testing/tests/package/test_weston.py: new
> runtime test), the weston test was introduced, and thus was the first
> that needed to test that rendering was happening.
> 
> Now we also have a test for a flutter application, and we'll want to
> have it test the rendering too.
> 
> Move the corresponding code to a helper that can be reused by other
> tests, rather than duplicate (or reinvent) it.
> 
> Switch weston to using that new helper.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Julien Olivain <ju.o@free.fr>

Seems like I forgot to reply to you when I applied this years ago, but
this series has been applied... a long time ago :-)

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
