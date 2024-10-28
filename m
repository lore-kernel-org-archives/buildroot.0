Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CADAD5B14E
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 20:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DA4E60707;
	Mon, 28 Oct 2024 20:48:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LcreUr0G4guC; Mon, 28 Oct 2024 20:48:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C36560722
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C36560722;
	Mon, 28 Oct 2024 20:48:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E744112A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F8E340153
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:48:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1QBEVzCrL_1p for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 20:48:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 13A4F400D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13A4F400D6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13A4F400D6
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:48:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60391C0002;
 Mon, 28 Oct 2024 20:48:18 +0000 (UTC)
Date: Mon, 28 Oct 2024 21:48:16 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241028214816.576c6144@windsurf>
In-Reply-To: <20241028203457.1221383-1-bernd@kuhls.net>
References: <20241028203457.1221383-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730148498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wSK2F6xjWL1Bp6qh4q3So3SqmkgShXqb56oieWYbRqk=;
 b=kabyk+7IEZN5mXLMFL8P5S85cj4lHkWZ/7BB+lNBq3ENSInfkrLr7MYnB2yHRAwixciT0C
 yHCW9skutzE/9JC6sQ3EFs1ZG8vuVE8hzDEJ59Azg2r4xPBGrtoogXCtPO5xTGDrulGTrx
 gQ4IeOHPChTjVLswNIusPknJoL8XjQbzcWaZrptgfSYec/TmjmwlbkINa0Z8kSvS6zc3Pz
 rUdACGxMIDdHBDY+11BUOy/qDn8KSzspbkgpWYUhw6E5Uquy9M7cbsLwTuiqhJ1UJ62riA
 GWoe6K906+GPsglyAVCGHlr37gsu5d+ocWR3rZ9mlfadV4s3IIrxGarGZuoGkw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kabyk+7I
Subject: Re: [Buildroot] [PATCH 1/1] package/ntp: Fix build
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

On Mon, 28 Oct 2024 21:34:57 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/fb4/fb4a011f14e87d348a53695868bb5f3b69496fc8/
> 
> The build errors occured immediately after bumping ntp to 4.2.8p18 with
> buildroot commit 49bd6bb638ff73eae3b486b207201382d46a6c05.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---

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
