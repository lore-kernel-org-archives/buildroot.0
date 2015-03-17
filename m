From: Bamvor Zhang <bamv2005@gmail.com>
Date: Tue, 17 Mar 2015 22:31:56 +0800
Subject: [Buildroot] [PATCH 2/5] aarch64: ilp32: handle special file name
In-Reply-To: <CAKbGBLi9aV1CCgB8W5i3ASuvk_ebPXMQpc73EuiqHARyybgvtw@mail.gmail.com>
References: <1426500013-1276-1-git-send-email-bamvor.zhangjian@huawei.com>
 <1426500013-1276-3-git-send-email-bamvor.zhangjian@huawei.com>
 <CAKbGBLi9aV1CCgB8W5i3ASuvk_ebPXMQpc73EuiqHARyybgvtw@mail.gmail.com>
Message-ID: <CAOijeYJRMdgAxk8o5WU6e8BfHVG2-oWw5BFLXT5Ne-w4CjdDEA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-03-17 18:50  "Steven Noonan" <steven@uplinklabs.net> wrote?
>
> On Mon, Mar 16, 2015 at 3:00 AM, Zhang Jian(Bamvor)
> <bamvor.zhangjian@huawei.com> wrote:
> > In aarch64 ilp32, the directory of library is libilp32 and the linker is
> > ld-linux-aarch64_ilp32.so.1 or ld-linux-aarch64_be_ilp32.so.1.
> >
> > Signed-off-by: Zhang Jian(Bamvor) <bamvor.zhangjian@huawei.com>
> > ---
> >  Makefile                                           |  9 +++++
> >  toolchain/helpers.mk                               |  4 +--
> >  toolchain/toolchain-external/toolchain-external.mk | 41
++++++++++++++++++++--
> >  3 files changed, 50 insertions(+), 4 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index af043a3..96816c3 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -456,6 +456,15 @@ LIB_SYMLINK = lib64
> >  else
> >  LIB_SYMLINK = lib32
> >  endif
> > +ifeq ($(BR2_GCC_TARGET_ABI), "ilp32")
> > +# Leave extension for x32 on x86_64
>
> Surely this comment is wrong
sorry for confuse.
x32 is the ilp32 implementation on x86_64. the library is libx32 instead of
libilp32.
What I mean is that we  could handle it later.

regards

