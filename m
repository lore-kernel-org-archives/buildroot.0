Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBECECAAA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 04:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5599D829AF;
	Tue,  6 Sep 2022 04:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5599D829AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9d9FU-pDpLrm; Tue,  6 Sep 2022 04:15:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1ED0F82974;
	Tue,  6 Sep 2022 04:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1ED0F82974
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 916131BF378
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 04:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73CF1415D0
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 04:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73CF1415D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pksDuceGwjlJ for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 04:15:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 867A3415A3
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 867A3415A3
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 04:15:10 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id j26so6222509wms.0
 for <buildroot@buildroot.org>; Mon, 05 Sep 2022 21:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=QEu+BJF7IrVIa9bArwppIebXA/NJSXN5txswS9V1whQ=;
 b=YybBeYE/3OJhqOat9DxzqD2KcYimnk4//MdmRurvsRPMqUORfw2icFU0jCmdNIZzUj
 kY/AS3Ikmf14C1hdpZ+9EV98ihK4dH9deoLCh63KsYT6UwoAN8t3iW8qF+RaXWZ1bwO9
 9uDdwrt7Dz9mGhTWZ76i3hVSNao3dtwSdc9Vt6thls9vvjTQ3/U0FOeJjtjxPCf+n+Ki
 0f+DDfGHnrkpDGi0IfBtT3wrXTUqc6mvlHbOMgMhF4pB4S5F8ldvOq5tM0nxe2cwuO4W
 Z/nZD7N+x+KXKThRdQUGPhKR8lA/7ZkQcuComtzaOIGRAsnlJi9Vkq6uQIrsp2Qnem1M
 tD9w==
X-Gm-Message-State: ACgBeo0GxGK6uPH0e04vIcHUBiOjvan/g0FfmhrqnNuP+8Ear/2lWnvK
 Qh7ER2rf1yADzR5XpT+BvbZ2pcnLdDWAoMhqpqFkMpNy
X-Google-Smtp-Source: AA6agR5nOGLNC+B+VGM2vm+sWXHCfVOvmigBMEuHK/ruZ5ZKi1aLSaKjkGUit1YGE2dC+En/3TcGWOeptWRPCXNYfJA=
X-Received: by 2002:a05:600c:4591:b0:3a6:755b:8e6 with SMTP id
 r17-20020a05600c459100b003a6755b08e6mr11723652wmo.147.1662437708380; Mon, 05
 Sep 2022 21:15:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220904130501.1983806-1-romain.naour@gmail.com>
In-Reply-To: <20220904130501.1983806-1-romain.naour@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 6 Sep 2022 04:14:55 +0000
Message-ID: <CACPK8Xd9GbBXbOfBd8yNk5mODyjU3EuKwzgp32oNabyv_Va2Eg@mail.gmail.com>
To: Romain Naour <romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=QEu+BJF7IrVIa9bArwppIebXA/NJSXN5txswS9V1whQ=;
 b=IeuUJ4HDkaPeriHUfb7Igx6fypJMwzQdrP3Qyoiq5onKGg2bjC6s+QqJziO72v+loV
 Bv5qSw0UdckvipPVOYAYNB4EcIpNdmf8gpqKnjDBh4BLUXEAIpBEGWrL60uvFTAsGP0F
 7XFz7QT6INV3oy5vq9OTcaz+Uxcgsxfs3O6Rk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au
 header.a=rsa-sha256 header.s=google header.b=IeuUJ4HD
