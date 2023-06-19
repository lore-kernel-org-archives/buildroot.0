Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD25EB64DB
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 12:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC5F5610AC;
	Mon, 19 Jun 2023 12:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC5F5610AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jZ1pySCgMDP5; Mon, 19 Jun 2023 12:13:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 005E160B1B;
	Mon, 19 Jun 2023 12:13:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 005E160B1B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D18311BF4E6
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 12:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9006812FB
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 12:13:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9006812FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XP3UP0r9V5TT for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 12:13:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D43E3812F7
 for <buildroot@uclibc.org>; Mon, 19 Jun 2023 12:13:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D43E3812F7
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id C1BBD8424C; Mon, 19 Jun 2023 12:13:42 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Mon, 19 Jun 2023 12:13:42 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.05
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vfazio@xes-inc.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-15634-163-FXouDwA9cv@https.bugs.busybox.net/>
In-Reply-To: <bug-15634-163@https.bugs.busybox.net/>
References: <bug-15634-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15634] fluidsynths refers to missing libgomp.so.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://bugs.busybox.net/show_bug.cgi?id=15634

--- Comment #3 from Vincent Fazio <vfazio@xes-inc.com> ---
When I `make olddefconfig` with your defconfig, it looks like it's using
bootlin's bleeding edge toolchain.

Bootlin recently (last year) enabled OpenMP support in the toolchain:
https://github.com/bootlin/toolchains-builder/commit/93f88ed30a4fd13ada7e2debf0d035855a690585

FluidSynth _tests_ for OpenMP support:

https://github.com/FluidSynth/fluidsynth/blob/master/CMakeLists.txt#L734

Unfortunately, the default configured Bootlin external toolchains to not
accurately reflect that OpenMP is supported due to a small issue with
generating the fragments:

https://github.com/bootlin/toolchains-builder/issues/60

Those fragments are used by a parser to add the external toolchain entries to
BR, but since they're not accurate, the selected toolchain features are also
not accurate. Most importantly here is they're missing
`BR2_TOOLCHAIN_EXTERNAL_OPENMP=y`.

This flag drives whether or not OpenMP libraries will be copied into the
resulting rootfs. 

So the library tests for support (and it is supported by the toolchain), but
since BR doesn't think it's enabled, the dependent libraries aren't copied in.

The quickest short term solutions are to:

1. Update your defconfig to use a "Custom Toolchain" and to manually point it
to the bootlin toolchain and flag OpenMP support

2. Update your defconfig to use a Buildroot generated toolchain and decide if
it should have OpenMP support.

This has actually been a recent discussion in IRC and we're contemplating a
more resilient check here.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
