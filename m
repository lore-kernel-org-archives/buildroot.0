Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8275DC4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 12:46:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A5E960F55
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 12:46:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A5E960F55
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=troodon-software.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D01A740207;
	Mon,  2 Aug 2021 12:46:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DbUTWUouo_T7; Mon,  2 Aug 2021 12:46:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2A2040377;
	Mon,  2 Aug 2021 12:46:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A5D551BF402
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 12:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9506D60813
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 12:46:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key)
 header.d=troodon-software-com.20150623.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3gLOoz7nDXgJ for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 12:46:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B90FE6080C
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 12:46:49 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id t128so24001713oig.1
 for <buildroot@buildroot.org>; Mon, 02 Aug 2021 05:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=troodon-software-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DWNLHHIBN+i1aas7TBcJnok49ED8cHRlfcjHMqu+UkU=;
 b=gmw7fwHQTWMq+a6EPaNavinjnjSfhUe2dJu7jbodX7xRHIYx3dwfPC7Xofzw+fjGVY
 8a6vINqLc0uy1RhVMFfctyUzbGFA8abqruaqx07jcj7k37RZHScqEptGBqHrvsWGrNRO
 kjcEDhMpBg6XGtnOOpM+5E4OVnImnvB6iiBBGXe+EhTirmEwA610kyKQLOxPUloaHDew
 7z6OKOz1YfAdidLJMuPjQm6pFKJ56oB7Hc17kybiddKhewu5qOMA6kKlkqGJRwvV7Hzl
 Vmb0t//b87Pmrm9/l/Z5mV64i/3T51Y2up45vxy05AcRQ4FF44lhVlI3bshOtco/1C3y
 U97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DWNLHHIBN+i1aas7TBcJnok49ED8cHRlfcjHMqu+UkU=;
 b=oEp21F2W3knw1IT7etohIdFSd68AW8qPWtQuKlYyoBdJREGayhYKe19vYaesr8d5FV
 gxdpKIfRNaDM+nKUpqkhhl2T6OH9BGz66SbWfC7twPnmhHP8h1q2xs/J3ZjSYYjnu/Dc
 0FpLNEdArnQ7fsB0wotkXAbZ563UNLs0VAL4cLE+VvI00bUOhHAtwP/NJowPMeS5LTRm
 YGZHe87/cYT6extaAiXgLroUNPtq+b2+yHQNX4uuChbq5l2ktsu3EW+P/N5EYZZV0LhC
 t+4VRWSZfr3xwRddGsWSvUYyhVnfhpjrl4aPFBloQsXhSYqAOf1oEL5GEyRdnEmrhZx+
 i7Iw==
X-Gm-Message-State: AOAM533DojYL0ibzXG10VTeqZC/5ubamRb0R9ySyx3kjiW4Qq/eYAkLB
 ayx8OEMcnTo1y41L9X2cunmnWU1REJuWP1uqB2XTmw==
X-Google-Smtp-Source: ABdhPJxaEclezPYy1bIYfOv/AnV4GnRSLIxBP3BJ9iQDkwxZxbysnU9YWobW3l9HviqufEqPtz3whdATjMy/3FwjtlY=
X-Received: by 2002:aca:c78d:: with SMTP id x135mr10210380oif.30.1627908408655; 
 Mon, 02 Aug 2021 05:46:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210508222419.586915-1-fhunleth@troodon-software.com>
 <20210728233513.4097848b@windsurf>
In-Reply-To: <20210728233513.4097848b@windsurf>
From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 2 Aug 2021 08:46:37 -0400
Message-ID: <CA+-urNS33eBwcaCSTMAb690j7r2M4674MuPkDhEX1X=Qr7YYXQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] erlang: support builds when gcc
 __atomic_* exist
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
Cc: Will Newton <will.newton@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Thomas,

On Wed, Jul 28, 2021 at 5:35 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sat,  8 May 2021 18:24:19 -0400
> Frank Hunleth <fhunleth@troodon-software.com> wrote:
>
> > While Erlang will use it's own atomic operations, it can also use gcc
> > __atomic_* builtins. This is now listed in Erlang's HOWTO/INSTALL.md.
> >
> > This change was necessary on RISC-V, since Erlang didn't have a built-in
> > implementation, but it was able to use gcc's __atomic_* functions.
> >
> > Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> > ---
> >  package/erlang/Config.in | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
>
> Thanks Frank for the patch. I have applied to master. However, I think
> the patch may be incomplete. Indeed, on some CPU architectures, the
> atomic intrinsics are implemented in a separate library provided by
> gcc, called libatomic, and one need to link against it to use those
> intrinsics.
>
> Could you try to do a build of Erlang on SPARCv8 for example ?
>
> I suppose it will fail, and if it does, could you add some logic in
> erlang.mk to link against libatomic when BR2_TOOLCHAIN_HAS_LIBATOMIC=y
> (of course assuming the Erlang build system doesn't do that by itself,
> of course).

As you expected, a SPARCv8 build fails. I updated erlang.mk to pass
linker flags to link to libatomic, but still received errors. The
errors were of type:

/tmp/cc1Mog0n.s:230: Error: Architecture mismatch on "cas [%g3],%g2,%g1".
/tmp/cc1Mog0n.s:230: (Requires v9|v9a|v9b|v9c|v9d|v9e|v9v|v9m|m8;
requested architecture is v8.)

I ran out of time this morning to track this down (sorry), but it's
sounding like Erlang is doing something that's not causing function
calls into libatomic.

Right now, I'm thinking that trying to be more generic about what
platforms Erlang supports may not be worth it. I.e., change this:

        default y if BR2_i386 || BR2_x86_64 || BR2_powerpc || \
                BR2_sparc_v9 || BR2_arm || BR2_aarch64 || BR2_mipsel || \
                BR2_TOOLCHAIN_HAS_ATOMIC

to

        default y if BR2_i386 || BR2_x86_64 || BR2_powerpc || \
                BR2_sparc_v9 || BR2_arm || BR2_aarch64 || BR2_mipsel || \
                BR2_RISCV_64

What do you think?

Thanks,
Frank

Thanks,
Frank
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
