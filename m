From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jul 2009 16:05:13 +0200
Subject: [Buildroot] External toolchain improvements
In-Reply-To: <1246406073.21132.13.camel@coalu.atr>
References: <mailman.0.1246405094.1110.buildroot@busybox.net>
	<1246406073.21132.13.camel@coalu.atr>
Message-ID: <20090701160513.2ce29151@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Lionel,

Le Wed, 01 Jul 2009 01:54:33 +0200,
Lionel Landwerlin <lionel.landwerlin@openwide.fr> a ?crit :

> I'm interested by your patches, I'm using a STLinux external toolchain
> (Linux for SH4 SetTop Boxes).

Ok. Nice to see interest in external toolchain support, which is still
experimental, as you saw.

> The problem is that copying only libraries is not enough to build
> even a simple program like this one :

I'm not sure which Buildroot version you're using, but 2009.05 and
current Git don't only copy the libraries. Here is what we do :

 1) Copy + strip the libraries to the target space
    (project_build_ARCH/PROJECT/root). Only the files needed for
    execution need to be copied to the target space.

 2) Copy the full sysroot to the staging space (build_ARCH/staging_dir).

This is done in toolchain/external-toolchain/ext-took.mk.

> int main (void) { return 0; }
> 
> With my current toolchain, I also need :
> 
>       * crt1.o crti.o crtn.o
>       * All headers from the libc & linux

In current Buildroot, all these are copied to the staging directory. In
an example build, I have :

$ find . -name '*crt*'
./build_arm/staging_dir/usr/lib/Scrt1.o
./build_arm/staging_dir/usr/lib/crt1.o
./build_arm/staging_dir/usr/lib/crti.o
./build_arm/staging_dir/usr/lib/crtn.o

$ find build_arm/staging_dir/ -name '*.h' | head -5
build_arm/staging_dir/usr/include/neteconet/ec.h
build_arm/staging_dir/usr/include/strings.h
build_arm/staging_dir/usr/include/ttyent.h
build_arm/staging_dir/usr/include/pty.h
build_arm/staging_dir/usr/include/mntent.h

> After that, I also have problems with packages using pkg-config.
> Pkg-config returns paths relatives to the build directory ( -L/usr/lib
> for example). Gcc tries to link with host libraries...

This should theorically not happen since we should pass --sysroot to
every gcc/ld compilation step, and therefore all paths should be
interpreted relative to the sysroot (which is in fact the staging dir).

> We probably need a double --sysroot parameter to look first where the
> toolchain is installed and then in the given sysroot path.

Could you give more details about what you're doing :

 * Buildroot version
 * Buildroot .config file
 * Error messages
 * External toolchain used

Thanks !

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
