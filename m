From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jun 2018 09:47:27 +0200
Subject: [Buildroot] [PATCH] core/sdk: generate the SDK tarball ourselves
In-Reply-To: <20180610080315.11cf122b@windsurf>
References: <20180609210607.13259-1-yann.morin.1998@free.fr>
 <20180610080315.11cf122b@windsurf>
Message-ID: <20180610074727.GA2471@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-06-10 08:03 +0200, Thomas Petazzoni spake thusly:
> On Sat,  9 Jun 2018 23:06:07 +0200, Yann E. MORIN wrote:
[--SNIP--]
> > So, we fix that mess by creating the archive ourselves, giving it and
> remove the final "and"

Here, 'it' refers to 'the archive' listed just before. We want to give
'the archive' and 'the top-most directory'. So, this is really valid
english grammar. ;-)

I'll rephrase to avoid confusion:

    So, we fix that mess by giving the top-most directory a
    recogniseable name, based on the target tuple and the Buildroot
    version, which we also use as the name of the archive (suffixed
    with the usual +.tar.gz+.)

> > the top-most directory a recogniseable name, based on the target tuple
> > and the Buildroot version.
> > 
> > Since this is an output file, we located it in the images/ directory.
> located -> locate
> or maybe "place", "store" ?

OK.

> >  .PHONY: sdk
> > -sdk: world
> > +sdk: world $(BR2_TAR_HOST_DEPENDENCY)
> >  	@$(call MESSAGE,"Rendering the SDK relocatable")
> >  	$(TOPDIR)/support/scripts/fix-rpath host
> >  	$(TOPDIR)/support/scripts/fix-rpath staging
> >  	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)/relocate-sdk.sh
> >  	mkdir -p $(HOST_DIR)/share/buildroot
> >  	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
> > +	$(Q)mkdir -p $(BINARIES_DIR)
> > +	$(TAR) czf $(BINARIES_DIR)/buildroot-sdk.$(GNU_TARGET_NAME)-$(BR2_VERSION_FULL).tar.gz \
> > +		-C $(HOST_DIR) \
> > +		--transform='s#^\.#buildroot-sdk.$(GNU_TARGET_NAME)-$(BR2_VERSION_FULL)#' \
> > +		.
> 
> Generally, I am fine with the principle, I believe it indeed makes
> sense to provide a tarball that is ready to use.
> 
> I was a bit concerned about backward compatibility behavior for people
> already using "make sdk". But in fact your change is fine from this
> point of view: if people have scripts today that run "make sdk" and
> create a tarball from output/host, they will still work fine.
> 
> > -It is possible to relocate the toolchain, this allows to distribute
> > -the toolchain to other developers to build applications for your
> > -target. To achieve this:
> > +Alternatively, Buildroot can also export the toolchain and all the
> > +development files of all selected packages,
> 
> "all the development files" -> "the development files", otherwise the
> repetition of "all" is a bit annoying.

ACK.

> Looks good otherwise. Thanks!

OK, thanks for the review! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
