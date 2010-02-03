From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 3 Feb 2010 00:04:37 +0000 (UTC)
Subject: [Buildroot] Copying extra libs into image using external
	toolchain
References: <39a5.4b68b030.ecb50@getafix.xdna.net>
Message-ID: <hkaeil$bis$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-02-02, Cameron Hutchison <lists@xdna.net> wrote:

> I have two buildroot (2009.11) configs set up:
> 1. A config that only builds a toolchain and installs it in
> /opt/brtc/<srch-tag> (with uClibc and C++ support)
> 2. A config that uses that toolchain as an external toolchain and builds
> the entire image (at91bootstrap, u-boot, linux, rootfs)
>
> In the toolchain's output/target/usr/lib is libstdc++.so - as I
> specified to build a C++ compiler. 
>
> When I build the image, this library is not copied into it. The uClibc
> libraries are copied. 

I ran into this a few weeks ago:

http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/19226/

> What do I need to do to get this library copied into the image? 

I wrote a shell script that does the "make" and then copies to
the proper locations the various libraries and include files
that buildroot forgets.  [There are some kernel headers that
don't get copied also.]  Here's the bash fragment that does that:

        # if toolchain is to be used as external toolchain, some
        # libraries neeed to be moved into expected locations
        echo "*** copying libs to expected locations ***"
        cp -av output/staging/usr/arm-linux-uclibc/lib/* output/staging/lib

        # some required kernel headers don't get copied 
        echo "*** copying kernel headers ***"
        cp -av output/toolchain/linux/include/mtd output/staging/usr/include

> The docco talks about "Core C library from external toolchain"
> and "Libraries to copy from the external toolchain" options
> but I cannot find these under menuconfig.
>
> The option for "Build/install c++ compiler and libstdc++" are
> enabled in both configs.

After you do the "make" to build to toolchain, you've got to
manually copy the libraries into the locations where buildroot
expects to find them.

-- 
Grant Edwards                   grante             Yow! I'm dressing up in
                                  at               an ill-fitting IVY-LEAGUE
                               visi.com            SUIT!!  Too late...
