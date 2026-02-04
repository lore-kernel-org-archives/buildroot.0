Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6827E9D3E7
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 14:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F7C3608C2;
	Wed,  4 Feb 2026 14:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ux9OJsNFUJ8I; Wed,  4 Feb 2026 14:37:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8711260A55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770215859;
	bh=x7unV/6udeCJlnblAOqX4hXTrEJXfjgKgBfWGndB3GQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CupH3EaTc4gbJNDwGfWVW6voTakI2yv0AveAo24/X6rfWblvg7nsuXYXW5GXz1W1w
	 pS8/K8NvilYI6iJ4MxwB3Is8AUCCCKdFaARUxRLayPsgaBCe/1rhlry2OcN87Rb1hp
	 vyJuuO4BbGdqrWjcAAfuMeLsRk0AgH+ceqAFL7ZrP1DbA8A2rVIz5FQgItnziIIw3x
	 1FGBhPPd1zBKbsx3UqjGjQWWI6S3RwOsDI1Sdg7r+nRQWeHT8+vxxF20BlrtAM3HxN
	 uGAXbN7h9yWo+YGZKeKOCQDiPxHCyghog5vVLaWQCniaE0GASOIXzfFWkvtWg0ia45
	 TGD6lBdBZfIGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8711260A55;
	Wed,  4 Feb 2026 14:37:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB6E1173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D0D940C6B
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3NoRlzpLxs3j for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 14:37:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7A40740C2F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A40740C2F
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A40740C2F
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:37:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 48DBC4E423F8
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:37:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0F22560745;
 Wed,  4 Feb 2026 14:37:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DAA43119A865B; Wed,  4 Feb 2026 15:37:31 +0100 (CET)
Date: Wed, 4 Feb 2026 15:37:30 +0100
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Thomas Devoogdt <thomas.devoogdt@barco.com>, 
 Bart Van Severen <bart.vanseveren@barco.com>
Message-ID: <aYNZg6CAPPKIQYZW@windsurf>
References: <20240920062014.132862-1-thomas@devoogdt.com>
 <20240920062014.132862-2-thomas@devoogdt.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240920062014.132862-2-thomas@devoogdt.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770215852; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=Wh2R/fZaKuNZglUMLNNaCDm7L2Cu4v8z6pX42MdwQZc=;
 b=b/3Q7WPGxSpruuhTfIKdSNUcvV5EEzPDTifDUHR6ucxhEJyxkv11KMTAfmJ5FXSESZrNIV
 ClliR613QVesY/q34w7WZuZNvMWHGjFqKLzIQK+qxC+E7J5uCeHPvzpBYeMMXNSX3TzB3V
 LFYmwJBtPheITY7Gd9Za/D0+ThamCNUaMEvFpYSpBJCd/aKH0Qlfk7dHe1HgJUMJfg/iBD
 K5wxwWU+JPNxef3x01v++g9yUKmIpI0u1IWUnn/hyOkJ3J//MsJJi0G0S182yKVGVqlvjr
 hymAqFoZHxpLuhmc7/loo5roiGlWTFN0hXkXlf8W53H+sFH1DQCGdMbmmVXo2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=b/3Q7WPG
Subject: Re: [Buildroot] [PATCH v1 2/2] package/libwebsockets: fix
 LWS_MAX_SMP when BR2_TOOLCHAIN_HAS_THREADS is set
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

Hello Thomas,

On Fri, Sep 20, 2024 at 08:20:14AM +0200, Thomas Devoogdt wrote:
> From: Bart Van Severen <bart.vanseveren@barco.com>
> 
> "If LWS_MAX_SMP=1, then there is no code related to pthreads compiled
>  in the library. If unset, LWS_MAX_SMP defaults to 32 and a small
>  amount of pthread mutex code is built into the library."
> 
> This is a misconception, when unset, LWS_MAX_SMP is actually set to 1,
> so mutexes aren't built in.
> 
> To fix, set it to 32 explicitly when threads are enabled.
> 
> https://libwebsockets.org/lws-api-doc-master/html/md_READMEs_README_8coding.html
> 
> Signed-off-by: Bart Van Severen <bart.vanseveren@barco.com>
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Thanks for the patch and additional details. I have improved a bit the
commit log with some of the details provided as part of the
discussion, and finally applied your patch... after 1.5 years.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
