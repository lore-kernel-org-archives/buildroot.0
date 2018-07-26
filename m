From: David De Grave (Essensium/Mind) <david.degrave@mind.be>
Date: Thu, 26 Jul 2018 12:36:29 +0200
Subject: [Buildroot] [PATCH 0/1] boot/uboot: host-dtc is not used as expected
Message-ID: <20180726103630.8643-1-david.degrave@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

U-Boot's build system (at least in 2018.01) does not use
$(HOST_DIR)/bin/dtc to compile custom dts files. Instead it tries to use
it's internal dtc who is not compiled by default and result in a build
failure:

  DTC     arch/arm/dts/foo.dtb
/bin/sh: ./scripts/dtc/dtc: No such file or directory
make[4]: *** [scripts/Makefile.lib:329: arch/arm/dts/foo.dtb] Error 127

To reproduce this error, use a uboot config that contains the following:

CONFIG_MULTI_DTB_FIT=y
CONFIG_OF_LIST="foo"

Unfortunately, even by applying the patch in this series to really use
host-dtc, it then fails with bunch of errors like the following:

FATAL ERROR: Unrecognized check name "simple_bus_reg"
make[4]: *** [scripts/Makefile.lib:329: arch/arm/dts/foo.dtb] Error 1

So, I though to just bump dtc to v1.4.7 who seems to supports these
parameters but then again, there is other errors with uboot & even with
linux:

In file included from output/host/include/libfdt.h:54:0, from
scripts/dtc/libfdt/fdt.c:54: output/host/include/libfdt_env.h:82:24:
error: redefinition of ?fdt16_to_cpu?
static inline uint16_t fdt16_to_cpu(fdt16_t x)

u-boot on his side is experiencing the same problem + a dependency that
it try to build and that doesn't exist in the tree:

make[3]: *** No rule to make target 'arch/arm/dts/unset.dts', needed by
'arch/arm/dts/unset.dtb'.  Stop.
make[3]: *** Waiting for unfinished jobs....

I never found from where that "unset.dts" is coming from...

In the meantime, Geoff submitted the same patch to bump to the v1.4.7
who leed to the same problem I was faced.

So... I'm a bit lost at that point and that's why I'm writing this RFC.

Thanks in advance for your feedbacks.

Regards,
David.


David De Grave (Essensium/Mind) (1):
  boot/uboot: Really use host-dtc

 boot/uboot/uboot.mk | 1 +
 1 file changed, 1 insertion(+)

-- 
2.13.6
