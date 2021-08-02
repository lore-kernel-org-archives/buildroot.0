Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29AB0C4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 21:46:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8087B60EBB
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 21:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8087B60EBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 360CD403B3;
	Mon,  2 Aug 2021 21:46:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E55fos7KxugW; Mon,  2 Aug 2021 21:46:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4796F4053F;
	Mon,  2 Aug 2021 21:46:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 533B61BF31C
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 21:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FF3F83993
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 21:46:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hmBZdbgh97wy for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 21:46:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4C1983806
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 21:46:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id E6C5A200003;
 Mon,  2 Aug 2021 21:46:49 +0000 (UTC)
Date: Mon, 2 Aug 2021 23:46:47 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@micronovasrl.com>, Bernd Kuhls <bernd.kuhls@t-online.de>,
 Adam Duskett <aduskett@gmail.com>, James Hilliard
 <james.hilliard1@gmail.com>
Message-ID: <20210802234647.6f3df99d@windsurf>
In-Reply-To: <20210802060946.C27006062D@smtp3.osuosl.org>
References: <20210802060946.C27006062D@smtp3.osuosl.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: [Buildroot] Some analysis of the major build failure reasons
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello,

Giulio, Bernd, Adam, there are questions for you below. Thanks for your
support!

On Mon, 02 Aug 2021 06:09:39 -0000
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

>     master   | 1903 | 802 | 53  | 2758 |

So it's getting a bit better, but we still have lots of build failures.

> Classification of failures by reason for master
> -----------------------------------------------
> 
>                   host-python3 | 50

So this is a timeout, which occurs only on James machines (that have
very high parallelism), during the compile_all.py invocation in the
build of host-python3. It fails like this:

Traceback (most recent call last):
  File "/tmp/instance-3/output-1/host/lib/python3.9/threading.py", line 973, in _bootstrap_inner
    self.run()
  File "/tmp/instance-3/output-1/host/lib/python3.9/concurrent/futures/process.py", line 317, in run
    result_item, is_broken, cause = self.wait_result_broken_or_wakeup()
  File "/tmp/instance-3/output-1/host/lib/python3.9/concurrent/futures/process.py", line 376, in wait_result_broken_or_wakeup
    worker_sentinels = [p.sentinel for p in self.processes.values()]
  File "/tmp/instance-3/output-1/host/lib/python3.9/concurrent/futures/process.py", line 376, in <listcomp>
    worker_sentinels = [p.sentinel for p in self.processes.values()]
RuntimeError: dictionary changed size during iteration

and then apparently gets stuck.

This issue had already been reported upstream several months ago:
https://bugs.python.org/issue43498

A pull request was posted: https://github.com/python/cpython/pull/24868
but not merged.

Also, a similar problem was found in another Python project that uses
somewhat the same code:
https://github.com/joblib/loky/pull/273/commits/956e8ae84ce4d385ef3a61635db7370f2645c4ad.
The fix is quite different from the one in the CPython pull request,
making it not trivial to know what is the correct fix.

I have submitted
https://patchwork.ozlabs.org/project/buildroot/patch/20210802211040.2535969-1-thomas.petazzoni@bootlin.com/
with the patch from the PR backported, and let another maintainer judge
if it's worth it.

>           libmodsecurity-3.0.5 | 47

I have applied
https://git.buildroot.org/buildroot/commit/?id=94b6fbd5823cbf94f2f76e402b0d73b473a8b64f
to fix this.

>                   libogg-1.3.5 | 39

This was a download issue affecting gcc159 only. It couldn't download
libogg-1.3.5.tar.xz from upstream due to SSL issue, but the fallback on
sources.buildroot.net returned 404. I could reproduce once, then after
fetching sources.buildroot.net/libogg/libogg-1.3.5.tar.xz from another
machine, gcc159 stopped getting a 404 for this URL.

It feels like the CDN in front of sources.buildroot.net is playing on us.

>                  pixman-0.40.0 | 31

I have investigated this. It fails only on sh4, due an internal
compiler error. It only occurs at -Os, at -O0 and -O2 it builds fine. I
have reported gcc bug
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101737 for this. Since I
tested only with gcc 9.3.0 for now, I've started a build with gcc 11.x,
to see how it goes.

Based on the result, I'll send a patch adding a new
BR2_TOOLCHAIN_GCC_HAS_BUG_101737 and disable -Os on pixman on SuperH
based on this.

>                        unknown | 31

I did not look into these for now.

>                   zeromq-4.3.4 | 30

Giulio: this is happening only on or1k, with a binutils assert. Do you
think this is solved by your or1k fixes?

>                     mpv-0.33.1 | 28

You manually enabled the feature 'vaapi-drm', but the autodetection check failed.

Bernd, could you have a look, perhaps ?

>             erlang-jiffy-1.0.6 | 26

This should be addressed by
https://patchwork.ozlabs.org/project/buildroot/patch/20210802135203.3059317-1-fhunleth@troodon-software.com/

>                libfuse3-3.10.4 | 23

This only happens on Microblaze, with:

../lib/fuse_loop_mt.c:361:1: error: symver is only supported on ELF platforms

Giulio, does it ring a bell to you ? It's weird because Microblaze is
using ELF binaries.

>                     ffmpeg-4.4 | 22

/tmp/ccDU0nYS.s: Assembler messages:
/tmp/ccDU0nYS.s:2136: Error: opcode not supported on this processor: mips32 (mips32) `dmult $20,$20'
/tmp/ccDU0nYS.s:2138: Error: opcode not supported on this processor: mips32 (mips32) `dsrl $21,$21,32'

I tried looking into this, but I'm not entirely clear how the detection
of the MIPS variant is done in the ffmpeg configure script.

Bernd, perhaps ?

>                    gconf-3.2.6 | 22

make[4]: *** No rule to make target 'GConf-2.0.typelib', needed by 'all-am'.  Stop.

Adam, isn't this GOI related ?

>              libmediaart-1.9.4 | 21

make[3]: *** No rule to make target 'MediaArt-2.0.typelib', needed by 'all'.  Stop.

Ditto. Adam, isn't this GOI related ?

>            optee-client-3.13.0 | 20

I pushed fixes for these issues.

>                nfs-utils-2.5.4 | 19

I assume would be fixed by
https://patchwork.ozlabs.org/project/buildroot/patch/20210802172116.10073-1-petr.vorel@gmail.com/

>   gobject-introspection-1.68.0 | 18

Adam ?

>                      gpsd-3.21 | 17

Giulio, the workaround to pass -O0 no longer works for some reason. -O0
is still passed, but -O2 is passed *after*, causing the build issue to
pop up again. Could you have a look ?

>                     qemu-6.0.0 | 17

../subprojects/libvhost-user/libvhost-user.c:1637:22: error: 'F_ADD_SEALS' undeclared (first use in this function)

Smells like a kernel headers dependency missing on a particular Qemu
feature, or something like this.

>                 harfbuzz-2.8.2 | 14

On ARC, toolchain issue: /tmp/ccYRTbeW.s:2996: Error: operand out of range (0x0000000000001036 is not between 0xfffffffffffff000 and 0x0000000000000fff)

On ARMv6 (only), a weird issue with mutexes:

../src/hb-mutex.hh:88:2: error: #error "Could not find any system to define mutex macros."
   88 | #error "Could not find any system to define mutex macros."


>                libgtk2-2.24.33 | 7 

Bernd, these are also .typelib related.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