Subject: Re: [Buildroot] [PATCH for-master] package/gcc: 11.3.0: fix glibc
 crash on G4 ppc cpus
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 4 Sept 2022 at 13:05, Romain Naour <romain.naour@gmail.com> wrote:
>
> gcc 11.3.0 contains a backported patch [1] that introduce
> a regression for old powerpc cpus like the powerpc 7400 (G4).
>
> The glibc crash the init process due to a wrong asm machine
> directive (.machine).
>
> Run /sbin/init as init process
> init[1]: segfault (11) at 7369693e nip 6f6e08 lr 6f6a68 code 1 in libc.so.6[690000+18f000]
> init[1]: code: 280a000c 41c1ffe0 811edb80 554a103a 7d48502e 7d4a4214 7d4903a6 4e800420
> init[1]: code: 2c08007a 4bffffbc 89290000 5529103a <7d2a482e> 2c090000 41c2ff78 7fe4fb78
> Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
>
> Backport two patches from the gcc-11 stable branch (the upcoming gcc
> 11.4.0).
>
> [1] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=3cb53c10831be59d967d9dce8e7980fee4703500
>
> Fixes:
> https://gitlab.com/kubu93/buildroot/-/jobs/2976071284
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

I haven't come across this myself, but looking through the gcc 11
branch this looks like a reasonable fix.

Reviewed-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

