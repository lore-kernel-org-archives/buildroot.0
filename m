From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 19 Aug 2020 21:33:27 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] Analysis
 of build results
In-Reply-To: <BN8PR12MB3330A6ED2C32729E6833FFEDA15D0@BN8PR12MB3330.namprd12.prod.outlook.com>
References: <20200815080146.EBD3186EA1@fraxinus.osuosl.org>
 <20200816000914.5ad801d9@windsurf.home>,
 <CAPi7W80bHF=CHbQOoA_h5CJm+nXdiQBZasCJAdeYPnJ97kfdpg@mail.gmail.com>,
 <BN8PR12MB3330A6ED2C32729E6833FFEDA15D0@BN8PR12MB3330.namprd12.prod.outlook.com>
Message-ID: <BN8PR12MB3330AC7ACC6277A4688ECE68A15D0@BN8PR12MB3330.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

> Hi Thomas, all,
> 
> > >     arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/a7732fdb2ba526a114d9fb759814236c5332f8d7/  |    
> > 
> > undefined reference to `std::__atomic_futex_unsigned_base::_M_futex_notify_all(unsigned int*)'
> > 
> > This is happening only on ARC700. Perhaps a variant of ARC that doesn't
> > support atomic instructions?
> > 
> > ARC maintainers, could you have a look please ?
> > 
> > >     arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/c3b67d8a5faf7ff06b08a0591f22b1fa4963c2ee/  | ORPH
> > 
> > /home/test/autobuild/run/instance-3/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/9.3.1/../../../../arc-buildroot-linux-uclibc/bin/ld: ../libs/wampcc/libwampcc.so.6.0.0: undefined reference to `std::__atomic_futex_unsigned_base::_M_futex_notify_all(unsigned int*)'
> > collect2: error: ld returned 1 exit status
> > 
> > This looks very similar to the log4cplus build issue above, also
> > happens only on ARC: http://autobuild.buildroot.net/?reason=wampcc-1.6
> > 
> > ARC maintainers, could you have a look ?
> 
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
> 
> In the meantime I'll be looking at opencv issues.

And as for OpenCV it's an upstream problem, see https://github.com/opencv/opencv/issues/17984.
Well and Fabrice already fixed that :)

1. OpenCV: https://git.buildroot.org/buildroot/commit?id=521854251f5a1e1082dbed503772969cd5797c41
2. OpenCV3: https://git.buildroot.org/buildroot/commit/?id=594201acb5b4b59bf43fc7c8c024b6e42c0569e7

So we're good now :)

-Alexey
