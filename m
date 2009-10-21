From: Roman Chertov <rchertov@cs.ucsb.edu>
Date: Wed, 21 Oct 2009 13:02:14 -0700
Subject: [Buildroot] uClibc kernel headers problem
In-Reply-To: <20091021085047.GA23642@mx.loc>
References: <4ADDE87E.1030601@cs.ucsb.edu> <20091021085047.GA23642@mx.loc>
Message-ID: <4ADF68C6.7030806@cs.ucsb.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> if the paths in the tarballs don't match the name of the tarball and the
> version in the BR config then this will not work.
> I've sent a patch to the list a couple of days ago where you can set the
> kernel version manually to ease this particular thing, fyi.
> This and a handful of other patches are still not applied yet, though.

I changed the path names by hand so that linux-2.6.24.7.tar.bz2 is
linux-2.6.24.tar.bz2 and is extracted into a 2.6.24 directory.

>> My current trouble is with uClibc 0.9.30.1.  In the buildroot menuconfig
>> I specified that I want to build the entire Linux kernel, so as far as I
>> understand there is no need to use the precompiled headers option.  When
>> I build the tool chain, it all works up to uClibc.  I get the following
>> error "cc1: error: unrecognized command line option "-mbig-endian"".  I
>> have included the output log down below.  I would appreciate any help
>> with this.
> 
> How did you configure BR?

I specified that I have an ARM processor with EABI.  For libc, I used
the default 0.9.30.1.  For the actual device, I had to make my own entry
in device.  I copied the following into the Makefile.in

UCLIBC_CONFIG_FILE=$(TOOL_BUILD_DIR)/uClibc.config.$(ARCH) from one of
the device directories.  Once, I commented that out, the problem
disappeared.

Roman


> 
>>  GEN include/bits/sysnum.h
>> cc1: error: unrecognized command line option "-mbig-endian"
>> cc1: error: unrecognized command line option "-mbig-endian"
>> ERROR: Could not generate syscalls.
>> Make sure that you have proper kernel headers.
>> Your .config in KERNEL_HEADERS="" was set to:
>> /usr/include/
> 
> Even if you build on an arm box this is incorrect.
> I suggest you start from a fresh BR config:
> you at box:buildroot $ rm -f .config ; make menuconfig
> 
