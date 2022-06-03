Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC734C43334
	for <buildroot@archiver.kernel.org>; Fri,  3 Jun 2022 09:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A143842A5;
	Fri,  3 Jun 2022 09:21:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gXUaru7nANgr; Fri,  3 Jun 2022 09:21:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2612E81BFA;
	Fri,  3 Jun 2022 09:21:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 706A21BF35A
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 09:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F135405BC
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 09:21:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vpWZlwjHXMBm for <buildroot@lists.busybox.net>;
 Fri,  3 Jun 2022 09:21:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F07B40002
 for <buildroot@buildroot.org>; Fri,  3 Jun 2022 09:21:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0864240009;
 Fri,  3 Jun 2022 09:21:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nx3V4-00AbGr-3X; Fri, 03 Jun 2022 11:21:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Kory Maincent via buildroot <buildroot@buildroot.org>
References: <20220531084428.100082-1-kory.maincent@bootlin.com>
Date: Fri, 03 Jun 2022 11:21:46 +0200
In-Reply-To: <20220531084428.100082-1-kory.maincent@bootlin.com> (Kory
 Maincent via buildroot's message of "Tue, 31 May 2022 10:44:28 +0200")
Message-ID: <87pmjq14r9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: add -fno-PIE to
 CFLAGS
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
Cc: kory.maincent@bootlin.com, thomas.petazzoni@bootlin.com, geomatsi@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Kory" == Kory Maincent via buildroot <buildroot@buildroot.org> writes:

 > From: Kory Maincent <kory.maincent@bootlin.com>
 > By default the toolchain-wrapper enable -fPIE to the build of all packages.
 > TF-A support Position Independent Executable(PIE) only in few build cases,
 > therefore it should be disable by default.
 > If you still want to enable PIE, TF-A provide a "ENABLE_PIE" build options
 > that will override the cflags for the supported cases.

 > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Funny, I ran into the same issue yesterday and figured out the same
workaround.

> ---
 >  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
 > index 03fa83b7b5..b0dec13a4c 100644
 > --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
 > +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
 > @@ -50,6 +50,7 @@ endif
 
 >  ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
 >  	CROSS_COMPILE="$(TARGET_CROSS)" \
 > +	CFLAGS="-fno-PIE" \

ATF already has logic to detect if a toolchain is configured with
default PIE (looking at gcc -v output), so I think we should only do
this if we add the "hidden" -fPIE in the toolchain wrapper.

I've changed this to be conditional of BR2_PIC_PIE and applied, thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
