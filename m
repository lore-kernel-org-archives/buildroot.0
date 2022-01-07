Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93E0C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 09:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B7A04289F;
	Fri,  7 Jan 2022 09:52:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kc3gAXcArlsw; Fri,  7 Jan 2022 09:52:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC86440273;
	Fri,  7 Jan 2022 09:52:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1DD901BF407
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 09:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B2B6831BD
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 09:52:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vHqAZfsFfbH1 for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 09:52:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7DBF81C0A
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 09:52:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 99331E0003;
 Fri,  7 Jan 2022 09:52:25 +0000 (UTC)
Date: Fri, 7 Jan 2022 10:52:23 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220107105223.01912574@windsurf>
In-Reply-To: <CADvTj4rf+NisSUL7=Ee_=3bpDFCaxpsXmUzcOF=oUD5imqXbSQ@mail.gmail.com>
References: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
 <20220106210000.397694-6-thomas.petazzoni@bootlin.com>
 <CADvTj4rf+NisSUL7=Ee_=3bpDFCaxpsXmUzcOF=oUD5imqXbSQ@mail.gmail.com>
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
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Thu, 6 Jan 2022 19:12:51 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> > +$(2)_CARGO_ENV += \
> > +       CARGO_HOME=$$(HOST_DIR)/share/cargo \
> > +       __CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS="nightly" \
> > +       CARGO_TARGET_APPLIES_TO_HOST="false"  
> 
> Maybe want to set these additional options as well so that packages
> using cargo can
> build with only the env variables set(in some cases at least I think),

Thanks for the suggestion. However, could you be more specific than
"maybe" and "I think" ? The way you put it seems like we don't really
know why those variables would be useful and what they do.

> still probably
> need to pass some command line args but this should reduce the amount at least:
> RUSTC_TARGET_TRIPLE = $(subst -,_,$(call UPPERCASE,$(RUSTC_TARGET_NAME)))

Which command line arguments would be replaced by those variables?

> PKG_RUST_CARGO_ENV = \
>     CARGO_HOME=$(HOST_DIR)/share/cargo \

This one we already pass.

>     CARGO_BUILD_TARGET=$(RUSTC_TARGET_NAME) \

This one would replace the --target argument? Just to understand, what
would be the advantage of the variable compared to the comand line
argument?

>     CARGO_INSTALL_ROOT=$(TARGET_DIR)/usr \

This would replace --root $$(TARGET_DIR)/usr/ I suppose. Here as well,
any benefit/drawback of arguments vs. variables?

>     CARGO_TARGET_$(RUSTC_TARGET_TRIPLE)_LINKER=$(notdir $(TARGET_CROSS))gcc

How come things are working today with this one?

> 
> HOST_PKG_RUST_CARGO_ENV = \
>     CARGO_HOME=$(HOST_DIR)/share/cargo \

This one already passed.

>     CARGO_INSTALL_ROOT=$(HOST_DIR) \

This would replace --root $$(HOST_DIR) I suppose.

>     RUSTFLAGS="$(addprefix -C link-args=,$(HOST_LDFLAGS))"

This is already passed, although replicated between the build and
install steps of the host variant.

So essentially the only questions is:

 - Advantage of variables vs. command line options

 - Relevance of CARGO_TARGET_$(RUSTC_TARGET_TRIPLE)_LINKER=$(notdir $(TARGET_CROSS))gcc

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
