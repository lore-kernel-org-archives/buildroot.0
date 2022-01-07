Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB081C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 21:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B523817AF;
	Fri,  7 Jan 2022 21:53:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wRxLJMhMlJAl; Fri,  7 Jan 2022 21:53:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C64A28177A;
	Fri,  7 Jan 2022 21:53:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B7911BF35A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA16660ADD
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:53:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1OPFmeSGYG_3 for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 21:53:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E35C060A99
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 21:53:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 09458240005;
 Fri,  7 Jan 2022 21:53:23 +0000 (UTC)
Date: Fri, 7 Jan 2022 22:53:22 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20220107225322.43eb3e8b@windsurf>
In-Reply-To: <310621ef-6a6e-f7e6-18d1-20ace14a81b7@smile.fr>
References: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
 <20220106210000.397694-6-thomas.petazzoni@bootlin.com>
 <310621ef-6a6e-f7e6-18d1-20ace14a81b7@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 05/11] package/pkg-cargo.mk: introduce
 the cargo package infrastructure
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
Cc: Matt Weber <Matthew.Weber@rockwellcollins.com>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Buildroot List <buildroot@buildroot.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 7 Jan 2022 22:07:26 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> > +endef
> > +endif # ifeq ($(4),target)
> > +endif # ifndef $(2)_BUILD_CMDS
> > +  
> 
> is _INSTALL_STAGING_CMDS is missing here ?
> 
> Rust package may wand to install *.rlib files [1] (similar to .a)

So far we haven't seen any package that needed staging installation, so
I did not implement it (Yann asked a similar question today, live).

> cargo install seems overingeneered and produce unwanted rebuild when packages
> are using cargo features [2].

Why do you say "over engineered" ? Buggy perhaps, over-engineered, I'm not sure.

> meta-rust doesn't use cago install at all but use an cargo_do_install() function
> that use manual install commandes [3].
> 
> [1] https://doc.rust-lang.org/reference/linkage.html
> [2] https://github.com/rust-lang/cargo/issues/8703
> [3] https://github.com/meta-rust/meta-rust/blob/master/classes/cargo.bbclass#L55

I was wondering how they knew what to install and how/where, but that
link explains it.

It would a lot simpler to be able to use "cargo install", but I agree
those rebuilds during the install step are not very nice (and they are
time consuming).

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
