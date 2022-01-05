Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6B5C433EF
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 00:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC756828B5;
	Wed,  5 Jan 2022 00:13:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3YN6V1yuk0U1; Wed,  5 Jan 2022 00:13:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BD6E82849;
	Wed,  5 Jan 2022 00:13:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E53631BF9B9
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 00:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D36F382849
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 00:13:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id khINtba1Tr_J for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 00:13:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from majs.cnackers.org (vps-1525-1.tilaa.nl [46.19.33.97])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6ED082813
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 00:13:02 +0000 (UTC)
Received: from majs.cnackers.org (localhost [127.0.0.1]) by majs.cnackers.org
 (Postfix) with ESMTPA id BC1E1FF20
Message-ID: <0ddf26619d1ef9d2df5d3c9de58ba91453b1a91b.camel@cnackers.org>
From: Erik Larsson <who+buildroot@cnackers.org>
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
Date: Wed, 05 Jan 2022 01:12:20 +0100
In-Reply-To: <f03bea9a-6c5b-0138-929d-73d40728e991@mind.be>
References: <20220101223900.2970405-1-who+buildroot@cnackers.org>
 <20220101223900.2970405-3-who+buildroot@cnackers.org>
 <f03bea9a-6c5b-0138-929d-73d40728e991@mind.be>
User-Agent: Evolution 3.42.2-1 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] package/tpm2-tools: add option for
 enabling FAPI tools
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 2022-01-04 at 18:52 +0100, Arnout Vandecappelle wrote:
> 
> On 01/01/2022 23:39, Erik Larsson wrote:
> > Signed-off-by: Erik Larsson <who+buildroot@cnackers.org>
> > ---
> >   package/tpm2-tools/Config.in     | 11 +++++++++++
> >   package/tpm2-tools/tpm2-tools.mk |  6 ++++++
> >   2 files changed, 17 insertions(+)
> > 
> > diff --git a/package/tpm2-tools/Config.in b/package/tpm2-tools/Config.in
> > index 1a6698570a..cb3eb2b0a5 100644
> > --- a/package/tpm2-tools/Config.in
> > +++ b/package/tpm2-tools/Config.in
> > @@ -21,6 +21,17 @@ config BR2_PACKAGE_TPM2_TOOLS
> >   
> >   	  https://github.com/tpm2-software/tpm2-tools
> >   
> > +if BR2_PACKAGE_TPM2_TOOLS
> > +
> > +config BR2_PACKAGE_TPM2_TOOLS_FAPI
> > +	bool "tpm2-tools fapi support"
> > +	select BR2_PACKAGE_TPM2_TSS_FAPI
> > +	help
> > +	  This option enables Feature API (FAPI) support in tpm2-tools.
> > +	  The FAPI tools are prefixed with tss2_.
> > +
> > +endif
> > +
> >   comment "tpm2-tools needs a glibc or musl toolchain w/ dynamic library, wchar"
> >   	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
> >   		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
> > diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
> > index df5fbbfff4..6894be195f 100644
> > --- a/package/tpm2-tools/tpm2-tools.mk
> > +++ b/package/tpm2-tools/tpm2-tools.mk
> > @@ -22,4 +22,10 @@ TPM2_TOOLS_CONF_OPTS = --disable-hardening
> >   # do not build man pages
> >   TPM2_TOOLS_CONF_ENV += ac_cv_prog_PANDOC=''
> >   
> > +ifeq ($(BR2_PACKAGE_TPM2_TOOLS_FAPI),y)
> 
>   Does this optoin make a big difference in size? If not, we'd normally make it 
> an automatic option, i.e.
> 
> ifeq ($(BR2_PACKAGE_TPM2_TSS_FAPI),y)
> 
> (and remove the Config.in option).

The size difference is minimal (about 100K).
The FAPI tools are enabled automatically if tss2-fapi is available, so I think this patch can be skipped in that case.

/Erik

> 
>   Regards,
>   Arnout
> 
> > +TPM2_TOOLS_CONF_OPTS += --enable-fapi
> > +else
> > +TPM2_TOOLS_CONF_OPTS += --disable-fapi
> > +endif
> > +
> >   $(eval $(autotools-package))
> > 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
