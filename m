From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Mar 2017 22:01:19 +0100
Subject: [Buildroot] [PATCH] uboot-tools: pass empty CFLAGS on
 invocation of libfdt/setup.py
In-Reply-To: <CAMo8BfLZzoRF0Q4zMRPcmwT0UErD7pGH_boMKrWQ07h09fiykw@mail.gmail.com>
References: <1489768962-26768-1-git-send-email-jcmvbkbc@gmail.com>
 <20170320225742.054be334@free-electrons.com>
 <CAMo8BfLZzoRF0Q4zMRPcmwT0UErD7pGH_boMKrWQ07h09fiykw@mail.gmail.com>
Message-ID: <20170322220119.24fc6301@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Mar 2017 16:30:53 -0700, Max Filippov wrote:

> I can't reproduce it.
> The python script makes the compilation super quiet, can we apply something
> like the attached patch to see what happens?

Build log is below. The issue is that the library being produced is
named _libfdt.cpython-35m-x86_64-linux-gnu.so, but U-Boot build system
assumes it's named _libfdt.so.

However, let's take a step back: why the heck do we have this Python
related stuff being built? uboot-tools is only meant to install the
basic U-Boot tools like fw_printenv and fw_setenv to the target. Why do
we bother about this Python libfdt thing? We're not even installing
this stuff to the target:

define UBOOT_TOOLS_INSTALL_TARGET_CMDS
        $(UBOOT_TOOLS_INSTALL_MKIMAGE)
        $(UBOOT_TOOLS_INSTALL_MKENVIMAGE)
        $(UBOOT_TOOLS_INSTALL_FWPRINTENV)
        $(UBOOT_TOOLS_INSTALL_DUMPIMAGE)
endef

Looking at tools/Makefile, it indeed automatically builds this Python
stuff is swig is available, with no way to disable this stuff. Should
we patch this out? Alternatively, changing:

	mv _libfdt.so $@

to:

	mv _libfdt.*so $@

does the trick.

Build log of the Python extension:

building '_libfdt' extension
creating build
creating build/temp.linux-x86_64-3.5
creating build/temp.linux-x86_64-3.5/lib
creating build/temp.linux-x86_64-3.5/lib/libfdt
creating build/temp.linux-x86_64-3.5/tools
/usr/bin/gcc -pthread -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -fPIC -I/home/test/outputs/995a1773efe982ed8443b2c5f9ea40a1ed106472/output/host/usr/include/python3.5m -c lib/libfdt/fdt.c -o build/temp.linux-x86_64-3.5/lib/libfdt/fdt.o -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -include ./include/libfdt_env.h -idirafterinclude -idirafter./arch//include -I./lib/libfdt -I./tools -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -D_GNU_SOURCE
  HOSTLD  tools/fdtgrep
/usr/bin/gcc -pthread -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -fPIC -I/home/test/outputs/995a1773efe982ed8443b2c5f9ea40a1ed106472/output/host/usr/include/python3.5m -c lib/libfdt/fdt_ro.c -o build/temp.linux-x86_64-3.5/lib/libfdt/fdt_ro.o -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -include ./include/libfdt_env.h -idirafterinclude -idirafter./arch//include -I./lib/libfdt -I./tools -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -D_GNU_SOURCE
  HOSTLD  tools/dumpimage
  HOSTLD  tools/mkimage
