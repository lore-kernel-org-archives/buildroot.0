Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4C6D5B16C
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15BB7407EE;
	Sun, 14 Dec 2025 17:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LR_7p6G5qRlk; Sun, 14 Dec 2025 17:07:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEC8840871
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765732029;
	bh=3XXAkkf2K8Rky+o6CWNjLquvx/+liOf5HZMF21w3KZ4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=S4MuL8AK3Tt6EwoMm7tKjKnlkbrKiG/iR5NKalnd4lR6p8ktGoWXPluwzg85WiNIf
	 aEqWZQseGtiX1q1sWzfynlv5Z7y9whch6N8R58fF18/j5pbiK5dhQZRD7sgboMFhut
	 LHrwiBPKhR37CLW/ZGlzd3/LosR3o+fIZPyGXYUEh9IJOuoxOO6ZP3j40TxXGBjLDt
	 mdhEMVBU3e9AWuWjEBiH7r+ttWDodCtFowcGyY2MfVw5f0EhWWsa4txpFXcXsGNcnz
	 QfQ69MLK8P5khETz9PwJODnZGw5WSyHcorPUcVHVA1onlprUf2vJ0w8V+/QrYhNSxi
	 mlScWFbhAnS4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEC8840871;
	Sun, 14 Dec 2025 17:07:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B5962C1
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 825E340871
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:07:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t5tx7LMWWSPO for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:07:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3E2EB407EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E2EB407EE
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E2EB407EE
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:07:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id AE14BC1018A;
 Sun, 14 Dec 2025 17:06:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E791260713;
 Sun, 14 Dec 2025 17:07:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 355A711940D98; Sun, 14 Dec 2025 18:07:00 +0100 (CET)
Date: Sun, 14 Dec 2025 18:06:59 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Jarkko Sakkinen <jarkko@kernel.org>
Message-ID: <20251214180659.666b3d0a@windsurf>
In-Reply-To: <20251208174427.3459324-1-bernd@kuhls.net>
References: <20251208174427.3459324-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765732020; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=05a9mgIm9cQrtbU0dKlYXIh+7Z89fY/qNjc3AL5wrVw=;
 b=xpMzBnlArcz+ftWhneoTwD+aHOY9gdlRvVZ53c2G54AWeDf5EkWfFJ51xhNmdFPW0xzEbK
 4xvxdthasPhwvAna8NhZIw8Cad8C8fOd4TSauWLyPUgkKRjkP6fL39TpUaIIftZaJ0S9HY
 pKwBo7HtgY8QFU3ic9H2f9FQfcx+7YDD+XvrrSOmaDq2pyVrDT/DSI06qX1eiYbYzXMsBy
 4eFqgxWU3uaG9l6ApvovE52sCeFEgH3ViudThPkmtQVIt0FMe+FuX7d02bIx5/1JKDDrwz
 jC7R7eABt+yo7DyqPFvl2zGEpG6rnJYs6XO/JM9NlWqlTbNL7fvrVJaaD5DbMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=xpMzBnlA
Subject: Re: [Buildroot] [PATCH 1/1] package/swtpm: needs gmp
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

On Mon,  8 Dec 2025 18:44:27 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Buildroot commit 2b449935c2e8e19a03a8962f49493a76ccca11f9 bumped swtpm
> from version 0.8.2 to 0.10.1.
> 
> Upstream added gmp as dependency in version 0.9.0:
> https://github.com/stefanberger/swtpm/commit/605e0ce8800201fca2a9a37dea5e99be7bdb2233
> 
> This causes build errors which are fixed by adding host-gmp as
> dependency.
> 
> Fixes:
> https://autobuild.buildroot.net/results/d14/d14b2953e04b488b2f357386870d557d50190d34/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks for this *good* commit log, which has all the information
needed! If you could make sure all your commit logs fixing build issues
have the same level of information, it would be A-M-A-Z-I-N-G.

Jarkko: since you maintain this package, it would be good to report
upstream the issue that <gmp.h> is being included without a proper
check for gmp's availability in configure.ac. This should be fixed
upstream.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
