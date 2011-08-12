From: raymond zhao <raymond.zhao.ml@gmail.com>
Date: Fri, 12 Aug 2011 10:51:03 -0400
Subject: [Buildroot] about TARGET_CROSS
Message-ID: <CAAa76NR2f4jkSem4vx1_-K5OjK-v567kU98zDP8skN+=eX-zGA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
There is a variable named TARGET_CROSS in the Makefile.in under
buildroot/package directory. It is used for lots of package build
command. The problem is that it end with "-". Some packages add that
"-" itself in their own building system. These kind of packages will
complain that it can not find the compiler, for instance,
powerpc-unknown-linux-gnu--gcc. Please note that there are two "-"
before gcc. Use makefile string functions to strip out the last "-" is
not easy. So I suggest we add another variable named
TARGET_CROSS_STRIP, which is another version of TARGET_CROSS without
the last "-".
Here is the modification. I did not use patch format since it is very
simple modification.

original one:
ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG),y)
TARGET_CROSS=$(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-
else
TARGET_CROSS=$(HOST_DIR)/usr/bin/$(call
qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))-
endif

change to:
ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG),y)
TARGET_CROSS_STRIP=$(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)
else
TARGET_CROSS_STRIP=$(HOST_DIR)/usr/bin/$(call
qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
endif
TARGET_CROSS=$(TARGET_CROSS_STRIP)-

I wonder could we add it into the official buildroot release.

thanks,

Raymond
