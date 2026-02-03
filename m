Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285A1E8783A
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 14:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6AF581518;
	Tue,  3 Feb 2026 14:27:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iXXLhGeIELYU; Tue,  3 Feb 2026 14:27:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16552822F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770128833;
	bh=u7owNHIeD9apTMlsQ1PajiW7/nYAistroiU0OuOVWqY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XnHgyC/T8SFEcGWoVcw+mqGWMWEWJJIHygNF7Q9ka94jVARUpaBHXtH15V697NmQu
	 PQQfZlwZ65qWG4JcXEzh5/9QXYR22tcCUlzexl7ES01ut7QowQxBxC2GLqnjofZuJh
	 IRtyBKZX+S1Ejr7gxMHBKBbM8bRFgfylllb/YB+fv/QxfYop2083diTs5Jw3uzPJ5h
	 Pv2FdbavG4FQK2SsxX/uw2YYOj2zwhlicbSFvocjVV0au6a+/at7t4/2YZkDDErXrx
	 HWKt2r05w5e3MpGlJfr0iWmAkDracjwkdDRAuqRSRPCrqublWsppVFqQTFGGxZi1lx
	 6o/G6RdP2POoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16552822F0;
	Tue,  3 Feb 2026 14:27:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E54DF5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 506F1605AD
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:27:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2THLrygVFnad for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 14:27:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 791A66059F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 791A66059F
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 791A66059F
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:27:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D119D4E423C0;
 Tue,  3 Feb 2026 14:27:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A568560728;
 Tue,  3 Feb 2026 14:27:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CD6D2119A8888; Tue,  3 Feb 2026 15:27:05 +0100 (CET)
Date: Tue, 3 Feb 2026 15:27:04 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Petr Vorel <petr.vorel@gmail.com>, linux-amarula@amarulasolutions.com
Message-ID: <aYIE-EM8yyQTdSS8@windsurf>
References: <20251226174623.2006300-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251226174623.2006300-1-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770128827; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=0g3Jgq0lWf+HebaZ69/jJU+1KxAx5m6Ltlc0QZNgtro=;
 b=rXvE5oyv9CZreTMFFwRA6sf9C13wftbrQRFveaxyZbvLSE1sYhbIIhg/i7RSpozosGWfMV
 8EMK4wdU/tD74rXUxDrc8ynFnBckzCiDrGJzguSMfX8seZzWgr1IiHpygtRD1qCyWT6gyT
 frgu49/wpJ640e5XN5mby+I2JLhBEvsE6kFKSBO6qATRFGjCd24K7bSh7i16CdXsD9DL3T
 vDR7Rg3ejQ6zWFu1toBpX4g+c6LaS8Qd0ptwfK4FZTNTpLWpRgqHPQ9z8ide04qu0WHGmO
 NSqORt1n8hatXBWrXRZMwXLMG9ouw6MRnJ9GwUiT/y3E+9d+8o5smWzLrYheDA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=rXvE5oyv
Subject: Re: [Buildroot] [PATCH 1/1] package/libtirpc: add option for RPC
 Database support
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

Hello,

On Fri, Dec 26, 2025 at 06:46:23PM +0100, Dario Binacchi wrote:
> Commit 7cea8ad66aec ("Add conditional version script support") broke
> backward compatibility for the RPC database interfaces, and indeed the
> build of xinetd fails with the following errors:

Thanks for your patch. Turns out we did merge another patch series for
this issue, so I'll mark your patch as Not Applicable. Sorry for
missing your patch in the first place.

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
