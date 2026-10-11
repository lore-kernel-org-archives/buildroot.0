Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33F8CC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7630A60791;
	Tue, 13 Oct 2026 17:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BnafMlbQgpcG; Tue, 13 Oct 2026 17:54:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A43066073B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914043;
	b=Lk0NKbGLDNdVaEF+yILcH3PQArlrgoJC63Cmps2l/RkAjJ45kI3QvrmKw3FpvlMYRdP1
	 9tQYpOBUg6mmL0IbjsOsjz6I9U9g9SsMtGbqX3DLohTCg5HhyOQJOB3ZZdfTEiSRXPWmE
	 Ja/dPgVPwJp49bWaHoJG/7R0re1IFI9dN5A6jX95qyLw3SY5uYlG5D+3TNdKdbLFAl/Rd
	 TO2ai571qKlGGibnqjuY3/JYHJdTv3CkoolWzEpzV7kTl8GrY7d/MnNvt5/HWHsWGElE2
	 MAGTkO2WuyOggspVS+aDMWGmLEA5PmekME6db0l1NEj4SAoQT4tLBdOpclFGtju6FsA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914043;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pGwrPbS7FpQ+b5jxshRGff1EbNhnJn0g5gjn2oT56N8=;
	b=euWcS0kb95hIQhnq90mZ2zOOzfMpUNgT8eMyluhDwnbmKIpiBv/Gy6amna4AG+LEYu4Z
	 SynUdwjP3WT0DAGD36v1h412+zdYeI9FUw1TyefXsEJN0wEm2xqCJL3u8bEMxPn8MNp8D
	 f/YCfTbBO1kPP1NdAtJk9rZr1VZEgITQ46jryeiqHgPMZvkDzKTZxz4g1ftyn3YGpco11
	 uGJ3ze6fQMNKnQji48OiGEVWlJ/0R92rwjZpaNDplgtqxbms3CWZfB2coxdmEcC5h4cgW
	 PZGJTAw38CUziUVRhbHQzgPIBICS+B6nUSeSefY0pFTU4+4Nqekq7uFKrO1xht/NP4A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914043;
	bh=pGwrPbS7FpQ+b5jxshRGff1EbNhnJn0g5gjn2oT56N8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oopuTXvFOB58/zCLqxytWByqA4C6lKFwAP9crqspDgF+AtoTL+Zg0G7pqLHxLOD6n
	 dWvgN86ODTsctxG27LjhXigCyNrNNLzw1dRAH0ROKTDltQEA+5Uzg+SQ8biCzAgP1e
	 8q5vhZr57Ki7DUysT/trgwIgwujayhorwpXXNFyxnI1TW5gUHwLADNsuWB3EaU+wfd
	 EQ4bjDLrmpIjxUiNXYYsOe3SHaV0V7uPE5yAvFrW1OqRThNP31h0Ixv29OOWqtlVWC
	 sbAxR5Lfs4W4PGZdlw4YkMkNF7sSRTSBXm5xpYlURxNmDutSn+otqGjUl2eTQWoec2
	 kkI0OYfQ61pEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A43066073B;
	Tue, 13 Oct 2026 17:54:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BAFF9362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACA53402DF
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCxO7Rkq-1h8 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:54:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C444B4002B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914042;
 b=QEuNTHeHeG2U9ZeuDpMkkK8xEQvNsf+tcFzSW93qGpempo3o9Rj3XazEKQuVWQ/Uha2F
 Bl93pq/MBR6s7ZdG2AXncLz/fHBfJl1ZQNDQcYsADx0SWhe2RemKsEvPmkD2ErQGwAQPt
 8O2IgbS2CQ6qUzbvlrKdA+NLjn/fce/+s7iPeI2RH6ZJ9VrCKStnGaGnHP4XQWBdaGqN/
 0oX0j8X+nlgGnx7iMluRHRZ1Lu4HuVvRyHiAYAri52iN2+mqyynVb4Vn7SmF7KvOR3nTZ
 dmFinXZgHL/lx32Prv62ih7BwAumpqrp4Zh8WIK7nJnbqJdJ6eyh0mLnwJYXcjzVBEg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914042;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=5ap4LzqgzDBSw5vplR6z8x8gGBNtBewoV0YtPeOiEDk=;
 b=kym1EYvn/PN85y2UlGAqAeLocbjh6ZN0QD+o57rwcu0SPE/YVMbJ1ZEPA9P1EBy8lwdR
 pb80HNUy40YN4BI8XVCe81VQbvtq5T/EOkTksNsaqfZl4k4DNeioKznC5e+Kpb0TOejY0
 dd3rvSthHtyT6fbhdk3LLygy8774TNt0qeArxXmWTtbbqCu/K6bzsOyjYQavEPEYqg7f5
 CYqKBb3sPZcxorUE4P9QAc24lyBoUH1npJrvZXKrXoWC4Wiu/OmPN00LQzHKRlOGALF+y
 G9Gb3ers3W5Kel6veu/aPQA8vU9fMgsQ6080Aw3vdz/+j7CD25vc+coS4049aR6OLoQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Y8UWzb7o; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C444B4002B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2939C4E41215
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:53:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F27186075C
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:53:58 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id 89D7C11D7188E; Tue, 13 Oct 2026 19:50:52 +0200 (CEST)
Date: Sun, 11 Oct 2026 15:46:33 +0200
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Message-ID: <asuTMso5FbwEnAjL@windsurf>
References: <20240826214434.1530363-1-geomatsi@gmail.com>
 <20240826214434.1530363-3-geomatsi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240826214434.1530363-3-geomatsi@gmail.com>
X-TUID: xKeleFMG8MMr
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 89D7C11D7188E
X-Spamd-Result: default: False [-0.27 / 30.00]; BAYES_HAM(-3.17)[93.34%];
 SUSPICIOUS_RECIPS(1.50)[]; DATE_IN_PAST(1.00)[52];
 MID_RHS_NOT_FQDN(0.50)[]; MIME_GOOD(-0.10)[text/plain];
 TAGGED_RCPT(0.00)[]; BCC(0.00)[]; RCVD_COUNT_ZERO(0.00)[0];
 DKIM_SIGNED(0.00)[bootlin.com:s=dkim]; MISSING_XM_UA(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[gmail.com];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 NEURAL_HAM(-0.00)[-1.000]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_SOME(0.00)[];
 FREEMAIL_CC(0.00)[buildroot.org,gmail.com,benettiengineering.com,free.fr];
 URIBL_BLOCKED(0.00)[bootlin.com:url,localhost:rdns,localhost:helo];
 RCPT_COUNT_FIVE(0.00)[5]
Subject: Re: [Buildroot] [PATCH v2 2/2] package: binutils: install libsframe
 to target
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

On Tue, Aug 27, 2024 at 12:44:24AM +0300, Sergey Matyukevich wrote:
> Starting from v2.40, binutils provides libsframe, a library for
> manipulating the SFRAME debug format. Buildroot installs libsframe
> to the target image only if BR2_PACKAGE_BINUTILS_TARGET option is
> enabled. However other dynamic libraries from binutils are linked
> against libsframe, including libbfd and libopcodes. Any binary
> linked dynamically against libbfd, e.g. perf, will need libsframe
> as well. So libsframe should always be installed the target together
> with other binutils libraries such as libbfd and libopcodes.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

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
