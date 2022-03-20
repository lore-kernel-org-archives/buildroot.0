Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CDEC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 17:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4486F40583;
	Sun, 20 Mar 2022 17:35:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yt7gKpvLMxMl; Sun, 20 Mar 2022 17:35:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12EAC40022;
	Sun, 20 Mar 2022 17:35:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 281771BF352
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25B5440277
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:35:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1N-KxX-X6JcM for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 17:35:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE38B40269
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 17:35:27 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 629B0200002;
 Sun, 20 Mar 2022 17:35:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nVzSd-00FE2T-3n; Sun, 20 Mar 2022 18:35:23 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20220224154513.220976-1-romain.naour@gmail.com>
 <20220224154513.220976-2-romain.naour@gmail.com>
Date: Sun, 20 Mar 2022 18:35:23 +0100
In-Reply-To: <20220224154513.220976-2-romain.naour@gmail.com> (Romain Naour's
 message of "Thu, 24 Feb 2022 16:45:13 +0100")
Message-ID: <875yo8plwk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCHv2 2/2] package/rust: install rustc and
 rust-std built by Buildroot
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > The test TestRust is currently broken with ripgrep package with
 > the following error:

 > error[E0514]: found crate `core` compiled by an incompatible version of rustc
 >   |
 >   = help: please recompile that crate using this compiler (rustc 1.58.1) (consider running `cargo clean` first)
 >   = note: the following crate versions were found:
 >           crate `core` compiled by rustc 1.58.1 (db9d1b20b 2022-01-20): TestRust/host/lib/rustlib/x86_64-unknown-linux-gnu/lib/libcore-6cfcec236d576603.rlib

 > error[E0514]: found crate `std` compiled by an incompatible version of rustc

 > The problem is not really a cross-compilation issue (we are building
 > for an armv7 target on x86_64 host) but a problem with rust-std libraries
 > (rlib).

 > We can notice that "rustc 1.58.1 (db9d1b20b 2022-01-20)" is the same
 > version as the prebuilt rustc used to bootstrap the build:

 > TestRust/host/bin/rustc --version
 > rustc 1.58.1

 > TestRustBin/host/bin/rustc --version
 > rustc 1.58.1 (db9d1b20b 2022-01-20)

 > Indeed we are using host-rust-bin to bootstrap the host-rust compiler
 > package built by Buildroot. The problem is that the
 > libcore-6cfcec236d576603.rlib file come from host-rust-bin (rust-std)
 > and is not removed before installing host-rust built by Buildroot.

 > We actually spent a lot of time to build host-rust with rust-std
 > and forget to install this important library HOST_DIR.

 > Looking at the host-rust build directory we can notice two installer
 > script "install.sh" (the same scripts used to install host-rust-bin):

 > TestRust/build/host-rust-1.58.1/build/tmp/tarball/rust/x86_64-unknown-linux-gnu/rust-1.58.1-x86_64-unknown-linux-gnu/install.sh
 > TestRust/build/host-rust-1.58.1/build/tmp/tarball/rust-std/armv7-unknown-linux-gnueabihf/rust-std-1.58.1-armv7-unknown-linux-gnueabihf/install.sh

 > The "tarball" directory is generated by the "python x.py dist" during
 > the install step, we have to keep it.

 > Replace "python x.py install" by theses two install scripts.
 > Installing rust-std with the install.sh script replace the rust-std
 > libraries installed by host-rust-bin.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/2116202544

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