> Cc: Joel Stanley <joel@jms.id.au>
> ---
>  .../11.3.0/0005-rs6000-Improve-.machine.patch | 120 ++++++++++++++++++
>  ...e-rs6000_cpu-for-.machine-ppc-and-pp.patch |  68 ++++++++++
>  2 files changed, 188 insertions(+)
>  create mode 100644 package/gcc/11.3.0/0005-rs6000-Improve-.machine.patch
>  create mode 100644 package/gcc/11.3.0/0006-rs6000-Do-not-use-rs6000_cpu-for-.machine-ppc-and-pp.patch
>
> diff --git a/package/gcc/11.3.0/0005-rs6000-Improve-.machine.patch b/package/gcc/11.3.0/0005-rs6000-Improve-.machine.patch
> new file mode 100644
> index 0000000000..7a4564b59e
> --- /dev/null
> +++ b/package/gcc/11.3.0/0005-rs6000-Improve-.machine.patch
> @@ -0,0 +1,120 @@
> +From ca2c3a7d3db7a699c358d3408f820396dd536fc8 Mon Sep 17 00:00:00 2001
> +From: Segher Boessenkool <segher@kernel.crashing.org>
> +Date: Tue, 1 Mar 2022 17:04:29 +0000
> +Subject: [PATCH 5/6] rs6000: Improve .machine
> +
> +This adds more correct .machine for most older CPUs.  It should be
> +conservative in the sense that everything we handled before we handle at
> +least as well now.  This does not yet revamp the server CPU handling, it
> +is too risky at this point in time.
> +
> +Tested on powerpc64-linux {-m32,-m64}.  Also manually tested with all
> +-mcpu=, and the output of that passed through the GNU assembler.
> +
> +2022-03-04  Segher Boessenkool  <segher@kernel.crashing.org>
> +
> +       * config/rs6000/rs6000.c (rs6000_machine_from_flags): Restructure a
> +       bit.  Handle most older CPUs.
> +
> +(cherry picked from commit 77eccbf39ed55297802bb66dff5f62507a7239e3)
> +(cherry picked from commit fc7e603edc67c66a14f893f3b5a0a34e7d26f77c)
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + gcc/config/rs6000/rs6000.c | 81 +++++++++++++++++++++++++-------------
> + 1 file changed, 54 insertions(+), 27 deletions(-)
> +
> +diff --git a/gcc/config/rs6000/rs6000.c b/gcc/config/rs6000/rs6000.c
> +index 0421dc7adb3..0a55c979c36 100644
> +--- a/gcc/config/rs6000/rs6000.c
> ++++ b/gcc/config/rs6000/rs6000.c
> +@@ -5742,33 +5742,60 @@ const char *rs6000_machine;
> + const char *
> + rs6000_machine_from_flags (void)
> + {
> +-  /* For some CPUs, the machine cannot be determined by ISA flags.  We have to
> +-     check them first.  */
> +-  switch (rs6000_cpu)
> +-    {
> +-    case PROCESSOR_PPC8540:
> +-    case PROCESSOR_PPC8548:
> +-      return "e500";
> +-
> +-    case PROCESSOR_PPCE300C2:
> +-    case PROCESSOR_PPCE300C3:
> +-      return "e300";
> +-
> +-    case PROCESSOR_PPCE500MC:
> +-      return "e500mc";
> +-
> +-    case PROCESSOR_PPCE500MC64:
> +-      return "e500mc64";
> +-
> +-    case PROCESSOR_PPCE5500:
> +-      return "e5500";
> +-
> +-    case PROCESSOR_PPCE6500:
> +-      return "e6500";
> +-
> +-    default:
> +-      break;
> +-    }
> ++  /* e300 and e500 */
> ++  if (rs6000_cpu == PROCESSOR_PPCE300C2 || rs6000_cpu == PROCESSOR_PPCE300C3)
> ++    return "e300";
> ++  if (rs6000_cpu == PROCESSOR_PPC8540 || rs6000_cpu == PROCESSOR_PPC8548)
> ++    return "e500";
> ++  if (rs6000_cpu == PROCESSOR_PPCE500MC)
> ++    return "e500mc";
> ++  if (rs6000_cpu == PROCESSOR_PPCE500MC64)
> ++    return "e500mc64";
> ++  if (rs6000_cpu == PROCESSOR_PPCE5500)
> ++    return "e5500";
> ++  if (rs6000_cpu == PROCESSOR_PPCE6500)
> ++    return "e6500";
> ++
> ++  /* 400 series */
> ++  if (rs6000_cpu == PROCESSOR_PPC403)
> ++    return "\"403\"";
> ++  if (rs6000_cpu == PROCESSOR_PPC405)
> ++    return "\"405\"";
> ++  if (rs6000_cpu == PROCESSOR_PPC440)
> ++    return "\"440\"";
> ++  if (rs6000_cpu == PROCESSOR_PPC476)
> ++    return "\"476\"";
> ++
> ++  /* A2 */
> ++  if (rs6000_cpu == PROCESSOR_PPCA2)
> ++    return "a2";
> ++
> ++  /* Cell BE */
> ++  if (rs6000_cpu == PROCESSOR_CELL)
> ++    return "cell";
> ++
> ++  /* Titan */
> ++  if (rs6000_cpu == PROCESSOR_TITAN)
> ++    return "titan";
> ++
> ++  /* 500 series and 800 series */
> ++  if (rs6000_cpu == PROCESSOR_MPCCORE)
> ++    return "\"821\"";
> ++
> ++  /* 600 series and 700 series, "classic" */
> ++  if (rs6000_cpu == PROCESSOR_PPC601 || rs6000_cpu == PROCESSOR_PPC603
> ++      || rs6000_cpu == PROCESSOR_PPC604 || rs6000_cpu == PROCESSOR_PPC604e
> ++      || rs6000_cpu == PROCESSOR_PPC750 || rs6000_cpu == PROCESSOR_POWERPC)
> ++    return "ppc";
> ++
> ++  /* Classic with AltiVec, "G4" */
> ++  if (rs6000_cpu == PROCESSOR_PPC7400 || rs6000_cpu == PROCESSOR_PPC7450)
> ++    return "\"7450\"";
> ++
> ++  /* The older 64-bit CPUs */
> ++  if (rs6000_cpu == PROCESSOR_PPC620 || rs6000_cpu == PROCESSOR_PPC630
> ++      || rs6000_cpu == PROCESSOR_RS64A || rs6000_cpu == PROCESSOR_POWERPC64)
> ++    return "ppc64";
> +
> +   HOST_WIDE_INT flags = rs6000_isa_flags;
> +
> +--
> +2.34.3
> +
> diff --git a/package/gcc/11.3.0/0006-rs6000-Do-not-use-rs6000_cpu-for-.machine-ppc-and-pp.patch b/package/gcc/11.3.0/0006-rs6000-Do-not-use-rs6000_cpu-for-.machine-ppc-and-pp.patch
> new file mode 100644
> index 0000000000..8e31c8241c
> --- /dev/null
> +++ b/package/gcc/11.3.0/0006-rs6000-Do-not-use-rs6000_cpu-for-.machine-ppc-and-pp.patch
> @@ -0,0 +1,68 @@
> +From 6de33ed642f119f1e2543095dd56e4a94f97c27f Mon Sep 17 00:00:00 2001
> +From: Segher Boessenkool <segher@kernel.crashing.org>
> +Date: Fri, 11 Mar 2022 21:15:18 +0000
> +Subject: [PATCH 6/6] rs6000: Do not use rs6000_cpu for .machine ppc and ppc64
> + (PR104829)
> +
> +Fixes: 77eccbf39ed5
> +
> +rs6000.h has
> +  #define PROCESSOR_POWERPC   PROCESSOR_PPC604
> +  #define PROCESSOR_POWERPC64 PROCESSOR_RS64A
> +which means that if you use things like  -mcpu=powerpc -mvsx  it will no
> +longer work after my latest .machine patch.  This causes GCC build errors
> +in some cases, not a good idea (even if the errors are actually
> +pre-existing: using -mvsx with a machine that does not have VSX cannot
> +work properly).
> +
> +2022-03-11  Segher Boessenkool  <segher@kernel.crashing.org>
> +
> +       PR target/104829
> +       * config/rs6000/rs6000.c (rs6000_machine_from_flags): Don't output
> +       "ppc" and "ppc64" based on rs6000_cpu.
> +
> +(cherry picked from commit 80fcc4b6afee72443bef551064826b3b4b6785e6)
> +(cherry picked from commit d87e0e297b1cba73a0c055d2a3e9267d288f435a)
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + gcc/config/rs6000/rs6000.c | 12 ++++++++++--
> + 1 file changed, 10 insertions(+), 2 deletions(-)
> +
> +diff --git a/gcc/config/rs6000/rs6000.c b/gcc/config/rs6000/rs6000.c
> +index 0a55c979c36..7e5cdd34840 100644
> +--- a/gcc/config/rs6000/rs6000.c
> ++++ b/gcc/config/rs6000/rs6000.c
> +@@ -5782,20 +5782,28 @@ rs6000_machine_from_flags (void)
> +   if (rs6000_cpu == PROCESSOR_MPCCORE)
> +     return "\"821\"";
> +
> ++#if 0
> ++  /* This (and ppc64 below) are disabled here (for now at least) because
> ++     PROCESSOR_POWERPC, PROCESSOR_POWERPC64, and PROCESSOR_COMMON
> ++     are #define'd as some of these.  Untangling that is a job for later.  */
> ++
> +   /* 600 series and 700 series, "classic" */
> +   if (rs6000_cpu == PROCESSOR_PPC601 || rs6000_cpu == PROCESSOR_PPC603
> +       || rs6000_cpu == PROCESSOR_PPC604 || rs6000_cpu == PROCESSOR_PPC604e
> +-      || rs6000_cpu == PROCESSOR_PPC750 || rs6000_cpu == PROCESSOR_POWERPC)
> ++      || rs6000_cpu == PROCESSOR_PPC750)
> +     return "ppc";
> ++#endif
> +
> +   /* Classic with AltiVec, "G4" */
> +   if (rs6000_cpu == PROCESSOR_PPC7400 || rs6000_cpu == PROCESSOR_PPC7450)
> +     return "\"7450\"";
> +
> ++#if 0
> +   /* The older 64-bit CPUs */
> +   if (rs6000_cpu == PROCESSOR_PPC620 || rs6000_cpu == PROCESSOR_PPC630
> +-      || rs6000_cpu == PROCESSOR_RS64A || rs6000_cpu == PROCESSOR_POWERPC64)
> ++      || rs6000_cpu == PROCESSOR_RS64A)
> +     return "ppc64";
> ++#endif
> +
> +   HOST_WIDE_INT flags = rs6000_isa_flags;
> +
> +--
> +2.34.3
> +
> --
> 2.34.3
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
