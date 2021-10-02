Return-Path: <SRS0=UKoJ=OW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D390CC433F5
	for <buildroot@archiver.kernel.org>; Sat,  2 Oct 2021 18:25:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4D1961B2A
	for <buildroot@archiver.kernel.org>; Sat,  2 Oct 2021 18:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4D1961B2A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75603404D9;
	Sat,  2 Oct 2021 18:25:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OJOJByWN-1lb; Sat,  2 Oct 2021 18:25:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E71C40291;
	Sat,  2 Oct 2021 18:25:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C6F971BF2BB
 for <buildroot@lists.busybox.net>; Sat,  2 Oct 2021 18:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C325B60817
 for <buildroot@lists.busybox.net>; Sat,  2 Oct 2021 18:25:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cPs5Kv1X6kRj for <buildroot@lists.busybox.net>;
 Sat,  2 Oct 2021 18:25:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73955605C2
 for <buildroot@buildroot.org>; Sat,  2 Oct 2021 18:25:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 160F5100003;
 Sat,  2 Oct 2021 18:25:34 +0000 (UTC)
Date: Sat, 2 Oct 2021 20:25:34 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20211002202534.40ca92ee@windsurf>
In-Reply-To: <6d635d7e-e88a-3b23-9682-a19ff3d08b7d@gmail.com>
References: <37a2790a-8c48-1cfd-a160-567618850bbe@gmail.com>
 <24407e05-d940-826a-690f-5bbe1aeec252@mind.be>
 <6d635d7e-e88a-3b23-9682-a19ff3d08b7d@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] csky 8xx toolchain issue
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
Cc: Guo Ren <ren_guo@c-sky.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Romain,

On Sat, 2 Oct 2021 17:58:24 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> The csky toolchain is still broken with recent host compiler and our CI will
> switch to Debian bullseye soon.
> 
> I tried to build with the latest upstream version of binutils, gcc and glibc and
> nothing build.
> 
> upstream gcc-11 doesn't support csky610 and csky860 needed for
> qemu_csky610_virt_defconfig and qemu_csky860_virt_defconfig.
> 
> qemu_csky807_virt_defconfig and qemu_csky810_virt_defconfig fail to build glibc
> with the following error:
> 
> glibc-2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/build/elf/librtld.os: in
> function `__sync_fetch_and_add_2':
> 
> build/host-gcc-initial-11.2.0/build/csky-buildroot-linux-gnuabiv2/libgcc/../../../libgcc/config/csky/linux-atomic.c:116:
> undefined reference to `__kernel_cmpxchg'
> 
> But even if the build succeeded there is no qemu binary to do a runtime test.

Considering these issues and the fact that there has been no updates in
terms of C-SKY support for a long time, I think we should consider
dropping support for the C-SKY CPU architecture.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
