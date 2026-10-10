Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44811CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 08:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 740C18146D;
	Sat, 10 Oct 2026 08:05:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3E_aWM5CKkzH; Sat, 10 Oct 2026 08:05:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 23247811FA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791619552;
	b=ScbPeOlbemgmShzaGlH1A2q83iYXfaCm6yA11zyIhl1jWgE41YspKXymcsXkKosNHZTH
	 UgtEnSjWjGHMQAXEx6gZBevSuAq+fns2sCn9FqgbGpC+Eo9CXMYMZUoAZUUYzpoGoDuh7
	 rM3tUCNq8Ts28R4ITMygCtEOiDyCganwkqvis8d+Fjfhfci0U/gUU4i3b1DNx+1p+vAAb
	 IvrSws6vK/srtPb3Ber0FGX4asQ1D5YV3EN4kc13+zwzzcKZc28UasSDENBHlOMtHIq5O
	 D+seXroAffFjrDJ0MWDeqQwIkxXNhlIoZ1JwTFgZp47g3t9CZFhAA1RLHf75jd5igng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791619552;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=POsU1+9gJwph3ge3XcIxQ+jrht/9umReq1oxFRFdBmA=;
	b=UOCJjCJ8xnEQ+HNtrZTDgkYx7FV2ml44dn3wD/OrrqSQptequTRAT9JDK6zbFuqYS8ua
	 t9Dny6PzFNesRBvX1MuuoUCvGD9mi44pYSJoBqXrILITab+Ntgfh9EBZzTLbBUmcOQaok
	 C4Xa+S0LfWh9EBHfo+M4N5hOTPq25D/jlxpOpKi8w0GDcKDXEiwSSEpKCtr6FRG/CV/sY
	 mc8cnMpucrwCpeMmOXHcNt1wPeKclOwgR6FLZ2m5+JBjg4GK3DYYj4k71j8MnxEZ8BN40
	 gnRbLCejj4u6J5A3gbMmmxNWJpKQrG96B5Nu69DfhP1qmfyYHvSW7AUpdvcNJKyommg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791619552;
	bh=POsU1+9gJwph3ge3XcIxQ+jrht/9umReq1oxFRFdBmA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sDezmyOEEQT7/WxYYUj9trfNT/aCzlTwDlBuzRpB8VtLTwX+6TgWB00T30tQY9MuQ
	 G58fQxFoyTgfbhcjJ3KnWlkEOC/iavpm1umkekDFPT0jrXyePshDTuDk+jP3urRxQ5
	 lg9zK1qs0wuspKu0mpL2GgXeYkv1cvhbTtZIX/XI4tFhUwvY2oA2kDFjLGI/NcjZp9
	 iT+/6JW98tdZp2Go2vgbQiXNU+0E53h7vJ9I9OqplyVJlpBu5FXokTyKKUJYh1HemA
	 o+VXOZP/mrPxdKFQTwlzfW/n4Y2ptKI4A/eyG0bL1yfN/zcAA2Gbj5pwAIrBDz4qea
	 0/b0IRWOdVz/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23247811FA;
	Sat, 10 Oct 2026 08:05:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C5AC9D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E69F7408F7
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_j_ZTuCGRxO for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 08:05:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 72B92408F4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791619548;
 b=oLABiPm+16vFNGi+jqc4AbRcVl9ve+vkE5aRA1/JqAriL2Tf71OK/3t+gxfy1xuWcASL
 lze4GTQJtzBsE9dSxezvxC9FtTbdQfIMxtl8XfC7TOOWsIWzLiPGcv/avDAF1mx1xSLc/
 OEq8/Wr7AmcKPmsjnPHuw1wX100kQ2VLcdjpqJJa0hwM9ZSbDvzisyp5V7UaFluvAAskx
 I7B+dwkLuSwJzhl0kVxBCTTm37sxJkqsarzNSIANtuVNF5HLkoS8mTuc2UJJEQXCNj7k0
 unhLbLYy5E2IqvDyFogqH7lqUQXngBlXTkNV9ZIzYggIVT/dfz2YM2NB429abutynmg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791619548;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=V50ezyzHj6hHV0RkJf9srTHvbEDkq06lQ9PUFqVJD9k=;
 b=RAomtL0M2rdOK+t7v/reJe1BZD5ayASjxUvqojH5Me4KNzQNKxwMeG7XKjK00IrcbkDC
 wfD66WttQ6Q7wYkxswnGomrm6b+Qv/0fBZlKXLggmgqUqcmqF5IOeXXd9WNLAO1CySp4B
 PyXlgwkhrhF2hurHVEo44dba+JhYG91rV0XWgUBL2wyPn1oplcmzWSipJFIsv6SipPhXD
 8OPqmAxmymDdTLHePKZ1XNPecS1UY5XqGTxSy7M/pOrtlnQGbuQbn56fYOGMQ1PchdJem
 nsW1+dZNM+IQEiynyiUJOAhaTfaPqaMei/XGCGNh3vjWtxGKaUQfEpQZZHxN1gubsNg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=jpihy1ff; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72B92408F4
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:05:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 4665A4E411BB
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:05:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0B8956075C;
 Sat, 10 Oct 2026 08:05:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0860211D70CBA; 
 Sat, 10 Oct 2026 10:05:43 +0200 (CEST)
Date: Sat, 10 Oct 2026 10:05:42 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <asnx0-nIOopEm3Z5@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-30-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-30-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v8 29/84] package/clamav: Fix build with
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

On Tue, Oct 06, 2026 at 06:20:10PM +0200, Bernd Kuhls wrote:
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
