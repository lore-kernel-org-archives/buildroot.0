From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 28 Sep 2007 20:53:46 +0200
Subject: [Buildroot] AVR32 misery
In-Reply-To: <20070928162433.GI20951@aon.at>
References: <1190938123.5322.54.camel@elrond.atmel.sweden>
	<1190956802.18129.2.camel@localhost.localdomain>
	<1190961727.5322.70.camel@elrond.atmel.sweden>
	<20070928162433.GI20951@aon.at>
Message-ID: <1191005626.5322.216.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2007-09-28 klockan 18:24 +0200 skrev Bernhard Fischer:
> On Fri, Sep 28, 2007 at 08:42:07AM +0200, Ulf Samuelsson wrote:
> >fre 2007-09-28 klockan 07:20 +0200 skrev Hans-Christian Egtvedt:
> >> On Fri, 2007-09-28 at 02:08 +0200, Ulf Samuelsson wrote:
> >> > I think I have found one problem
> >> > "toolchain_build_avr32/gcc-4.1.2-initial/gcc/as" is a script file
> >> > which should call the assembler.
> >> > 
> >> > It contains
> >> > 
> >> > #!/bin/sh
> >> > exec "$@"
> >> > 
> >> > and should contain:
> >> > #!/bin/sh
> >> > exec <buildroot>/build_avr32/staging_dir/bin/avr32-linux-uclibc-ld "$@"
> >> 
> >> This should really not mather, because the PATH variable should be set
> >> before starting to compile the cross-compiler.
> >> 
> >> Perhaps this is as easy as a missing TARGET_CONFIGURE_OPTS?
> >> 
> >
> >I have added ORIGINAL_*_FOR_TARGET /DEFAULT_*/*_FOR_TARGET to
> >HOST_CONFIGURE_OPTS 
> >(it fails during gcc-4.1.2-final) 
> >And now use HOST_CONFIGURE_OPTS for configure and make.
> 
> Passing CONFIGURE_OPTS to make after an autoconf'igured package was
> configured is not needed

Assuming that the package is well behaved.

Packages which contains subdirectories which are 
configured separately typically fail miserably if you do not 
make $(TARGET_CONFIGURE_OPTS) -C $(DIR)
Haven't you noticed that?

I dread packages which contains configuration down a third level...


> >As a result, it seems that ld/nm/objcopy now has the right path,
> >but the assembler doesn't.
> >
> >	     echo '#!$(SHELL)' > as; \
> >	     echo 'exec $(ORIGINAL_AS_FOR_TARGET) "$$@"' >> as ; \
> >
> >results in as containing
> >+++++++++++++++
> >#!/bin/bash
> >exec "$@"
> >---------------
> >
> >I suspect, I have to configure with "-with-gnu-as" or with 
> >"-with-as=$(STAGING_DIR)/../*-as"as well,
> >(It is already configured with "-with-gnu-ld")
> >and the machine is working overtime, testing that at the moment.
> 
> We don't need to pass --with-gnu-ld nor --with-gnu-as. If sombody finds
> a different assembler or linker, then this is a consequence of something
> going wrong previously. The target is linux and not irix or something
> like that.

Well gcc-4.1.2 doesn't find anything apparently 
unless you bombard it with information during configure.
-with-as=$(CROSS_COMPILE)as seems absolutely neccessary.
or ORIGINAL_AS_FOR_TARGET will be empty.

Empty ORIGINAL_AS_FOR_TARGET is why sysroot fails.
Still gcc-4.1.2 has problems with libtool.

BR
Ulf Samuelsson
