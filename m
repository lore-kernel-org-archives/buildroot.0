Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63987CC6B2D
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 20:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0AE68105C;
	Wed, 14 Oct 2026 20:46:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 536rrI8etAZr; Wed, 14 Oct 2026 20:46:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 112E681005
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792010796;
	b=UBDCKfU7c0MuRdpYUwVOPrbt99HONqc8Q7rWNMOBCvbZCAkHCbMa0tw3StozNH4419vc
	 MogmaY8ts/SoeEJQL8EtiV8hI0kqIrwTpUuFXQaWHoyqM7QB5/j+q9uzwn73EbDiBk4fu
	 J+WCcHl8V8hkOqxlHV3hUjLMw1ZJmlb4qV9eUhr1Ux+vFMQZ6+uoz0K6T/374e788Ojyy
	 Ii6ALRdODYQ862CS2X560620agU6kCyz3oQHcWlvf3K49XnnoawrM7q7Nzi2ws8uhkWqU
	 YQbYULfXRw7PQEGM2mEBMV/2XASaos5BjxR59WpFzUUvJs34H3jg5BjQAUufop/yEYA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792010796;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3EGH0RM2pPDveiU/SRPoLMETqjDoRinYSMYNN7KDpmw=;
	b=rcgTdOQzw5k0Euw7u6UrgovIlFjQwVLiKzSBfoyVJB9v23wxeDc5Zm1zXbWRxIzyJTzk
	 0PbhxMLWHgc1w3mxAF+rpXdP8F7JzmGHpjenbNiS2Dp/VOASsPRQNXf0g+qrVNPw83SoJ
	 bW73zR8CuSxPKTE3Y2v2QlnxyyXN2Roi2ygn/HzB2tFfpkvxMg+Tq6w2WL808tT2G2I0F
	 EhM4Sn0c6JKSa0jzog08SR/mRH0Zo97Wcq2hfCP7+J6jnTS/L1YT0Ck4E/G/cDzsSzU8g
	 GhPGScy6fMCqW6XjJNCRAfARcyT9/WpLryP7H31vhBLWO+SGjxXrqjT/+0j1GxskTzA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=d9ep8kNh;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792010796;
	bh=3EGH0RM2pPDveiU/SRPoLMETqjDoRinYSMYNN7KDpmw=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SoEjhn5Bss3u143u83UeAaDRtbjX/Mf+4rCtPc7UhI9dq3HwhEE6v+wLv8s01dSnB
	 HeqkV1seX9vKXifwMX0D51eZgR/iY+GAiu1Uq4YEToJe4+MwjQ1zqHZtahRIKNu4Hf
	 N0ChQ8QTCp6KLQThfdtxs3lnfoprKT9pF0yW6Lkuv7tpfvS1i26V3GiFhYYJzVGDU0
	 5yeuP7X+j1LWHOkXTm40r2/Azt9AdmCgVSD7bjr/QXnmuLfQs50eGXfIVmZkYHrVri
	 YPuIXaTIw75913bO3PWQtFO4/ArjxWjeuMbHt1QHTHvvhl5Yx+h43nQDPECIK6Fb0y
	 P0tFagr8wA0Rw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 112E681005;
	Wed, 14 Oct 2026 20:46:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6ABBCA58
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 20:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50E6581005
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 20:46:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yaFx6ZZLzKKr for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 20:46:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2A15080F70
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792010793;
 b=fLnJWW2bWURzlOFe2jYJJlYs7l1c+G5vStOpTdSZ1F7HgaAtSo18Psvu9nAQ24F6C0Ig
 bYNwUnmMghW4Cjw+9dFXscGmWwSe8aEe98xgiX0rW5MCmifEY4oT2cscy6QHz+rgSGClQ
 DXKBYzs4qcjt7xK/VjyI22IX2LxqOnrKVJuIf2nAkgghYpNNEBj+/LCRgdeloJfNHQiCe
 JdRGiaRkFL2Y0l0pL5mFifQIKIRsXYTWo3VLTnaZPDN1hmosVTBpXbiHKLRYQm1u7AYF8
 w0gR+Cs4tS9VN222YKgRSDiVGcXxiyvuv9e1yqSB2UFT8ui0kB6kWrlyHz5zue8HsDg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792010793;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=VuMfWG3FfmDO0d9MPX8fBmJjG1dCvjo+kVpFUOUMTpE=;
 b=pVwgKR1LzLxjIohnI8oVD974joLUJtHw6QLTx/95qXYTGcQnT1suszf1QALoeQP4X+2E
 ukeaINRoxuPCRHRI/pYNjpUuXQxNrmF0831/dO9F2w9xIUqAK4wmoF4ZveJGPdodtkaEB
 T14LA2wUJfzstUIJO/b1rMrvSqKIPusLsdaJPO8QDn8oF2Pj+56qWkU/BJLeSnGHgQMwj
 zvoe1cb/+z3bdf2dtNtubjQ6Vyj0XgSiUkH5FqI16QwiFmXkQGza0oHQKoI+RMyrmV5uQ
 CJbExmuPyy+UzeI1ydMzNg0fZZNOjz2dJNnHA8j006yMLFjG0pWYjE5nk6zZQlQPQMQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=d9ep8kNh; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=d9ep8kNh
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A15080F70
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 20:46:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=d9ep8kNh4LTRfEFF8pPuD6/VwTm3JbqIGte0erMZ9wOGdp1cKlfjpyvsaLt7Ena5v27JNEvECaAWGwldu498g56mWYkaKT5NkTsvaagBC7Ahg0tU0ciOX1MkHA0ceThMAmbhMTrxmW7UaJVQNKLi3kn+7H/kyRZ1UQsuPT/4ly6xsDdFaoI324q+MkfZ/vC2FQFdKJj4FpBFeG3YVS91Pi/7G9j6rjecASfCEt1cO0prk3h26JGlwFtPfFuokA6HzJgK2jvkXxuRwYeyfgxdVaFRw7ZKjAM53k2lGdb+ESlZCr/qfEmPmMtawdOlE4YxP/RA53vFQr2K8CMfH3fPRw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=BYZheT6hkut0TiyK9RRqGhpLzSiSI7uMcsuGmPiio8o=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1623954976; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 14 Oct 2026 20:46:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xH5ri-000000001OS-3pZ1;
 Wed, 14 Oct 2026 22:46:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
In-Reply-To: <20261014074908.3176317-1-neal.frager@amd.com> (Neal Frager's
 message of "Wed, 14 Oct 2026 08:49:08 +0100")
References: <20261014074908.3176317-1-neal.frager@amd.com>
Date: Wed, 14 Oct 2026 22:46:22 +0200
Message-ID: <87a4ogj9i9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/1] package/gcc: add microblaze frame
 unwinding fix to v14
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
Cc: buildroot@buildroot.org, joseph@anodize.com, ramin.moussavi@yacoub.de,
 thesamprice@gmail.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 arnout@rnout.be, lordrasmus@gmail.com, romain.naour@smile.fr,
 michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > Add microblaze signal-frame unwinding fix back port to gcc 14.4.0.
 > Upstream: https://gcc.gnu.org/cgit/gcc/commit/?id=4ef64ad1aa9bbbe9471610e2de6ef0c8afed8b1f

 > Signed-off-by: Neal Frager <neal.frager@amd.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
