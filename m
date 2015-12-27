From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Dec 2015 12:44:52 +0100
Subject: [Buildroot] [PATCHv3] toolchain: granular choice for stack
	protector
In-Reply-To: <CAKbGBLhQahOvac7XK7EWsQcK_6Um+j4_f0a+ZD3Td7sitpm9xg@mail.gmail.com>
References: <1451214451-26133-1-git-send-email-yann.morin.1998@free.fr>
 <CAKbGBLhQahOvac7XK7EWsQcK_6Um+j4_f0a+ZD3Td7sitpm9xg@mail.gmail.com>
Message-ID: <20151227114452.GE3483@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steven, All,

On 2015-12-27 03:39 -0800, Steven Noonan spake thusly:
> On Sun, Dec 27, 2015 at 3:07 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > From: Steven Noonan <steven@uplinklabs.net>
> >
> > Currently, we only support two levels of stach-smashing protection:
> >   - entirely disabled,
> >   - protect _all_ functions with -fstack-protector-all.
> >
> > -fstack-protector-all tends to be far too aggressive and impacts
> > performance too much to be worth on a real product.
> >
> > Add a choice that allows us to select between different levels of
> > stack-smashing protection:
> >   - none
> >   - basic   (NEW)
> >   - strong  (NEW)
> >   - all
> >
> > The differences are documented in the GCC online documentation:
> >     https://gcc.gnu.org/onlinedocs/gcc-4.9.2/gcc/Optimize-Options.html
[--SNIP--]
> > -config BR2_ENABLE_SSP
> > +choice
> >         bool "build code with Stack Smashing Protection"
> > -       depends on BR2_TOOLCHAIN_HAS_SSP
> > +       default BR2_SSP_ALL if BR2_ENABLE_SSP # legacy
> 
> Oh, wait I think I misread this -- I take back my previous comments.
> We weren't changing the default of SSP enabled or disabled, but rather
> the default SSP type when it's enabled.
> 
> When SSP is *enabled* (BR2_ENABLE_SSP) the default should be
> BR2_SSP_STRONG (if available). It's generates code that's
> better-protected than BR2_SSP_REGULAR, but faster and smaller than
> BR2_SSP_ALL.
> 
> Only crazy folks would use BR2_SSP_ALL if BR2_SSP_STRONG is an option. ;)

No, we want the legacy BR2_ENABLE_SSP symbol to set the same default as
it previously represented.

Currently, BR2_ENABLE_SSP meant 'ssp-all' so we want to keep that
behaviour.

Regards,
Yann E. MORIN.

> >         help
> > -         Enable stack smashing protection support using GCCs
> > -         -fstack-protector-all option.
> > +         Enable stack smashing protection support using GCC's
> > +         -fstack-protector option family.
> >
> >           See http://www.linuxfromscratch.org/hints/downloads/files/ssp.txt
> >           for details.
> > @@ -536,9 +536,47 @@ config BR2_ENABLE_SSP
> >           support. This is always the case for glibc and eglibc
> >           toolchain, but is optional in uClibc toolchains.
> >
> > -comment "enabling Stack Smashing Protection requires support in the toolchain"
> > +config BR2_SSP_NONE
> > +       bool "None"
> > +       help
> > +         Disable stack-smashing protection.
> > +
> > +comment "Stack Smashing Protection needs a toolchain w/ SSP"
> >         depends on !BR2_TOOLCHAIN_HAS_SSP
> >
> > +config BR2_SSP_REGULAR
> > +       bool "-fstack-protector"
> > +       depends on BR2_TOOLCHAIN_HAS_SSP
> > +       help
> > +         Emit extra code to check for buffer overflows, such as stack
> > +         smashing attacks. This is done by adding a guard variable to
> > +         functions with vulnerable objects. This includes functions
> > +         that call alloca, and functions with buffers larger than 8
> > +         bytes. The guards are initialized when a function is entered
> > +         and then checked when the function exits. If a guard check
> > +         fails, an error message is printed and the program exits.
> > +
> > +config BR2_SSP_STRONG
> > +       bool "-fstack-protector-strong"
> > +       depends on BR2_TOOLCHAIN_HAS_SSP
> > +       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> > +       help
> > +         Like -fstack-protector but includes additional functions to be
> > +         protected - those that have local array definitions, or have
> > +         references to local frame addresses.
> > +
> > +comment "Stack Smashing Protection strong needs a toolchain w/ gcc >= 4.9"
> > +       depends on BR2_TOOLCHAIN_HAS_SSP
> > +       depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> > +
> > +config BR2_SSP_ALL
> > +       bool "-fstack-protector-all"
> > +       depends on BR2_TOOLCHAIN_HAS_SSP
> > +       help
> > +         Like -fstack-protector except that all functions are protected.
> > +
> > +endchoice
> > +
> >  choice
> >         bool "libraries"
> >         default BR2_SHARED_LIBS if BR2_BINFMT_SUPPORTS_SHARED
> > diff --git a/Config.in.legacy b/Config.in.legacy
> > index 2628796..5d45d04 100644
> > --- a/Config.in.legacy
> > +++ b/Config.in.legacy
> > @@ -145,6 +145,14 @@ endif
> >  ###############################################################################
> >  comment "Legacy options removed in 2016.02"
> >
> > +# BR2_ENABLE_SSP is still referenced in Config.in (default in choice)
> > +config BR2_ENABLE_SSP
> > +       bool "Stack Smashing protection now has different levels"
> > +       help
> > +         The protection offered by SSP can now be selected from different
> > +         protection levels. Be sure to review the SSP level in the build
> > +         options menu.
> > +
> >  config BR2_PACKAGE_DIRECTFB_CLE266
> >         bool "cle266 driver for directfb removed"
> >         select BR2_LEGACY
> > diff --git a/package/Makefile.in b/package/Makefile.in
> > index 82a66c2..c5652af 100644
> > --- a/package/Makefile.in
> > +++ b/package/Makefile.in
> > @@ -159,7 +159,13 @@ TARGET_CFLAGS += -msep-data
> >  TARGET_CXXFLAGS += -msep-data
> >  endif
> >
> > -ifeq ($(BR2_ENABLE_SSP),y)
> > +ifeq ($(BR2_SSP_REGULAR),y)
> > +TARGET_CFLAGS += -fstack-protector
> > +TARGET_CXXFLAGS += -fstack-protector
> > +else ifeq ($(BR2_SSP_STRONG),y)
> > +TARGET_CFLAGS += -fstack-protector-strong
> > +TARGET_CXXFLAGS += -fstack-protector-strong
> > +else ifeq ($(BR2_SSP_ALL),y)
> >  TARGET_CFLAGS += -fstack-protector-all
> >  TARGET_CXXFLAGS += -fstack-protector-all
> >  endif
> > --
> > 1.9.1
> >

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
