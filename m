From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Nov 2015 22:25:06 +0100
Subject: [Buildroot] [PATCH 06/21 RFC] package/gcc: add licensing
 information
In-Reply-To: <20151117211549.GC3703@free.fr>
References: <cover.1447713615.git.yann.morin.1998@free.fr>
 <ac61c991794df8089b615aee810b018840e37cc8.1447713615.git.yann.morin.1998@free.fr>
 <20151117122826.646069a0@free-electrons.com>
 <20151117211549.GC3703@free.fr>
Message-ID: <20151117222506.2faa3bbf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Nov 2015 22:15:49 +0100, Yann E. MORIN wrote:

> > As per your implementation, such license information will only be part
> > of the "host packages" license information, while libgcc gets actually
> > installed in the target. To be honest, I am not entirely sure how to
> > handle this properly with our package infrastructure.
> 
> Yes, the current legalese will only apply to the host variant.
> 
> We could add a target gcc-final that defines the needed legal-info
> stuff, but installs nothing (like I did so far with the host-gcc
> package). But I don't like it much either.

It's not super nice indeed, but I don't really see a better option. We
could always make this package actually do something "useful":
installing the gcc libraries to the target. I.e essentially move the
following part of host-gcc-final to this package:

# Handle the installation of libraries in /usr/lib
HOST_GCC_FINAL_USR_LIBS =

ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
HOST_GCC_FINAL_USR_LIBS += libstdc++
endif

ifeq ($(BR2_TOOLCHAIN_BUILDROOT_FORTRAN),y)
HOST_GCC_FINAL_USR_LIBS += libgfortran
endif

ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
HOST_GCC_FINAL_USR_LIBS += libgomp
endif

ifeq ($(BR2_GCC_ENABLE_LIBMUDFLAP),y)
ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
HOST_GCC_FINAL_USR_LIBS += libmudflapth
else
HOST_GCC_FINAL_USR_LIBS += libmudflap
endif
endif

ifneq ($(HOST_GCC_FINAL_USR_LIBS),)
define HOST_GCC_FINAL_INSTALL_STATIC_LIBS
        for i in $(HOST_GCC_FINAL_USR_LIBS) ; do \
                cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$${i}.a \
                        $(STAGING_DIR)/usr/lib/ ; \
        done
endef

ifeq ($(BR2_STATIC_LIBS),)
define HOST_GCC_FINAL_INSTALL_SHARED_LIBS
        for i in $(HOST_GCC_FINAL_USR_LIBS) ; do \
                cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$${i}.so* \
                        $(STAGING_DIR)/usr/lib/ ; \
                cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$${i}.so* \
                        $(TARGET_DIR)/usr/lib/ ; \
        done
endef
endif

define HOST_GCC_FINAL_INSTALL_USR_LIBS
        mkdir -p $(TARGET_DIR)/usr/lib
        $(HOST_GCC_FINAL_INSTALL_STATIC_LIBS)
        $(HOST_GCC_FINAL_INSTALL_SHARED_LIBS)
endef
HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_USR_LIBS
endif

This is really making the code more complicated just for the sake of
legal-info, though. Which isn't super nice. But at least we would have
the gcc libraries properly mentioned in the legal-info output for the
target.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
