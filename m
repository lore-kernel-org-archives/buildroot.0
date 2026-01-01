Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4F3EEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93F1B821D3;
	Thu,  1 Jan 2026 09:49:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8vfVb19mJObO; Thu,  1 Jan 2026 09:49:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4D90821D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260992;
	bh=RqHyb4B854uGDIPt/4kg7Inzl4Os9RlI9ev/bygtxrU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=d1CnN3w20gidRhn+vwmNpaEhWMdpKzqNcnrCU8Hxxk9wgoBk3qacQtGYsN5ZxUui8
	 Lsrxc+B0trSXA3lznka4QNZmuSw7GPJdpYpmXc4RJ64Q59Gn0wIZlD9kZQuo3+7Uxt
	 2tvn5LDGfQMyeqT57dFfutuBcFaYel6BjYYEyH0yF804x32Gotw5KwrN6c12AGzRYR
	 3KsNXk4fiOSmUUscDNT2DfD2+keBAM1vg/kyn6wY2fMoH2dl9DkC1CEJRl0hvUgIF8
	 gNKii7JRI4tWyXh3+UdJ63PUf9hNtyST2qaXAed2b1/F/02GdFoPrzXCmeMch6o2nU
	 4Kv7DK0nP8HqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4D90821D9;
	Thu,  1 Jan 2026 09:49:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D5F8206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B51940827
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3MX9TfCG-GHA for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:49:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7B72440833
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B72440833
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B72440833
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B12514E41ED2;
 Thu,  1 Jan 2026 09:49:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 88096606B6;
 Thu,  1 Jan 2026 09:49:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 730C6113B071F; Thu,  1 Jan 2026 10:49:47 +0100 (CET)
Date: Thu, 1 Jan 2026 10:45:34 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260101104534.2f51f10c@windsurf>
In-Reply-To: <20251231184222.3941176-1-james.hilliard1@gmail.com>
References: <20251231184222.3941176-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767260988; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=k/Hogaqd+2VUrPfprrnNi/d9V52bZAPxXG2rKCBaEdQ=;
 b=ORydTZAfVLS96lQldgfbooiDaiz/6uMFyTPNEroMz6UmJVClitBCr9Ilcl6czTh5pBto3d
 HEYZXf36PulNOTMFIHBAF923xyGpAcuxew8L/PiqNP77ZP/lpjeVsWsrzEe8k8O4l8UHSz
 WekSDFpI9/pEVuUgSUPSjxh8OI82SaV1xNrMBe5wkTSdngnpMnkxN9sWlEpyfr5Ke/LgES
 NdDtbgEVtsSRguLoOdMYjMXpeBC9BgvBmxnFxxJracxlLYZemrEa5+TD5qCXTemMudfY7L
 UiQyJMoktQ8Lyusl088oKDjY/GWl8Qck983Mc3gVfOvC4/4MfLPFCW+RdbUKnQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=ORydTZAf
Subject: Re: [Buildroot] [PATCH 1/1] package/python-types-setuptools: bump
 to version 80.9.0.20251223
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

On Wed, 31 Dec 2025 11:42:22 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-types-setuptools/python-types-setuptools.hash | 4 ++--
>  package/python-types-setuptools/python-types-setuptools.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
