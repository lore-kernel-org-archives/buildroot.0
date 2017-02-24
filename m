From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Fri, 24 Feb 2017 15:07:13 +1100
Subject: [Buildroot] [RFC PATCH 1/2] package/gobject-introspection: add
 package
In-Reply-To: <20170223101820.127d5700@free-electrons.com>
References: <cover.1487811280.git.sam.bobroff@au1.ibm.com>
 <b5cbc35d4d8e4457563fdf5b8dfd04360c6616a5.1487811280.git.sam.bobroff@au1.ibm.com>
 <20170223101820.127d5700@free-electrons.com>
Message-ID: <20170224040713.GA4446@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 23, 2017 at 10:18:20AM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 23 Feb 2017 11:54:54 +1100, Sam Bobroff wrote:
> > Add gobject-introspection, built using host-qemu.
> 
> Ouch, this is complicated dependency. Have you taken into account that
> it's only available for some architectures? Also there's the major
> issue of kernel headers version between host and target. See the
> comment in qemu.mk:
> 
> # The principle of qemu-user is that it emulates the instructions of
> # the target architecture when running the binary, and then when this
> # binary does a system call, it converts this system call into a
> # system call on the host machine. This mechanism makes an assumption:
> # that the target binary will not do system calls that do not exist on
> # the host. This basically requires that the target binary should be
> # built with kernel headers that are older or the same as the kernel
> # version running on the host machine.
> 
> This makes using host-qemu user mode emulation very unpractical,
> because you must have target kernel headers older than the host kernel
> headers, which is frequently not true.

