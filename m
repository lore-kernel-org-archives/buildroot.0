From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Apr 2019 11:00:25 +0200
Subject: [Buildroot] [PATCH v5 0/4] Add prebuilt nds32 toolchain,
 ae3xx board and autobuild configs support
In-Reply-To: <20190418083910.GA20517@app09>
References: <20190416072545.17633-1-nylon7@andestech.com>
 <20190417212209.09ef3182@windsurf> <20190418083910.GA20517@app09>
Message-ID: <20190418110025.6e34ff9e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nylon,

On Thu, 18 Apr 2019 16:39:10 +0800
Nylon Chen <nylon7@andestech.com> wrote:

> >    Build failure: http://autobuild.buildroot.net/results/1b1/1b18acb11db4d6c4198deb7385aff3d4d524c37e/build-end.log
> >    Commit to disable binutils on nds32: https://git.buildroot.org/buildroot/commit/?id=b45a703078e6f3be096f24ac63848490d32d0d29
> >   
> I got two methods can resolve this problem
> 
> 1.package/binutils/binutils.mk
> 
> +ifeq ($(BR2_nds32),y)
> +GNU_TARGET_NAME=nds32le-linux
> +endif
> +
> 
> 2.package/Makefile.in
> 
> +ifeq ($(BR2_nds32),y)
> +GNU_TARGET_NAME=$(ARCH)le-$(TARGET_OS)
> +else
> GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
> +endif

Ah, so the correct tuple for your architecture is nds32le, not nds32 ?

If that's correct, then the right change is:

diff --git a/arch/Config.in.nds32 b/arch/Config.in.nds32
index 9c5db20e6f..f268883662 100644
--- a/arch/Config.in.nds32
+++ b/arch/Config.in.nds32
@@ -1,5 +1,5 @@
 config BR2_ARCH
-       default "nds32"
+       default "nds32le"
 
 config BR2_GCC_TARGET_ARCH
        default "v3"

So that ARCH is directly equal to nds32le. Since the architecture at
the kernel level is known as nds32, you will also want the following
change:

diff --git a/Makefile b/Makefile
index 522c0b0606..86e444da98 100644
--- a/Makefile
+++ b/Makefile
@@ -439,6 +439,7 @@ KERNEL_ARCH := $(shell echo "$(ARCH)" | sed -e "s/-.*//" \
        -e s/arceb/arc/ \
        -e s/arm.*/arm/ -e s/sa110/arm/ \
        -e s/aarch64.*/arm64/ \
+       -e s/nds32.*/nds32/ \
        -e s/or1k/openrisc/ \
        -e s/parisc64/parisc/ \
        -e s/powerpc64.*/powerpc/ \

> >  - The libffi library does not have support for nds32 as well, so I
> >    made sure that we don't try to build configurations that include
> >    libffi on nds32. Are you planning on adding nds32 support to libffi
> >    upstream ?
> >  
> We have no plans at the moment. 

OK. I think you should plan to have libffi support. Without libffi, you
can't build libglib, which means a huge set of Linux
libraries/applications can't be built for your platform. Another thing
that requires libffi is Python, so without libffi support for nds32,
you can't build Python.

See https://github.com/libffi/libffi for the upstream source code. And
see https://github.com/libffi/libffi/tree/master/src for all the
folders containing architecture specific code. There is not that much
architecture specific code.

Of course, there is no urgency: Buildroot autobuilders will not try to
build any configuration that include libffi. But it means that a lot of
packages are not tested, and also that a lot of the Linux software
ecosystem is not usable on nds32.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
