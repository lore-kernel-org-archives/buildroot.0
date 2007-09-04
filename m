From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 05 Sep 2007 00:50:34 +0200
Subject: [Buildroot] [RFC] config cache
In-Reply-To: <20070904221147.GZ11697@aon.at>
References: <20070901193243.GQ11697@aon.at>
	<000301c7ed9d$c08b9510$54b0780a@atmel.com>
	<20070904221147.GZ11697@aon.at>
Message-ID: <1188946234.11158.38.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> >> 
> >> Since the advent of PROJECT one may even consider to build the
> >> autoconf'ed packages out-of-tree, i.e. unpack them in build_dir, step
> >> into project_dir/package/ and there do a
> >> $(PACKAGE_DIR)/configure $(TARGET_CONFIGURE_OTPS) && make
> >> 
> >
> >One of the advantages of the PROJECT thing, is that you can share
> >the result of the build between projects.
> >Only packages which can be configured in different ways should be
> >built in the project_build_dir.
> 
> Every network app, everything dealing with files/disks and perhaps some
> of the apps with optional X11 support are project specific, by that
> definition (and every app with optional locale support too, of course).
> 

I do not see why every network app is project specific.
The assumption is "Toolchain Options" are the same for all projects.
Then you should not change "Enable IPv6/RPC" between different projects.

If that rule is used, then only the following networking apps
* avahi
* ipsec-tools
* mDNSresponder
* ncftp
* nfs-utils
* ntp
* openswan
* samba
* tcpdump

needs to be built in project_build_dir at first glance.
There are about 70 configuration items under networking.


When studying closer, you will find that some configuration
items only define what applications should be copied
to the target file system.
Such packages can still be built in $(BUILD_DIR)
and the project configuration may or may not ignore already built
packages.


> This leaves only a handful of packages that live in build_dir
> legitimately. That's the reason why i was not too fond of the project
> thing in the first place, but ok (digressing, the project thing is
> just a detail wrt the config.cache idea).
> 
> >> We would end up with a stanza like (modulo naming of the variables):
> >> 
> >> (cd $(PROJECT_DIR)/$(PACKAGE_NAME) && \
> >> $(TARGET_CONFIGURE_ENV) \
> >> $(TARGET_CONFIGURE_PARAMS) \
> >> $(PACKAGE_DIR)/configure \
> >> $(TARGET_CONFIGURE_OPTS) \
> >
> >Are you not using $(TARGET_CONFIGURE_OPTS) in a new meaning then.
> >I think in that case you should come up with a new name
> >to avoid bugs.
> 
> I'd replace them globally in one sweep, so the _OPTS should be no
> problem.
> 
> What do you all think about this proposal of a central config-cache
> in general?

I have no clue because I do not know anything about this mechanism right
now.

> 
> One possible issue that i could think of was that i don't know how this
> would work out for toplevel parallel builds (that never worked anyway,
> which is something i'd like to fix). Could be that updating the central
> cache by multiple instances of configure would go up in flames in a
> spectacular manner. Does somebody know off-hand if that works or not?
-- 
Best Regards,
Ulf Samuelsson 
