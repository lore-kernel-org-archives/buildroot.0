Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDBE7C52D7F
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 18:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CE6940C06;
	Wed, 14 Aug 2024 18:00:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bbO-vAhLr-Tu; Wed, 14 Aug 2024 18:00:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 061DC40C1D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 061DC40C1D;
	Wed, 14 Aug 2024 18:00:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 642151BF3A8
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 18:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5249B605D5
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 18:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PlEvpH0DE-5T for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 18:00:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DAD1B605C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAD1B605C2
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DAD1B605C2
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 18:00:37 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 9EB393520C9B; Wed, 14 Aug 2024 20:00:34 +0200 (CEST)
Date: Wed, 14 Aug 2024 20:00:34 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZrzwwtPZGEENRwxV@waldemar-brodkorb.de>
References: <ZrysgCNIRtUzTjbG@waldemar-brodkorb.de>
 <20240814195717.43707f3f@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240814195717.43707f3f@windsurf>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723658434; bh=BnBUOS5y4iY9q5uTcQPUTbII28lUHd+3RoXIYoBGK1c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O9mUEqEGFdIEIIG04bDaqVx/EynZ/8w8Nj4UcL0SwH4+mFlDoa4+Q7YsiwNZ3yF5h
 GD5q3GkzyURZ9jRYMLeCabQC3cpni1d/OHCFiJW1/KFZxyLr+1pbcv8bVUZmvS7OQa
 nLcNF2PfrsOhh8MyHRF60fAob9dtjHd/n5eIUT4/94TuU1y6PxIzqvREhDmt/LQKt4
 RJvY79Z8hpz7iqKSWRxpqGHId+NagUGWz7P+HFe8xy573jxj3rjET73H9dprsBpYcb
 jLIRylfxVY0PLtu77iuw7MzD+6Tx1bYyO/Z+iP858Bo4zM6E43s7sNDxZUT6yruH2L
 Waq6agf0DrLPQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=O9mUEqEG
Subject: Re: [Buildroot] [PATCH] package/libpcap: fix m68k-cf compile issue
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,
Thomas Petazzoni wrote,

> Hello Waldemar,
> 
> On Wed, 14 Aug 2024 15:09:20 +0200
> Waldemar Brodkorb <wbx@openadk.org> wrote:
> 
> > Compilation with -Os triggers this assembler problem.
> > 
> > Fixes:
> >  - http://autobuild.buildroot.net/results/db5/db58215fb3c7f30b6c0f0764a84271010346edfb
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> 
> [...]
> 
> > diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
> > index a4523f2218..257ec77e08 100644
> > --- a/package/libpcap/libpcap.mk
> > +++ b/package/libpcap/libpcap.mk
> > @@ -57,5 +57,11 @@ ifeq ($(BR2_microblaze)$(BR2_sparc)$(BR2_sparc64),y)
> >  LIBPCAP_CFLAGS += -fPIC
> >  endif
> >  
> > +# Enable default optimizations to not run into "Error: value -602 out of range"
> > +# assembler issues. -Os triggers the issue.
> > +ifeq ($(BR2_m68k_cf),y)
> > +LIBPCAP_CFLAGS += -O2
> > +endif
> 
> Thanks for the patch, but this is not how we handle gcc or binutils
> bugs. Instead, we report the bug upstream, and once the bug is
> reported, we add a BR2_TOOLCHAIN_HAS_GCC_BUG_12345 or
> BR2_TOOLCHAIN_HAS_BINUTILS_BUG_12345 (depending on which component is
> affected), this option is enabled on a per-architecture basis, and
> sometimes per-gcc version basis, and then the workaround in the package
> is made conditional on this option. This allows us to track to which
> GCC/binutils bug a workaround is related, and from to time check if the
> issue has been fixed in newer versions of gcc/binutils.
> 
> See toolchain/Config.in for a lot of examples. Giulio in Cc can also
> help with this, he is our resident expert in BR2_TOOLCHAIN_HAS_xyz_BUG
> workarounds :-)
> 
> Your bug seems somewhat similar to https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104028,
> for which we already have BR2_TOOLCHAIN_HAS_GCC_BUG_104028 in
> Buildroot. Not sure it is exactly the same bug.

Okay, sorry. I was just taking the example from
package/assimp/assimp.mk, which use a similar workaround for m68k.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
