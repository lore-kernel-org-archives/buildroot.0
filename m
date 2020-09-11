From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 Sep 2020 10:39:13 +0200
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] Analysis
 of build results
In-Reply-To: <BN8PR12MB3330A6ED2C32729E6833FFEDA15D0@BN8PR12MB3330.namprd12.prod.outlook.com>
References: <20200815080146.EBD3186EA1@fraxinus.osuosl.org>
 <20200816000914.5ad801d9@windsurf.home>
 <CAPi7W80bHF=CHbQOoA_h5CJm+nXdiQBZasCJAdeYPnJ97kfdpg@mail.gmail.com>
 <BN8PR12MB3330A6ED2C32729E6833FFEDA15D0@BN8PR12MB3330.namprd12.prod.outlook.com>
Message-ID: <20200911103913.381a29c6@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Aug 2020 20:31:17 +0000
Alexey Brodkin <Alexey.Brodkin@synopsys.com> wrote:

> Ok so that happens because of misconfiguration of libstdc++.
> 
> When it gets configured we use not true final Buildroot's GCC (read-on...)
> but just an intermediate "xgcc". And so when libstdc++ is checking for
> atomics support it gets this:
> -------------------------------->8-----------------------------  
> cat << EOF > /tmp/yourfilehere
> int
> main ()
> {
>   #if __GCC_ATOMIC_INT_LOCK_FREE <= 1
>   # error atomic int not always lock free
>   #endif
>   return 0;
> }
> EOF
> 
> configure:81594: .../output/build/host-gcc-final-arc-2020.03-release/build/./gcc/xgcc \
> -B.../output/build/host-gcc-final-arc-2020.03-release/build/./gcc/ \
> -B.../output/host/arc-buildroot-linux-uclibc/bin/ \
> -B.../output/host/arc-buildroot-linux-uclibc/lib/ \
> -isystem .../output/host/arc-buildroot-linux-uclibc/include \
> -isystem .../output/host/arc-buildroot-linux-uclibc/sys-include \
> -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os conftest.c >&5
> conftest.c: In function 'main':
> conftest.c:240:13: error: #error atomic int not always lock free
>   240 |           # error atomic int not always lock free
>       |             ^~~~~
> -------------------------------->8-----------------------------  
> 
> And that's because "xgcc" uses its default configuration, i.e. "-mcpu=arc700",
> and this one is w/o atomics. To make GCC using atomics we need to pass an extra option
> to the driver with "-matomics" and... we do it via wrapper, see:
> -------------------------------->8-----------------------------  
> strace -s 1000 .../output/host/bin/arc-linux-gcc -c test.c 2> >(grep execve)
> execve(".../output/host/bin/arc-linux-gcc", [".../output/host/bin/arc-linux-gcc", "-c", "test.c"], [/* 136 vars */]) = 0
> execve(".../output/host/bin/arc-linux-gcc.br_real", [".../output/host/bin/arc-linux-gcc.br_real", "--sysroot", ".../output/host/arc-buildroot-linux-uclibc/sysroot", "-matomic", "-Wl,-z,max-page-size=8192", "-c", "test.c"], [/* 136 vars */]) = 0
> -------------------------------->8-----------------------------  
> 
> Note how "arc-linux-gcc" nicely takes care of implicit handling of extra options.
> 
> So I guess it's clear what was the reason. What's not clear is how to solve
> that problem properly, any guesses/hints?

Thanks for the research!

Wouldn't this be normally handled by having a --with-atomic option
passed to gcc, which would ensure that the compiler enables -matomic,
without having to pass this flag explicitly ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
