Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79691E95A8B
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 12:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A74EF60B7C;
	Tue, 30 Dec 2025 12:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_c8n4XaOPNE; Tue, 30 Dec 2025 12:38:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C4B860B6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767098295;
	bh=mOLCIuT+sgjvNeDa1xAVWgOcmTCgRwr89JexaLJAzWA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bdbKM4JX+HNYeUBaQ6j5Dtd7R+hamrVFb4bKRbda6NRR0Pa5d2IgwUX56e/3z3fLq
	 aDHa0At2fiq2qLfs7byZYQj6OCihPHepPsDoH23tzkWroNmByIRs9uplYlGXlspMXI
	 AVrLayF5OxReH/hymk4b/w9mb7XdOdJZMfyYMhFVilQgjV/FYo8soE1EbJ0DfYG7kY
	 KL02uwsW9xJsS+JOd3zg+fcUc69iwqOPyHZR1bh4zSZQlaIwPvTfB7lo624JpJr+Dx
	 kEx1FKpFwi+NfR4HQ6B1QG8NnjXnO9yVcl5VANVstYG2/zdEc4tc1lrdDMJQXbCbN1
	 HEoSJliGy9Nkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C4B860B6C;
	Tue, 30 Dec 2025 12:38:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CD0C9D8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 12:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2F8460B6C
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 12:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJ4y6t-MwZW5 for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 12:38:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D14CA60B15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D14CA60B15
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D14CA60B15
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 12:38:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id DCE311A2531
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 12:38:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AB08D6072C;
 Tue, 30 Dec 2025 12:38:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BF2DF113B0392; Tue, 30 Dec 2025 13:38:09 +0100 (CET)
Date: Tue, 30 Dec 2025 13:38:08 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20251230133808.4c56b076@windsurf>
In-Reply-To: <20251229075539.516207-2-bernd@kuhls.net>
References: <20251229075539.516207-1-bernd@kuhls.net>
 <20251229075539.516207-2-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767098290; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=fhFdSP9xTOGPXrzL274VTlI9g49IE6MHO+I2oa7dMdI=;
 b=kxYK+y0WKlfuHBq8Z0ttRSE8nbLzgOHmmiqK7KsjhXzmqkvn4TInY5a/4QfnNPxANyEt3J
 4Cd2rTW0Pgz0qH4+BSTgaj1KNapu5sce2+dPCix0uzZuqjrQGlL2q1jeW2xJ7+LExMIQbu
 jc2+9rW5d0MrqTzlNTc+1LDS6BhElP2rSLaRNE9EC7+3V0REvgNmfvAoH2NsShg/BguujO
 Um7c2UU6J5l8vG1Hcz++mtOK1Kj3XrKMKwuJmxYGRHP24lGToVafEkPbyDGdNgcD6x3V7v
 pHP1Ua8jQLvfJ2GTwR0hRyr6+Rf/oUbasMXwUqpqZky0s7aaIXwR5EDbTaKfng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=kxYK+y0W
Subject: Re: [Buildroot] [PATCH 2/2] package/utfcpp: bump version to 4.09
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

On Mon, 29 Dec 2025 08:55:39 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes: https://github.com/nemtrif/utfcpp/releases/tag/v4.09

This page does not exist. I guess upstream tagged 4.09, realized it
should have been 4.0.9, and made a 4.0.9. Could you check this out and
clarify?

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
