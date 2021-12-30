Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94772C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 20:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 322C5827E0;
	Thu, 30 Dec 2021 20:15:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RgCgejHDDaC5; Thu, 30 Dec 2021 20:15:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DE67827C6;
	Thu, 30 Dec 2021 20:15:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3FBD71BF361
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24E13827C5
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:15:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u8z-fCTLyyKN for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 20:15:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26851827C6
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 20:15:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id CB64D20004;
 Thu, 30 Dec 2021 20:14:59 +0000 (UTC)
Date: Thu, 30 Dec 2021 21:14:58 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Message-ID: <20211230211458.4449d869@windsurf>
In-Reply-To: <20211021115915.32447-1-abrodkin@synopsys.com>
References: <20211021115915.32447-1-abrodkin@synopsys.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH,
 RE-SEND] openjdk: Add ARC HS3x/4x support via "Zero Assembly
 Project"
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
Cc: "Yann E .
 MORIN" <yann.morin.1998@free.fr>, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alexey,

On Thu, 21 Oct 2021 04:59:15 -0700
Alexey Brodkin via buildroot <buildroot@buildroot.org> wrote:

> This allows building and running a full-scale JVM in purely
> interpretive mode on ARCv2 processors.
> 
> Once JIT'ed version is available for ARC we'll obviously switch
> to it to gain a faster execution.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Adam Duskett <aduskett@gmail.com>

I have applied your patch (finally you could say!) but there was a
mistake in it: you've added your patch in package/openjdk/, but we
support two versions of OpenJDK (11 and 17), and your patch only
applies to version 17. So I moved it to a sub-folder + ensured that
version 11 couldn't be selected for ARC. This also raised the issue
that version 17 has an additional requirement on host gcc >= 4.9, so if
a package ever did "select BR2_PACKAGE_OPENJDK", they would have to be
careful that specifically on ARC, it's only available if host gcc >=
4.9. To avoid this, I've moved the host gcc >= 4.9 dependency to
BR2_PACKAGE_OPENJDK itself, even if not strictly required for OpenJDK
11.

However, there is one thing I didn't address as I wasn't sure: do you
support only the "zero" variant on ARC? If so, doesn't this:

config BR2_PACKAGE_OPENJDK_JVM_VARIANT_CLIENT
        bool "client"
        depends on !BR2_powerpc
        help
          Quick loading, but slower run-time performance.

config BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER
        bool "server"
        depends on !BR2_powerpc
        help
          Slower loading, but faster run-time performance.

config BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO
        bool "zero"
        select BR2_PACKAGE_LIBFFI
        help
          A non-assembler variant with wide arch support, however
          performance is less then client/server.

          http://openjdk.java.net/projects/zero

also needs some depends on !BR2_arc for the client and server variants?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
