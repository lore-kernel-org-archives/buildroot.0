Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66DFC2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 09:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6920A409CB;
	Tue,  9 Jul 2024 09:37:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U04RziViS9i8; Tue,  9 Jul 2024 09:37:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33697409D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33697409D5;
	Tue,  9 Jul 2024 09:37:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73A251BF29A
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 09:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60DDE8145A
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 09:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id blpbEvQBxyVV for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 09:37:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 27AB781459
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27AB781459
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 27AB781459
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 09:37:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F40E9C0005;
 Tue,  9 Jul 2024 09:37:05 +0000 (UTC)
Date: Tue, 9 Jul 2024 11:37:04 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20240709113704.65a5c956@windsurf>
In-Reply-To: <40102a9d-6674-4a11-bf18-a4ea41164095@gmx.de>
References: <20240705094449.8550-1-fiona.klute@gmx.de>
 <20240705094449.8550-2-fiona.klute@gmx.de>
 <20240708231151.2606b9ff@windsurf>
 <40102a9d-6674-4a11-bf18-a4ea41164095@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720517826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sfrSEsX4P2S9/THZculsQUSVo4ad3Mr1zF6mHkUdw5w=;
 b=bkYXw0k4oI+q7X+qD0H1vIbjtCmwIkC0T1R9YkJqFDtUEg1AQOemx5jag9qS2TR8K/izc2
 EdFczwRJ50mfEeVQEp4OeQAW9yBC8XnNthW0CT3+XwNzPJvfkNu0sCC4XD9pkke/2Ze3Rk
 oNG5c9qTL9/BTsJFaBsQJxqcY59dizMHMwcMC9E4C4eamYZp82QBi9jYaC7II20I8SeXh+
 B1aX3KXel0YCtFqvHTC7LKlaTkhHJ4DtFtRGgBdArPc3MBoxMoCHe6qpvcatrd32tNs2lD
 cI2ZyLOPiXofT/L/K1q41tXZnNHa+IMTC0vfsL31GIwKOP8WU61dWMbyAPonIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bkYXw0k4
Subject: Re: [Buildroot] [PATCH 1/2] docs/manual: describe relying on
 default options
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
Cc: Fiona Klute via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 9 Jul 2024 10:38:13 +0200
Fiona Klute <fiona.klute@gmx.de> wrote:

> > I understand the wish to document this, but I'm not sure an
> > "Integration principles" is the right place. Shouldn't we document that
> > in a section where we document the expectations in terms of init
> > scripts instead?  
> 
> Arnout explicitly requested I put it there in this mail:
> https://lore.kernel.org/buildroot/6d02d2d5-e71e-45b3-a447-e81521085e7a@mind.be/

Ah crap :-)

> I'm happy to respin and put it elsewhere, but I'd like to avoid a back
> and forth between two maintainers telling me different things, so I'd
> appreciate if you could find an agreement before I do.

You're absolutely right obviously.

I don't have a strong opinion, but I think
section https://buildroot.org/downloads/manual/manual.html#adding-packages-start-script
makes more sense, as it's actually close to where it matters. Arnout?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
