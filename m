From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Aug 2013 07:59:04 +0200
Subject: [Buildroot] List of pending patches: what to do?
In-Reply-To: <CAAXf6LVc5T9=hCTwdiCz+HcfaU9wt8Ypk+9fiQm6pNX6wdxJJw@mail.gmail.com>
References: <20130731191415.545f7dff@skate>
 <CAAXf6LVc5T9=hCTwdiCz+HcfaU9wt8Ypk+9fiQm6pNX6wdxJJw@mail.gmail.com>
Message-ID: <20130801075904.04598ad8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 31 Jul 2013 22:45:28 +0200, Thomas De Schampheleire wrote:

> > http://patchwork.ozlabs.org/patch/188525 Question about 64Bit kernel and 32Bit applications
> 
> Can be closed, that problem was fixed differently.

Done.

> > http://patchwork.ozlabs.org/patch/201313 Passing arguments to the linker when external toolchain is used.
> 
> Can also be closed for the same reason.

Done.

> > http://patchwork.ozlabs.org/patch/207717 dtb: provide option to install dtb to boot directory
> 
> At first sight, this feature is already present but with a slightly
> different implementation. Could you double-check?

Yes, I need to have a look today at several DTB/uImage/initramfs
patches against linux.mk, I'll try to have a look at that one.

> > http://patchwork.ozlabs.org/patch/231856 Install DTB as part of images install command
> 
> Seems to have been acked by several people, can be applied as-is?

Agreed.

> > http://patchwork.ozlabs.org/patch/241250 toolchain/gcc: Introduce BR2_ARCH_HAS_GCC_x_y_PLUS
> 
> Needs to be updated to latest buildroot, but has been acked by Arnout
> before, after two other iterations.

I'd be inclined to post-pone that for 2013.11, but I can merge it as
soon as -next opens.

> > http://patchwork.ozlabs.org/patch/249635 UCLIBC_EXTRA_CFLAGS in uClibc overridden while using buildroot
> > http://patchwork.ozlabs.org/patch/249855 UCLIBC_EXTRA_CFLAGS in uClibc overridden while using buildroot
> 
> Former is the old one, can be closed.

Apparently someone marked 249635 as superseded in the mean time.

> > http://patchwork.ozlabs.org/patch/256744 tar: avoid ccache chicken and egg problem when bootstrapping tar
> 
> I'm going to test this.

Ok.

> > http://patchwork.ozlabs.org/patch/260246 xzcat: treat as host prerequisite and build if needed
> 
> This is one of mine, feedback would be welcome. I tested it and it works :)

The only part I'm not entirely happy with is:

-		DL_TOOLS="$(sort $(DL_TOOLS_DEPENDENCIES))" \
+		DL_TOOLS="$(sort $(filter-out $(XZCAT),$(DL_TOOLS_DEPENDENCIES)))" \

This looks like very special-case filtering. It sounds odd to add xzcat
to DL_TOOLS_DEPENDENCIES to later remove it when DL_TOOLS_DEPENDENCIES
is used. I think I'd prefer something along the lines of (but it'd be
great if a temporary variable could be used for the $(firstword ...)
thing) :

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index b8eaa98..435a1c6 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -539,7 +539,11 @@ else ifeq ($$($(2)_SITE_METHOD),hg)
 DL_TOOLS_DEPENDENCIES += hg
 endif # SITE_METHOD
 
+# Do not add xzcat to the list of required dependencies, as it gets
+# built automatically if it isn't found.
+ifneq ($(firstword $(INFLATE$(suffix $($(2)_SOURCE)))),$(XZCAT))
 DL_TOOLS_DEPENDENCIES += $(firstword $(INFLATE$(suffix $($(2)_SOURCE))))
+endif
 
 endif # $(2)_KCONFIG_VAR
 endef # inner-generic-package

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
