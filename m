From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 21 Oct 2009 10:50:47 +0200
Subject: [Buildroot] uClibc kernel headers problem
In-Reply-To: <4ADDE87E.1030601@cs.ucsb.edu>
References: <4ADDE87E.1030601@cs.ucsb.edu>
Message-ID: <20091021085047.GA23642@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 20, 2009 at 09:42:38AM -0700, Roman Chertov wrote:
>Hello,
>
>I am using the latest build root release and I am trying to build a tool
>chain for CS-e9302 board which has an ARM chip.  I want to use the
>2.6.24.7 Linux kernel (I patched it to support click modular router).  I
>patched that kernel and u-boot 1.3.3 with patches from
>http://dev.ivanov.eu/projects/cs-e9302/ to enable the board support.  I
>then renamed the tar.bz2 files into file names that buildroot supports
>in the menuconfig (linux-2.6.24.tar.bz2 kernel and
>u-boot-2009.06.tar.bz2) and placed the files into the dl directory.

if the paths in the tarballs don't match the name of the tarball and the
version in the BR config then this will not work.
I've sent a patch to the list a couple of days ago where you can set the
kernel version manually to ease this particular thing, fyi.
This and a handful of other patches are still not applied yet, though.
>
>My current trouble is with uClibc 0.9.30.1.  In the buildroot menuconfig
>I specified that I want to build the entire Linux kernel, so as far as I
>understand there is no need to use the precompiled headers option.  When
>I build the tool chain, it all works up to uClibc.  I get the following
>error "cc1: error: unrecognized command line option "-mbig-endian"".  I
>have included the output log down below.  I would appreciate any help
>with this.

How did you configure BR?

>  GEN include/bits/sysnum.h
>cc1: error: unrecognized command line option "-mbig-endian"
>cc1: error: unrecognized command line option "-mbig-endian"
>ERROR: Could not generate syscalls.
>Make sure that you have proper kernel headers.
>Your .config in KERNEL_HEADERS="" was set to:
>/usr/include/

Even if you build on an arm box this is incorrect.
I suggest you start from a fresh BR config:
you at box:buildroot $ rm -f .config ; make menuconfig
