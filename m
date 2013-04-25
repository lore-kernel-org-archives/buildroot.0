From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Apr 2013 05:02:21 +0200
Subject: [Buildroot] [PATCH v2 00/12] RFC: ARC port
In-Reply-To: <1366798403-6984-1-git-send-email-mjonker@synopsys.com>
References: <1366798403-6984-1-git-send-email-mjonker@synopsys.com>
Message-ID: <20130425050221.4846d873@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mischa Jonker,

On Wed, 24 Apr 2013 12:13:11 +0200, Mischa Jonker wrote:

> Thanks for the prompt feedback that I have received on the patches.
> Here's a new revision of the patchset to introduce ARC support in
> BuildRoot; I think I have addressed all the comments received from
> Thomas and Arnout.

Thanks for the quick turnaround! This time, I actually applied and
tested your patches in the autobuilders environment, and I had some
issues.

The first issue is that your version of binutils require flex and bison
installed on the host, so we have to add these as dependencies of
binutils. The binutils.patch attached does that, but it does that
unconditionally, regardless of the binutils version being chosen. Since
the recent binutils versions do not require building flex and bison,
I'd prefer to make this dependency conditional on which version of
binutils is being built.

The second issue is that gcc 4.4.x also require flex (and maybe bison,
but I haven't checked). So I've added host-flex and host-bison as gcc
dependencies. Unfortunately, gcc doesn't use the package
infrastructure, so it doesn't add host/usr/bin to the PATH, so I had to
change the gcc makefile to use $(HOST_MAKE_ENV) and $(TARGET_MAKE_ENV)
where appropriate. This is the second 'gcc.patch' attached does. Here
as well, it makes the host-flex and host-bison dependency
unconditional, even though the latest versions of gcc do not require
this. A proper patch would have to make this dependency conditional on
the version of gcc being used.

(Note: both patches are quick and dirty, they don't have any
description or signed-off-by. Feel free to re-use them and apply your
signed-off-by on them, I don't care about authorship on those patches.)

Note that those flex and bison issues are visible in the autobuilder
environment because the build runs in a minimal chroot that has only
the strict, minimal dependencies required by Buildroot. That probably
explains why you haven't seen those problems until now.

Then, once this was fixed, the build went on, but failed at the gcc
intermediate step, with some pthread related issue:

In file included from /home/test/outputs/arc/toolchain/uClibc_dev//usr/include/stdio.h:71,
                 from /home/test/outputs/arc/toolchain/gcc-4.4.7-arc/libgcc/../gcc/tsystem.h:87,
                 from /home/test/outputs/arc/toolchain/gcc-4.4.7-arc/libgcc/../gcc/libgcc2.c:29:
/home/test/outputs/arc/toolchain/uClibc_dev//usr/include/bits/uClibc_stdio.h:207: error: expected specifier-qualifier-list before 'pthread_mutex_t'

make[3]: *** [_negdi2.o] Error 1
make[3]: *** Waiting for unfinished jobs....

The defconfig I was trying to build is very simple:

$ cat defconfig 
BR2_arcle=y

Do you have an idea for this pthread_mutex_t issue? Maybe ARC doesn't
support NPTL or something?

Also, do you have a public repo to push your changes to? Since your
patch series has become quite long, it would make it easier for us to
test it as a whole.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: binutils.patch
Type: text/x-patch
Size: 567 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130425/ab026573/attachment.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: gcc.patch
Type: text/x-patch
Size: 3705 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130425/ab026573/attachment-0001.bin>
