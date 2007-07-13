From: Ralph Siemsen <ralphs@netwinder.org>
Date: Fri, 13 Jul 2007 09:53:44 -0400
Subject: [Buildroot] gcc 4.x and soft-float, -mfloat-abi
Message-ID: <20070713135344.GB27875@marvin.netwinder.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[ I mistakenly posted this to busybox list first.
  Apologies for the duplication and/or confusion. ]

Short:

The gcc -mfloat-abi option should only be passed for ARM builds
unless I am mis-reading the gcc documentation...

Long:

When I build a toolchain for powerpc with buildroot (current SVN)
this results in a compiler that doesn't accept -mfloat-abi option:

# $(STAGING_DIR)/usr/bin/powerpc-linux-uclibc-gcc --version
powerpc-linux-uclibc-gcc (GCC) 4.2.0
Copyright (C) 2007 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

# $(STAGING_DIR)/usr/bin/powerpc-linux-uclibc-gcc -mfloat-abi test.c
cc1: error: unrecognized command line option "-mfloat-abi"

The failure is observed while compiling openssl.  Its makefile does:
    $(SED) 's,/CFLAG=,/CFLAG= $(TARGET_SOFT_FLOAT) ,g' \
                $(OPENSSL_DIR)/Configure
where TARGET_SOFT_FLOAT comes from toolchain/gcc/Makefile.in:
	ifeq ($(findstring x4.,x$(GCC_VERSION)),x4.)
	SOFT_FLOAT_CONFIG_OPTION:=--with-float=soft
	ifeq ($(BR2_SOFT_FLOAT_FP),y)
	TARGET_SOFT_FLOAT:=-mfloat-abi=softfp
	else # no fp at all
	TARGET_SOFT_FLOAT:=-mfloat-abi=soft
	#endif
	else # not gcc-4.x
	TARGET_SOFT_FLOAT:=-msoft-float
	endif

So if using gcc4x then -mfloat-abi is passed unconditionally.
(And, because BR2_SOFT_FLOAT_FP is commented out in Config.in,
 the value "soft" is always chosen, never "softfp", but that's
 not my issue at the moment).

I believe the gcc4 check in toolchain/gcc/Makefile.in should
only set the -mfloat-abi for ARM architecture.  I can try cobbling
together a patch for this, but as I am not entirely sure it is
the right answer, I thought I'd get some feedback first.

Thanks,
-R
