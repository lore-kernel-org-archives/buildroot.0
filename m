Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B501CCC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6717F405BF;
	Tue, 13 Oct 2026 17:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rC0kIyNIJAxu; Tue, 13 Oct 2026 17:52:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D0827405C2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791913970;
	b=P5OMJbF9gMmRy3FBU2LNsnssG2z5wCKC+tqwBX+pGJjtbMDIy/3/43UE0mS5DqR8K0IN
	 Gk4hN9MlFRncwKXNTJtFcSf1lfGy+ua+2p7UDeexQd0a4KmEDO/lBFiIjkzM2cQfUEzFF
	 s24rzwCYX6xVh7StqyJohM9FvyPWk/CQzql9Jh9XbwAiLn/x1OXqN6cFmflUi+6HQTLFa
	 lm1Q3rkjtTh7TFkbScc9dIpIG9yv4U0es/7ZoMNi5GrD1si0fMlE1oEjG8DPLQv5NzFX+
	 sMf4dPR7+2384EoZr7M7fVgDMdHewT5Z5d8H5+tkuWteyzkq0eyqsIsDmbxtb8qHlnA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791913970;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nk2GG675rS/dpwC04Flq5/AR2XuRWGbt+VcOxjH/kSQ=;
	b=V4Q1ODx3LADAmthKcp+tKZmVEdD6xjPIR0ye5jxplyAhLl50Vki/tEoJe56S8e3r7a9Z
	 Lf3M5WFWOk8Q+NjOqMiYe1ar3c9kHZ2twwnMm3XNn6D+7TwQQUcRv8XrPRllMK11FSl4O
	 Luu99vbQefMAyJe7v/FbPfQEX6cf1Hf7sYj8ptNPa4qQOFPnNH8e94DgA2+kEa9zGs2+T
	 5DrKE0q5DjcgLYaz8+J09N4SQUSw80Sc/KItfHdgBVrSrvErCvjYGYBffsUq87RNx4sUr
	 n4F5+oGFULPh7TcPGtxNkGWxQqu0h/P4/VrwPtt/gkb+RlAEQ73bj+sjZlCqjPBgiLA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791913970;
	bh=nk2GG675rS/dpwC04Flq5/AR2XuRWGbt+VcOxjH/kSQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MOjbzptVa+EMECdoU/R2dxMa43snbTbr2kk40nYzakyYPwiect2KBpMJXycCwSjRD
	 ldO72e+AfTpAZDh3FsX/88PgqVXLSfp8ZeeKcHgbh8/gAi4JfuBTnhqFdRjQAEgYjw
	 bQbDJzlm/CUdtDzKgPrP4V6DN4HtOUVax4Wjre6g7gMhGfsJtbaMNTv9EspQ193maG
	 6yx//2StxSdulKCVHBr7dEBwPYHH+azWVJTcIBRNLAXAQrAKRDz8tGz5S2ZjWvaGmk
	 YXwa5It3Jr7ycHMmq7w77TuLZ1l8sxJBI9Ui8+6qL47q1/igMh7dnok24pkpChuOUd
	 KorUoy7Tpp0JA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0827405C2;
	Tue, 13 Oct 2026 17:52:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7189675
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57DE56073B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I7RjRkzsRPGy for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:52:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 771F060705
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791913967;
 b=o45eMypnYnTlb/O/BNAPjm7U222A5okxLw6aW0gsgbeqQRh9LG6UIb1rW0MUf2hhNUrz
 0Avkr1kI32ldRz3lidI0aUj/iDsQT35NC4SKGDNKqBR5hDjFRR77nh4RG8uNYr/7ylueX
 Wsax5JEG/jfNi/u90I9UJglsM7HAYK238S0IAcufFb+Xei1yhPmMzUVBDIB8cRyOhex+s
 Ci9gYgQIn6ZOj/zlQ2xOBuwdY4PoBLjIXJuTCXMksE0xp9AOUjnwjKouYwPe2mFUuNlaM
 /uC/0c8CuLtBJBCyhG5FTMM0y3ia8XU3keoyIRNJUk83cWw8+0pdnRDiV7FSk8k1JQw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791913967;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=Qu6V030VpJ8h3dojjUIDpVluP1izYqAIVeJggFkFKvA=;
 b=YwmtOP8IOH1hSBwr14NBgAoQjxnC8Ql4RD6y/EHlNGLCQLhxpPrfIGfjfDF2VoUz4zEw
 zpowTxvZRuU60dcxzUMQLzi3DpU0LlW7ExiRNEjMtWhHh5JutIII/joXyCzjPbubiNfHb
 x8jREOlFD3dn7J5iF26uW7awTvEqKBCDvHHp7BmtMWztZOsjWDcDPPANe9szyOcGSCjX0
 wgeCbdE2oxIJjNsALKRI+h+xMv0MMbI0wCPsEKUuQaiaO1LjHO9A5edvhMSeb7kwrEFsI
 ufueq/p6PZq+kDbW4bKS9kX4WAUyFVIXnoYedWORNMFSJUxNe+pxEhFN1GBSBtODh3g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=iK+IBKf7; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 771F060705
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:52:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D55924E4120F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:52:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AA78A60362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:52:45 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id 1D25111D7189D; Tue, 13 Oct 2026 19:50:21 +0200 (CEST)
Date: Wed, 7 Oct 2026 09:56:02 +0200
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: buildroot@buildroot.org, laurent.pinchart@ideasonboard.com, 
 tomi.valkeinen@ideasonboard.com
Message-ID: <asX6-FL0fQqOEnyU@windsurf>
References: <20261005065818.2023521-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261005065818.2023521-1-paul.elder@ideasonboard.com>
X-TUID: 3BkitW4whj28
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 1D25111D7189D
X-Spamd-Result: default: False [-0.05 / 30.00]; BAYES_HAM(-1.45)[84.63%];
 DATE_IN_PAST(1.00)[153]; MID_RHS_NOT_FQDN(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; BCC(0.00)[];
 URIBL_BLOCKED(0.00)[bootlin.com:url,localhost:rdns,localhost:helo];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[bootlin.com:s=dkim]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; TO_MATCH_ENVRCPT_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 NEURAL_HAM(-0.00)[-1.000]; MISSING_XM_UA(0.00)[];
 RCVD_COUNT_ZERO(0.00)[0]; TO_DN_SOME(0.00)[]
Subject: Re: [Buildroot] [PATCH v2 0/2] package/kmsxx: Add support for pykms
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

On Mon, Oct 05, 2026 at 03:58:14PM +0900, Paul Elder wrote:

> Paul Elder (2):
>   package/kmsxx: Add option for pykms
>   package/kmsxx: Add kmsprint and kmstest to extra utils

Thanks, series applied!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
