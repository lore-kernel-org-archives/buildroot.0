Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D2FCC6B3C
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 11:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA31E607C8;
	Thu, 15 Oct 2026 11:32:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XqFVlQhvE9YL; Thu, 15 Oct 2026 11:32:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7D11A6077F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792063936;
	b=eoAW92lB0b/rzc4zAqN19eQsPhnK4SSeHoO9CQYBmhCp39DHpSzHoMqlhsRWHWvHqySB
	 CaDAZ2uVL9OydeFToq5NzQBpaw38ffC0k7SgWOgIPH6v0ojYnQ8i0NshGG0pc/S/gKd3L
	 qMZ5Zz2797CxC7N8T0J4jdOHO9OqWyCC9P5BbN6AsCByV1bkhVFz1WJdAdoyNtwE3H/PP
	 Qh0yjmKf7Xa+nOf5dxYeoYbnHFxR2pfxHzmfpr32HL4l23vKVlGqOwjG1ERq4xZ7S4qdj
	 lQUULSUl3vRSk/fQtw3ny9j4LFfjwDUFi+LN349sAax3HVcJFULOACf1W/qOJluel6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792063936;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QoYi71e2v4nyztGJzp4CKH/N1qdk4xGSOPFaVH5DihI=;
	b=fMHjgDzvhqXhLfFggJLJdIBbSE/5VsMwjhoVDcPrB3/Ke6EbxFQWV0boO4TdfV5F2H88
	 PdP/yKWK1ywx8udD6W5A5c/yfvQIJiWNz+xMKqEUK1mnMA9dLTu0mOLsZVfzmqodxtGK7
	 gf+rxdTTZDC6nXCNbk72+xlmi8b2Gq40cKqP4bTrtyJty1n9Y66o/LqJR23bCeKnEVSV4
	 MwXbdzF4LinLrE7S3KKD7DHFvNrNB+Eqfye8KsZg4/BJPFptLnSurKcjcsP/JVyslxt6H
	 Irxi7NvUDIFfdWnbhGJUn1LP6T5iUf3+GX2LlVlLDmNYnEja5mJkqDcXi5oAT+PA7YQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792063936;
	bh=QoYi71e2v4nyztGJzp4CKH/N1qdk4xGSOPFaVH5DihI=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mTbVzlY+7wTFM+aGmvTcvDrsb7gIZVsWJOVeiNEpvJTkWb+Up/uruTeBThyteWoXp
	 skxHjqwdOEUFwew7px6Ytz6rM45TqDq3kl2uZ27LwmGgBRU3YYefgNSMCYAqLwxrtO
	 uKH+xRXiDeDHpqylVfC1+8ryUWvFaLakMICRzUJ/+0e+5J7hbPyC1VPr7V306h3zt9
	 1gq7PEPaiOc8t414lVfY0f3bNoshAs1dHPl0s6JDwUHIjkndOOK9twQp9g3Ya2l1fL
	 tkAWcuP8at00hKZ0r9C9ndmGRCTLP8dJ/Fwykt7CJyvs9YXzbj1DNCGVpSp5WgWKC2
	 ZG2n+d6sj2+hQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D11A6077F;
	Thu, 15 Oct 2026 11:32:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C206F255
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 11:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB83781105
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 11:32:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tqFgfqs0xJ3D for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 11:32:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 93F1381101
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792063933;
 b=IeUZkqVe1OJ4uQUEiYzT7tuhHcG9OyXWnKKtUZdWqcJOQB4ygLiV4ICd4arRceyhcIWM
 w7TQ/5vmibSZxz4tSriD2tcFgffXIMS0vi5wHA6D2Yux8bMOYB5SQelUTmUT5ZoZBRYFN
 i3+nu/YdXCwfJr4wxdtnjm/OXG5uP8t2YsZwQ7oItE/9fZ8GC4FPDJC2GL5hOYfVmPBgf
 fQok7SiqMgPH52BqV9IcoS0ufS1sssb583RcwCDoa+/I38Gs/eSD3L3VJG1JBPsnHK92X
 3ud/V/Ayzt5r09R3lJ4hvmA+bb6B/bgiSZNQxP4sDBjtg4574GdE9yqQtmg6aqKt7ng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792063933;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=EpqMQl/2/qj7C93wqYd1b718KHpL8vhcpSaag0TuKZ4=;
 b=YILun+y1IqJi2tX8TdeYP+SA8AdXMel6WCHAzob3MHndY4y2Lb05lwdONzdUPRFG/fdF
 w0YJWwXknJ1QWw+LZ+Z5ib9ARZJh+8KNZ7WBvoWRpWjBZG+N1AXH6UlrCF2izxgWR8rNf
 ATCCgk8CHCGTviUf7RYOzxT/3jp8bPHDLjIQrjlzBGtAqkj+8IDZi5xIIFqdqSCOmHe7O
 51eafeBgL3jFTb/hzP1KN4WncCCXze6b3ER/GC3oVruteaz9k6BpMSFtVmEjqFMDmN0CY
 87f43KV9BHvpMQ6w/fzLccIenbmv9BH93T7XdNPIrqxxH3REShRN0dqMwQu54OwzZ8Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=XHWELyKe; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=XHWELyKe
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93F1381101
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 11:32:11 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=XHWELyKe0SnNANCTb3zFQvknvzcSXZPWKz8rWA0TWP2tOtHH7sJyfgRgtChqxdZokqIE9klVUnbtXVsCfuXipPq/LmKjprddZbYnrac2DQjANJwtEyYGmKY6n53oFfxxLPQjv8G0E5HHDQ5jG9cfbhtgD5tfLqTf158dQKljZftMumXhj+noQYiDtFzOOrlmX23R5Z5Vst0eX4xekabwNGc9zmJuiXn32DezO5UIhqQEP5rXaYl+BX1RK5qFIQEgGTMl84+8/89me39zIO2euAH78VB0cbdUg3JeMMQ03AIojBlEOoPlAkiQQn50iqLLTM3gKIxY32FEU0gg1Ff8AQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=+L3gs4ImJZxIFR33/IfsuergiHKfqxtbXXOiiuX2qgg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1019528219; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 15 Oct 2026 11:32:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xHJgp-00000000OaU-3669;
 Thu, 15 Oct 2026 13:32:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@smile.fr>,  buildroot@buildroot.org,
 arnout@rnout.be,  Julien Olivain <ju.o@free.fr>
