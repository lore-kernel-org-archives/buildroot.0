Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59E4CC6B08
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 14:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C6FB605B7;
	Tue, 13 Oct 2026 14:17:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aP8hFnDReJyj; Tue, 13 Oct 2026 14:17:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DB29E605CB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791901053;
	b=R512L/8zpo5ls9aZLFqGya7abAIP4Om35u0AieYsNatJrtWnuJZmrxq8D/2a28FowNlM
	 JHlxVHwKqdS5Tr7V3Owt1CQu0SnEe1rwv/rmGGopj/YqPi6MaHrc8jFZ6Tyi7uCVDbWeL
	 bK7u+G1eoNggOQUyNyNTgnbEIZFQOr5gcMkXCQlyEF97rrJOmRBFi2W4mx9jgMQFPvZJk
	 X8ahloU0x1Cj6HRINRf9aQGr4MeReVolWTjkr0yHLPyeCH76IQOmF4KJDrA7TLUZFDbaF
	 GvZLjrmG5Nc8xmIQ6wkt/5T04NiKSMUJFbLGYKc24BR2mwHESn2NahIvnZBcyj95FRQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791901053;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QpYS2E71JDnWq29MdR0rulcS3hSjCRJyOdyBi3vTMr8=;
	b=TonYkBRd2X1vO67ceMlxW1QSqKpKUWrIJ3DRO8pK6USpeJZ+q1XR5PRd4i5tCvvOutpt
	 VleTz7PpLRu6lkRVguNTx59P1UqQWZKX54ZN1nomilchs4w+FReKb1LLNJhyMi1f22c6t
	 aCu2nqA9R5OHd5fHKQeRpjZBTetlKVEQGeIZtBCawmMNpHSITRFQsfCbdgEwz2ofvhAjh
	 SMJbaKxEqfsoboYVuDgVVFQyBBT32esHUcPsSC3CSjxa2IMUQ9Ga15yuy6qIeurwLo1Ja
	 kijKkrlCgeQCXlYIwPzjHXrzYFhsjqC9C9qJNA3rKGRt/cQJwlghvxPukkmN7Q9it1Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791901052;
	bh=QpYS2E71JDnWq29MdR0rulcS3hSjCRJyOdyBi3vTMr8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=icLo4eOAP5rUqVJpfFkPrrhqU1PZ/SVqYuIP2vRV26Wy4bUF5VFlidNcm6qTAZ5sK
	 vYOpHXP6SobxCmHG0Y4U55acFk9ykGFHk+raI8b0dIOAOWNJfHsAtbeAptXGNCfte8
	 twGIHNxAVvahnPHm/n0vwUew0WCmSqnmBqHAS3q5N5gEHx01vwHcq3+otYAvNxnA/M
	 7TJot80gSxfe4hydmcnpoaOJN+Uce5PRpz0c0RbTeV+P1KfNi/zKF+pbXMn8wjA8Hc
	 cAdohO4z4BnCWR66xw8oDaOumw3f07+++3+/fj3DjHY3NhmH1meoa32eoDLIicR4nS
	 9cxRDhEfXRZWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB29E605CB;
	Tue, 13 Oct 2026 14:17:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A241788
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 14:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 704678079E
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 14:17:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fb0kEE93Nkqk for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 14:17:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EEFE380760
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791901050;
 b=jyJkHjmqZ6ON+ly7tFi1GPHKpOGunkP/8gGfCyAOzhqKwff+ypuFIBZ3dGI7YYhFzUPw
 rC6cXZa2SF82Gxt5jWFaVC//Ws/3Mh/VUdBZ86gB79kEdIblCaG0DoH3tV5VLGm+LW1KB
 qqe0wV079B0zMVZdItcf/8SXAIevLOPoZC5/AeJTexxxXrMq4NkqjHzVSllS28uX0GPC0
 3L+6uQRFRIGzLA+7/vM2zykAyZ4AQ6LX8HJkgKuy5u1FJRbXbjgKTcPTlaQQ4ezsf3gUC
 Kc6AzrZr2Eujkrr2rD9rTr3U4e9kdnCgIy6eYC/9PCKjB7xEssTttL3huMqqiO0/1AQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791901050;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=zz8DIXJncGUuSoVj8D9S56SDDYiSbHdPdQq3ovCw1h8=;
 b=fLnpQHzSiPfCdfghudI3aSfyi5CV2iEKSiOF3pln4REcqMS1F7GMKVutVSi2fdAmh3IO
 Q+bZkZmaQ3/LVTWRYFIW2zq8zrBKuiLA8ORQCLnZMi7BOx2zxgWfvE3twbizHkpt9ozzY
 VlWYRZlQ33jTe51mLbsbXThaxpKsNOfI/Szeipu4HkAaWXi1jRKRTgtzquMUjxVWIR719
 UTIY2jE1OVErAYrX/sTCOMnVp73YjdNxRo36KK48ewNAFf3GWkc7sZAsjh65PaQNgsOAf
 z606jotu1pTU7HLEP37gas7AR9UKcPCUE9g71L/+HosDuv7zjCEIrmk/Y3lQKfxQwDA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=qpRPuKnQ; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EEFE380760
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 14:17:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 5E21D1A1207
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 14:17:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 259B260362;
 Tue, 13 Oct 2026 14:17:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B423011D71027; 
 Tue, 13 Oct 2026 16:17:24 +0200 (CEST)
Date: Tue, 13 Oct 2026 16:17:23 +0200
To: Baruch Siach <baruch@tkos.co.il>
Cc: Thomas Petazzoni via buildroot <buildroot@buildroot.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Message-ID: <as49WDTmMGZAxybw@windsurf>
References: <20261003210833.735937-9-james.hilliard1@gmail.com>
 <asJ4XGMDm4jGCL4k@windsurf> <875wzh5tue.fsf@tarshish>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875wzh5tue.fsf@tarshish>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-librt: bump to version
 0.16.0
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

On Sun, Oct 04, 2026 at 07:11:21PM +0300, Baruch Siach wrote:

> On Sun, Oct 04 2026, Thomas Petazzoni via buildroot wrote:
> > On Sat, Oct 03, 2026 at 03:07:59PM -0600, James Hilliard wrote:
> >> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >
> > Applied to master, thanks!
> 
> Not in master as of commit b12c9294ff536 ("package/python-urwid: bump to
> version 4.2.4").

Indeed, sorry, I got interrupt, and pushed much later than sending the
"applied to master" e-mail. But it is now in master as expected.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
