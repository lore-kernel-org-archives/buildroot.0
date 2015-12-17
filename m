From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Dec 2015 19:07:35 +0100
Subject: [Buildroot] [PATCH] linux: Build and install kernel selftests
In-Reply-To: <20151217124506.616549d9@camb691>
References: <1448409222-4510-1-git-send-email-cyrilbur@gmail.com>
 <1448409222-4510-2-git-send-email-cyrilbur@gmail.com>
 <20151214221846.GD4152@free.fr> <20151217124506.616549d9@camb691>
Message-ID: <20151217180735.GA3653@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cyril, All,

On 2015-12-17 12:45 +1100, Cyril Bur spake thusly:
> On Mon, 14 Dec 2015 23:18:46 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > On 2015-11-25 10:53 +1100, Cyril Bur spake thusly:
> > > This patch simply adds the ability to compile and install the kernel
> > > selftests into the target.
> > > 
> > > This is likely to be a rarely used debugging/performance feature for
> > > development and unlikely to be used in a production configuration.
> > > 
> > > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> > > ---
> > >  linux/Config.tools.in         | 12 ++++++++++++
> > >  linux/linux-tool-selftests.mk | 40 ++++++++++++++++++++++++++++++++++++++++
> > >  2 files changed, 52 insertions(+)
> > >  create mode 100644 linux/linux-tool-selftests.mk
> > > 
> > > diff --git a/linux/Config.tools.in b/linux/Config.tools.in
> > > index 24ef8cd..68655dc 100644
> > > --- a/linux/Config.tools.in
> > > +++ b/linux/Config.tools.in
> > > @@ -26,4 +26,16 @@ config BR2_LINUX_KERNEL_TOOL_PERF
> > >  
> > >  	  https://perf.wiki.kernel.org/
> > >  
> > > +config BR2_LINUX_KERNEL_TOOL_SELFTESTS
> > > +	bool "selftests"  
> > 
> > Since the .mk has:
> >     SELFTESTS_DEPENDENCIES = bash
> > 
> > then you must either depend on bash or select it here. I think a select
> > is better, so:
> > 
> >     depends on BR2_USE_MMU  # bash
> >     select BR2_PACKAGE_BASH
> > 
> > > +	help
> > > +	  Build and install (to /usr/lib/selftests) kernel selftests.  
> > 
> > Why do you install in there?
> > 
> 
> I was really quite a bit random, don't have any preferred place myself.
> 
> > I'm not sure what the kernel selftests are, but two options:
> >   - if they are executables, they should go into /usr/sbin
> >   - if they are libraries, they should go in /usr/lib
> 
> So I think I initially put them in /bin for testing but its odd because they
> have quite a directory structure to them, so /bin/selftests/x/y/z felt odd.
> Theres a runtests script that expects that too otherwise all the binaries
> *could* be dumped into /usr/sbin.
> 
> They aren't libraries either though I agree but then its not like the
> executables really do anything, in a way they are more like a 'library of
> tests'
> 
> Happy to defer to you on that one.

OK, your explanations is good for me. Still, the directory is not
completely to my taste, since it does not refer to the kernel. What
about either of:
    /usr/lib/linux-selftests
    /usr/lib/kselftests

My preference would be for the second, but if you have a better idea,
feel free to improvise! ;-)

That should probably be explained in the commit log.

[--SNIP--]
> > > +ifeq ($(KERNEL_ARCH),x86_64)
> > > +SELFTESTS_ARCH=x86
> > > +else
> > > +SELFTESTS_ARCH=$(KERNEL_ARCH)
> > > +endif  
> > 
> > Not related to your patch, but I wonder if we should not make that a
> > common conditional, so that all tools do not have to repeat it.
> > 
> > Since there are only two such tool (with selftests) that do it, it can
> > be put aside for now, and we can revisit it later.
> That does make sense, totally agreed. I'll ponder too :)

Really, just let that as-is for now. Two packages doing exactly the same
think is OK. We try to commonalise stuff when a lot of packages want to
do the same thing. 2 is not "a lot". ;-)

> > > +SELFTESTS_DEPENDENCIES = bash
> > > +
> > > +SELFTESTS_INSTALL_STAGING = YES  
> > 
> > Why install it in staging?
> 
> I actually hadn't initially but I did get to a point in my work where I had
> to objdump a test binary. So, since I needed it, it stayed.

But can't you objdump the binaries that are installed in target/ instead?

> > > +SELFTESTS_MAKE_FLAGS = \
> > > +	$(LINUX_MAKE_FLAGS) \
> > > +	ARCH=$(SELFTESTS_ARCH)
> > > +
> > > +# O must be redefined here to overwrite the one used by Buildroot for
> > > +# out of tree build. We build the selftests in $(@D)/tools/selftests and
> > > +# not just $(@D) so that it isn't built in the root directory of the kernel
> > > +# sources.
> > > +define SELFTESTS_BUILD_CMDS
> > > +	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) headers_install  
[--SNIP--]
> > Why are headers needed?
> 
> Unfortunately a few of the Makefiles do:
> CFLAGS += -I../../../../usr/include/
> 
> There are other ways around the problem but this was the easiest.

OK, your solution is acceptable. But please add a comment just above,
tha texplains why this is needed, like so;

    # Lots of selftests use hard-coded CFLAGS to find the headers
    # like:  CFLAGS += -I../../../../usr/include/
    # So we insall them locally *inside* the kernel source tree
    make blabla headers_install

Basically, add a comment whenever what you do, or the reason why you do
it, is not obvious. And it also probably warrants some explanations in
the commit log as well.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
