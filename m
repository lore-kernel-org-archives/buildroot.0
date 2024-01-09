Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47162C47073
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 12:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC5DC61175;
	Tue,  9 Jan 2024 12:59:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC5DC61175
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2pgyvmQtyBbu; Tue,  9 Jan 2024 12:59:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D2FC613F3;
	Tue,  9 Jan 2024 12:59:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D2FC613F3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 477361BF616
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 12:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D4456144A
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 12:59:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D4456144A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gHUlo6L0aSiy for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 12:59:00 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 044CC61175
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 12:58:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 044CC61175
Received: by mail.gandi.net (Postfix) with ESMTPSA id C1950E0003;
 Tue,  9 Jan 2024 12:58:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rNBh3-007TMX-0Z;
 Tue, 09 Jan 2024 13:58:57 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20231203041841.492885-1-adam.duskett@amarulasolutions.com>
 <20231203041841.492885-4-adam.duskett@amarulasolutions.com>
 <20231224120936.43969775@windsurf>
Date: Tue, 09 Jan 2024 13:58:57 +0100
In-Reply-To: <20231224120936.43969775@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sun, 24 Dec 2023 12:09:36 +0100")
Message-ID: <87sf36acj2.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 4/6]
 support/testing/tests/package/test_google_breakpad.py: new runtime test
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Pascal Huerst <pascal.huerst@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

Hi,

 > As we discussed, I am just not sure what would be the right mechanism
 > to exchange data between the target system running in Qemu, and the
 > host running the test suite. Our default Busybox configuration doesn't
 > enable httpd or ftpd. One option would be dropbear of course. This
 > would in all cases require networking between host and target.

 > Julien: do you have some suggestions here?

One option is the FAT support in QEMU, which exposes a host directory as
a FAT formatted disk to the VM:

https://en.wikibooks.org/wiki/QEMU/Devices/Storage

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
