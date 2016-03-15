From: Cyril Bur <cyrilbur@gmail.com>
Date: Wed, 16 Mar 2016 09:09:32 +1100
Subject: [Buildroot] [PATCH v2] linux: Build and install kernel selftests
In-Reply-To: <20160315092413.GA7196@free.fr>
References: <1451869172-16621-1-git-send-email-cyrilbur@gmail.com>
 <20160315092413.GA7196@free.fr>
Message-ID: <20160316090932.1f2681b1@camb691>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Mar 2016 10:24:13 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Cyril, All,
> 
> On 2016-01-04 11:59 +1100, Cyril Bur spake thusly:
> > This patch simply adds the ability to compile and install the kernel
> > selftests into the target at /usr/lib/kselftests. The rationale behind
> > /usr/lib is that the selftests have subdirectories where they are installed
> > which makes them unsuitable to be placed in /usr/sbin as this would result
> > in /usr/sbin/kselftests/x/y/z. While the selftests aren't libraries either,
> > they don't achieve much as a standalone binary so they can be considered to
> > be a 'library of tests' making /usr/lib sensible.
> > 
> > The selftests require that the kernel headers be installed into the kernel
> > build tree as some of the selftests have a hardcoded CFLAGS to include
> > kernel headers (CFLAGS += -I../../../../usr/include/). This is most easily
> > achieved by using the make ... headers_install inside the kernel build dir.
> > 
> > This is likely to be a rarely used debugging/performance feature for
> > development and unlikely to be used in a production configuration.  
> 
> So I finally take some time to review this new iteration; sorry for the
> delay... :-/

Hi Yann,

No worries, thanks for taking the time.

> 
> > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> > ---  
> [--SNIP--]
> > diff --git a/linux/linux-tool-selftests.mk b/linux/linux-tool-selftests.mk
> > new file mode 100644
> > index 0000000..b610599
> > --- /dev/null
> > +++ b/linux/linux-tool-selftests.mk
> > @@ -0,0 +1,42 @@
> > +################################################################################
> > +#
> > +# selftests
> > +#
> > +################################################################################
> > +
> > +LINUX_TOOLS += selftests
> > +
> > +ifeq ($(KERNEL_ARCH),x86_64)  
> 
> For i386, Buildroot sets KERNEL_ARCH=i386, so we may also want to handle
> that case, no?
> 

I think you're right but not super sure... I'll leave it up to an x86 boffin to
confirm that it's the correct thing to do :)

> > +SELFTESTS_ARCH=x86  
> 
> I know the other linux-tools don't, but I think we should call that
> linux-selftests (so LINUX_SEFLTESTS_ARCH and so on) to avoid name
> clashing with other packages.

Yeah that's a good idea.

> 
> > +else
> > +SELFTESTS_ARCH=$(KERNEL_ARCH)
> > +endif
> > +
> > +SELFTESTS_DEPENDENCIES = bash  
> 
> It can also use libcap-ng, so you probably want to depend on it, too:
> 
>     /home/ymorin/dev/buildroot/O/host/usr/bin/i686-pc-linux-gnu-gcc -O2 -g
>       -std=gnu99 -Wall    validate_cap.c  -lcap-ng -lrt -ldl -o validate_cap
>     validate_cap.c:1:20: fatal error: cap-ng.h: No such file or directory
> 
> Ditto popt:
> 
>     /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/
>     i686-pc-linux-gnu/4.7.2/../../../../i686-pc-linux-gnu/bin/ld: cannot
>     find -lpopt
>     collect2: error: ld returned 1 exit status
> 

I could add those dependencies I suppose, it would be nicer for everyone.

> However, as you said in the commit log, those are not fatal errors
> (although reported as such) and the build goes on successfully for the
> rest of the tests:
> 
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Are you happy for me to do a v3 based on your comments and leave both the
Reviewed-by and Tested-by tags?

Also, for what its worth, I've built and used it a lot for powerpc.

Thanks again,

Cyril

> [build-tested only, for i386]
> 
> Regards,
> Yann E. MORIN.
> 
> > +SELFTESTS_MAKE_FLAGS = \
> > +	$(LINUX_MAKE_FLAGS) \
> > +	ARCH=$(SELFTESTS_ARCH)
> > +
> > +# O must be redefined here to overwrite the one used by Buildroot for
> > +# out of tree build. We build the selftests in $(@D)/tools/selftests and
> > +# not just $(@D) so that it isn't built in the root directory of the kernel
> > +# sources.
> > +#
> > +# The headers_install step here is important as some kernel selftests use a
> > +# hardcoded CFLAGS to find kernel headers e.g:
> > +# CFLAGS += -I../../../../usr/include/
> > +# The headers_install target will install the kernel headers locally inside
> > +# the Linux build dir
> > +define SELFTESTS_BUILD_CMDS
> > +	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(SELFTESTS_MAKE_FLAGS) \
> > +		headers_install
> > +	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)/tools/testing/selftests \
> > +		$(SELFTESTS_MAKE_FLAGS) O=$(@D)/tools/testing/selftests
> > +endef
> > +
> > +define SELFTESTS_INSTALL_TARGET_CMDS
> > +	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)/tools/testing/selftests \
> > +		$(SELFTESTS_MAKE_FLAGS) O=$(@D)/tools/testing/selftests \
> > +		INSTALL_PATH=$(TARGET_DIR)/usr/lib/kselftests install
> > +endef
> > -- 
> > 2.6.4
> >   
> 
