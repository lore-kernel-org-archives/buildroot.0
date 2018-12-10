From: Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Mon, 10 Dec 2018 10:52:20 +0000
Subject: [Buildroot] [PATCH] gdb: Fix compilation for arc-2018.09 in
 some cases
In-Reply-To: <20181210114726.7df0a5fa@windsurf>
References: <20181210093526.29619-1-abrodkin@synopsys.com>
 <20181210114726.7df0a5fa@windsurf>
Message-ID: <edb7c0f0a91fd30576c51df14f3b7f33a5c00460.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2018-12-10 at 11:47 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 10 Dec 2018 12:35:26 +0300, Alexey Brodkin wrote:
> > In some cases which seem to depend on how toolchain headers
> > got installed or configured we may face well-known by now failure
> > fixed in upstream with [1]:
> > ------------------------------>8----------------------------  
> > In file included from nat/linux-ptrace.c:20:
> > nat/linux-ptrace.h:175:22: error: expected identifier before numeric constant
> >  # define TRAP_HWBKPT 4
> >                       ^
> > nat/linux-ptrace.h:175:22: error: expected '}' before numeric constant
> > In file included from .../output/host/arc-buildroot-linux-gnu/sysroot/usr/include/signal.h:58,
> >                  from build-gnulib/import/signal.h:52,
> >                  from .../output/host/arc-buildroot-linux-gnu/sysroot/usr/include/sys/wait.h:36,
> >                  from ./common/gdb_wait.h:23,
> >                  from nat/linux-ptrace.c:24:
> > .../output/host/arc-buildroot-linux-gnu/sysroot/usr/include/bits/siginfo-consts.h:156:1: note: to match this '{'
> >  {
> >  ^
> > In file included from nat/linux-ptrace.c:20:
> > nat/linux-ptrace.h:175:22: error: expected unqualified-id before numeric constant
> >  # define TRAP_HWBKPT 4
> >                       ^
> > In file included from .../output/host/arc-buildroot-linux-gnu/sysroot/usr/include/features.h:428,
> >                  from .../output/host/arc-buildroot-linux-gnu/sysroot/usr/include/bits/libc-header-start.h:33,
> >                  from .../output/host/arc-buildroot-linux-gnu/sysroot/usr/include/stdio.h:27,
> >                  from build-gnulib/import/stdio.h:43,
> >                  from ./common/common-defs.h:52,
> >                  from nat/linux-ptrace.c:19:
> > .../output/host/arc-buildroot-linux-gnu/sysroot/usr/include/sys/wait.h:158:1: error: expected declaration before '}' token
> >  __END_DECLS
> >  ^~~~~~~~~~~
> > ------------------------------>8----------------------------  
> 
> Applied to master, thanks. I see this patch is in gdb 8.2, so surely
> gdb 8.2 is not affected. What about previous gdb releases ?

In OpenEmbedded they used to apply that patch for 8.1.x GDB unconditionally [1]
which means we may want to have it in "package/gdb/8.0.1" and "package/gdb/8.1.1"
but I didn't add it there since I had no way to reproduce this failure as
compared to ARC. If you want I may still apply it to mentioned GDB versions in
Buildroot.

[1] https://github.com/openembedded/openembedded-core/commit/1d9d117e8eee2d3b9802384cb93155aea487f002#diff-4a406ea95be89670d34dd1f5514a1212

-Alexey
