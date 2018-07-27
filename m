From: Geoff Levand <geoff@infradead.org>
Date: Fri, 27 Jul 2018 11:56:49 -0700
Subject: [Buildroot] [PATCH v1 1/2] dtc: bump version to 1.4.7
In-Reply-To: <CAPnjgZ1297i1+K=SUB-Y37jjabqxdJRA13iPxPe=MND5da44WA@mail.gmail.com>
References: <28d7fee033a5e5ef512c02d5291d20b1d19fdbbf.1532460521.git.geoff@infradead.org>
 <20180727110728.300c06e2@windsurf>
 <10d6e217-c05f-ff72-d3fa-0459148746c3@infradead.org>
 <CAPnjgZ1297i1+K=SUB-Y37jjabqxdJRA13iPxPe=MND5da44WA@mail.gmail.com>
Message-ID: <5503f4f7-d712-44c4-0bb0-001b70418e8c@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simon,

After looking at it a bit more, it seems setup.py is using the host
toolchain (/usr/bin/gcc), and not the cross toolchain when linking.

Any idea how to fix this?

pylibfdt/setup.py --verbose  build_ext --inplace
running build_ext
building '_libfdt' extension
swigging pylibfdt/libfdt.i to pylibfdt/libfdt_wrap.c
swig -python -I/br-bug/build/dtc-1.4.7 -o pylibfdt/libfdt_wrap.c pylibfdt/libfdt.i
/br-bug/host/bin/aarch64-linux-gcc -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -I libfdt -I . -fPIC -I/br-bug/host/include/python2.7 -c /br-bug/build/dtc-1.4.7/libfdt/fdt.c -o build/temp.linux-x86_64-2.7/br-bug/build/dtc-1.4.7/libfdt/fdt.o -I/br-bug/build/dtc-1.4.7 -I/br-bug/build/dtc-1.4.7/libfdt
...
/usr/bin/gcc -pthread -shared -L/br-bug/host/lib -Wl,-rpath,/br-bug/host/lib -Wl,--enable-new-dtags -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -I libfdt -I . build/temp.linux-x86_64-2.7/br-bug/build/dtc-1.4.7/libfdt/fdt.o build/temp.linux-x86_64-2.7/br-bug/build/dtc-1.4.7/libfdt/fdt_ro.o build/temp.linux-x86_64-2.7/br-bug/build/dtc-1.4.7/libfdt/fdt_wip.o build/temp.linux-x86_64-2.7/br-bug/build/dtc-1.4.7/libfdt/fdt_sw.o build/temp.linux-x86_64-2.7/br-bug/build/dtc-1.4.7/libfdt/fdt_rw.o build/temp.linux-x86_64-2.7/br-bug/build/dtc-1.4.7/libfdt/fdt_strerror.o build/temp.linux-x86_64-2.7/br-bug/build/dtc-1.4.7/libfdt/fdt_empty_tree.o build/temp.linux-x86_64-2.7/br-bug/build/dtc-1.4.7/libfdt/fdt_addresses.o build/temp.linux-x86_64-2.7/br-bug/build/dtc-1.4.7/libfdt/fdt_overlay.o build/temp.linux-x86_64-2.7/pylibfdt/libfdt_wrap.o -L/br-bug/host/lib -lpython2.7 -o /br-bug/build/dtc-1.4.7/_libfdt.so
/usr/bin/ld: build/temp.linux-x86_64-2.7/br-bug/build/dtc-1.4.7/libfdt/fdt.o: Relocations in generic ELF (EM: 183)


-Geoff
