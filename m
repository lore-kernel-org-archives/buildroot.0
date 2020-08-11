From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Tue, 11 Aug 2020 20:00:35 +0000
Subject: [Buildroot] [arc-buildroot] dmalloc issue on ARC HS38
In-Reply-To: <20200808175559.612425c2@windsurf.home>
References: <20200808175559.612425c2@windsurf.home>
Message-ID: <CH2PR12MB41044C85361322A9F585C8BDD9450@CH2PR12MB4104.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I am currently investigating this issue as well as other ARC-related(arc-gdb, apcupsd, etc.).
I will send fixes as soon as possible.

Best regards,
Evgeniy Didin

-----Original Message-----
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com> 
Sent: Saturday, August 8, 2020 6:56 PM
To: ARC Maintainers <arc-buildroot@synopsys.com>
Cc: buildroot at uclibc.org
Subject: [arc-buildroot] dmalloc issue on ARC HS38

Dear ARC maintainers,

For quite a while, we have been having this build issue of the dmalloc package on ARC HS38:

  https://urldefense.com/v3/__http://autobuild.buildroot.net/?reason=dmalloc-5.5.2__;!!A4F2R9G_pg!PoHjeFRllJw9Z-29IUdLH6tjFiBZST81gzh5LZPolssbfs48opcYULUQ4zAlLGTJCol5Lg$ 

It goes like this:

ERROR: architecture for "/usr/lib/libdmallocxx.so" is "ARCompact", should be "ARCv2"
ERROR: architecture for "/usr/lib/libdmalloc.so" is "ARCompact", should be "ARCv2"
ERROR: architecture for "/usr/lib/libdmallocth.so" is "ARCompact", should be "ARCv2"
ERROR: architecture for "/usr/lib/libdmallocthcxx.so" is "ARCompact", should be "ARCv2"

According to arch/Config.in.arc, we expect that the ELF type of binaries should be:

        default "ARCompact"     if BR2_arc750d || BR2_arc770d
        default "ARCv2"         if BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31

So for HS38, it should be ARCv2, but for some reason, just for this package, the value is ARCompact. Why so? I don't see any special flag passed by dmalloc at build time.

Also, another thing that looks suspicious in the build log is:

checking shared library link args... ./configure: line 4467: 15012 Segmentation fault      ( ${LD-ld} -shared --whole-archive -soname conftest.so -o conftest.so.t conftest.a ) 2>&5
/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/bin/arc-buildroot-linux-gnu-ld -G -o $@.t

It looks like an ARC linker segmentation fault. It might actually be related, because when I look at how the .so files are produced:

/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/bin/arc-buildroot-linux-gnu-ld -G -o libdmalloc.so.t libdmalloc.a /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/bin/arc-buildroot-linux-gnu-ld -G -o libdmallocxx.so.t libdmallocxx.a

it calls ld directly, which is probably why it is producing a .so file with the incorrect ELF type.

Could you have a look into this ?

Thanks a lot,

Thomas
--
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://urldefense.com/v3/__https://bootlin.com__;!!A4F2R9G_pg!PoHjeFRllJw9Z-29IUdLH6tjFiBZST81gzh5LZPolssbfs48opcYULUQ4zAlLGRuGFwNaQ$ 
