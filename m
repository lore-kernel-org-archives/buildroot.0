From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 10:18:20 +0100
Subject: [Buildroot] [RFC PATCH 1/2] package/gobject-introspection: add
 package
In-Reply-To: <b5cbc35d4d8e4457563fdf5b8dfd04360c6616a5.1487811280.git.sam.bobroff@au1.ibm.com>
References: <cover.1487811280.git.sam.bobroff@au1.ibm.com>
 <b5cbc35d4d8e4457563fdf5b8dfd04360c6616a5.1487811280.git.sam.bobroff@au1.ibm.com>
Message-ID: <20170223101820.127d5700@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Feb 2017 11:54:54 +1100, Sam Bobroff wrote:
> Add gobject-introspection, built using host-qemu.

Ouch, this is complicated dependency. Have you taken into account that
it's only available for some architectures? Also there's the major
issue of kernel headers version between host and target. See the
comment in qemu.mk:

# The principle of qemu-user is that it emulates the instructions of
# the target architecture when running the binary, and then when this
# binary does a system call, it converts this system call into a
# system call on the host machine. This mechanism makes an assumption:
# that the target binary will not do system calls that do not exist on
# the host. This basically requires that the target binary should be
# built with kernel headers that are older or the same as the kernel
# version running on the host machine.

This makes using host-qemu user mode emulation very unpractical,
because you must have target kernel headers older than the host kernel
headers, which is frequently not true.

> Also updates libglib2 to a more recent version to satasify a dependency.

Which dependency?

Your SoB line is missing.

> diff --git a/package/gobject-introspection/0001-ldd-cross-launcher.patch b/package/gobject-introspection/0001-ldd-cross-launcher.patch
> new file mode 100644
> index 000000000..9129431cb
> --- /dev/null
> +++ b/package/gobject-introspection/0001-ldd-cross-launcher.patch
> @@ -0,0 +1,22 @@
> +*** a/giscanner/shlibs.py	2016-06-01 13:42:52.559661299 +1000
> +--- b/giscanner/shlibs.py	2016-06-01 13:44:43.028025807 +1000
> +***************
> +*** 103,109 ****
> +          if platform_system == 'Darwin':
> +              args.extend(['otool', '-L', binary.args[0]])
> +          else:
> +!             args.extend(['ldd', binary.args[0]])
> +          proc = subprocess.Popen(args, stdout=subprocess.PIPE)
> +          patterns = {}
> +          for library in libraries:
> +--- 103,112 ----
> +          if platform_system == 'Darwin':
> +              args.extend(['otool', '-L', binary.args[0]])
> +          else:
> +!             ldd = os.getenv('GI_LDD')
> +!             if not ldd:
> +!                 ldd = 'ldd'
> +!             args.extend([ldd, binary.args[0]])
> +          proc = subprocess.Popen(args, stdout=subprocess.PIPE)
> +          patterns = {}
> +          for library in libraries:

Please use "diff -u" to generate patches. And more precisely, for
projects using Git as their version control system, we want a Git
formatted patch, i.e the result of "git format-patch".

> diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
> new file mode 100644
> index 000000000..253c20b30
> --- /dev/null
> +++ b/package/gobject-introspection/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_GOBJECT_INTROSPECTION
> +    bool "gobject-introspection"

Indentation with tabs.

> +    depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_3 # ldd

Not sure to see the relationship between ldd, which is provided by the
C library, and the version of the compiler.

> +    select BR2_PACKAGE_HOST_QEMU
> +    select BR2_PACKAGE_PKGCONF

You really need pkgconf on the target? Seems unlikely.

> +    select BR2_PACKAGE_LIBGLIB2
> +    select BR2_PACKAGE_PYTHON
> +

Unneeded empty line.

> +    help
> +      gobject-introspection

We want a better description here.

> +
> +      http://wiki.gnome.org/

And a better upstream URL here.

> +GOBJECT_INTROSPECTION_VERSION         = 1.51.1

Only one space before and after '=' sign.

> +GOBJECT_INTROSPECTION_SITE            = $(call github,GNOME,gobject-introspection,$(GOBJECT_INTROSPECTION_VERSION))

Not tarball releases?

> +GOBJECT_INTROSPECTION_LICENSE         = GPLv2+ LGPLv2.1

Licenses should be comma separated, and you should preferably indicate
what is under LGPLv2.1 and what is under GPLv2+.

> +GOBJECT_INTROSPECTION_LICENSE_FILES   = COPYING COPYING.GPL COPYING.LGPL COPYING.lib COPYING.tools
> +GOBJECT_INTROSPECTION_INSTALL_STAGING = YES
> +GOBJECT_INTROSPECTION_MAKE_OPTS       = GI_CROSS_LAUNCHER="$(HOST_DIR)/usr/bin/qemu-$(HOST_QEMU_ARCH)" GI_LDD=$(STAGING_DIR)/usr/bin/ldd-cross INTROSPECTION_SCANNER=g-ir-scanner INTROSPECTION_COMPILER=g-ir-compiler

Please split long lines.

> +GOBJECT_INTROSPECTION_DEPENDENCIES    = pkgconf python libglib2 host-qemu host-gobject-introspection
> +HOST_GOBJECT_INTROSPECTION_DEPENDENCIES = host-pkgconf host-python host-libglib2 toolchain
> +
> +define GOBJECT_INTROSPECTION_BOOTSTRAP
> +	cd $(GOBJECT_INTROSPECTION_DIR) && env NOCONFIGURE=1 ./autogen.sh --host=$(GNU_TARGET_NAME)

Please use <pkg>_AUTORECONF = YES. What you did is not correct because
you will use autoconf/automake from the host machine instead of ones
built by Buildroot.

[... I did not yet review the rest of the .mk file....]

> -LIBGLIB2_VERSION_MAJOR = 2.50
> -LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
> +LIBGLIB2_VERSION_MAJOR = 2.51

This is a development/unstable version, so we typically don't package it in Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
