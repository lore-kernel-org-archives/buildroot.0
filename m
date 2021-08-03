Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBA9C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 07:28:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3082560F70
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 07:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3082560F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAF97606C4;
	Tue,  3 Aug 2021 07:28:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C3hQvz_UdQ67; Tue,  3 Aug 2021 07:28:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF7BA606E0;
	Tue,  3 Aug 2021 07:28:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CAC161BF35B
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 07:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9021403AF
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 07:28:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r_MsbeaSNJk0 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 07:28:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5438C4031C
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 07:28:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 3CEDAFF807;
 Tue,  3 Aug 2021 07:28:36 +0000 (UTC)
Date: Tue, 3 Aug 2021 09:28:35 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20210803092835.0e4d2663@windsurf>
In-Reply-To: <0c80668e-d1c0-3516-4a9e-54e6eb32cfd8@benettiengineering.com>
References: <20210802060946.C27006062D@smtp3.osuosl.org>
 <20210802234647.6f3df99d@windsurf>
 <0c80668e-d1c0-3516-4a9e-54e6eb32cfd8@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] Some analysis of the major build failure reasons
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Giulio,

On Tue, 3 Aug 2021 00:56:24 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> > I have investigated this. It fails only on sh4, due an internal
> > compiler error. It only occurs at -Os, at -O0 and -O2 it builds fine. I
> > have reported gcc bug
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101737 for this. Since I
> > tested only with gcc 9.3.0 for now, I've started a build with gcc 11.x,
> > to see how it goes.
> > 
> > Based on the result, I'll send a patch adding a new
> > BR2_TOOLCHAIN_GCC_HAS_BUG_101737 and disable -Os on pixman on SuperH
> > based on this.  
> 
> I can do that since I've treated a lot of gcc bugs. Is it ok?

Oh yes, sure! In the mean time, I have confirmed that gcc 11.1.0 is
also affected by the same issue, and I have updated the gcc bug with
that information. So to me, it seems like all gcc versions are affected.

> >>                         unknown | 31  
> > 
> > I did not look into these for now.  
> 
> I've taken a look into the last ones of today(the 31 ones)
> @James: lot of your builds simply stuck after Make has finished(not on 
> linking but exactly on 'make: Leaving directory').
> 
> I've noticed it time ago some time, and now it became very more 
> frequent. This is 9/10 your autobuilder giving that problem.
> And this happens at different Build Duration:
> http://autobuild.buildroot.net/?reason=unknown
> Also I see you use /tmp/ folder but I don't see anyone else doing that. 
> Isn't it maybe that your distro automatically cleans /tmp folder up? Or 
> it is mapped somewhere where disk gets full randomly?
> I would move it to a specific user folder(i.e. buildroot user) and that 
> should fix the problem. If you're trying to do such thing to save disk 
> space I tell you that I've already done it time ago with this patch that 
> now needs to be rebased:
> https://patchwork.ozlabs.org/project/buildroot/patch/20180919114541.17670-1-giulio.benetti@micronovasrl.com/
> But in my case NOK was clear. I'm pretty sure /tmp/ is the problem.

No, I don't think there is any problem with the use of /tmp. The
"unknown" build failures are typically build failures with top-level
parallel build enabled.

If you take
http://autobuild.buildroot.net/results/4ee/4eead81391d76edcdd2823e439f9b8d165b9b7ef/
which is the latest "unknown" build issue at the time of writing this
e-mail, it has BR2_PER_PACKAGE_DIRECTORIES=y. We enable
BR2_PER_PACKAGE_DIRECTORIES for a subset of the builds, and then for
the builds that have BR2_PER_PACKAGE_DIRECTORIES enabled, for a subset
of them, we use top-level parallel build.

However, when there is top-level parallel build enabled, the output is
quite messy (due to multiple packages being built in parallel). And due
to that, the build-end.log may not actually contain the actual build
failure as the failure may be visible much earlier in the build output.

If you check these "unknown" build failures, they all have
BR2_PER_PACKAGE_DIRECTORIES enabled, which really hints at a top-level
parallel build issue.

Perhaps what I should do is cook a patch that keeps the full build log
file for builds that use top-level parallel build, so that we have a
chance to debug these. The problem is going to be the disk-space
consumption on my server, but I guess I could do something that
compresses the build log after X days or something like that.

> On @Thomas autobuilder I see failure for:
> - optee-client(already found NOK):
> http://autobuild.buildroot.net/results/5e9/5e91bc53c3fbcd2ed232db79dc5c947394d66a1e/
> - failure on fetching as mentioned above
> 
> >>                    zeromq-4.3.4 | 30  
> > 
> > Giulio: this is happening only on or1k, with a binutils assert. Do you
> > think this is solved by your or1k fixes?  
> 
> It is. Those build failures are due to the use of binutils-2.33.1 that 
> have not patches for or1k. While all the other binutils versions have
> local or upstreamed or1k patches.
> 
> Of course this can still happen with actual external Bootlin or1k 
> toolchain that use exactly binutils-2.33.1 not patched. So the problem 
> will be solved once you recompile and bump them with patches provided. I 
> still see that we're on 2020.08-1:
> https://git.buildroot.net/buildroot/tree/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk#n586

Yes, I have worked on rebuilding the toolchains with 2021.05 + a few
patches, but I have a runtime issue with Microblaze + glibc, which
doesn't boot (well the kernel boots, but not user-space). Microblaze +
uclibc or musl works fine.

I guess I should probably not delay further the release of 2021.05
toolchains, and leave just the Microblaze/glibc toolchains to 2020.08.

> NOTE:
> I also add libnss-3.68 new bug on Aarch64_BE to be fixed. I'm already 
> working on it on spare time.

Great!

> PS: I've found my autobuilders stopped, I think I've forgotten to 
> restart the daemon after updating the Distro. Now they're up and running.

OK, thanks. That being said, additional autobuilders at the moment are
probably not that important: compared to the CPU power made available
by James through its super high-performance 63 machines, additional
"regular" machines added to the autobuilder pool are not going to help
much.

However, they are going to definitely help when James will no longer
have access to those machines.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