In-Reply-To: <as3sD0VIZZwk-tXn@windsurf> (Thomas Petazzoni's message of "Tue, 
 13 Oct 2026 10:31:33 +0200")
References: <20260607213030.1509913-1-romain.naour@smile.fr>
 <20260607213030.1509913-2-romain.naour@smile.fr>
 <as3sD0VIZZwk-tXn@windsurf>
Date: Thu, 15 Oct 2026 13:32:03 +0200
Message-ID: <874iengpxo.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/glibc: riscv w/ ISA RVV needs
 gcc >= 15
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 >> +++ b/package/glibc/Config.in
 >> @@ -27,6 +27,9 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 >> # glibc needs atomic instructions, and does not support
 >> # single-precision floating point ABIs (ilp32f and lp64f)
 >> depends on (BR2_RISCV_ISA_RVA && !BR2_RISCV_ABI_ILP32F && !BR2_RISCV_ABI_LP64F) || !BR2_riscv
 >> +	# glibc >= 2.43 needs at gcc >= 15 when Vector
 >> +	# Instructions (V) are enabled.
 >> +	depends on (BR2_RISCV_ISA_RVV && BR2_TOOLCHAIN_GCC_AT_LEAST_15) || !BR2_riscv

 > This will hide glibc if gcc 15.x is not used. I was wondering if it
 > would make more sense to turn things around and hide gcc 14.x instead
 > if glibc is used on RISC-V RVV-enabled platforms?

 > Peter, Arnout, Julien, thoughts?

Yes, that sounds more sensible and then the logic would also just go away
when GCC 14.x support is dropped.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
