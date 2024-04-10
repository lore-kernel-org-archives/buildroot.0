Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D64CD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 20:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E26160780;
	Wed, 10 Apr 2024 20:55:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gei78qAGUrQr; Wed, 10 Apr 2024 20:55:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D859260E7F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D859260E7F;
	Wed, 10 Apr 2024 20:55:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3FD831BF4DD
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 20:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38F68405B3
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 20:55:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LDNQMzc4_Mm9 for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 20:55:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4F23F40594
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F23F40594
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F23F40594
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 20:55:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7876613F81D;
 Wed, 10 Apr 2024 22:55:24 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 10 Apr 2024 22:55:24 +0200
Date: Wed, 10 Apr 2024 22:55:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Zhb8vKs-ltd8ghUR@landeda>
References: <20240404124329.768546-1-thomas.perale@mind.be>
 <20240407231500.2248bc22@windsurf> <ZhRCOocYgxC-C5GL@landeda>
 <ef73b0da-0127-4d58-b195-bb09c36bf39c@mind.be>
 <ZhbKkdeV6FEARag-@landeda>
 <ca3fa476-0679-496f-989d-e070724da1ee@mind.be>
 <20240410221013.10b6fb48@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240410221013.10b6fb48@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712782529;
 bh=mGzz7SYKGoOPpsGGASjOMLJRtYTB82N16oKao8ii2L8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H4/QTbhmhVGJcc52++d5CjKU/O/YI8fAxoklAVdAUr8tEXTjN4TA0ZpHsybZUW5AZ
 GOJDwxOs00zQWOLW+TUDXe/UMh9Rj/8sIHl6hcAKA39hsTCSDgl+0RkALbfpbku2mQ
 DbtjoQprZOr06th9/3+HysB1f3a/j2zU5Ftv29wu+HCAlDqh2Uf34WotZybh6Sx9oO
 zoMas8WdP6BR9ZUmtKg8frF5MT1nU0VQDoO8zDB1kxlPQZmsZV+vfSAcUcew+76JiG
 LdySqlFUC81xBzcnBza7rnKecrlGOL7GQ0hkS2TF3bX6Uj7+Ek5ySqVuF4LArBeXmH
 k+6TSpNM9E/Bw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=H4/QTbhm
Subject: Re: [Buildroot] [RFC PATCH 0/5] Support SBOM in CycloneDX format
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
Cc: Thomas Perale <thomas.perale@essensium.com>,
 Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-04-10 22:10 +0200, Thomas Petazzoni spake thusly:
> On Wed, 10 Apr 2024 21:26:09 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
> > > An SBOM is totally worthless when generated on the developers machines,
> > > as the build environment there is uncontrollable; it is useless during
> > > development as well [0]. An SBOM only ever makes sense when generated in
> > > a delivery pipeline, like in a CI/CD pipeline.  
> >   Huh? It's equally worthless as the images created by Buildroot then. Those are 
> > also uncontrollable. Of course, you have no guarantee that the SBoM corresponds 
> > to the image that gets shipped to customers, but that's not really relevant. You 
> > can still use the SBoM to see which packages get installed, which patches are 
> > applied, which CVEs apply, which licenses are used, etc.
> Yes, I agree the argument from Yann here is a bit dubious, but do we
> care?

What I meant here, is that the environment on a developper's machine is
unknown, so there is no way one can produce an SBOm there, that is
meaningful. If the developper has an override-srcdir or a local.mk with
arbitrary stuff, then this is not reproducible, and this should not be
used to tag a release.

Where an SBOM is usefull, is when it is generated for a release, so that
it can traval along it. A release should be done in a constrained,
reproducible environment, like a CD pipeline.

> >   And anyway, I don't think it's very relevant if this SBoM generation happens 
> > on a developer machine or in CI. In either case, I don't think we want to rely 
> > on a host-installed Python version.
> Why?

Indeed, why? As far as I see, such a script would only need modules from
the stdlib (json, maybe subprocess, re, and similar). We'd just need to
state that Buildroot requires a python3.8+ on the host, which to be
honest would hugely help in simpifying our other scripts...

