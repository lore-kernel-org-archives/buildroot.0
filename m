Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D069EC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 09:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 536C680E20;
	Fri, 16 May 2025 09:41:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsqGIm-t88Di; Fri, 16 May 2025 09:41:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C3C480D7D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C3C480D7D;
	Fri, 16 May 2025 09:41:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ECB2E185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 09:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2FF283C77
 for <buildroot@buildroot.org>; Fri, 16 May 2025 09:41:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tgco30VVN6eS for <buildroot@buildroot.org>;
 Fri, 16 May 2025 09:41:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C8ED283C52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8ED283C52
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C8ED283C52
 for <buildroot@buildroot.org>; Fri, 16 May 2025 09:41:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4BDC84316C;
 Fri, 16 May 2025 09:41:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uFrZO-004nFC-1o;
 Fri, 16 May 2025 11:41:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Cherniaev Andrei <dungeonlords789@naver.com>
Cc: buildroot@buildroot.org,  Thomas Petazzoni
 <homas.petazzoni@bootlin.com>,  Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20250309162614.2549737-1-dungeonlords789@naver.com>
Date: Fri, 16 May 2025 11:41:34 +0200
In-Reply-To: <20250309162614.2549737-1-dungeonlords789@naver.com> (Cherniaev
 Andrei's message of "Mon, 10 Mar 2025 01:26:11 +0900")
Message-ID: <87tt5kc2pd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvgedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepfeeuveefteefheeufffgledugeeffeffudevleejjedtuddujeevhffgveelvdeinecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpsghuihhlughrohhothdrohhrghenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemjeeiugekmeefvghffhemfhgvsgefmeegsggsheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumeejiegukeemfegvfhhfmehfvggsfeemgegssgehpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeguuhhnghgvohhnlhhorhgushejkeelsehnrghvvghrrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtt
 hhopehhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepvghrihgtrdhlvgdrsghihhgrnhdruggvvhesfhhrvggvrdhfrh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-meson: change build sub-dir
 name
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

>>>>> "Cherniaev" == Cherniaev Andrei <dungeonlords789@naver.com> writes:

 > I encountered a situation where build/ is not empty folder so when all
 > files in build/ was removed by buildroot I was not able to use meson,
 > example https://gitlab.com/buildroot.org/buildroot/-/issues/64
 > The choice of "build" as the build sub-directorty is a bit stupid.

 > Co-Authored-By: Thomas Petazzoni <1089203+tpetazzoni@users.noreply.github.com>

You forgot to add your signed-off-by (git commit -s). Given how this is
just a replacement of build -> buildroot-build I took the liberty of
adding it here manually, hopefully that is OK with you?

Committed after rewording the commit message quite a bit, thanks.

> ---
 >  package/pkg-meson.mk | 26 +++++++++++++-------------
 >  1 file changed, 13 insertions(+), 13 deletions(-)

 > diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
 > index bc805b799c..30271e35e5 100644
 > --- a/package/pkg-meson.mk
 > +++ b/package/pkg-meson.mk
 > @@ -147,12 +147,12 @@ $(2)_CXXFLAGS ?= $$(TARGET_CXXFLAGS)
 >  #
 >  #
 >  define $(2)_CONFIGURE_CMDS
 > -	rm -rf $$($$(PKG)_SRCDIR)/build
 > -	mkdir -p $$($$(PKG)_SRCDIR)/build
 > +	rm -rf $$($$(PKG)_SRCDIR)/buildroot-build
 > +	mkdir -p $$($$(PKG)_SRCDIR)/buildroot-build
 >  	sed -e "/^\[binaries\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_BINARIES),\n$$(x)):" \
 >  	    -e "/^\[properties\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_PROPERTIES),\n$$(x)):" \
 >  	    $$(call PKG_MESON_CROSSCONFIG_SED,$(2)_CFLAGS,$(2)_CXXFLAGS,$(2)_LDFLAGS,$(2)_FCFLAGS) \
 > -	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
 > +	    > $$($$(PKG)_SRCDIR)/buildroot-build/cross-compilation.conf
 >  	PATH=$$(BR_PATH) \
 >  	CC_FOR_BUILD="$$(HOSTCC)" \
 >  	CXX_FOR_BUILD="$$(HOSTCXX)" \
 > @@ -162,21 +162,21 @@ define $(2)_CONFIGURE_CMDS
 >  		--libdir=lib \
 >  		--default-library=$(PKG_MESON_DEFAULT_LIBRARY) \
 >  		--buildtype=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) \
 > -		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
 > +		--cross-file=$$($$(PKG)_SRCDIR)/buildroot-build/cross-compilation.conf \
 >  		-Db_pie=false \
 >  		-Db_staticpic=$(if $(BR2_m68k_cf),false,true) \
 >  		-Dstrip=false \
 >  		-Dbuild.pkg_config_path=$$(HOST_DIR)/lib/pkgconfig \
 >  		-Dbuild.cmake_prefix_path=$$(HOST_DIR)/lib/cmake \
 >  		$$($$(PKG)_CONF_OPTS) \
 > -		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
 > +		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/buildroot-build
 >  endef
 >  else
 
 >  # Configure package for host
 >  define $(2)_CONFIGURE_CMDS
 > -	rm -rf $$($$(PKG)_SRCDIR)/build
 > -	mkdir -p $$($$(PKG)_SRCDIR)/build
 > +	rm -rf $$($$(PKG)_SRCDIR)/buildroot-build
 > +	mkdir -p $$($$(PKG)_SRCDIR)/buildroot-build
 >  	$$(HOST_CONFIGURE_OPTS) \
 >  	$$($$(PKG)_CONF_ENV) $$(MESON) setup \
 >  		--prefix=$$(HOST_DIR) \
 > @@ -188,7 +188,7 @@ define $(2)_CONFIGURE_CMDS
 >  		--wrap-mode=nodownload \
 >  		-Dstrip=true \
 >  		$$($$(PKG)_CONF_OPTS) \
 > -		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
 > +		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/buildroot-build
 >  endef
 >  endif
 >  endif
 > @@ -203,12 +203,12 @@ ifndef $(2)_BUILD_CMDS
 >  ifeq ($(4),target)
 >  define $(2)_BUILD_CMDS
 >  	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
 > -		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
 > +		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/buildroot-build
 >  endef
 >  else
 >  define $(2)_BUILD_CMDS
 >  	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
 > -		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
 > +		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/buildroot-build
 >  endef
 >  endif
 >  endif
 > @@ -220,7 +220,7 @@ endif
 >  ifndef $(2)_INSTALL_CMDS
 >  define $(2)_INSTALL_CMDS
 >  	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
 > -		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
 > +		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/buildroot-build install
 >  endef
 >  endif
 
 > @@ -231,7 +231,7 @@ endif
 >  ifndef $(2)_INSTALL_STAGING_CMDS
 >  define $(2)_INSTALL_STAGING_CMDS
 >  	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(STAGING_DIR) \
 > -		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
 > +		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/buildroot-build install
 >  endef
 >  endif
 
 > @@ -242,7 +242,7 @@ endif
 >  ifndef $(2)_INSTALL_TARGET_CMDS
 >  define $(2)_INSTALL_TARGET_CMDS
 >  	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(TARGET_DIR) \
 > -		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
 > +		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/buildroot-build install
 >  endef
 >  endif
 
 > -- 

 > 2.43.0

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
