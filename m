From: Trent Piepho <tpiepho@impinj.com>
Date: Mon, 11 Jun 2018 17:20:57 +0000
Subject: [Buildroot] [PATCH] core/sdk: generate the SDK tarball ourselves
In-Reply-To: <e4bbb78b-8301-e576-7e65-f83d55e0da7b@mind.be>
References: <20180609210607.13259-1-yann.morin.1998@free.fr>
 <e4bbb78b-8301-e576-7e65-f83d55e0da7b@mind.be>
Message-ID: <1528737656.28705.131.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2018-06-10 at 23:21 +0200, Arnout Vandecappelle wrote:
>  
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
> 
>  Wouldn't it make more sense to make a .xz, or perhaps a .bz2? Although, that
> probably gives a significant hit to the build time. But since it's explicit in
> 'make sdk' I don't mind that much.
> 

I'm using the SDK with Docker.  It can add tar.gz files into the
container, but now tar.xz.  Having to recompress the archive would be a
significant increase in build time.


> > +		-C $(HOST_DIR) \
> > +		--transform='s#^\.#buildroot-sdk.$(GNU_TARGET_NAME)-$(BR2_VERSION_FULL)#' \
> 
>  Perhaps move that "buildroot-sdk.$(GNU_TARGET_NAME)-$(BR2_VERSION_FULL)" into a
> variable?

So having extracted an SDK, in an automated CI script, how does one use
it?  I'll add it to the Docker container:

ARG sdk_file
ENV SDK=/mnt/sdk
ADD --chown=user:user ${sdk_file} ${SDK}

Now it needs to be relocated.  Something like:

RUN cd ${SDK}/buildroot-sdk.arm-buildroot-linux-gnueabihf-2018.02-00035-ge588bdd3e8 && ./relocate-sdk.sh

Is the problem with using this tarball apparent?  The dockerfile needs
to be hand edited on every single build to use the correct path to the
SDK.

I've already added a "sdk-tar" to my external.mk to do this, but used
the tarbomb approach.  While annoying for those who extract it in their
home dir, it's much easier to use in an automated processes since there
is no unknown path name component.

It is good if archives that are going to be used in an automated
process do not contain unpredictable path names!

Now one might say that I can just make a tarball with a different
process.  But that would mean creating two SDK tarballs, since there is
no way to prep the host dir for making a SDK tar without also making
the tarball.  That's a significant amount of wasted time.
