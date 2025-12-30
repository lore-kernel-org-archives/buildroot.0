Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0A5E95A77
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 11:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8F0B40478;
	Tue, 30 Dec 2025 11:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uFWzi1B55Ju4; Tue, 30 Dec 2025 11:01:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C53C240432
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767092475;
	bh=fRin1wyaYmKwpkYPoY0VuPEi3sufrMTmsZhRNbiv080=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g1iGPM642/eua39tY4OzZBer/vdfX1i+3nuRMS4qLqnQqnvG7OTYnjc6D+Vh1tLlO
	 tA8L5jvl4dv/L7iz4NrEmKXR57xdXBA/TiPwgHABTRX16CUBfgLl050JSKqpmD62xk
	 GcauOKwGwZaqF20A0PTNryv7gzjvhHCzv2VuAAKon5N/sQjP6ftXvb+m3GBDBlwy5C
	 hWLUR8/4utO3APA2WCYoVPXYRg/CVY1+sARnof2C4p2ix74/xtyGTG98dQ3MHAHHy/
	 6BsqzTxpCSGIVE/U85W7F3/75TMWLQbfxHGEVD3JRkowHD9dvqp2WRkTGDjBhb+Iqy
	 xYFbtGFkh+/Hw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C53C240432;
	Tue, 30 Dec 2025 11:01:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 68F4735B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6660840273
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 76NzBX-BZVjk for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 11:01:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8E0694026B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E0694026B
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E0694026B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:01:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 88E79C1D72E;
 Tue, 30 Dec 2025 11:00:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1E77B6072C;
 Tue, 30 Dec 2025 11:01:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D2495113B0643; Tue, 30 Dec 2025 12:01:09 +0100 (CET)
Date: Tue, 30 Dec 2025 12:01:08 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20251230120108.3c166a6a@windsurf>
In-Reply-To: <20251229185919.4176115-1-bernd@kuhls.net>
References: <20251229185919.4176115-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767092470; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=5nBuDe9S+rR8ndmUrLClTiFDRXVoKT+DicfCvLPkI9U=;
 b=mnr9TWhL/+ntQUVdZZXV+Hc2fD/T0uMGzWZygzpPR9qO2GA+1dcMkwsWMo4vcAa72KnYP1
 eMihsjCnST/XeTRFNS9Oteolr37M1lMYj07i02ssWdW5+1ojry8UeGQwouiem1pVQ/HKyb
 /BJF4gn0lRxze9iHe8iPfO2l9J+80TIHM0vA7AWq2uUIlruAwfGFLfHeSALKR+F1sVGkty
 D59KLH0cPjyPHmSrePCytdZJrJDcWRfEIeZUxwc3s7YBYJQmCO4uomyKRwfYIYtf6EoaK9
 2DSIDXBhI3vdzIEVIid3DQHWZtiHzh9UKAFKoMXT+If/+KwEMunI3wJQW6crUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=mnr9TWhL
Subject: Re: [Buildroot] [PATCH 1/1] package/libupnp: disable blocking-tcp
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

On Mon, 29 Dec 2025 19:59:19 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Suggested by Gerbera:
> https://github.com/gerbera/gerbera/commit/fcf31472239705e7d28af81cbe326f8f416f7f7d
> 
> CMake Warning at CMakeLists.txt:583 (message):
>   !! It is strongly recommended to build libupnp with --disable-blocking-tcp-connections !!
>   Without this option non-responsive control points can cause libupnp to hang.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libupnp/libupnp.mk | 1 +
>  1 file changed, 1 insertion(+)

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
