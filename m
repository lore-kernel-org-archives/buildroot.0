Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7668BFA3750
	for <buildroot@archiver.kernel.org>; Fri, 13 Sep 2024 19:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B8EB84740;
	Fri, 13 Sep 2024 19:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MRkdTRPncr7O; Fri, 13 Sep 2024 19:30:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38ED484741
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38ED484741;
	Fri, 13 Sep 2024 19:30:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF9D21BF5F8
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 19:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9E4084741
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 19:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ELFN53epZgIA for <buildroot@lists.busybox.net>;
 Fri, 13 Sep 2024 19:30:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2093E84740
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2093E84740
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2093E84740
 for <buildroot@uclibc.org>; Fri, 13 Sep 2024 19:29:59 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1spBzQ-0005qI-OM
 for buildroot@uclibc.org; Fri, 13 Sep 2024 21:29:56 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Fri, 13 Sep 2024 19:29:52 -0000 (UTC)
Message-ID: <vc23rg$llm$1@ciao.gmane.io>
User-Agent: slrn/1.0.3 (Linux)
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=gmail.com
Subject: [Buildroot] Upgrading buildroot and rootfs/kernel compatibility
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I started with a buildroot 2020.02.7 configuration provided by a
silicon vendor that used a linaro-6.3.1-2017.02 toolchain.  That
worked OK after I manually upgraded a couple packages that were too
old to build using my host system's gcc 13.3.

Now I'm trying to upgrade buildroot to 2024.02.6.  First I tried using
the same toolchain as above.  That failed. AFAICT, it was because
Fortran support was enabled in the toolchain, and BF 2024 can't
tolerate that unless Fortran support is also enabled somewhere else
(it wasn't clear where).

Then I tried the "standard" external toolchains listed in the
2024.02.6 menuconfig.

ARM

   With arm-gnu-toolchain-13.2.rel1 the rootfs built cleanly, but the
   target panicked as soon as the init process was started. I assume
   that's some sort of Linux system-call incompatibility between the
   glibc included in the ARM toolchain and my 4.19.142 kernel (which I
   think was built using buildroot 2020 -- probably using the Linaro
   6.3.1-2017.02 toolchain).

Linaro

   With the linaro-7.3.1-2018.05 toolchain, the rootfs builds cleanly
   and the resulting image appears to work, though it's about 20%
   larger than before with the same set of packages selected.  Is that
   sort of size increase typical? (I know, it depends on the
   packages.)

What I'm trying to understand is where rootfs/kernel incompatibilities
come from.

 * Did the rootfs built with the ARM compiler crash because the kernel
   headers used by ARM to build glibc were incompatible with my
   kernel?

 * Is the gcc 13.2 compiler version itself incompatible with my kernel
   version?  (Would it fail even if glibc could be built using gcc
   13.2 and my kernel headers).

 * Are some versions of glibc simply not compatible with some kernel
   versions regardless of the toolchain and kernel headers used to
   build glibc?

--
Grant



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
