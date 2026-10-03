Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A83ECA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6982881326;
	Sat,  3 Oct 2026 12:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MPB3srd8mmsl; Sat,  3 Oct 2026 12:53:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 57C87810AE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791032005;
	b=SPotWbqnOPrqtjytO9DdyTi+cSD56AIGLnfdyCUTWBfHeoCEEFZ7xRLDVR0nbmbqFGkw
	 vLGFht/N+G/P49A2h/qxOdiXP67u7JxMtAMTCytGIOym2FG4a1EKa7RCXlzJEwGxVvKGj
	 oVfDyotwX8nvlC93ZVhDCHCzy8RkwHTg5auFTSMpVoMae07lo6/8BpBlB9cVljXaXKE06
	 JdfFUl0Z8T0bkYxOg8EyQ6vqi8KuTNnR14uJ1KQKbJPDLxfVthUZ1Tm0ZXfWa6yxg3VL8
	 SJBuDP3yRKnGsb/AnZLi5pVwBP7Wi2c9g9aXdLWMOnotl+mVv3UOQIXGdLs+ONKKgZA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791032005;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=jKmZX6OXJNzg60OIhWosFguou+vGHbWdZxlf++Rtwhc=;
	b=ENN3zaXXi5zNZ21NfEy1VQBl+a+EjMN+0+Xpc/bN6ZZumjfCpNPcgTXR7AgJEHDoDJFM
	 eH2c4ffmEu7ojsp8hkORxgc7ofO8O4xmx90PXcNPrD9P6bWQNClawm2v3EKYooREgI+pO
	 3usZAmiczIvgSCLeHoTC9JM7dEIOcRFZtmEU092b404tIUp8irqL0U04MFg9pe2Z7GXRi
	 G8YSZcyKajjCgRQC3iBYS/DLlk8hygh2e7YI3ltyL6yyOj6BmBZLRwixopVk+E6GWbI6r
	 uG3Xpro4LEBPhc5lXViT8vS3DbveMfHxyt3Utb+smITOkpfS3JeQo/E9BucpI1G3gKw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791032005;
	bh=jKmZX6OXJNzg60OIhWosFguou+vGHbWdZxlf++Rtwhc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CKrqF6cOwDmUb/QWFhR4TLC0mOleWB9emOOANBV5DuVyK52Feah+e4pAE6KadZxlr
	 OxN0f27XhtWMmky64DPYTD/TJPl08Y3fKgU1KiDxSxYSajKEfqnLLPkimbgg6nvBEG
	 yNsaavcDKi8X/8jztSrzsOZ+yliPtCsxP7x0L8hRmjLjUzR/cVjYSSYZQBE42UF9Nt
	 rmK5/FVgPMdDmhVrEf/pcXd+s7uker3Ea+orfTkZe9GXC86OCLCO4bI47yfbKGM3Ga
	 fY2Z+QrL/7OSBPbTy/kupeepn6jqplmBfX5Cu2BZ0h4QqgZLKxw21k6GxB14FRta+3
	 GrNURsOfpSIyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57C87810AE;
	Sat,  3 Oct 2026 12:53:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB8181A6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DB23412B0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gjrPuA49lGLQ for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:53:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BCD5E41287
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791032003;
 b=PfAqESJXOp0pALtzw+RD4SfU9Qd6nKazEXMPcnaCkgt8YfX0Gd1UaH0a1ougOCaE7bT1
 MSVD+4T446MmYoDSkX2B1WmPKEHNkU9K5bdmlJRvGSTY0dT40U+vThvOce9wsmiVtM/Be
 VqNnQLEZdBBodjkxv9KRvDFS8UKygOexwWlg0y3Lwx3nEs/Bu2n7R3bSN9m2wfOUiplAJ
 /XNcMzbcQg3KQNbP0N6by+2+pS5bZ+bIT/+0053NDGsPqkixdcTNA8LAeNd8+Ox3R7Xod
 exriCxFIKv0o8jHYYcle7meZiD8Th+rcSA/a/hqJAO1w8KawA1TGmny1diSdIAABHng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791032003;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Ha5cVwRvVYKBKN8/A5GPIUjqg0z9/csImRJtu6vlWdQ=;
 b=IjfQzdwjoJlPOpBdopz+kgnpMehmI5fVMOcnyBDM86GwQ85IjJbTdNmkwDwBoYP4LMns
 42lRAVETUVvef+v45SXowVDaIRekf8jhr/7N1dE8/xKT/jxz68vcyJ0JbsO6t4xRjxcYl
 LXwgRbnUWTEjH7hInZJuZoW8wI8MMp577lrQe7X/JoP6QuFnjPONVvM57LZmGVai+muYn
 sdMNG/lNqIJgT6WtvaVsvqxZtdlqrO/nf3ji8kE87XG8bxpB5xYaCToqgOgAm00kgtqkW
 Vpdtq/r5E8vtU5NPY05piHWB90LjrJvGDFBI2YGUWgZyRDx7N4kelyPY5fnrVY8T4fQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Oe7I0GBw; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BCD5E41287
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:53:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D3CBB1A10E3
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:53:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A94B7604FF;
 Sat,  3 Oct 2026 12:53:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DBD0C103283EB; 
 Sat,  3 Oct 2026 14:53:17 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:53:17 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asD6tx7nLXo9pMG6@windsurf>
References: <20261003084453.545653-24-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-24-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-psycopg2: bump to
 version 2.9.13
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

On Sat, Oct 03, 2026 at 02:44:09AM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

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
