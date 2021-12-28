Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960ACC433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 21:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22E1D819F6;
	Tue, 28 Dec 2021 21:45:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iQZfC-LTo3ON; Tue, 28 Dec 2021 21:45:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 937E2818CA;
	Tue, 28 Dec 2021 21:45:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BDDE61BF39D
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAF97818CA
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:45:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cVB0vSRJ6VS5 for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 21:45:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95279818BE
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 21:45:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 96A25240007;
 Tue, 28 Dec 2021 21:45:28 +0000 (UTC)
Date: Tue, 28 Dec 2021 22:45:27 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Ankur Tyagi <ankur.tyagi@gallagher.com>
Message-ID: <20211228224527.55b5c79c@windsurf>
In-Reply-To: <20210928213650.912-1-ankur.tyagi@gallagher.com>
References: <20210928213650.912-1-ankur.tyagi@gallagher.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libevent: add -fPIC to CFLAGS
 when BR2_PIC_PIE is set
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Ankur,

On Wed, 29 Sep 2021 10:36:50 +1300
Ankur Tyagi <ankur.tyagi@gallagher.com> wrote:

> Otherwise build fails with following error:
> Toolchain wrapper executing: '/tools/aarch64-linux-gnu/bin//aarch64-linux-gnu-gcc' '--sysroot' '/home/user/work/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot' '-mabi=lp64' '-fstack-protector-strong' '-fstack-clash-protection' '-mcpu=cortex-a35' '-fPIE' '-Wl,-z,now' '-Wl,-z,relro' '-shared' '.libs/buffer.o' '.libs/bufferevent.o' '.libs/bufferevent_filter.o' '.libs/bufferevent_pair.o' '.libs/bufferevent_ratelim.o' '.libs/bufferevent_sock.o' '.libs/event.o' '.libs/evmap.o' '.libs/evthread.o' '.libs/evutil.o' '.libs/evutil_rand.o' '.libs/evutil_time.o' '.libs/listener.o' '.libs/log.o' '.libs/strlcpy.o' '.libs/select.o' '.libs/poll.o' '.libs/epoll.o' '.libs/signal.o' '-Os' '-g2' '-pthread' '-pthread' '-Wl,-soname' '-Wl,libevent_core-2.1.so.7' '-o' '.libs/libevent_core-2.1.so.7.0.1'
> /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: .libs/evmap.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `event_changelist_add_' which may bind externally can not be used when making a shared object; recompile with -fPIC
> .libs/evmap.o: in function `evmap_check_integrity_':
> /home/user/work/cxos-buildroot/output/build/libevent-2.1.12/evmap.c:1007:(.text+0x13ac): dangerous relocation: unsupported relocation
> collect2: error: ld returned 1 exit status
> Makefile:1516: recipe for target 'libevent_core.la' failed
> make[3]: *** [libevent_core.la] Error 1
> 
> Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
> ---
>  package/libevent/libevent.mk | 5 +++++
>  1 file changed, 5 insertions(+)

I have looked at all the patches you have sent to add -fPIC flags in
various packages. However, I don't understand why this would be needed.
I've just tried building libevent on aarch64, and it builds fine, with
BR2_PIC_PIE=y. Also, our autobuilders have not detected anything.

So I'm afraid, you will have to provide more details: which toolchain
is used, which Buildroot configuration, so that we can reproduce the
problem.

I'm for now marking the patches as "Rejected" in our patch tracking
system, but please provide more details so that we can see how to
address it.

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
