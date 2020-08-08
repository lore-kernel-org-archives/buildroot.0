From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 17:55:59 +0200
Subject: [Buildroot] dmalloc issue on ARC HS38
Message-ID: <20200808175559.612425c2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear ARC maintainers,

For quite a while, we have been having this build issue of the dmalloc
package on ARC HS38:

  http://autobuild.buildroot.net/?reason=dmalloc-5.5.2

It goes like this:

ERROR: architecture for "/usr/lib/libdmallocxx.so" is "ARCompact", should be "ARCv2"
ERROR: architecture for "/usr/lib/libdmalloc.so" is "ARCompact", should be "ARCv2"
ERROR: architecture for "/usr/lib/libdmallocth.so" is "ARCompact", should be "ARCv2"
ERROR: architecture for "/usr/lib/libdmallocthcxx.so" is "ARCompact", should be "ARCv2"

According to arch/Config.in.arc, we expect that the ELF type of
binaries should be:

        default "ARCompact"     if BR2_arc750d || BR2_arc770d
        default "ARCv2"         if BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31

So for HS38, it should be ARCv2, but for some reason, just for this
package, the value is ARCompact. Why so? I don't see any special flag
passed by dmalloc at build time.

Also, another thing that looks suspicious in the build log is:

checking shared library link args... ./configure: line 4467: 15012 Segmentation fault      ( ${LD-ld} -shared --whole-archive -soname conftest.so -o conftest.so.t conftest.a ) 2>&5
/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/bin/arc-buildroot-linux-gnu-ld -G -o $@.t

It looks like an ARC linker segmentation fault. It might actually be
related, because when I look at how the .so files are produced:

/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/bin/arc-buildroot-linux-gnu-ld -G -o libdmalloc.so.t libdmalloc.a
/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/bin/arc-buildroot-linux-gnu-ld -G -o libdmallocxx.so.t libdmallocxx.a

it calls ld directly, which is probably why it is producing a .so file
with the incorrect ELF type.

Could you have a look into this ?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
