From: Cyril Bur <cyrilbur@gmail.com>
Date: Thu, 17 Dec 2015 12:45:06 +1100
Subject: [Buildroot] [PATCH] linux: Build and install kernel selftests
In-Reply-To: <20151214221846.GD4152@free.fr>
References: <1448409222-4510-1-git-send-email-cyrilbur@gmail.com>
 <1448409222-4510-2-git-send-email-cyrilbur@gmail.com>
 <20151214221846.GD4152@free.fr>
Message-ID: <20151217124506.616549d9@camb691>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Dec 2015 23:18:46 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Cyril, All,
> 
> Sorry for the delay, but I'm now looking at this patch...
> 

Hi Yann,

No worries, thanks for getting around to it and thanks for review.

> On 2015-11-25 10:53 +1100, Cyril Bur spake thusly:
> > This patch simply adds the ability to compile and install the kernel
> > selftests into the target.
> > 
> > This is likely to be a rarely used debugging/performance feature for
> > development and unlikely to be used in a production configuration.
> > 
> > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> > ---
> >  linux/Config.tools.in         | 12 ++++++++++++
> >  linux/linux-tool-selftests.mk | 40 ++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 52 insertions(+)
> >  create mode 100644 linux/linux-tool-selftests.mk
> > 
> > diff --git a/linux/Config.tools.in b/linux/Config.tools.in
> > index 24ef8cd..68655dc 100644
> > --- a/linux/Config.tools.in
> > +++ b/linux/Config.tools.in
> > @@ -26,4 +26,16 @@ config BR2_LINUX_KERNEL_TOOL_PERF
> >  
> >  	  https://perf.wiki.kernel.org/
> >  
> > +config BR2_LINUX_KERNEL_TOOL_SELFTESTS
> > +	bool "selftests"  
> 
> Since the .mk has:
>     SELFTESTS_DEPENDENCIES = bash
> 
> then you must either depend on bash or select it here. I think a select
> is better, so:
> 
>     depends on BR2_USE_MMU  # bash
>     select BR2_PACKAGE_BASH
> 
> > +	help
> > +	  Build and install (to /usr/lib/selftests) kernel selftests.  
> 
> Why do you install in there?
> 

I was really quite a bit random, don't have any preferred place myself.

> I'm not sure what the kernel selftests are, but two options:
>   - if they are executables, they should go into /usr/sbin
>   - if they are libraries, they should go in /usr/lib

So I think I initially put them in /bin for testing but its odd because they
have quite a directory structure to them, so /bin/selftests/x/y/z felt odd.
Theres a runtests script that expects that too otherwise all the binaries
*could* be dumped into /usr/sbin.

They aren't libraries either though I agree but then its not like the
executables really do anything, in a way they are more like a 'library of
tests'

Happy to defer to you on that one.

> 
> > +	  Use of this option implies you know the process using and compiling
> > +	  the kernel selftests. The Makefile to build and install these is very
> > +	  noisy and may appear to cause your build to fail for strange reasons.
> > +
> > +	  This is very much a use at your risk option and may not work for
> > +	  every setup or every architecture.
> > +
> >  endmenu
> > diff --git a/linux/linux-tool-selftests.mk b/linux/linux-tool-selftests.mk
> > new file mode 100644
> > index 0000000..573ba0c
> > --- /dev/null
> > +++ b/linux/linux-tool-selftests.mk
> > @@ -0,0 +1,40 @@
> > +################################################################################
> > +#
> > +# selftests
> > +#
> > +################################################################################
> > +
> > +LINUX_TOOLS += selftests  
> 
> linux-tool infrastructure. Yeah! :-)
> 

I thought doing this was going to be a massive headache and then I found
linux-tool infrastructure and it's exactly what I need, long live buildroot! :)

> > +ifeq ($(KERNEL_ARCH),x86_64)
> > +SELFTESTS_ARCH=x86
> > +else
> > +SELFTESTS_ARCH=$(KERNEL_ARCH)
> > +endif  
> 
> Not related to your patch, but I wonder if we should not make that a
> common conditional, so that all tools do not have to repeat it.
> 
> Since there are only two such tool (with selftests) that do it, it can
> be put aside for now, and we can revisit it later.
> 

That does make sense, totally agreed. I'll ponder too :)

> > +SELFTESTS_DEPENDENCIES = bash
> > +
> > +SELFTESTS_INSTALL_STAGING = YES  
> 
> Why install it in staging?
> 

I actually hadn't initially but I did get to a point in my work where I had
to objdump a test binary. So, since I needed it, it stayed.

> > +SELFTESTS_MAKE_FLAGS = \
> > +	$(LINUX_MAKE_FLAGS) \
> > +	ARCH=$(SELFTESTS_ARCH)
> > +
> > +# O must be redefined here to overwrite the one used by Buildroot for
> > +# out of tree build. We build the selftests in $(@D)/tools/selftests and
> > +# not just $(@D) so that it isn't built in the root directory of the kernel
> > +# sources.
> > +define SELFTESTS_BUILD_CMDS
> > +	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) headers_install  
> 
> Headers are target dependent, so I think you also need to pass
> $(SELFTESTS_MAKE_FLAGS) in there, no?
> 

Quite possible that you're right, this might explain somethings I was seeing.
Thanks.

> Why are headers needed?
> 

Unfortunately a few of the Makefiles do:
CFLAGS += -I../../../../usr/include/

There are other ways around the problem but this was the easiest.

> > +	$(TARGET_MAKE_ENV) $(MAKE1) $(SELFTESTS_MAKE_FLAGS) \
> > +		-C $(@D)/tools/testing/selftests O=$(@D)/tools/testing/selftests  
> 
> I prefer when the -C args are passed early (if possible first) because
> it is then much obvious where the build is taking place:
> 
>     $(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)/tools/testing/selftests \
>         $(SELFTESTS_MAKE_FLAGS) \
>         O=$(@D)/tools/testing/selftests
> 

Sure, will fix.

> > +endef
> > +
> > +define SELFTESTS_INSTALL_STAGING_CMDS
> > +	$(TARGET_MAKE_ENV) $(MAKE1) INSTALL_PATH=$(STAGING_DIR)/usr/lib/selftests $(SELFTESTS_MAKE_FLAGS) \
> > +		-C $(@D)/tools/testing/selftests install  
> 
> Line too long, split it to below ~72 chars; also, I prefer we keep the
> generic flags early; probably you also have to repeat the O arg:
> 
>     $(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)/tools/testing/selftests \
>         $(SELFTESTS_MAKE_FLAGS) \
>         O=$(@D)/tools/testing/selftests \
>         INSTALL_PATH=$(STAGING_DIR)/usr/lib/selftests \
>         install
> 
Thanks!


> > +endef
> > +
> > +define SELFTESTS_INSTALL_TARGET_CMDS
> > +	$(TARGET_MAKE_ENV) $(MAKE1) INSTALL_PATH=$(TARGET_DIR)/usr/lib/selftests $(SELFTESTS_MAKE_FLAGS) \
> > +		-C $(@D)/tools/testing/selftests install  
> 
> Ditto.
> 
> Regards,
> Yann E. MORIN.
> 

Thanks for the review,

Cyril.

> > +endef
> > -- 
> > 2.6.2
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot  
> 
