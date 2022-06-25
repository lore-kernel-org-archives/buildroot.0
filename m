Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A92C433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Jun 2022 20:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A60784154D;
	Sat, 25 Jun 2022 20:18:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A60784154D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GZvtSvEyNpRK; Sat, 25 Jun 2022 20:18:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B27741557;
	Sat, 25 Jun 2022 20:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B27741557
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DAB661BF3C5
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 20:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4FCA60F66
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 20:18:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4FCA60F66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3r6OrUhDxO7e for <buildroot@lists.busybox.net>;
 Sat, 25 Jun 2022 20:18:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0ED53607D0
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0ED53607D0
 for <buildroot@buildroot.org>; Sat, 25 Jun 2022 20:18:38 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 2E4455C24F0;
 Sat, 25 Jun 2022 22:18:35 +0200 (CEST)
MIME-Version: 1.0
Date: Sat, 25 Jun 2022 13:18:35 -0700
From: Stefan Agner <stefan@agner.ch>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <20220625175355.GF2608@scaer>
References: <82b5bbe664c06c5864debb660850e0cf@agner.ch>
 <20220625175355.GF2608@scaer>
Message-ID: <ff6964995c3be151ddf58f6dbde7e261@agner.ch>
X-Sender: stefan@agner.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1656188315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0MVBQVnDD65T0p6gUrYGfrDRuAmC+WV5Q32NJMEG64o=;
 b=cRWZpcTi8Sufnwcqyno8xz3hT9sNeGMkgwekvs+wK+Q5epoULPGnXhlxIfFXLnI5Xrn7bW
 1YGE4LJgE4+1n5roVmPku1EPVqKwGKw+P6NCx/SPh2ppMRjrjbBiG2r1ZxdfqhZEEUdpAB
 WITlGuJ0dfyTTLf7hKroc9m6BMyBBbU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=cRWZpcTi
Subject: Re: [Buildroot] Build error when building two GRUB2 configurations
 (race condition)
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
Cc: kory.maincent@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

Thanks for your answer!

On 2022-06-25 10:53, Yann E. MORIN wrote:
> Stefan, All,
> 
> On 2022-06-25 09:44 -0700, Stefan Agner spake thusly:
>> In Home Assistant OS we use the capability to build two GRUB2 binaries
>> by enabling these two configurations:
>>
>> BR2_TARGET_GRUB2_I386_EFI=y
>> BR2_TARGET_GRUB2_X86_64_EFI=y
>>
>> Every now and then a from scratch build seems to fail with the following
>> error:
>>
>> config.status: creating config-util.h
>> In file included from ../include/grub/disk.h:***,
>>                  from ../include/grub/file.h:26,
>>                  from ../grub-core/kern/emu/hostfs.c:23:
>> ./config.h:38:10: fatal error: ./config-util.h: No such file or
>> directory
>>    38 | #include <config-util.h>
>>       |          ^~~~~~~~~~~~~~~
>> compilation terminated.
> 
> I had the same issue even with a single grub2 config enabled. This is a
> grub2 issue, and it was supposedly fixed with upstream commit
> 42f4054faf3c (Makefile: Make libgrub.pp depend on config-util.h) and we
> do have this patch backported as:
> boot/grub2/0150-Makefile-Make-libgrub.pp-depend-on-config-util.h.patch

Hm, yeah this seems to be applied properly.

> 
> We currently have grub2 2.04, almost three years old now; we currently
> carry 149 backported patches. This is getting insane. We should update.
> 
> grub 2.06 has been out for a year now, but there are already a lot of
> commits applied in the tree.
> 
> I think we should just bite the bullet and bump to the current HEAD of
> the repository.
> 
> We have (indirect) runtime testing for grub2, so we can at least check
> if bumping is not breaing those (TestIso9660Grub2Hybrid is a two-grub2
> build configuration):
>     support/testing/tests/boot/test_edk2.py
>     support/testing/tests/fs/test_iso9660.py
> 
> New runtime tests to explicitly test grub2, added before we bump, then a
> bump, would be nice. Hint, hint. ;-)
> 
>> At least in this instance it seems to be the second configuration
>> x86_64-efi which fails (as the previous >>> grub2 2.04 Building i386-efi
>> succeeds).
> 
> This is a race condition. As all good race conditions, who wins and who
> lose is totally arbitrary... :-/
> 
>> The full build log can be found here:
>> https://pipelines.actions.githubusercontent.com/serviceHosts/dff1d65b-5367-4f4f-a0ee-c2bf0f874fbd/_apis/pipelines/1/runs/8778/signedlogcontent/14?urlExpires=2022-06-25T16%3A32%3A02.7601449Z&urlSigningMethod=HMACV1&urlSignature=c9ayjKpOOIoTexbMMXYB8A1G6UwmGfhBwTdtxTE3wmI%3D
>>
>> I haven't dig into it really, maybe someone with some familiarity of the
>> GRUB2 (multi-platform) build system has some idea?
> 
> Their Makefiles are, err... interesting. I did have a look a while back
> to try and solve that exact issue, and was relieved to see that they
> supposedly had a patch already. Once I found it was not enough, I did
> not dare look back at the Makefiles again, sadly...


Just run another build, and it had the same outcome. Also this time, it
was the second build, but could be random still I guess.

From what I can tell config-util.h is required in the all target, and
this is the Makefile part which makes sure it gets created.

config-util.h: stamp-h1
        @test -f $@ || rm -f stamp-h1
        @test -f $@ || $(MAKE) $(AM_MAKEFLAGS) stamp-h1

stamp-h1: $(srcdir)/config-util.h.in $(top_builddir)/config.status
        @rm -f stamp-h1
        cd $(top_builddir) && $(SHELL) ./config.status config-util.h
$(srcdir)/config-util.h.in:  $(am__configure_deps) 
        ($(am__cd) $(top_srcdir) && $(AUTOHEADER))
        rm -f stamp-h1
        touch $@

I wonder if it somehow picks up stamp-h1 from the previous build, or
otherwise races in this section. As this is happening on CI I can't
really inspect the state. I'll try to reproduce locally.

--
Stefan


> Regards,
> Yann E. MORIN.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
