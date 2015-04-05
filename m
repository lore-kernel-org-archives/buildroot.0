From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 05 Apr 2015 23:53:29 +0200
Subject: [Buildroot] [PATCH] ARC: bump tools to 2014.12 release
In-Reply-To: <1427213019.13499.10.camel@synopsys.com>
References: <1002870381.1069734.1426237851891.JavaMail.root@openwide.fr>	
 <1427205068.13499.9.camel@synopsys.com>	
 <20150324163127.417da43d@free-electrons.com>
 <1427213019.13499.10.camel@synopsys.com>
Message-ID: <5521AED9.5030802@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexey,

Le 24/03/2015 17:03, Alexey Brodkin a ?crit :
> Hi Thomas,
> 
> On Tue, 2015-03-24 at 16:31 +0100, Thomas Petazzoni wrote:
>> Dear Alexey Brodkin,
>>
>> On Tue, 24 Mar 2015 13:51:08 +0000, Alexey Brodkin wrote:
>>
>>> On Fri, 2015-03-13 at 10:10 +0100, Romain Naour wrote:
>>>> Hi Alexey,
>>>>
>>>> ----- Mail original -----
>>>> | De: "Alexey Brodkin" <Alexey.Brodkin@synopsys.com>
>>>> | ?: "romain naour" <romain.naour@openwide.fr>, "thomas petazzoni" <thomas.petazzoni@free-electrons.com>
>>>> | Cc: buildroot at uclibc.org
>>>> | Envoy?: Vendredi 13 Mars 2015 10:00:34
>>>> | Objet: Re: [Buildroot] [PATCH] ARC: bump tools to 2014.12 release
>>>> | 
>>>> | On Fri, 2015-03-13 at 09:19 +0100, Romain Naour wrote:
>>>> | > Hi Alexey,
>>>> | > Can you have a look at this patch:
>>>> | > https://patchwork.ozlabs.org/patch/449686/
>>>
>>> Do you think the patch Romain mentioned may fix
>>> http://autobuild.buildroot.org/results/d62/d62f472d70f60281dfe94cffc46a3e0566fd4a3d ?
>>
>> Yes, most likely it will fix this problem.
> 
> Are you going to apply it or we'll need to find somebody to try it
> first?
> 

I'm back on this issue and I found a way to reproduce it.

As you can see in the build.log, libiberty.a is located in host/usr/lib/libiberty.a
But on my machine libiberty.a is located in host/usr/lib64/libiberty.a

This is really weird because autobuilders are also 64bits machine
(x86_64-unknown-linux-gnu) and there is no reason that libiberty.a is not in the
same place...
So, I moved libiberty.a from host/usr/lib64/libiberty.a to
host/usr/lib/libiberty.a and now I have the very same build failure.

When gdb is build with shared libraries, it try to link with it own libiberty.a
(host-gdb-7.8.2/bfd/../libiberty/pic -liberty) but it take the one from
host/usr/lib/libiberty.a because -LPath/to/host/usr/lib/libiberty.a is before
-LPath/to/build/host-gdb-7.8.2/bfd/../libiberty/pic.

See the complete gcc line (verbose):
/bin/sh ./libtool --tag=CC   --mode=link /usr/bin/gcc -W -Wall
-Wstrict-prototypes -Wmissing-prototypes -Wshadow -O2
-I/home/naourr/git/buildroot/test/gdb/host/usr/include  -release `cat
libtool-soversion`  -L/home/naourr/git/buildroot/test/gdb/host/lib
-L/home/naourr/git/buildroot/test/gdb/host/usr/lib
-Wl,-rpath,/home/naourr/git/buildroot/test/gdb/host/usr/lib -o libbfd.la -rpath
/home/naourr/git/buildroot/test/gdb/host/usr/x86_64-unknown-linux-gnu/arm-buildroot-linux-uclibcgnueabi/lib
archive.lo archures.lo bfd.lo bfdio.lo bfdwin.lo cache.lo coffgen.lo corefile.lo
format.lo init.lo libbfd.lo opncls.lo reloc.lo section.lo syms.lo targets.lo
hash.lo linker.lo srec.lo binary.lo tekhex.lo ihex.lo stabs.lo stab-syms.lo
merge.lo dwarf2.lo simple.lo compress.lo verilog.lo `cat ofiles`
-L/home/naourr/git/buildroot/test/gdb/build/host-gdb-7.8.2/bfd/../libiberty/pic
-liberty -Wl,-lc,--as-needed,-lm,--no-as-needed  -lz

This line come from gdb/bfd/Makefile.in: l1239:
libbfd.la: $(libbfd_la_OBJECTS) $(libbfd_la_DEPENDENCIES)
	$(libbfd_la_LINK) $(am_libbfd_la_rpath) $(libbfd_la_OBJECTS)
$(libbfd_la_LIBADD) $(LIBS)

One solution is to disable shared libraries (preferred).

The second is to tweak LDFLAGS in gdb.mk like this:
HOST_GDB_CONF_OPTS = \
	[...]
	LDFLAGS="-L$(@D)/bfd/../libiberty/pic $(HOST_LDFLAGS)"

I don't see a better fix for gdb.

Best regards,
Romain
