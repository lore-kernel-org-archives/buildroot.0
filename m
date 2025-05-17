Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E100C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 20:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 691B340789;
	Sat, 17 May 2025 20:03:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B9UHERMIUna6; Sat, 17 May 2025 20:03:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65219407F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65219407F9;
	Sat, 17 May 2025 20:03:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BE34E4
 for <buildroot@buildroot.org>; Sat, 17 May 2025 20:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DCB160B6C
 for <buildroot@buildroot.org>; Sat, 17 May 2025 20:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id frlV0bOQ9AHr for <buildroot@buildroot.org>;
 Sat, 17 May 2025 20:03:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3D24060687
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D24060687
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D24060687
 for <buildroot@buildroot.org>; Sat, 17 May 2025 20:03:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF6B7440D5;
 Sat, 17 May 2025 20:03:23 +0000 (UTC)
Date: Sat, 17 May 2025 22:03:22 +0200
To: nvd <nvd@nist.gov>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20250517220322.4da9bdb3@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 49
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeiheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecuogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpeffhffvvefukfhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleehteelffdtgfegudeghfeuledujeefledvgfekfedtgfegtddtfeevuefhieevnecuffhomhgrihhnpehsohhurhgtvghfohhrghgvrdhnvghtpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehnvhgusehnihhsthdrghhovhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747512204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SwU9XKtxzGc8Q0rv0yGFO3nfVgTsVkQNkRlNzKBbQj4=;
 b=k3qDFQmj0X2jaiMvHiQvHuFsLVh2mZXVbDgvYkB1G4k8ZcNgzWSIs9NTe1VAmaAF1U2XLV
 o8tmZdNZXO3Lj07AceRZzSp6+0WUvWgyl78xBgly4k5AF9mkKkit4WeC/oeNGwotfJ/7eJ
 kVs0zAnM1UdOUGn/Q9jKqNDZm7TMDvlYOVXn5KIJno5e3QTqYHmoR9N2uCc8OywAaQTaGz
 DY8FfdLdxD4Oqt5CjmuU0JvKNarNxEIxdPPQL+mDmeDJJKCL+la+5XH9x8nZ9vnv3j/iVp
 dR6I08BxgvT2nEngWc0FTa2HXH8/5Ru2ZDcrNCPfoq2NtDnhqwzXl/5566av/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=k3qDFQmj
Subject: [Buildroot] Numerous issues in CVEs for the "sox" project
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

I am contacting you to report a significant number of issues related to
the annotation on CVEs reported against the "sox" project in the NVD
database.

Naming change
=============

The CPE ID used to identify the project used to be
sound_exchange_project:sound_exchange, and then got changed in the
middle to sox_project:sox. This is extremely annoying for consumers of
the NVD data as they can't match against a single CPE identifier. When
you do such renames, either the old entries should be amended to also
have a CPE configuration with the new name, or the new entries should
have a CPE configuration with the old name.

Regardless of this, the "cut" in the renaming is anyway bogus. CVEs
with the old sound_exchange_project:sound_exchange identifier:

CVE-2014-8145
CVE-2017-11332
CVE-2017-11358
CVE-2017-11359
CVE-2017-15370
CVE-2017-15371
CVE-2017-15372
CVE-2017-15642
CVE-2017-18189
CVE-2019-1010004
CVE-2019-13590
CVE-2019-8354
CVE-2019-8355
CVE-2019-8356
CVE-2019-8357
CVE-2023-34432

So it was used from 2014 to 2019... and then an outlier in 2023.

Then CVEs with the new sox_project:sox identifier:

CVE-2021-23159
CVE-2021-23172
CVE-2021-23210
CVE-2021-33844
CVE-2021-3643
CVE-2022-31650
CVE-2022-31651
CVE-2023-26590
CVE-2023-32627
CVE-2023-34318

So it started being used in 2021... but that means CVE-2023-34432 is
clearly bogus.

CPE identifiers with incorrect versions
=======================================

CVE-2021-23159
CVE-2021-23172
CVE-2021-23210
CVE-2021-33844

are reported as affecting version 14.4.2-7 but that version doesn't
exist in the upstream sox project. 14.4.2 does and most likely should
be used here. 14.4.2-7 looks like a Debian-specific version, but does
not make any sense in this context.

CVE-2023-26590
CVE-2023-32627
CVE-2023-34318

are reported as affecting version 14.4.3, but that version doesn't
exist in the upstream sox project.

See at https://sourceforge.net/projects/sox/files/sox/ the released
versions of sox.

CPE identifiers should use version ranges
=========================================

All of:

CVE-2017-11332
CVE-2017-11358
CVE-2017-11359
CVE-2017-15370
CVE-2017-15371
CVE-2017-15372
CVE-2017-15642
CVE-2019-13590
CVE-2019-8354
CVE-2019-8355
CVE-2019-8356
CVE-2019-8357
CVE-2021-23159
CVE-2021-23172
CVE-2021-23210
CVE-2021-33844
CVE-2021-3643
CVE-2022-31650
CVE-2022-31651
CVE-2023-26590
CVE-2023-32627
CVE-2023-34318

pretend that only one specific version is affected by the CVE (14.4.2,
14.4.2-7, 14.4.1, 14.4.3), while nothing indicates that just this
version is affected. Most likely earlier versions are affected as well,
and therefore the CPE identifier should rather state that all versions
up to and including 14.4.2 are affected.

Do you think you could address those different issues in the NVD
database?

Thanks a lot for your support!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
