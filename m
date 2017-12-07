From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 07 Dec 2017 20:08:19 +0000
Subject: [Buildroot] [Bug 10536] Finding non-relative paths in the ccache
In-Reply-To: <bug-10536-163@https.bugs.busybox.net/>
References: <bug-10536-163@https.bugs.busybox.net/>
Message-ID: <bug-10536-163-weXtJ1yrgX@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10536

--- Comment #1 from Trent Piepho <tpiepho@gmail.com> ---
Examining the build of objects that have non-relative paths into the buildroot
output directory in ccache shows how they are getting created.  Here's an
example from host-uboot-tools:

    /work/build-system/output/r700/host/bin/ccache /usr/lib64/ccache/gcc
-Wp,-MD,tools/.mkimage.o.d -O2 -I/work/build-system/output/r700/host/include  
-include ./include/libfdt_env.h -idirafterinclude -idirafter./arch//include
-I./lib/libfdt -I./tools -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -D_GNU_SOURCE  -c
-o tools/mkimage.o tools/mkimage.c

Since this is building a host binary it doesn't not call the buildroot
toolchain wrapper.  The toolchain wrapper is what sets basedir for ccache and
so ccache will not make absolute paths into the buildroot output directory tree
relative.

I think in order to see this one needs to build a host binary, have the
package's build system for the host binary use buildroot's cccache, have it
produce an auto-dependency file (-MD, etc), and have the code use a header that
in the buildroot output tree, i.e. some part of a host library package.

Perhaps this could be fixed if CCACHE_BASEDIR was injected in a way that also
managed to apply it to host compilations?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
