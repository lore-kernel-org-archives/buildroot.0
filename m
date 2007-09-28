From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 28 Sep 2007 08:42:07 +0200
Subject: [Buildroot] AVR32 misery
In-Reply-To: <1190956802.18129.2.camel@localhost.localdomain>
References: <1190938123.5322.54.camel@elrond.atmel.sweden>
	<1190956802.18129.2.camel@localhost.localdomain>
Message-ID: <1190961727.5322.70.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2007-09-28 klockan 07:20 +0200 skrev Hans-Christian Egtvedt:
> On Fri, 2007-09-28 at 02:08 +0200, Ulf Samuelsson wrote:
> > I think I have found one problem
> > "toolchain_build_avr32/gcc-4.1.2-initial/gcc/as" is a script file
> > which should call the assembler.
> > 
> > It contains
> > 
> > #!/bin/sh
> > exec "$@"
> > 
> > and should contain:
> > #!/bin/sh
> > exec <buildroot>/build_avr32/staging_dir/bin/avr32-linux-uclibc-ld "$@"
> 
> This should really not mather, because the PATH variable should be set
> before starting to compile the cross-compiler.
> 
> Perhaps this is as easy as a missing TARGET_CONFIGURE_OPTS?
> 

I have added ORIGINAL_*_FOR_TARGET /DEFAULT_*/*_FOR_TARGET to
HOST_CONFIGURE_OPTS 
(it fails during gcc-4.1.2-final) 
And now use HOST_CONFIGURE_OPTS for configure and make.

As a result, it seems that ld/nm/objcopy now has the right path,
but the assembler doesn't.

	     echo '#!$(SHELL)' > as; \
	     echo 'exec $(ORIGINAL_AS_FOR_TARGET) "$$@"' >> as ; \

results in as containing
+++++++++++++++
#!/bin/bash
exec "$@"
---------------

I suspect, I have to configure with "-with-gnu-as" or with 
"-with-as=$(STAGING_DIR)/../*-as"as well,
(It is already configured with "-with-gnu-ld")
and the machine is working overtime, testing that at the moment.

Best Regards
Ulf Samuelsson