Yes, absolutely, and I really don't know how we should handle it. I
searched fairly hard for another solution but the only other one seems
to be to rewrite gobject-introspection completely and the other
projects that have attempted this have used the same host-qemu approach
(that's yocto and cygwin).

I suppose what we want is to make this available but to make the
constraints obvious so that noone is confused when it doesn't work.

I thought about adding some text to the QEMU section of the menuconfig
to explain the constraint but I couldn't work out how to make it useful,
because gobject-introspection will select host-QEMU usermode by
dependency so a user may never go to the QEMU section. I suppose we
could remove the auto-selection and force users to go select QEMU
manually. Maybe?

Would a comment in the menuconfig section for gobject-introspection be
any better? It's more likely to be seen but it's not really the "right"
place -- you can run into the kernel version issue with QEMU usermode
without using gobject-introspection (although not during the build!).

But more generally, should buildroot accept this kind of solution at
all? It works and is useful but it significantly more complex and
therefore problem-prone than normal...

> > Also updates libglib2 to a more recent version to satasify a dependency.
> 
> Which dependency?

Oh right, good point. It's gobject-introspection itself but I'll fix the
comment.

> Your SoB line is missing.

Yes, and I also posted it as an RFC. I didn't want to misrepresent this
as ready for inclusion, or even that it will ever be included, given
what we're discussing up above about usermode QEMU.

> > diff --git a/package/gobject-introspection/0001-ldd-cross-launcher.patch b/package/gobject-introspection/0001-ldd-cross-launcher.patch
> > new file mode 100644
> > index 000000000..9129431cb
> > --- /dev/null
> > +++ b/package/gobject-introspection/0001-ldd-cross-launcher.patch
> > @@ -0,0 +1,22 @@
> > +*** a/giscanner/shlibs.py	2016-06-01 13:42:52.559661299 +1000
> > +--- b/giscanner/shlibs.py	2016-06-01 13:44:43.028025807 +1000
> > +***************
> > +*** 103,109 ****
> > +          if platform_system == 'Darwin':
> > +              args.extend(['otool', '-L', binary.args[0]])
> > +          else:
> > +!             args.extend(['ldd', binary.args[0]])
> > +          proc = subprocess.Popen(args, stdout=subprocess.PIPE)
> > +          patterns = {}
> > +          for library in libraries:
> > +--- 103,112 ----
> > +          if platform_system == 'Darwin':
> > +              args.extend(['otool', '-L', binary.args[0]])
> > +          else:
> > +!             ldd = os.getenv('GI_LDD')
> > +!             if not ldd:
> > +!                 ldd = 'ldd'
> > +!             args.extend([ldd, binary.args[0]])
> > +          proc = subprocess.Popen(args, stdout=subprocess.PIPE)
> > +          patterns = {}
> > +          for library in libraries:
> 
> Please use "diff -u" to generate patches. And more precisely, for
> projects using Git as their version control system, we want a Git
> formatted patch, i.e the result of "git format-patch".

Sorry I'll fix it for v2! (I generated that patch a long time ago). If
we're able to get this to a point where we think we'll include it in
buildroot, I'll try upstreaming it. It's upstream seems to be at least
somewhat active.

> > diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
> > new file mode 100644
> > index 000000000..253c20b30
> > --- /dev/null
> > +++ b/package/gobject-introspection/Config.in
> > @@ -0,0 +1,12 @@
> > +config BR2_PACKAGE_GOBJECT_INTROSPECTION
> > +    bool "gobject-introspection"
> 
> Indentation with tabs.

Done.

> > +    depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_3 # ldd
> 
> Not sure to see the relationship between ldd, which is provided by the
> C library, and the version of the compiler.

I'll remove this. It is cruft from an earlier version where I was trying
to pull ldd in from the toolchain (I think it's distributed with glibc)
but I gave up on that approach because it's not installed when buildroot
builds toolchains.

> > +    select BR2_PACKAGE_HOST_QEMU
> > +    select BR2_PACKAGE_PKGCONF
> 
> You really need pkgconf on the target? Seems unlikely.

Removed.

> 
> > +    select BR2_PACKAGE_LIBGLIB2
> > +    select BR2_PACKAGE_PYTHON
> > +
> 

> Unneeded empty line.

Removed.

> 
> > +    help
> > +      gobject-introspection
> 
> We want a better description here.

Will do.

> 
> > +
> > +      http://wiki.gnome.org/
> 
> And a better upstream URL here.

OK.

> 
> > +GOBJECT_INTROSPECTION_VERSION         = 1.51.1
> 
> Only one space before and after '=' sign.
> 
> > +GOBJECT_INTROSPECTION_SITE            = $(call github,GNOME,gobject-introspection,$(GOBJECT_INTROSPECTION_VERSION))
> 
> Not tarball releases?

There wasn't one I could find, but I re-checked (since you asked) and it
looks like there is one now!

I'll switch it over.

> > +GOBJECT_INTROSPECTION_LICENSE         = GPLv2+ LGPLv2.1
> 
> Licenses should be comma separated, and you should preferably indicate
> what is under LGPLv2.1 and what is under GPLv2+.

Ah, OK. Will do (I think I can do it correctly now).

> > +GOBJECT_INTROSPECTION_LICENSE_FILES   = COPYING COPYING.GPL COPYING.LGPL COPYING.lib COPYING.tools
> > +GOBJECT_INTROSPECTION_INSTALL_STAGING = YES
> > +GOBJECT_INTROSPECTION_MAKE_OPTS       = GI_CROSS_LAUNCHER="$(HOST_DIR)/usr/bin/qemu-$(HOST_QEMU_ARCH)" GI_LDD=$(STAGING_DIR)/usr/bin/ldd-cross INTROSPECTION_SCANNER=g-ir-scanner INTROSPECTION_COMPILER=g-ir-compiler
> 
> Please split long lines.

Done.

> > +GOBJECT_INTROSPECTION_DEPENDENCIES    = pkgconf python libglib2 host-qemu host-gobject-introspection
> > +HOST_GOBJECT_INTROSPECTION_DEPENDENCIES = host-pkgconf host-python host-libglib2 toolchain
> > +
> > +define GOBJECT_INTROSPECTION_BOOTSTRAP
> > +	cd $(GOBJECT_INTROSPECTION_DIR) && env NOCONFIGURE=1 ./autogen.sh --host=$(GNU_TARGET_NAME)
> 
> Please use <pkg>_AUTORECONF = YES. What you did is not correct because
> you will use autoconf/automake from the host machine instead of ones
> built by Buildroot.

Ah, good point but AUTORECONF fails, or as least it did. I'll
re-investigate and see if I can get it working.

If I can't, I'll document it properly so that we know what the actual
reason is.

> [... I did not yet review the rest of the .mk file....]
> 
> > -LIBGLIB2_VERSION_MAJOR = 2.50
> > -LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
> > +LIBGLIB2_VERSION_MAJOR = 2.51
> 
> This is a development/unstable version, so we typically don't package it in Buildroot.

Hmm, it may be the only version that can work but I'll see if I can get
a proper release one working.

> Best regards,
> 
> Thomas

Thanks!
Sam.
