Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A002FCD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6760D60A7F;
	Wed, 10 Apr 2024 21:47:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mFniAtypVUxp; Wed, 10 Apr 2024 21:47:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7828760EAB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7828760EAB;
	Wed, 10 Apr 2024 21:47:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 910621BF4D6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B87060EAB
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OOCwwQs2-yal for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:47:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7DEB760A7F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DEB760A7F
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DEB760A7F
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:47:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B82060002;
 Wed, 10 Apr 2024 21:47:19 +0000 (UTC)
Date: Wed, 10 Apr 2024 23:47:18 +0200
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20240410234718.47bc4e11@windsurf>
In-Reply-To: <20240327172351.411598-1-romain.naour@smile.fr>
References: <20240327172351.411598-1-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712785639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hNbcr7JuV0P4xB4BCuQDlVhIHaRLxLube9m/vflM1rI=;
 b=cZGoe1ouSenOVNRXH9KpoFkyeI+UqlFn2338pEMySGdlVQD2D6eJ8RXpgyUEQzDRXWM0xm
 BO9z+6c9XfeOrNQS6pOAvol4Ne7DWYe9ZwaVoIuC+iLh+tQ7suCOpksWCY+iATSZwnucHA
 IELtIw9W59W6mX55jHaaQRaGu+c6x+vo3/Fiby5kjjq16NlLms+qqj26+kS4VoIVots//p
 Xb92vSVO+eC05dQj3vyYH/sUgr77dYEyCrwyzoFle87UpwmN5IgktfYOtoThcvCYkctYsG
 VNZ62wqtevSimCkej/1u6bmOtESu65eh9ereCZrONAfdjL6iLfvyFCb49BI+NA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cZGoe1ou
Subject: Re: [Buildroot] [PATCH] package/python-segno: add missing
 python3-{pyexpat, zlib} dependencies
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Mar 2024 18:23:51 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> The last version bump removed python-setuptools runtime dependency
> but doing so also removed the python3-pyexpat and python3-zlib
> runtime depdencies [1] that are actually direct runtime
> dependencies.
> 
> [1] 081162580f99d1a68133f7f513bf2cd6d1b8b6b6
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/6477656982 (TestPythonPy3Segno)
> 
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  package/python-segno/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

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
