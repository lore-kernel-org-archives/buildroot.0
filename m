Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4252C3DA7A
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 18:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B36F80F87;
	Wed, 14 Oct 2026 18:02:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0dRCL7vXhrb1; Wed, 14 Oct 2026 18:02:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6167480F88
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792000921;
	b=sdU6psjsnAv18XkSxhfKOPi6qAW1T5WnHSKzmtN5KUcA5d6C1du+/c7mizDCpjZIPB25
	 AkH/rFY8UvD1I4xbDfsHe5t09AQQKaGkQNtVnuIR2HZZcMmG01d49mEP4Q9NvtuUefmpF
	 qfeGd2Qbj6icja/XaUqLCHHxGkgweS7g6jf1QyZL6yqernEWCOSUsiBaphxqaXpvK29gW
	 e7N0GuZu68HcrkyGmYig1RMLrdtWiHdWLDlOPSPgpb96NMTERQZ4ByP9TyDyi2VYCTgao
	 9E0BqW00HtbQzHpwtNfrbp6Fnu7V9gP4QSlzuRwv/0NQri/YHfLu44rvNtdwkPT717g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792000921;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+R715CXsHfqmRDD17GbCh8vwdNfc7zusVjAvQ1QRlZE=;
	b=BWols4c/Ug5mtft69RZOcXrupSg/SfumVDsEuDkctw/d7ZgqAzjsTCA6ddPfi/+3P/6k
	 kA+Q6GJanMbonT83EZIFLpB5WDe57i9x7z0z+yr8F5Ixz79oNZOyca1/SDU5mav45vSO9
	 ZcFeAaUxny6r8hNgZP5LzGDWTw1+W7TiEZI6vxW4vUwUk8NXlEcSEqiw+i916CFCwn85o
	 5IvTD2kPesUXFJqkRtubOEOQ5ql6ps3B5VuBtVj8VTIsxMJzaFm/YXPoA1lwXwNMBwrP4
	 KrGMIUDleKNs9Hvivuv5Qrh/Iuuvtd54d1p5lHZulOB97m24kWBMAX8DpPtjXmv4how==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b="KSuj//+n";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792000921;
	bh=+R715CXsHfqmRDD17GbCh8vwdNfc7zusVjAvQ1QRlZE=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gROK8DS5rD/RtjODAqHA/oTLQcECdGN+cyf4w3fOnrHCUdatOgtnk3WA+9a3UKu+H
	 dePvsLyjwFonJfG5yHTbqTcPgQsPZxbfIBvIcgmpk7idGKwp8GUwAg8pfYSfX3U45Q
	 Rbn72aJDXqNU54KJd70taYSgJXfwWXhxCtLu6/lTx3RpgqWHAzSLNL8l4HhTOlQNji
	 S48Vamw4K+ocU+VHvk32eVYmbyHCnxmWZERQTObnMv5zUYTphg1w1iAP3XpJ9f0Jdp
	 Tk2E9i9VELlDaG0CuMJdwgMjzEGwkTsARG/vRVB4LyXzaeInjpV8a0YwXyZD0oO3SP
	 PTun52emyWsvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6167480F88;
	Wed, 14 Oct 2026 18:02:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 04EF84DD
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 18:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA67380F88
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 18:01:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id utzhi9DEbaz5 for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 18:01:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 009C580F87
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792000918;
 b=gi3/VkLymLHjF2/MVIvZOm7fQVY3ffyCNxu57zDtFLl7huS3vWEjtuuJ7KINdqKgOhVE
 cFXIrhC7uSzy5Jf2AhVAu9Mf+kHNk9Ktqp5o793WynaLnXwOMAg57OREUfPQ8LPe6ELD0
 NGx4Jhv6YIC6SoCMQGbrMNYmODGB2Gr4T1MOzcMBvwuAZKXmCCprhYj14OKCnhHgLc6+y
 Hii70cqFWGkN9uX0fr095yCJonyG1qPLW2bxFLDtQBJVOKlsUST29fmZMYKtuqfMPHI1h
 hr2RJQF6AmhnM/SY+iy8fxKUWgUsuXnaC72via51IPyviAIwTKcoNAT7l5/w9FFR74Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792000918;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=ysq8+pU0jNwjGnLYEi6++cDAFdgaBQ9o0NnTboL+eDc=;
 b=cAyn9u1ws53RThd3rZ7OixqdTvVkottprcbDP+jN1w6zYIgVAP6yOKUhH5xedsJHUSwd
 qQt9lmwPACZBtSKi5FMPXVrAqDXTUIZG3iETBT6929e8kN7MOAwvyY1HauJLwa7BkjEL/
 HhnsoQYZVrZHB6NKf3fu8w5JLChcRDK8WeP7C6w0xIXqvTDC2HCjql6EUrvHoXyygMv+e
 UWFCX88FHkcRkAPsrHi/vXiN+scCuVzLfAQHY6bsZnDRu2La+xzxTQJjUzFVZrT8o4XE7
 84NGYtMUUkFzSNRZ0mRs2n/fD/Q75UTZc2O94YsOzZ4zoOQr3VQj5K9u7RF7YaAsKew==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b="KSuj//+n"; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=KSuj//+n
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 009C580F87
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 18:01:55 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=KSuj//+nDHQq5wchNcupnmpHLGEd/y64YsAoSx60tORJDUZ+j3A7egY99T7eaub0wQK2qK22aVxN1hYlWLkNyfQcVBzwCgoCMUlA+PqfKC9QpiMeObQt3LKe9Oj/LYu2EwzhkGed094VcImsWx4eZwnSSaSHmO0jrLprYOWtR4jhWRKhN9foGGmufzI9YPFhw720FJEr10meG8UKJi3kpk0kFr2Sh3SL2LBBKWR7RFLkkpndycJVUnKM1ksh4APHXkTfDMGbYCO7iNsN1DmK72H0Pbr9kP7xEEh4/M3Br6kDycU3eigAvNbwC4N3roIipKIebp8fstgB+EK6EHm2sg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=ZF6XAVYY+lTko+4qTEq9KqjcnUQgaEqupgNLC1f4m6A=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1961769187; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 14 Oct 2026 18:01:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xH3IU-0000000DMsG-3bKg;
 Wed, 14 Oct 2026 20:01:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer via buildroot <buildroot@buildroot.org>
Cc: Peter Seiderer <ps.report@gmx.net>
In-Reply-To: <20261014153526.1672168-1-ps.report@gmx.net> (Peter Seiderer via
 buildroot's message of "Wed, 14 Oct 2026 17:35:26 +0200")
References: <20261014153526.1672168-1-ps.report@gmx.net>
Date: Wed, 14 Oct 2026 20:01:50 +0200
Message-ID: <874ieorwj5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/libcurl: security bump version
 to 8.23.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Seiderer via buildroot <buildroot@buildroot.org> writes:

 > - bump to version 8.23.0 (for details see [1], [2])
 > - drop '--enable-smb'/'--disable-smb' as smb support is gone (see [1])

 > [1] https://curl.se/changes.html
 > [2] https://daniel.haxx.se/blog/2026/10/14/curl-8-23-0/

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed after adding the details about what CVEs are fixes, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
