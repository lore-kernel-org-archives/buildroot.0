From: hartleys <hartleys@visionengravers.com>
Date: Tue, 17 Jun 2008 14:57:15 -0400
Subject: [Buildroot] Problem with buildroot and external toolchain
In-Reply-To: <20080617183841.GA18089@real.realitydiluted.com>
References: <BD79186B4FD85F4B8E60E381CAEE1909182568@mi8nycmail19.Mi8.com>
	<20080617183841.GA18089@real.realitydiluted.com>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190918260A@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > I think I worked the problem down to the external toolchain
libraries 
> > not getting copied to the root filesystem. The
copy_toolchain_lib_root 
> > in ext-tool.mk does locate the libraries to copy but I don't get the

> > messages about the libraries being copied.
> > 
> > The only thing I can figure is the find in:
> > 
> > 	for FILE in `find $${LIB_DIR} -maxdepth 1 -type l -name
"$${LIB}*"`; 
> > do { \
> > 
> > Is failing for some reason. Can anyone please offer any help on
this?
> > 
> Here is what I have for an external glibc-based toolchain:
>
> BR2_TOOLCHAIN_EXTERNAL_LIB_C="libc.so.6"
> BR2_TOOLCHAIN_EXTERNAL_LIBS="ld.so.1 libcrypt.so libdl.so libgcc_s.so
libm.so
> libnsl.so libnss_dns.so libnss_files.so libpthread.so libresolv.so
librt.so
> libstdc++.so libutil.so"
>
>
BR2_TOOLCHAIN_EXTERNAL_PATH="/opt/toolchains/gcc-3.4.5-glibc-2.3.6/power
pc-7450-linux-gnu"
> BR2_TOOLCHAIN_EXTERNAL_PREFIX="powerpc-7450-linux-gnu"
>
> The libraries will be copied from:
>
>  $(BR2_TOOLCHAIN_EXTERNAL_PATH)/$(BR2_TOOLCHAIN_EXTERNAL_PREFIX)/lib
>
> Hope that helps.

Thanks for the quick reply.

My setup is for an external uclibc-based toolchain:

BR2_TOOLCHAIN_EXTERNAL_LIB_C="libc.so.0"
BR2_TOOLCHAIN_EXTERNAL_LIBS="ld-uClibc.so.0 libcrypt.so.0 libdl.so.0
libm.so.0 ... (others)"

BR2_TOOLCHAIN_EXTERNAL_PATH="/usr/local/arm/4.1.1-920t"
BR2_TOOLCHAIN_EXTERNAL_PREFIX="arm-linux"

My library files are in the
$(BR2_TOOLCHAIN_EXTERNAL_PATH)/$(BR2_TOOLCHAIN_EXTERNAL_PREFIX)/lib
directory.

But, like I said, the copy_toolchain_lib_root is locating the files but
not actually copying them. If I manually copy the files to the root file
system everything works fine.

Any other ideas?

Hartley
