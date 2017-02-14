From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Feb 2017 12:58:37 +0100
Subject: [Buildroot] [PATCH] kmsxx: not available on m68k
In-Reply-To: <20170214114204.GD12810@waldemar-brodkorb.de>
References: <20170213093502.26507-1-peter@korsgaard.com>
 <20170213132925.5324f141@free-electrons.com>
 <8760kema97.fsf@dell.be.48ers.dk>
 <20170213213713.GA12810@waldemar-brodkorb.de>
 <87fujhkrik.fsf@dell.be.48ers.dk>
 <20170214114204.GD12810@waldemar-brodkorb.de>
Message-ID: <20170214125837.69821038@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Feb 2017 12:42:04 +0100, Waldemar Brodkorb wrote:

> I can try. But now I am back to my original problem, how do I
> overwrite CFLAGS/CXXFLAGS correctly for a single package build with
> cmake?
> 
> Any examples in the tree?

ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
LIBCEC_DEPENDENCIES += rpi-userland
LIBCEC_CONF_OPTS += \
        -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -lvcos -lvchiq_arm" \
        -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) \
                -I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux \
                -I$(STAGING_DIR)/usr/include/interface/vcos/pthreads"
endif

or

ifeq ($(BR2_ARM_CPU_ARMV7A)$(BR2_ARM_CPU_HAS_NEON),yy)
GNURADIO_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -march=armv7-a"
endif

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
