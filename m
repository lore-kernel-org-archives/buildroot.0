From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 11:44:16 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2016-08-23
In-Reply-To: <57C009DD.9070309@imgtec.com>
References: <20160824172543.19BA410CCE6@stock.ovh.net>
 <57C009DD.9070309@imgtec.com>
Message-ID: <20160826114416.443825e6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

[Adding Waldemar in Cc, there's a uClibc bug below.]

On Fri, 26 Aug 2016 14:50:29 +0530, Rahul Bedarkar wrote:

> On Wednesday 24 August 2016 10:55 PM, Thomas Petazzoni wrote:
> > Hello,
> >
> > This is the list of Buildroot build failures that occured on
> > 2016-08-23, and for which you are a registered architecture developer
> > or package developer. Please help us improving the quality of
> > Buildroot by investigating those build failures and sending patches to
> > fix them. Thanks!
> >
> > Build failures related to your packages:
> >
> >          bfin |                    glog-v0.3.4 | http://autobuild.buildroot.net/results/914cc267eba357cc0c425f07e57c6ae35b099b7e
> >  
> 
> We have disabled glog on blackfin external toolchain uclinux sometime 
> back [1]. But we are seeing same issue with buildroot based toolchain now.
> 
> As elf-fdpic.h is only provided by uClibc and we support only uClibc for 
> blackfin, should we disable glog on blackfin ?

No: we should instead fix the bug in uClibc.

Indeed, the following test program:

#include <link.h>
int main(void) { return 0; }

builds fine with the C compiler:

$ ./output/host/usr/bin/bfin-linux-gcc -o toto toto.c 
$

but fails with the C++ compiler:

$ ./output/host/usr/bin/bfin-linux-g++ -o toto toto.c 
In file included from /home/thomas/projets/buildroot/output/host/usr/bfin-buildroot-linux-uclibc/sysroot/usr/include/link.h:78:0,
                 from toto.c:1:
/home/thomas/projets/buildroot/output/host/usr/bfin-buildroot-linux-uclibc/sysroot/usr/include/bits/elf-fdpic.h: In function ?void* __reloc_pointer(void*, const elf32_fdpic_loadmap*)?:
/home/thomas/projets/buildroot/output/host/usr/bfin-buildroot-linux-uclibc/sysroot/usr/include/bits/elf-fdpic.h:94:54: error: invalid use of ?void?
       unsigned long offset = p - (void*)map->segs[c].p_vaddr;
                                                      ^~~~~~~
$

Seems like a bug in the uClibc headers. So I'd prefer that we fix
uClibc rather than disabling glog on Blackfin.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
