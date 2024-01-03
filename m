Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBC7C3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 12:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EBA8417A8;
	Wed,  3 Jan 2024 12:02:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EBA8417A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7I9-ArBCuCRw; Wed,  3 Jan 2024 12:02:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FE36417B4;
	Wed,  3 Jan 2024 12:01:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FE36417B4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F386F1BF2AF
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 12:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB93181E72
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 12:01:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB93181E72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bySx5iZmdHZk for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 12:01:52 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D37B81D68
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 12:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D37B81D68
Received: by mail.gandi.net (Postfix) with ESMTPSA id 965011C0003;
 Wed,  3 Jan 2024 12:01:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rKzwS-002n6u-0K;
 Wed, 03 Jan 2024 13:01:48 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Louis Chauvet via buildroot <buildroot@buildroot.org>
References: <20231208174217.29735-1-louis.chauvet@bootlin.com>
Date: Wed, 03 Jan 2024 13:01:47 +0100
In-Reply-To: <20231208174217.29735-1-louis.chauvet@bootlin.com> (Louis Chauvet
 via buildroot's message of "Fri, 8 Dec 2023 18:42:12 +0100")
Message-ID: <87h6ju62xg.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] boot/arm-trusted-firmware: fix the RPATH
 of fiptool
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
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Louis" == Louis Chauvet via buildroot <buildroot@buildroot.org> writes:

 > The arm-trusted-firmware package builds a host tool called "fiptool",
 > which is used during the build process of arm-trusted-firmware
 > itself. This tool links against the OpenSSL host library, and
 > therefore needs to be built with the correct RPATH pointing to
 > $HOST_DIR/lib.

 > This is why commit a957d9a90ade4194dffe3eb2fc0136bc5d077c28
 > ("boot/arm-trusted-firmware: build fiptool separately with dependency
 > o n host-openssl") added the ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL
 > variable, which builds the fiptool tool first, with the right
 > variables set, before invoking the full build of TF-A. This ensured
 > that fiptool was built with the correct RPATH.

 > However, more recent versions of TF-A have modified their Makefile
 > machinery, and fiptool is being rebuilt even if it was built
 > before. Unfortunately, this rebuild is no longer done with the right
 > flags, so we end up with a fiptool binary that no longer has the right
 > RPATH, and fiptool fails to find the OpenSSL libraries from
 > $HOST_DIR/lib.

 > In order to fix this, we take a different approach: we do not build
 > fiptool separately first, but we inject the necessary flags through
 > the HOSTCC variable. Indeed, there's no HOST_LDFLAGS or HOST_LDLIBS
 > variable or similar that would allow us to pass the -Wl,-rpath flag
 > that is needed. Shoe-horning this flag into HOSTCC gets the job done,
 > and actually simplifies our arm-trusted-firmware.mk.

 > This patch break the compatibility with version prior to 1.4 (upstream
 > commit 72610c4102990 ("build: Introduce HOSTCC flag")). v1.4 is very old
 > (July 2017), not used anymore in-tree and probably not used anymore
 > outside the tree.

 > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
 > Co-authored-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 > Previous version:
 >    https://lore.kernel.org/buildroot/20231206164437.22191-1-louis.chauvet@bootlin.com/

 > Changes v1->v2:
 >    Update commit log about compatibilty

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