We indeed currently do not require such a python to be present, as
that's not part of our requirements.

> > > We should now drop printvars.  
> >   OMG, I completely forgot about show-vars! But indeed, we still need to keep 
> > show-vars. And we should drop printvars.
> We don't care about backward compatibility?

Yes, but printvars is riddled with issues, and show-vars as been around
for a while already...

> > > and so there is no reason to inject those in cyclonedx just
> > > because something else may need it. That's what show-info is for  
> >   Anyway, for me replacing show-info is not the most important thing, it's more 
> > a nice-to-have. What I don't want is to generate CycloneDX by post-processing 
> > the show-info output, because it turns out that that is still fairly complicated 
> > and it's just easier to directly generate CycloneDX from make.
> Why is it "fairly complicated"? It sounds to me that post-processing
> show-info into a simple and nice Python script to generate CycloneDX is
> not at all "fairly complicated" but rather "fairly simpler" than doing
> it in make.

Here 's even a little patch that would allow to write everything in
python, and generate the thign as part of the standard build process
(which I would not suggest, but for the sake of the argument):

    commit ccf4722ae0a9755aa73c9c1eaa2a6935b77d7a7c
    Author:     Yann E. MORIN <yann.morin.1998@free.fr>
    AuthorDate: Wed Apr 10 22:25:11 2024 +0200
    Commit:     Yann E. MORIN <yann.morin.1998@free.fr>
    CommitDate: Wed Apr 10 22:42:51 2024 +0200

        Makefile: cyclonedx from show-info ezpz

        Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

    diff --git a/Makefile b/Makefile
    index d1caec63b5..344f72244a 100644
    --- a/Makefile
    +++ b/Makefile
    @@ -497,7 +497,7 @@ export BASE_DIR
     #
     ################################################################################

    -all: world
    +all: world sbom-all

     # Include legacy before the other things, because package .mk files
     # may rely on it.
    @@ -918,20 +918,37 @@ check-dependencies:
         @cd "$(CONFIG_DIR)"; \
         $(TOPDIR)/support/scripts/graph-depends -C

    +SHOW_INFO = \
    +    $(call clean-json, \
    +           { $(foreach p, \
    +                   $(sort $(foreach i,$(PACKAGES) $(TARGETS_ROOTFS), \
    +                                   $(i) \
    +                                   $($(call UPPERCASE,$(i))_FINAL_RECURSIVE_DEPENDENCIES) \
    +                           ) \
    +                   ), \
    +                   $(call json-info,$(call UPPERCASE,$(p)))$(comma) \
    +           ) } \
    +    ) \
    +
     .PHONY: show-info
     show-info:
         @:
    -    $(info $(call clean-json, \
    -                   { $(foreach p, \
    -                           $(sort $(foreach i,$(PACKAGES) $(TARGETS_ROOTFS), \
    -                                           $(i) \
    -                                           $($(call UPPERCASE,$(i))_FINAL_RECURSIVE_DEPENDENCIES) \
    -                                   ) \
    -                           ), \
    -                           $(call json-info,$(call UPPERCASE,$(p)))$(comma) \
    -                   ) } \
    -           ) \
    -    )
    +    # Use $(foreach...) like for show-vars, just in case
    +    $(foreach i,$(SHOW_INFO),$(info $(i)))
    +
    +sbom-all: sbom-buildroot sbom-cyclonedx
    +
    +.PHONY: $(O)/info.json
    +$(O)/info.json:
    +    $(file > $(@),$(SHOW_INFO))
    +
    +.PHONY: sbom-buildroot
    +sbom-buildroot: $(O)/sbom.json
    +    @:
    +
    +.PHONY: sbom-cyclonedx
    +sbom-cyclonedx: $(O)/sbom.json world legal-info
    +    $(TOPDIR)/support/scripts/cyclonedx --show-info=$(<) --legal-info=$(LEGAL_INFO_DIR)

     .PHONY: pkg-stats
     pkg-stats:

Also: badly tab-mangled, but that's just for the example, not meant to
be applied. Totally untested, although I already had the SHOW_INFO
variable implemented a while back already, and IIRC that was working.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
