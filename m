From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Tue, 18 May 2010 12:08:43 +0200
Subject: [Buildroot] RFC: Libtool and wrong rpath
In-Reply-To: <4BF1AA6B.50109@gmail.com>
References: <4BF1AA6B.50109@gmail.com>
Message-ID: <AANLkTinvPUF9GOWl2Vo2daT9CwGSkrZB48YAdlnHhNuP@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Very interesting...
Same thing here, I'm pretty sure it's because of the modifications we
make on .la files

On Mon, May 17, 2010 at 10:43 PM, Paulius Zaleckas
<paulius.zaleckas@gmail.com> wrote:
> Hi,
>
> I have noticed with strace that strange path is being probed by dynamic
> linker
> on the target. This makes applications to start slower, since each library
> is probed with wrong path first!
>
> Problem is that ELF dynamic section (readelf -d) has RPATH set to absolute
> path
> of the satging dir on the host:
>
> 0x0000000f (RPATH) ? ? ? ? ? ? ? ? ? ? ?Library rpath:
> [/home/paulius/buildroot/output/build/staging_dir/usr/i386-unknown-linux-uclibc/lib]
>
> I have put some simple script to discover ELF files with this WRONG path:
>
> #!/bin/sh
> for file in `find $@ -type f -executable`; do
> ? ? ? ?if [ -n "`file $file | grep ELF`" ]; then
> ? ? ? ? ? ? ? ?if [ -n "`readelf -d $file | grep staging`" ]; then
> ? ? ? ? ? ? ? ? ? ? ? ?echo $file
> ? ? ? ? ? ? ? ?fi
> ? ? ? ?fi
> done
>
> On my target directory it found 119 occurrences. Mostly X11 and GTK related.

On my target, it's all libraries, except the low level ones (libcurl,
libdbus, libcrypto, ...).
In fact each library which has a dependency on another library
providing a .la modified by buildroot will have this wrong rpath.

> The source of this problem seems to be buggy libtool script...

Or a buggy buildroot...

> I failed to fix/identify libtool lines responsible for this, but I think we
> can
> use chrpath utility to remove wrong RPATH from these executables.
>
> If we use chrpath, then should we add package or require it from host?
> I guess we will have to run it after all packages are installed?
That sucks ;)


Thx for reporting this.

--
Lionel Landwerlin
