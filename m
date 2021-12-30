Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FD7C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 14:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 327A381441;
	Thu, 30 Dec 2021 14:57:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MqdRVxyytjJh; Thu, 30 Dec 2021 14:57:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 791FF812DD;
	Thu, 30 Dec 2021 14:56:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 35A2D1BF2BC
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 14:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 256304019F
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 14:56:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LfWh62k7dZJz for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 14:56:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11C3F40197
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 14:56:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 4BCDE100004;
 Thu, 30 Dec 2021 14:56:55 +0000 (UTC)
Date: Thu, 30 Dec 2021 15:56:54 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20211230155654.1929e59d@windsurf>
In-Reply-To: <20200221235728.592613-1-romain.naour@smile.fr>
References: <20200221235728.592613-1-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/elf2flt: fix relocations for
 readonly .eh_frame section
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

On Sat, 22 Feb 2020 00:57:28 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> The patch added to fix a efl2flt segfault on ARM Cortex-m4
> introduced some regressions on m68k and ARM [2].
> 
> While debuging, we can notice the flags value (0x12f) for .eh_frame
> just before the crash.
> 
> RELOCS: .eh_frame [0x2185c20]: flags=0x12f vma=0x84384
> 
>     /* bug case: flags = 0x12f (m68k)
>      * SEC_HAS_CONTENTS 0x100
>      * SEC_DATA         0x020
>      * SEC_READONLY     0x008
>      * SEC_RELOC        0x004
>      * SEC_LOAD         0x002
>      * SEC_ALLOC        0x001
>      */
> 
> On ARM cortex-m4, we have the same flags:
> RELOCS: .ARM.exidx [0x9ac5b0]: flags=0x12f vma=0x4b4ec
> 
> So due to the new condition introduced by [1] the .eh_frame
> section located in a readonly data section will be moved to
> the "text" section.
> 
> Looking at the gcc code for m68k [3]:
> 
> "Because .eh_frame refers to both code and data, it follows that
> .eh_frame must be in the data segment itself.
> [...]
> In theory, we could create a read-only .eh_frame [...]. However,
> gcc currently handles indirect references using a per-TU constant
> pool. This means that if a function and its eh_frame are removed
> by the linker, the eh_frame's indirect references to the removed
> function will not be removed, leading to an unresolved symbol
> error."
> 
> Fix this crash by checking the section name and move
> .eh_frame section even if it is located in readonly data.
> 
> Upstream status: under review [4]
> 
> Build tested on m68k and ARM w/ host-binutils 2.33.1.
> 
> [1] 2b064f86b6a0fd683f307b51f12d9d919fcaa386
> [2] http://lists.busybox.net/pipermail/buildroot/2020-February/274593.html
> [3] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/m68k/m68k.h;h=fc65e524b139a6d43e528956a788b9110aebaf2e;hb=a0c06cc27d2146b7d86758ffa236516c6143d62c#l785
> [4] https://github.com/uclinux-dev/elf2flt/issues/12
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...cations-for-read-only-.eh_frame-sect.patch | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 package/elf2flt/0003-elf2flt-fix-relocations-for-read-only-.eh_frame-sect.patch

If I'm not wrong, this has been replaced by
https://git.buildroot.org/buildroot/commit/package/elf2flt?id=2b064f86b6a0fd683f307b51f12d9d919fcaa386.

I'll mark this patch as Superseded, but please let me know if there's
still something to fix.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
