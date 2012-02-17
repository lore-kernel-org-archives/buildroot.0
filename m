From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 17 Feb 2012 09:42:09 +0000 (UTC)
Subject: [Buildroot] [Bug 4634] Bigendian binary is output even if it is
 configured to output little endian
In-Reply-To: <bug-4634-163@https.bugs.busybox.net/>
References: <bug-4634-163@https.bugs.busybox.net/>
Message-ID: <20120217094209.E7A1D90AC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4634

--- Comment #3 from Aristotelis Iordanidis <aristotelis.iordanidis@diasemi.com> 2012-02-17 09:42:09 UTC ---
(In reply to comment #1)
> Buildroot does not automatically add the needed CFLAGS and LDFLAGS to use the
> adequate multilib variant, because those CFLAGS and LDFLAGS are very
> toolchain-specific and architecture-specific. So it is the user's job to add
> explictly those flags.
> 
> I have posted a patch,
> http://lists.busybox.net/pipermail/buildroot/2012-January/049556.html, which
> adds some help text on the different external toolchains about their respective
> multilib variants and how to select between them. Hopefully, this patch should
> be merged for 2012.02.

(I'm sorry I posted a patch before the explanation)

I don't think this is enough (it didn't work for me).
The TOOLCHAIN_EXTERNAL_CFLAGS in toolchain/toolchain-external/ext-tool.mk does
not take into account BR2_TARGET_OPTIMIZATION.
So, in the end it always copies the big-endian libc/ from multilib.

From toolchain/toolchain-external/ext-tool.mk:

# march/mtune/floating point mode needs to be passed to the external toolchain
# to select the right multilib variant
ifneq ($(CC_TARGET_TUNE_),)
TOOLCHAIN_EXTERNAL_CFLAGS += -mtune=$(CC_TARGET_TUNE_)
TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_TUNE='"$(CC_TARGET_TUNE_)"'
endif
ifneq ($(CC_TARGET_ARCH_),)
TOOLCHAIN_EXTERNAL_CFLAGS += -march=$(CC_TARGET_ARCH_)
TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_ARCH='"$(CC_TARGET_ARCH_)"'
endif
ifneq ($(CC_TARGET_CPU_),)
TOOLCHAIN_EXTERNAL_CFLAGS += -mcpu=$(CC_TARGET_CPU_)
TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_CPU='"$(CC_TARGET_CPU_)"'
endif
ifneq ($(CC_TARGET_ABI_),)
TOOLCHAIN_EXTERNAL_CFLAGS += -mabi=$(CC_TARGET_ABI_)
TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_ABI='"$(CC_TARGET_ABI_)"'
endif

ifeq ($(BR2_SOFT_FLOAT),y)
TOOLCHAIN_EXTERNAL_CFLAGS += -msoft-float
TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_SOFTFLOAT=1
endif

ifeq ($(BR2_VFP_FLOAT),y)
TOOLCHAIN_EXTERNAL_CFLAGS += -mfpu=vfp
TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_VFPFLOAT=1
endif

...

        $(Q)SYSROOT_DIR=`$(TOOLCHAIN_EXTERNAL_CC) -print-sysroot 2>/dev/null` ;
\

...

        ARCH_SUBDIR=`$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS)
-print-multi-directory` ; \
        ARCH_SYSROOT_DIR=$${SYSROOT_DIR}/$${ARCH_SUBDIR} ; \

...

        echo "Copy external toolchain sysroot to staging..." ; \
        $(call
copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR}) ;
\


I have selected the following in menuconfig (I've also selected soft-float):

BR2_TARGET_OPTIMIZATION="-pipe -EL -march=m14kc -mmcu"
BR2_TARGET_LDFLAGS="-EL"


I attempted to fix the problem by passing $(TARGET_LDFLAGS) in ARCH_SUBDIR:

        ARCH_SUBDIR=`$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS)
$(TARGET_LDFLAGS) -print-multi-directory` ; \

After this change it seems that the little-endian version of libc is copied in
buildroot's sysroot, but I still get errors about crt1.o and crti.o (ld can't
find them).

This happens because in my case ARCH_SUBDIR=soft-float/el .
copy_toolchain_sysroot doesn't handle the case where ARCH_SUBDIR is not a
single directory:

ln: failed to create symbolic link
`/home/iordanidis/src/buildroot/buildroot/output/host/usr/mipsel-unknown-linux-gnu/sysroot/soft-float/el':
No such file or directory

I corrected this by slightly modifying copy_toolchain_sysroot. After that,
busybox was built correctly with -EL -soft-float.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
