From: Robert P. J. Day <rpjday@crashcourse.ca>
Date: Wed, 17 Oct 2007 07:17:41 -0400 (EDT)
Subject: [Buildroot] make using prebuilt kernel headers fails trying to
 download kernel tarball
Message-ID: <Pine.LNX.4.64.0710170708060.7319@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


  (still) trying to see how far i can get in building for a nios2, i'm
using the latest "svn update", configured for nios2, selected
"deprecated" packages and left the selection for kernel headers at
2.6.9.

  now, as i read it, it's the snippets in
toolchain/kernel-headers/kernel-headers-old.makefile that will map
that version selection thusly so that, instead of downloading the
2.6.9 kernel source itself, i'll go after just the pre-built headers:

...
ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.9")
VERSION:=2
PATCHLEVEL:=6
SUBLEVEL:=9
LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
LINUX_HEADERS_SITE:=http://ep09.pld-linux.org/~mmazur/linux-libc-headers/
LINUX_HEADERS_SOURCE:=linux-libc-headers-2.6.9.1.tar.bz2
LINUX_HEADERS_CAT:=$(BZCAT)
LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.6.9.1
endif
...

 the above settings should then (theoretically) affect this rule out
of kernel-headers.mk, right?

...
$(DL_DIR)/$(LINUX_HEADERS_SOURCE):
        $(WGET) -P $(DL_DIR) $(LINUX_HEADERS_SITE)/$(LINUX_HEADERS_SOURCE)
...

  and yet, after i config as i described above and run "make",
the build fails very quickly with:

rm -rf /home/rpjday/buildroot/br-svn/project_build_nios2/uclibc/buildroot-config
mkdir -p /home/rpjday/buildroot/br-svn/project_build_nios2/uclibc
cp -dpRf package/config/buildroot-config /home/rpjday/buildroot/br-svn/project_build_nios2/uclibc/buildroot-config
make: *** No rule to make target `/home/rpjday/buildroot/br-svn/dl/linux-2.6.9.tar.bz2', needed by `/home/rpjday/buildroot/br-svn/toolchain_build_nios2/linux-2.6.9/.unpacked'.
Stop.

  it's as if the fact that pre-built headers should be downloaded has
been forgotten or overridden, and the make process is now trying to
download the kernel tarball of that version.  this will, of course,
fail since there's no rule that defines that target (anymore).

  am i misreading something?  i'm currently following the logic and
trying to figure out what happened here, but if someone wants to save
me all that time, i'd be ever so grateful.

rday

-- 
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
========================================================================
