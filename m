From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 6 May 2015 20:58:43 +0000
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150506094236.114894a2@free-electrons.com>
References: <20150506063017.6B6A61015C1@stock.ovh.net>
 <20150506094236.114894a2@free-electrons.com>
Message-ID: <1430945922.2395.16.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, 2015-05-06 at 09:42 +0200, Thomas Petazzoni wrote:
> >          arc |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/4c694d715f66de49964ef36f7236c7575c3a0b5a/
> 
> relocation R_ARC_32 against `.text' can not be used when making a
> shared object; recompile with -fPIC

That failure looks pretty expected to me.
In defconfig
(http://autobuild.buildroot.net/results/4c6/4c694d715f66de49964ef36f7236c7575c3a0b5a/defconfig) I see "BR2_STATIC_LIBS=y". And libffi is built statically then. In that case fixed relocation R_ARC_32 is used (symbol gets resolved during final linkage and then offset is inserted in-place in .text section which means there's no way to relocate that symbol later on).

But even though we expect to build everything statically there's what
happens in the end of build log:
--->8---
/home/peko/autobuild/instance-1/output/host/usr/bin/arc-linux-gcc
-shared -static
build/temp.linux2-arc-2.7/home/peko/autobuild/instance-1/output/build/python-2.7.9/Modules/_ctypes/_ctypes.o build/temp.linux2-arc-2.7/home/peko/autobuild/instance-1/output/build/python-2.7.9/Modules/_ctypes/callbacks.o build/temp.linux2-arc-2.7/home/peko/autobuild/instance-1/output/build/python-2.7.9/Modules/_ctypes/callproc.o build/temp.linux2-arc-2.7/home/peko/autobuild/instance-1/output/build/python-2.7.9/Modules/_ctypes/stgdict.o build/temp.linux2-arc-2.7/home/peko/autobuild/instance-1/output/build/python-2.7.9/Modules/_ctypes/cfield.o -L/home/peko/autobuild/instance-1/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib -L/home/peko/autobuild/instance-1/output/host/usr/arc-buildroot-linux-uclibc/sysroot/lib -L/home/peko/autobuild/instance-1/output/host/opt/ext-toolchain/arc-buildroot-linux-uclibc/lib -L/home/peko/autobuild/instance-1/output/host/opt/ext-toolchain/lib/gcc -lffi -o build/lib.linux2-arc-2.7/_ctypes.so
--->8---

ctypes.so is attempted to be built dynamically and here our linker
throws an error:
--->8---
/home/peko/autobuild/instance-1/output/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/4.8.3/../../../../arc-buildroot-linux-uclibc/bin/ld: /home/peko/autobuild/instance-1/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/libffi.a(prep_cif.o): relocation R_ARC_32 against `.text' can not be used when making a shared object; recompile with -fPIC
/home/peko/autobuild/instance-1/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/libffi.a: could not read symbols: Bad value
--->8---

So I'm not sure how to solve it properly.
I would say that building of shared object should not happen if
BR2_STATIC_LIBS=y, and probably we need to patch Python build system to
troubleshoot that problem.

I'm also wondering if something similar happens for other arches?

Any thoughts?

-Alexey
