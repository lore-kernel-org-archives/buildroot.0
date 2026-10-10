Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608B6CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2ED3240765;
	Tue, 13 Oct 2026 17:57:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ep0WmY6E1qQs; Tue, 13 Oct 2026 17:57:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 70AA840728
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914220;
	b=a2W2OyCNoqb5+RLOdJ642XQnRis0zrBOApmb4NBOHrgm8BHtg4GoefRN71ya/Y5RAAGy
	 7vKEhN591qQE2dBR0ZHyfZKnygzhonmusABDFvnw1iCyTpw3/nrEvJat+o4whhrgREgvP
	 bliYMyNaxFiSW1/Pn80XKoXNlbjOvjEUUGzbM6EVlSQhKkjw/cOiUlHIaHkv707h2mk2K
	 tKRhEnAywgJnn3pDUnCNLrq6Eiwg64xHqiuYHrJUqmvotU6RPxQZc5upoNE5xRxm253PR
	 F0Fs+USGFtnxa23C9kFcOiMWwIr72RTp3dM3CVtnBj7b/HFb/Efok+TAIfv/cuBRF1Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914220;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1JLs2V0bguLoY4EP7EKHFWUQeeVasQQjuvryjVuEKxI=;
	b=WQp5MksazBXGd4/RIT+pfxHWVZoZiPuBq6emwuLyOsIqdHrXdJEFHVaQoiCuc53rENAC
	 VVT23sOkFP3I1p34fi95AQSji3e5Gm823uymYOUJ3iFCuYqOjMn6My2ZTlV+neOqO3OKq
	 GhVxXfUWLmKdkefoRA28SJAnJFwifsyyEwWEIcovirjl37vFSJl66r/1M0Q6BIDfM8pkU
	 ytN/ls5qVN3wdbDgyXR6yRshNduKv28iVKXTCIejlFYwhhdrrR8KoOT7qqJP9UcNClHiJ
	 sJmLzin6yJj1ZHmt8WGb45/LY0ZIAtU9cKCF1Yg24/bpfnlIpgcBJUzP6Rgt0pA5T3Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914220;
	bh=1JLs2V0bguLoY4EP7EKHFWUQeeVasQQjuvryjVuEKxI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KftlGEUMa+o5RpOei96gZxynICj04mRQT3iohKRG4UIEkXENEI7COkhYgwdVFDXTo
	 aOpxlYwvuD5uAYSyudAOyqEK2uOovOHqo458eMaBbZ2W6Z1HfVJZj1UlJgXkp7jZKY
	 htUaAaBoOXFQ+TmUhlwM/sEB584EGqHnr3y22pFR+K70cdoDZMyXt4HyDBc5J9EAN0
	 95biC+9mwP0CGp0Qa7X3eBX3/P6ILp+yAQhlgRDvPUIf3cko1IvBLtezFtwvSdDEFU
	 uGxlTxnu2oUaVtu+k1QzLa1Lv8nuOFdm3su9Juhf9RdA0R5a0YxgbnfzB91ZtTuMkQ
	 g/5v8W/HwoiwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70AA840728;
	Tue, 13 Oct 2026 17:57:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 41508362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 280B4402DF
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X_GMxOtDAy48 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:56:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 524AD4002B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914218;
 b=qvZ462nf0UEKjIWx3K/LnUaVPJXJFAEoBkZInVqamU49Tn39errvj8XW+igBVR3tcvFI
 IhnGhTKt0GjYbDWab1kpz169unYfnuYqSvlJsGfkjvV+JTTqERWMnv8vctOOkI3mI8BAa
 kb/N+euWunuuj40MjSByVQPkQTGIm0DQI8oqCe+T1UQwEmHNC0Bk7LrB9QnygHiRU0JkD
 kQFVnYglvsadcPMTE30TT/OMyg6UPHHijQsLMzR8nLsAONXMal/o3/NDomIeN+pbXx9F2
 utjU0KuYBpPMBPTmQfLkvZvocyvbEOOZy5r5u+FvKGljw5/9NS+vYE5fngPoCj9hBtw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914218;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=ps/UscZwhrxSBp6MGhgZjFm4VH3lDK7kgQyk5V0HfYk=;
 b=Q2kpnyIdC/xTrn0pqrJ92pXi7ZBQ1Stv4r9In+uVTYyPFXe8jsHmI9hpB7d3JYxHThZP
 akFG+7FZrrGXVRSvbCTdIFqwPRXl8P12SbNSnIOGAlbB8UIA+Kml7vX7S7RUcGg1IjDi2
 StaPwwZi57SEqIV1jMI69+4BsRpxS0ZB/8ad64yu0k0Ld6xiFoeaviHZp6jxNjYnyOYAU
 4GhAEui1IB6xzUHXnGaEIgNf5SnC9C2ZEuMcHy82EBJ26JIMkq5htPwIA+oOmu9rSxrsh
 g4jke2lLu2hD8i2q2cWtHdfUI58VCAMKx+xPJcHZJlc0w52cXs4hXybxbMV8yQmvwmQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=iDwi5Iew; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 524AD4002B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D254BC653FA
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:57:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3AE7360362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:56 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id C154B11D718D1; Tue, 13 Oct 2026 19:50:29 +0200 (CEST)
Date: Sat, 10 Oct 2026 10:36:36 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Philippe Reynes <philippe.reynes@softathome.com>
Message-ID: <asn5DwjW2V516mi0@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-33-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-33-bernd@kuhls.net>
X-TUID: u8Vn/kK9A30b
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: C154B11D718D1
X-Spamd-Result: default: False [-1.60 / 30.00]; BAYES_HAM(-3.00)[92.69%];
 DATE_IN_PAST(1.00)[81]; MID_RHS_NOT_FQDN(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; RCVD_COUNT_ZERO(0.00)[0];
 ARC_NA(0.00)[]; MISSING_XM_UA(0.00)[]; BCC(0.00)[];
 MIME_TRACE(0.00)[0:+]; DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 TO_DN_SOME(0.00)[]; FROM_HAS_DN(0.00)[];
 NEURAL_HAM(-0.00)[-1.000]; FROM_EQ_ENVFROM(0.00)[];
 URIBL_BLOCKED(0.00)[localhost:rdns,localhost:helo,bootlin.com:url,kuhls.net:email,softathome.com:email];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; RCPT_COUNT_THREE(0.00)[3]
Subject: Re: [Buildroot] [PATCH v8 32/84] package/ibm-sw-tpm2: Fix build
 with OpenSSL 4.{0, 1}
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

On Tue, Oct 06, 2026 at 06:20:13PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Philippe Reynes <philippe.reynes@softathome.com>

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
