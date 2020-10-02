From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 2 Oct 2020 15:16:31 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] Analysis
 of build results
In-Reply-To: <20200911103913.381a29c6@windsurf.hq.k.grp>
References: <20200815080146.EBD3186EA1@fraxinus.osuosl.org>
 <20200816000914.5ad801d9@windsurf.home>
 <CAPi7W80bHF=CHbQOoA_h5CJm+nXdiQBZasCJAdeYPnJ97kfdpg@mail.gmail.com>
 <BN8PR12MB3330A6ED2C32729E6833FFEDA15D0@BN8PR12MB3330.namprd12.prod.outlook.com>,
 <20200911103913.381a29c6@windsurf.hq.k.grp>
Message-ID: <BN8PR12MB3330D7EE79CE6EB08E3F2B26A1310@BN8PR12MB3330.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Thomas, all,

> > Ok so that happens because of misconfiguration of libstdc++.
> > 
> > When it gets configured we use not true final Buildroot's GCC (read-on...)
> > but just an intermediate "xgcc". And so when libstdc++ is checking for
> > atomics support it gets this:
> > -------------------------------->8-----------------------------  
> > cat << EOF > /tmp/yourfilehere
> > int
> > main ()
> > {
> >   #if __GCC_ATOMIC_INT_LOCK_FREE <= 1
> >   # error atomic int not always lock free
> >   #endif
> >   return 0;
> > }
> > EOF
> > 
> > configure:81594: .../output/build/host-gcc-final-arc-2020.03-release/build/./gcc/xgcc \
> > -B.../output/build/host-gcc-final-arc-2020.03-release/build/./gcc/ \
> > -B.../output/host/arc-buildroot-linux-uclibc/bin/ \
> > -B.../output/host/arc-buildroot-linux-uclibc/lib/ \
> > -isystem .../output/host/arc-buildroot-linux-uclibc/include \
> > -isystem .../output/host/arc-buildroot-linux-uclibc/sys-include \
> > -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os conftest.c >&5
> > conftest.c: In function 'main':
> > conftest.c:240:13: error: #error atomic int not always lock free
> >   240 |           # error atomic int not always lock free
> >       |             ^~~~~
> > -------------------------------->8-----------------------------  
> > 
> > And that's because "xgcc" uses its default configuration, i.e. "-mcpu=arc700",
> > and this one is w/o atomics. To make GCC using atomics we need to pass an extra option
> > to the driver with "-matomics" and... we do it via wrapper, see:
> > -------------------------------->8-----------------------------  
> > strace -s 1000 .../output/host/bin/arc-linux-gcc -c test.c 2> >(grep execve)
> > execve(".../output/host/bin/arc-linux-gcc", [".../output/host/bin/arc-linux-gcc", "-c", "test.c"], [/* 136 vars */]) = 0
> > execve(".../output/host/bin/arc-linux-gcc.br_real", [".../output/host/bin/arc-linux-gcc.br_real", "--sysroot", ".../output/host/arc-buildroot-linux-uclibc/sysroot", "-matomic", "-Wl,-z,max-page-size=8192", "-c", "test.c"], [/* 136 vars */]) = 0
> > -------------------------------->8-----------------------------  
> > 
> > Note how "arc-linux-gcc" nicely takes care of implicit handling of extra options.
> > 
> > So I guess it's clear what was the reason. What's not clear is how to solve
> > that problem properly, any guesses/hints?
> 
> Thanks for the research!
> 
> Wouldn't this be normally handled by having a --with-atomic option
> passed to gcc, which would ensure that the compiler enables -matomic,
> without having to pass this flag explicitly ?

Finally I was able to spend some more time on that. So it looks like a kind of
regression due to https://git.buildroot.org/buildroot/commit/?id=c568b4f37fa6d7f51e6d14d33d7eb75dfe26d7bf
where we moved "-matomic" from TARGET_ABI to ARCH_TOOLCHAIN_WRAPPER_OPTS.

The point is (and it could be seen from my previous explanation above) libstdc++ is being built by
temporary cross-compiler (xgcc) instead of preperly installed wrappers for real tools.
That's why whatever we put in ARCH_TOOLCHAIN_WRAPPER_OPTS makes no sense, while CFLAGS_FOR_TARGET
where we add contents of TARGET_ABI do make "xgcc" using "-matomic".

So far we know what's wrong. The question now what could be a good solution?
Revert offending commit?

-Alexey
