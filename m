Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240A1D74958
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 12:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCEC360603;
	Thu, 31 Oct 2024 12:53:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Mw96K3o2e9B; Thu, 31 Oct 2024 12:53:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7B9260625
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7B9260625;
	Thu, 31 Oct 2024 12:53:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 40E285E50
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D8DC60603
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:53:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gMg9RXRMrOLp for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 12:53:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 24AA860625
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24AA860625
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 24AA860625
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:53:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD05BC0006;
 Thu, 31 Oct 2024 12:53:38 +0000 (UTC)
Date: Thu, 31 Oct 2024 13:53:37 +0100
To: Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>, James Hilliard
 <james.hilliard1@gmail.com>
Message-ID: <20241031135337.0303f7ae@windsurf>
In-Reply-To: <20241030221140.2520388-1-romain.naour@smile.fr>
References: <20241030221140.2520388-1-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730379219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Exh3vsCB4thbPqjDGmSFbpHDD+K5cpdVIvZr9nGnV7U=;
 b=l9ndogMH/BtWP+9fvkxwy3lYw0kLLQprEwbYT+eNp4zEZBcp2doi7mEfcfjbeoLhZYDaPi
 fI+bmbuDakFH26Q/ALo9+9W8A3iLUTbSxAJsfy9on21OyHmqzYdWAUQBTi+2HWCf4MBbzZ
 3MZxC8Cn6lPbhWEn36KW8JaUCRN34mEp1UlOJ/ZTK15u1/coKFg2Alla3PMrYlG9uor6G4
 X5bygHYiFyw1LfPnUGBYMJjo0Nwh8hDJupKl5gTE5l62f59zwKlk6yhCfZn5JgBuZRu4MU
 uP8HC4IMgr0M7jnX08MISlkztNDASEYVbiSKvs8TpNRZuig1Wi9kRx1yD7XNHA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l9ndogMH
Subject: Re: [Buildroot] [PATCH] package/python-twisted: add missing
 python3-zlib dependency
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

On Wed, 30 Oct 2024 23:11:40 +0100
Romain Naour via buildroot <buildroot@buildroot.org> wrote:

> TestPythonTwisted doesn't try to import all python-twisted modules and
> doesn't detect that zlib module is imported at least by
> twisted/web/client.py and twisted/conch.

This commit log really isn't clear, especially when looking at the
patch below.

Indeed, there is already a failure *today* without any change to the
test case, and the failure is that zlib is missing in the dependency.

But in addition to adding the zlib dependency, you *also* extend the
test script by important some more modules, as if this was needed to
test the zlib dependency.

So it's not really clear to me what you're trying to say here. Could
you clarify?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