/usr/bin/gcc -pthread -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -fPIC -I/home/test/outputs/995a1773efe982ed8443b2c5f9ea40a1ed106472/output/host/usr/include/python3.5m -c lib/libfdt/fdt_rw.c -o build/temp.linux-x86_64-3.5/lib/libfdt/fdt_rw.o -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -include ./include/libfdt_env.h -idirafterinclude -idirafter./arch//include -I./lib/libfdt -I./tools -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -D_GNU_SOURCE
/usr/bin/gcc -pthread -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -fPIC -I/home/test/outputs/995a1773efe982ed8443b2c5f9ea40a1ed106472/output/host/usr/include/python3.5m -c lib/libfdt/fdt_strerror.c -o build/temp.linux-x86_64-3.5/lib/libfdt/fdt_strerror.o -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -include ./include/libfdt_env.h -idirafterinclude -idirafter./arch//include -I./lib/libfdt -I./tools -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -D_GNU_SOURCE
/usr/bin/gcc -pthread -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -fPIC -I/home/test/outputs/995a1773efe982ed8443b2c5f9ea40a1ed106472/output/host/usr/include/python3.5m -c lib/libfdt/fdt_wip.c -o build/temp.linux-x86_64-3.5/lib/libfdt/fdt_wip.o -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -include ./include/libfdt_env.h -idirafterinclude -idirafter./arch//include -I./lib/libfdt -I./tools -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -D_GNU_SOURCE
/usr/bin/gcc -pthread -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -fPIC -I/home/test/outputs/995a1773efe982ed8443b2c5f9ea40a1ed106472/output/host/usr/include/python3.5m -c lib/libfdt/fdt_region.c -o build/temp.linux-x86_64-3.5/lib/libfdt/fdt_region.o -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -include ./include/libfdt_env.h -idirafterinclude -idirafter./arch//include -I./lib/libfdt -I./tools -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -D_GNU_SOURCE
/usr/bin/gcc -pthread -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -fPIC -I/home/test/outputs/995a1773efe982ed8443b2c5f9ea40a1ed106472/output/host/usr/include/python3.5m -c lib/libfdt/fdt_sw.c -o build/temp.linux-x86_64-3.5/lib/libfdt/fdt_sw.o -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -include ./include/libfdt_env.h -idirafterinclude -idirafter./arch//include -I./lib/libfdt -I./tools -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -D_GNU_SOURCE
/usr/bin/gcc -pthread -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -fPIC -I/home/test/outputs/995a1773efe982ed8443b2c5f9ea40a1ed106472/output/host/usr/include/python3.5m -c tools/libfdt_wrap.c -o build/temp.linux-x86_64-3.5/tools/libfdt_wrap.o -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -include ./include/libfdt_env.h -idirafterinclude -idirafter./arch//include -I./lib/libfdt -I./tools -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -D_GNU_SOURCE
/usr/bin/gcc -pthread -shared -L/home/test/outputs/995a1773efe982ed8443b2c5f9ea40a1ed106472/output/host/lib -L/home/test/outputs/995a1773efe982ed8443b2c5f9ea40a1ed106472/output/host/usr/lib -Wl,-rpath,/home/test/outputs/995a1773efe982ed8443b2c5f9ea40a1ed106472/output/host/usr/lib -Wl,--enable-new-dtags build/temp.linux-x86_64-3.5/lib/libfdt/fdt.o build/temp.linux-x86_64-3.5/lib/libfdt/fdt_ro.o build/temp.linux-x86_64-3.5/lib/libfdt/fdt_rw.o build/temp.linux-x86_64-3.5/lib/libfdt/fdt_strerror.o build/temp.linux-x86_64-3.5/lib/libfdt/fdt_wip.o build/temp.linux-x86_64-3.5/lib/libfdt/fdt_region.o build/temp.linux-x86_64-3.5/lib/libfdt/fdt_sw.o build/temp.linux-x86_64-3.5/tools/libfdt_wrap.o -L/home/test/outputs/995a1773efe982ed8443b2c5f9ea40a1ed106472/output/host/usr/lib -lpython3.5m -o /home/test/outputs/995a1773efe982ed8443b2c5f9ea40a1ed106472/output/build/uboot-tools-2017.03/_libfdt.cpython-35m-x86_64-linux-gnu.so
mv _libfdt.so tools/_libfdt.so
mv: cannot stat `_libfdt.so': No such file or directory
make[3]: *** [tools/_libfdt.so] Error 1
make[2]: *** [tools-only] Error 2
make[1]: *** [/home/test/outputs/995a1773efe982ed8443b2c5f9ea40a1ed106472/output/build/uboot-tools-2017.03/.stamp_built] Error 2
make: *** [_all] Error 2



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
