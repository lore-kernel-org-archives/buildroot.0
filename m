From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 7 Jul 2008 17:25:46 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <87ej654uuu.fsf@macbook.be.48ers.dk>
References: <20080704222950.E76B63C61F@busybox.net>
	<87fxqmg53j.fsf@macbook.be.48ers.dk>
	<48720878.3070602@atmel.com> <20080707123642.GA15840@mx.loc>
	<87ej654uuu.fsf@macbook.be.48ers.dk>
Message-ID: <20080707152546.GH15840@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 07, 2008 at 04:44:25PM +0200, Peter Korsgaard wrote:
>>>>>> "Bernhard" == Bernhard Fischer <rep.dot.nop@gmail.com> writes:
>
> Bernhard> On Mon, Jul 07, 2008 at 02:13:44PM +0200, Ulf Samuelsson wrote:
> >> -----BEGIN PGP SIGNED MESSAGE-----
> >> Hash: SHA1
> >> 
> >> Peter Korsgaard skrev:
>
> >>> That breaks the source-check/external-deps check in
> >>> Makefile.autotools.in (r22607).
> >>> 
> >> 
> >> Is not something like the following to be preferred?
>
> Bernhard> What were you trying to fix initially?
>
>Me or Ulf? For me, see r22607. Makefile.autotools.in is kinda broken as
>the download target is executed even if the download exists (E.G. it

Ok that's broken.

$(BUILD_DIR)/%/.stamp_download_tarball:
	$(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_SOURCE)
	# or $(if $(BR2_PRIMARY_SITE),$(BR2_PRIMARY_SITE),$($(PKG)_SITE))/$($(PKG)_SOURCE) if you want to support that primary site stuff
	touch $@

$(BUILD_DIR)/%/.stamp_download_patches:
	$(foreach p,$($(PKG)_PATCH),$(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$p)

$(BUILD_DIR)/%/.stamp_downloaded: |\
	$(BUILD_DIR)/%/.stamp_download_tarball \
	$(BUILD_DIR)/%/.stamp_download_patches

>uses a phony target instead of the exact file name), so source-check /

The phony has to go, of course. There is absolutely no sane reason for it.

>external-deps doesn't work like it does for the other packages.

My lack of interrest to support external stuff is deep and profound.
