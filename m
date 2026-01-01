Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEABEEEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CA2782107;
	Thu,  1 Jan 2026 09:49:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bAlyYz5E3vj5; Thu,  1 Jan 2026 09:49:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C583781FFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260945;
	bh=l9ObmunPgEm2igjYDjy0H1bXE/Ob5pXX/bg8S0+Tdq4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=G4VZXu0iIYpn4KDK+DAPHIPFNg94um+U+8hKQ/EuEH9sbysRe2GAfGtGHsdPSH/2z
	 BDLZeBXHSiIn0D7AvB+L3IhlNVG0L1WYlLaurOLTFNfzwSfc/Y27dvmdPcu+WpLEbB
	 tNCuVEuQ8ppHyrDcq3gcIFlBAm1nHMRUUlaxpZjjkQ3OqG98rXOOSXxEfHPcYfBVKj
	 83mL9+J9lUtB0NCs3gzlNH9UPI6HK+9e9KPj9NJB3KVdi78nBA/+gF45UIOBBY95Qz
	 AyB0a7K4wiVX0VQpxi7gZ0LFL2L6mxvByOk3dDtimOLdnWMylvZq3+tIlrrUSxHlJe
	 j2hn3cMmDTNKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C583781FFC;
	Thu,  1 Jan 2026 09:49:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 812AF206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68AEE400A5
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xSrg_w9zG14a for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:49:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 693D540168
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 693D540168
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 693D540168
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C8D181A258F
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9889C606B6;
 Thu,  1 Jan 2026 09:49:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B9C5A113B072B; Thu,  1 Jan 2026 10:49:00 +0100 (CET)
Date: Thu, 1 Jan 2026 10:45:43 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Colin Foster <colin.foster@in-advantage.com>
Message-ID: <20260101104543.5e2356f6@windsurf>
In-Reply-To: <20251231184824.3951137-1-james.hilliard1@gmail.com>
References: <20251231184824.3951137-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767260941; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=zq96gm5EDK7hSaLgFuFI38TVcAcc0CY8ck7RfiwWFzE=;
 b=z0SeKe6nK2xPR6eDyjUOX/ENVzDEw1SKqlkiD/1iARGQqB6ArTudYWo9TpOl4mBSzukVPI
 ehU+vLfeXgCD0s3b6rjvMSPf02xRNql8UD2wBEukBMnWLwNxE9at3orEDzjmGOHkWHUHTK
 B4HlE28TzJHVy2HO6trGFzhuTP07jvUFZb7RkpFXmR434QwiDbQfwKy1ynv+NZeNn/8vzs
 cA54jWe/SbXsHMR8NqZS28TAjyXdZaYS6WCldru+4KajPG2HczBL453QunVM4piOzDhB8c
 KhcgY/XVLfD1Ei5FJwfahxDmhShBZetno2IqtarklY+wEWVCTTfyr1qoCFWEpw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=z0SeKe6n
Subject: Re: [Buildroot] [PATCH 1/1] package/python-tftpy: bump to version
 0.8.6
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

On Wed, 31 Dec 2025 11:48:24 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-tftpy/python-tftpy.hash | 5 ++++-
>  package/python-tftpy/python-tftpy.mk   | 5 +++--
>  2 files changed, 7 insertions(+), 3 deletions(-)

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
