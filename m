Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5FAC87FCA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 11:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 179B060F3E;
	Sun, 10 Aug 2025 11:14:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o4AXYHHX6z0v; Sun, 10 Aug 2025 11:14:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35D1E60F3B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35D1E60F3B;
	Sun, 10 Aug 2025 11:14:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 91EBA154
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 11:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83B3F40DA5
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 11:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yhPKw2-79rMf for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 11:14:39 +0000 (UTC)
X-Greylist: delayed 1123 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 10 Aug 2025 11:14:39 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2BCD240D52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BCD240D52
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BCD240D52
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 11:14:38 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 220FA58042C
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 10:47:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66A1943173;
 Sun, 10 Aug 2025 10:47:37 +0000 (UTC)
Date: Sun, 10 Aug 2025 12:47:36 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20250810124736.00b1cc30@windsurf>
In-Reply-To: <20250809223229.2307960-1-fiona.klute@gmx.de>
References: <20250809223229.2307960-1-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdelfeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgfdtheettdeftdejudefffffleelkeehhfegffeuleeitedvheduffevfefgnecuffhomhgrihhnpeduledvrdhsohdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepfhhiohhnrgdrkhhluhhtvgesghhmgidruggvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhop
 ehjrghmvghsrdhhihhllhhirghrugdusehgmhgrihhlrdgtohhmpdhrtghpthhtohephigvghhorhhslhhishhtshesghhoohhglhgvmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1754822857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QnA+Eyf743GlFqNjoVKK4h+gFDaASv+C073tzpTZVms=;
 b=U4gCZKAcckq1dkj8f0To4seXTEptnymDb6ydHB97zJpo9y70Q3aIDcKlk7oYbRCWjQrA4D
 exGS81BvdNZS8dQ/hEeZP2UqzWfeXrOCJmKzsoZ80j55GqF+WVxfXasezVX1QoCIzoJgrx
 vgyht15l6Qp3Y6NLoE5nfnacXlpVCWojd+j+D6CvpcC6H0QYpM5EiA7XZpYpziIOTKxSFV
 OWW0n+FWmCHJ9lvhWwXnSV0ltF48xyh3uwAkL5wIroqFD2MVtcInR4e1OR9QAWfXPVF6X8
 UoNx1I/+ILNTkTfizJfEyyFKbw0RkN6FLff3JB7TnU2C4quRESR8Alj0RfVGGQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U4gCZKAc
Subject: Re: [Buildroot] [PATCH 0/7] Add package/python-memray and
 dependencies
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fiona,

On Sun, 10 Aug 2025 00:32:22 +0200
Fiona Klute <fiona.klute@gmx.de> wrote:

> This series adds the Memray memory profiler for Python [1] and its
> dependencies. I needed it to help reduce memory usage of some custom
> tools, and figure it might be useful to others for
> debugging/optimization, too.
> 
> The individual patches are fairly simple, just a bunch of new Python
> packages. Memray itself includes a binary module that needs to be
> cross-compiled.

Thanks for the patch series! Since it's mostly made if Python packages,
it would be nice to have some tests in support/testing/ for those
packages, or at least for the "top-level" Memray package.

> One thing I'm not sure about is whether there should be a separate
> option to enable building libdebuginfod in package/elfutils, instead
> of enabling it if the dependencies are met. Having an option would
> allow people who need package/json-c and package/libcurl, but don't
> build anything that links against libdebuginfod to save a few kB (in
> my arm64 build /usr/lib/libdebuginfod-0.192.so is about 38 kB), at the
> price of slightly more complexity in the config system. I'm happy to
> add the option if that's preferred.

In this particular case, I believe I would create an explicit
sub-option. Not because 38 KiB matters, but because it's rather
impossible to "guess" that json-c and libcurl are needed to get
libdebuginfod to be built.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
