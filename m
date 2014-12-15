From: Steve James <ste@junkomatic.net>
Date: Mon, 15 Dec 2014 12:20:24 +0000
Subject: [Buildroot] Adding leveldb to buildroot
In-Reply-To: <20141208175521.GC4105@free.fr>
References: <201412081517.25808.ste@junkomatic.net>
 <20141208175521.GC4105@free.fr>
Message-ID: <201412151220.24377.ste@junkomatic.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 08 Dec 2014 17:55:21 Yann E. MORIN wrote:
> Steve, All,
> 
> [Sorry for the duplicate, I forgot to Cc the Buildroot mailing list in
> the previous mail.]
> 
> On 2014-12-08 15:17 +0000, Steve James spake thusly:
> > Hello Yann,
> > I noticed that you started adding leveldb to buildroot at the weekend. I
> > just finished off the Makefile for the current release (1.18). Files are
> > attached. Please do with them as you wish.
> 
> Thank you for your contribution!
> 
> In the future, do not hesitate to post the patch to the mailing list,
> so it can get more thorough reviews.

Thanks Yann. OK, will do. I have been watching the list for a few days. I 
think I get the idea. Patches will follow after this message...

> In fact, I started work on leveldb back in MAy 2013, not this
> week-end! ;-)

It was this [1] commit that I had in mind when I said "started" -- that's how 
it looks from the outside of course. I started with this changeset to add 
leveldb. By the way, it's the origin of some of my non-compliant formatting! 
;-) Maybe the spec. changed since May 2013? Any way...

 [1] - 
https://gitorious.org/buildroot/buildroot/commit/73ad73787a074707ee91dc1beeb75d72fb9ed9f1

> It is part of my (still on-going) work to get a complete libvirt
> integration in Buildroot, and leveldb is needed by ceph, which in turn
> can be used by Qemu, but that is still all a long way ahead.

Hopefully at least the leveldb part can be completed soon.

> As for leveldb, I have some comments.
> 
> First, look at the manual, which explains how to add a package, the
> coding style we use, and some other usefull tips and tricks, as well as
> how to submit your changes:
> 
>     http://buildroot.net/downloads/manual/manual.html
>     http://buildroot.net/downloads/manual/manual.html#adding-packages
>    
> http://buildroot.net/downloads/manual/manual.html#_contributing_to_buildro
> ot http://buildroot.net/downloads/manual/manual.html#submitting-patches

Thanks. The documentation is comprehensive and necessarily large, so I'm 
still working my way through it. It'll take a while to fully assimilate.

> You must sign-off your patches. Signing-off is a way to handle a chain
> of origins of a contribution; see a description there:
>     http://elinux.org/Developer_Certificate_Of_Origin
> 
> Basically, you sign-off on a patch with a line like:
> 
>     Signed-off-by: Your Real NAME <your-email@example.net>

Got it.

> > config BR2_PACKAGE_LEVELDB
> > 
> >    bool "leveldb"
> >    select BR2_PACKAGE_SNAPPY
> >    help
> 
> This hsould be indented with a single TAB, not spaces.
> 
> >      LevelDB is a fast key-value storage library written at Google that
> >      provides an ordered mapping from string keys to string values.
> >      
> >      https://github.com/google/leveldb
> 
> Help text should be indented with a single TAB followed by two spaces.
 
OK. (I hate tabs, but lets not go OT with a religious Tab War)

> > comment "leveldb needs a toolchain w/ C++"
> > 
> >         depends on !BR2_INSTALL_LIBSTDCPP
> 
> If so, then you should add a "depends on BR2_INSTALL_LIBSTDCPP" to the
> main option:
> 
>     config BR2_PACKAGE_LEVELDB
>         bool "leveldb"
>         depends on BR2_INSTALL_LIBSTDCPP
>         select BR2_PACKAGE_SNAPPY
>         help
>           leveldb blabla...

OK

> 
> > #############################################################
> > #
> > # leveldb
> > #
> > #############################################################
> 
> The ### lines should be 80-chars wide.

OK.

> > LEVELDB_VERSION		   = 1.18
> > LEVELDB_SITE            = https://github.com/google/leveldb/archive/
> > LEVELDB_SOURCE          = v$(LEVELDB_VERSION).tar.gz
> > LEVELDB_LICENSE		   = BSD-3c
> > LEVELDB_LICENSE_FILES	= LICENSE
> > LEVELDB_INSTALL_STAGING	= YES
> 
> There should be only one space before and after the equal sign.

OK (evil tabs...)

> > define LEVELDB_BUILD_CMDS
> > 
> > 	$(MAKE) -C $(@D) all
> 
> This won't work, because you forgot to pass the appropriate variables
> that contain the cross-compiler and compilation flags. This should be
> something like:
> 
>     $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) all
> 
> (You can omit 'all' if it is the default rule of the makefile, which it
> usually is.)

You're right, I hadn't got to that bit of the documentation yet.

> > endef
> > 
> > define LEVELDB_INSTALL_TARGET_CMDS
> > 
> >    $(INSTALL) -D -m 0644 $(@D)/libleveldb.a       $(TARGET_DIR)/usr/lib
> >    $(INSTALL) -D -m 0755 $(@D)/libleveldb.so.1.18 $(TARGET_DIR)/usr/lib
> >    
> >    $(HOSTLN) -sf $(TARGET_DIR)/usr/lib/libleveldb.so.1.18
> >    $(TARGET_DIR)/usr/lib/libleveldb.so.1 $(HOSTLN) -sf
> >    $(TARGET_DIR)/usr/lib/libleveldb.so.1.18
> >    $(TARGET_DIR)/usr/lib/libleveldb.so
> 
> The last three lines won;t work in case we are doing a static-only
> build, that is when BR2_PREFER_STATIC_LIB is set.

Right. I think I get the idea now. Put static and dynamic libs into 
staging, dynamic libs only into target.

> >    $(INSTALL) -d -m 0755 $(@D)/include/leveldb
> >    $(TARGET_DIR)/usr/include/leveldb
> 
> What are you trying to do there? Are you trying to copy the directory
> $(@D)/include/leveldb and all its content over to
> $(TARGET_DIR)/usr/include/leveldb ?
> 
> If so, that's wrong. This should be installed in $(STAGING_DIR).

Yep, was my broken attempt to copy all the leveldb headers.

> Basically, we put all that is needed for development (headers, .so
> symlinks, shared and/or static libraries) in $(STAGING_DIR), and all
> that is needed at runtime (shared libraries) in $(TARGET_DIR).

That's what I was missing before. RTFM, sorry.
 
> > endef
> > 
> > $(eval $(generic-package))
> 
> All the comments above are not in anyway a mean to turn down this patch,
> but are made so that the code we get in Buildroot meets our standards so
> that it is maintainable over the long run, and also so you can improve
> and gain some more knowledge of Buildroot internals.

No problem. I appreciate the attention to detail and thanks for the review.

> Care to address all the above and respin a new version, please?

It's on its way.

> Thank you again for your contribution, it is much appreciated! :-)
> 
> Regards,
> Yann E. MORIN.

And thanks for the welcome Yann,
Regards,
Steve.
