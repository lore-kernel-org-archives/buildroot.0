From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 22 Jun 2007 13:24:00 +0200
Subject: [Buildroot] This linker was not configured to use sysroots
In-Reply-To: <009401c7b4ba$7613bbf0$2311a8c0@OneWorld.local>
References: <009401c7b4ba$7613bbf0$2311a8c0@OneWorld.local>
Message-ID: <20070622112400.GB31755@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 22, 2007 at 11:45:34AM +0100, Nuno da Costa Ferro wrote:
>Hello,
>
>I'm getting this error while compiling 'fontconfig':
>make[4]: Entering directory 
>`/build/firmware/buildroot/build_arm/fontconfig-2.4.2/fc-case'
>/usr/bin/gcc  -Os -pipe  -I/build/firmware/buildroot/build_arm/staging_dir/usr/include 
> --sysroot=/build/firmware/buildroot/build_arm/staging_dir/ -isysroot 
>/build/firmware/buildroot/build_arm/staging_dir   -L/build/firmware/buildroot/build_arm/staging_dir/lib 
> -L/build/firmware/buildroot/build_arm/staging_dir/usr/lib -o fc-case 
>fc-case.o
>
>/usr/bin/ld: this linker was not configured to use sysroots

IIRC this fc-case is ment to be run on the host (to create some stuff).
Last time i looked, fontconfig was utterly broken for cross-compiling.

I suggests you add -march=armv5 (or any arm* that matches your target)
to your BR2_TARGET_OPTIMIZATION, this will make it very, very clear
which packages are broken (are and also were even before the sysroot
support).
>
>What do I need to do in order to fix this?

fix fontconfig upstream so it can properly be cross-compiled, i.e. so
that it uses CC_FOR_BUILD CFLAGS_FOR_BUILD when creating binaries ment
to be run on the host, and CC/CFLAGS for stuff that is cross-compiled.