bamvor
>
> > +ifeq ($(BR2_aarch64), y)
> > +LIB_SYMLINK = libilp32
> > +endif
> > +ifeq ($(BR2_aarch64_be), y)
> > +LIB_SYMLINK = libilp32
> > +endif
> > +endif
> >
> >  $(STAGING_DIR):
> >         @mkdir -p $(STAGING_DIR)/bin
> > diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> > index 3121da4..ffb5c72 100644
> > --- a/toolchain/helpers.mk
> > +++ b/toolchain/helpers.mk
> > @@ -38,7 +38,7 @@
> >  #
> >  # $1: arch specific sysroot directory
> >  # $2: support libraries directory (can be empty)
> > -# $3: library directory ('lib' or 'lib64') from which libraries must
be copied
> > +# $3: library directory ('lib', 'lib64' or 'libilp32') from which
libraries must be copied
> >  # $4: library name
> >  # $5: destination directory of the libary, relative to $(TARGET_DIR)
> >  #
> > @@ -140,7 +140,7 @@ copy_toolchain_sysroot = \
> >         for i in etc $${ARCH_LIB_DIR} sbin usr usr/$${ARCH_LIB_DIR}; do
\
> >                 if [ -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
> >                         rsync -au --chmod=Du+w --exclude
'usr/lib/locale' \
> > -                               --exclude lib --exclude lib32 --exclude
lib64 \
> > +                               --exclude lib --exclude lib32 --exclude
lib64 --exclude libilp32 \
> >                                 $${ARCH_SYSROOT_DIR}/$$i/
$(STAGING_DIR)/$$i/ ; \
> >                 fi ; \
> >         done ; \
> > diff --git a/toolchain/toolchain-external/toolchain-external.mk
b/toolchain/toolchain-external/toolchain-external.mk
> > index 9aa8123..ed10d5c 100644
> > --- a/toolchain/toolchain-external/toolchain-external.mk
> > +++ b/toolchain/toolchain-external/toolchain-external.mk
> > @@ -85,6 +85,10 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
> >  LIB_EXTERNAL_LIBS += libc.so libgcc_s.so.*
> >  endif
> >
> > +ifeq ($(BR2_GCC_TARGET_ABI), "ilp32")
> > +LIB_EXTERNAL_LIBS += ld*.so
> > +endif
> > +
> >  ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
> >  USR_LIB_EXTERNAL_LIBS += libstdc++.so.*
> >  endif
> > @@ -248,6 +252,19 @@ define TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
> >         ln -sf . $(TARGET_DIR)/usr/lib/aarch64-linux-gnu
> >  endef
> >
> > +ifeq ($(BR2_GCC_TARGET_ABI), "ilp32")
> > +ifeq ($(BR2_ENDIAN), "LITTLE")
> > +define TOOLCHAIN_EXTERNAL_ILP32_SYMLINK
> > +       ln -sf ld*.so $(TARGET_DIR)/lib/ld-linux-aarch64_ilp32.so.1
> > +endef
> > +endif
> > +ifeq ($(BR2_ENDIAN), "BIG")
> > +define TOOLCHAIN_EXTERNAL_ILP32_SYMLINK
> > +       ln -sf ld*.so $(TARGET_DIR)/lib/ld-linux-aarch64_be_ilp32.so.1
> > +endef
> > +endif
> > +endif
> > +
> >  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305),y)
> >  TOOLCHAIN_EXTERNAL_SITE =
http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi
> >  TOOLCHAIN_EXTERNAL_SOURCE =
arm-2013.05-24-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
> > @@ -382,6 +399,7 @@ else
> >  # Custom toolchain
> >  TOOLCHAIN_EXTERNAL_SITE = $(dir $(call
qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
> >  TOOLCHAIN_EXTERNAL_SOURCE = $(notdir $(call
qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
> > +TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS +=
TOOLCHAIN_EXTERNAL_ILP32_SYMLINK
> >  endif
> >
> >  # In fact, we don't need to download the toolchain, since it is already
> > @@ -426,13 +444,13 @@ endef
> >
> >  # Returns the sysroot location for the given compiler + flags
> >  define toolchain_find_sysroot
> > -$$(echo -n $(call toolchain_find_libc_a,$(1)) | sed -r -e
's:(usr/)?lib(32|64)?/([^/]*/)?libc\.a::')
> > +$$(echo -n $(call toolchain_find_libc_a,$(1)) | sed -r -e
's:(usr/)?lib(32|64|ilp32)?/([^/]*/)?libc\.a::')
> >  endef
> >
> >  # Returns the lib subdirectory for the given compiler + flags (i.e
> >  # typically lib32 or lib64 for some toolchains)
> >  define toolchain_find_libdir
> > -$$(echo -n $(call toolchain_find_libc_a,$(1)) | sed -r -e
's:.*/(usr/)?(lib(32|64)?)/([^/]*/)?libc.a:\2:')
> > +$$(echo -n $(call toolchain_find_libc_a,$(1)) | sed -r -e
's:.*/(usr/)?(lib(32|64|ilp32)?)/([^/]*/)?libc.a:\2:')
> >  endef
> >
> >  # Checks for an already installed toolchain: check the toolchain
> > @@ -698,10 +716,28 @@ define TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT
> >         fi
> >  endef
> >
> > +ifeq ($(BR2_GCC_TARGET_ABI), "ilp32")
> > +ifeq ($(BR2_ENDIAN), "LITTLE")
> > +ILP32_SYM = ld-linux-aarch64_ilp32.so.1
> > +else
> > +ILP32_SYM = ld-linux-aarch64_be_ilp32.so.1
> > +endif
> > +define TOOLCHAIN_EXTERNAL_INSTALL_ILP32_LINK
> > +       LD_ILP32=`basename $(STAGING_DIR)/lib/ld*.so`; \
> > +       ln -sf $${LD_ILP32} $(STAGING_DIR)/lib/${ILP32_SYM}
> > +endef
> > +
> > +define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_ILP32_LINK
> > +       LD_ILP32=`basename $(TARGET_DIR)/lib/ld*.so`; \
> > +       ln -sf $${LD_ILP32} $(TARGET_DIR)/lib/${ILP32_SYM}
> > +endef
> > +endif
> > +
> >  define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
> >         $(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
> >         $(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
> >         $(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
> > +       $(TOOLCHAIN_EXTERNAL_INSTALL_ILP32_LINK)
> >  endef
> >
> >  # Even though we're installing things in both the staging, the host
> > @@ -711,6 +747,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_CMDS
> >         $(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS)
> >         $(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC)
> >         $(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FLAT)
> > +       $(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_ILP32_LINK)
> >  endef
> >
> >  $(eval $(generic-package))
> > --
> > 1.8.4.5
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150317/1b71ae2c/attachment.html>
