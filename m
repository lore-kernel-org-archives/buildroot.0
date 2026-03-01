Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D118FFD004A
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 10:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 563F540D42;
	Sun,  1 Mar 2026 10:10:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZJtmPRi0QOvu; Sun,  1 Mar 2026 10:10:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78FF241550
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772359823;
	bh=2fjOKCiiGYcbjdZ5SmFYaeFQg2G8FEj/gQcy7Hk2LvM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FM4O4bOm/PLYI24bkK51GTLR0GPciFem+cov88qs0NP4TD5EBkj3KcuqPmVu0XzKT
	 seqdO217m6Gjs10iL3xoREvIFQEnOfpJ/ul2sGA+gcMKX/SiKyptGgIR+FDnnq/ek7
	 y9e7E9N2ba/kbXsAirkcIMP/KB5juide+hbgVPv4YCpauyuYzhK+5bk0ftmwgfF7st
	 x1+kGTtsmyzQJlibsgbMz6SeEvFesUfJXTecsBGx+3VxWNrrqjg+nkY65olYxdAjA+
	 +iU7EErSqM3VqJDgp6obTAagBTUIN/rY4l/OtT4Q4WwPRTAtM1/ZZgnuUv1L81Uqpa
	 KN1MI8Iy/9How==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78FF241550;
	Sun,  1 Mar 2026 10:10:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EAA19231
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 10:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC25441550
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 10:10:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SjanCktXY2k7 for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 10:10:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 25F0B40D42
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25F0B40D42
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25F0B40D42
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 10:10:19 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -541472821; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 01 Mar 2026 10:10:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vwdkb-0000000AVLM-3DnR;
 Sun, 01 Mar 2026 11:10:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org,  Ricardo Martincoski
 <ricardo.martincoski@datacom.com.br>,  Julien Olivain <ju.o@free.fr>,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>,
 guenther.harrasser@mobileye.com
In-Reply-To: <d5069f4c-565b-4111-8f11-67f31281f3f4@gmx.de> (Fiona Klute's
 message of "Sat, 28 Feb 2026 23:30:45 +0100")
References: <20260227192112.3792145-1-fiona.klute@gmx.de>
 <871pi4prz5.fsf@dell.be.48ers.dk>
 <4de55993-a547-418b-83a5-b5e5549480fd@gmx.de>
 <87wlzwo6gc.fsf@dell.be.48ers.dk>
 <d5069f4c-565b-4111-8f11-67f31281f3f4@gmx.de>
Date: Sun, 01 Mar 2026 11:10:13 +0100
Message-ID: <87pl5noo6y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=rq+8gXEodu6WIQXgOXOk+DNN8QCToK6xEZlDbUSCDyVdG5YP5Wrwkfvz4GBGwfa/KsW8upLEcveYZPXBZT4KUgpNsbO5L9jgygKwgfAiViBrOr0mNKyw3TyBQq9WFJfFoKJvfcGqXJm/y+NZWd17EwaZhXihLQeArVrGzyyDOoxlXFr2p3upZRcHOazK8+3hbZtnuG3jQeSfZFE52MlQkCMLP0KwiLMdi6l9sVHMenUTjRquRr7IRkwuRW+YHYZc7izR1VFZ9pG79yfo/xvjhLRkjkbpfwPiOMVBymuwynTbxykuSVXYgsPc8EHKjkQAP3ALOcqTrREs9a1KsZhszA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=NkiiwzgI9iNwJTuSh2KaDEtaLrE6jcSs1A68r/o0iXM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=rq+8gXEo
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: transfer config in
 environment instead of class variables
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

>>>>> "Fiona" == Fiona Klute <fiona.klute@gmx.de> writes:

Hi,

 >> What we could also do is to only add the workaround for python >=
 >> 3.14.x
 >> (which is not yet in Debian), E.G.
 >> if sys.version_info >= (3,14):
 >> multiprocessing.set_start_method('fork')
 
 > That would fix the immediate issue, yes. If Debian updates to 3.14
 > before Nose is fixed we'll be back where we started, and I think it'd
 > be good not to rely on a specific start method in general. But I
 > suppose the version check would be a reasonable compromise for the
 > stable branches. :-)

Indeed. I started by reporting the issue to Debian so the package
(hopefully) does not transition to stable:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1129350

Another hacky workaround would be to monkey patch set_start_method() to
ignore the call from nose2, E.G.:

if multiprocessing.get_start_method() != 'fork':
   multiprocessing.set_start_method('fork')
   multiprocessing.set_start_method = = lambda *args: None

Which may be better than the python version check.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
