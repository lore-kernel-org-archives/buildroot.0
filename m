Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27835C3DA78
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 20:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A84E860F64;
	Sat, 14 Jan 2023 20:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A84E860F64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id efKlY1sX3Kn8; Sat, 14 Jan 2023 20:01:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E15B260F5E;
	Sat, 14 Jan 2023 20:01:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E15B260F5E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 229881BF3D8
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 20:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9ECE60F5E
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 20:01:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9ECE60F5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sT60NYM4aht4 for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 20:01:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AE7560AB1
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0AE7560AB1
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 20:01:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F167B20005;
 Sat, 14 Jan 2023 20:01:41 +0000 (UTC)
Date: Sat, 14 Jan 2023 21:01:40 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230114210140.13529462@windsurf>
In-Reply-To: <20230114144853.192664-1-yann.morin.1998@free.fr>
References: <20230114144853.192664-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1673726502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UO/3WwSr/+/2Phccwe4ymxVn8sgVU/0nmwwyF7vHIlQ=;
 b=Y2kk7M3ZL7xEql3TZvfpXx9G3R5KQZVjvK4tDyfxnSue89KZhobQq2WOKyC5e+0Fs1R/Tp
 iADFPFxELLEWc0VASEQ2OS9voc1ajzXX/j30/+cmgqnyMhBtxF5h9ihsIHLCbd89T+noJ7
 zRA8mbMMg7tKDujtPOVAjgeDbc1JRwtTq+XuKlT9HNcC8TF+oGQWRNmoKqTLOCYGZhstHE
 XeGPFm2hm7AGGuNoXr9bEuZ6JncmiERAsKE71Xx1n7PT/iveNJOVR9Rp9z1hVb6wELC/OU
 Z6czXsE84jWoyK6lsKim2EBW67IbdyOAthAKF3Lq0YrkEMw3YHEIf/wOsPFmhQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y2kk7M3Z
Subject: Re: [Buildroot] [PATCH] support/download: fix concurrent cargo
 vendor
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Moritz Bitsch <moritz@h6t.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 14 Jan 2023 15:48:53 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Commit 8450b7691870 (package/pkg-cargo: move CARGO_HOME into DL_DIR)
> allowed for a shared cargo cache of crates. Internally, cargo is
> supposed to lock themselves when accessing that cache, and that commit
> even had some research in that area, pointing at [0] for complaints
> about too-coarse the lock, so it was deemed safe to have a shared cargo
> home.
> 
> However, in practice, the locking as implemented buy cargo, fails to
> properly protect the concurrent access to the crates cache, with random
> failures that manifest themselves like so:
> 
>         Blocking waiting for file lock on package cache
>         Blocking waiting for file lock on package cache
>      Downloading crates ...
>     error: failed to sync
>     Caused by:
>       failed to download packages
>     Caused by:
>       failed to download `autocfg v1.1.0`
>     Caused by:
>       unable to get packages from source
>     Caused by:
>       failed to unpack package `autocfg v1.1.0`
>     Caused by:
>       failed to unpack entry at `autocfg-1.1.0/src/tests.rs`
>     Caused by:
>       No such file or directory (os error 2) while canonicalizing [...]
> 
> with the last few errors sometime being:
> 
>     Caused by:
>       failed to parse manifest at `[...]/aho-corasick-0.7.18/Cargo.toml`
>     Caused by:
>       can't find library `aho_corasick`, rename file to `src/lib.rs` or specify lib.path
> 
> So, as we do not systematically use our own cargo build (we can use a
> pre-built one with host-rust-bin), we can't patch cargo (even if we knew
> what to do!).
> 
> Instead, we implement a lock ourselves, by wrapping the call to "cargo
> vendor" with a flock(1) on cargo home.
> 
> Note: the download wrapper is already flock-ed, but it is a per-package
> lock, so it does not prevent different packages from being downloaded in
> parallel; if those packages need cargo vendoring, thayt wil not be
> protected bu the flock on the dl wrapper. So we really do need a flock
> on cargo home.
> 
> [0] https://github.com/rust-lang/cargo/issues/6930
> 
> Fixes: 8450b769187087751f83cbefcf0a88f70d9da670
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Moritz Bitsch <moritz@h6t.eu>
> ---
>  support/download/cargo-post-process | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master after fixing a few typos in the commit log, thanks a
lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
