Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DCAC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE796403C7;
	Sat,  8 Jan 2022 22:40:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YGELtjujJAUd; Sat,  8 Jan 2022 22:40:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E0114056A;
	Sat,  8 Jan 2022 22:40:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF38A1BF3D2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB7E6605EA
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:40:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aAxqLilhgCkz for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:40:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC46B605E8
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:40:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 0FEDD200002;
 Sat,  8 Jan 2022 22:39:57 +0000 (UTC)
Date: Sat, 8 Jan 2022 23:39:56 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>, Christian Stewart
 <christian@paral.in>, Buildroot List <buildroot@buildroot.org>, Matt Weber
 <Matthew.Weber@rockwellcollins.com>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>
Message-ID: <20220108233956.3f145631@windsurf>
In-Reply-To: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
References: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 00/11] Support for Cargo and Go vendoring
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
Cc: Patrick Havelange <patrick.havelange@essensium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu,  6 Jan 2022 21:59:48 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Christian Stewart via buildroot (2):
>   package/embiggen-disk: new package
>   package/gocryptfs: new package
> 
> Patrick Havelange (3):
>   package/pkg-cargo.mk: introduce the cargo package infrastructure
>   docs/manual/cargo: document the cargo-package infrastructure
>   package/ripgrep: convert to cargo infrastructure
> 
> Thomas Petazzoni (6):
>   support/download/dl-wrapper: add concept of download post-processing
>   package/pkg-download.mk: add <pkg>_DOWNLOAD_POST_PROCESS variable
>   support/download/post-process-helpers: add helper function for post
>     process scripts
>   package/pkg-golang.mk: implement Go vendoring support
>   package/sentry-cli: re-add package
>   package/tinifier: new package

So, this series has been applied, with some additional tweaks based on
your feedback + review from Yann and Arnout.

Here are the things that have *not* yet been taken into account, and
left for future work:

 * We still use "cargo install" even though that causes rebuilds with
   some packages. Either we switch to a manual installation, or we
   "wait" for some better solution from cargo maintainers.

 * We don't use environment variables for everything, and some flags
   are passed through a cargo config file, which is not ideal.

 * We only support cargo/go packages that use .tar.gz tarballs, because
   the repacking with mk_tar_gz assumes .tar.gz is used.

These 3 limitations have been captured in the TODO list at
https://elinux.org/Buildroot#Core_Buildroot_infrastructure. Patches
welcome to implement these things of course, but we wanted to get the
initial infrastructure in place and merged, so that we can build on top
of it.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
