From: Lars Dunemark <ladu@hms.se>
Date: Tue, 16 Apr 2013 09:51:13 +0000
Subject: [Buildroot] Problem with external toolchain sysroot and eclipse
In-Reply-To: <20130416093325.57cfc00e@skate>
References: <6119D107D82B0940B389FAED3F2DDE66158823C4@Ansuz.hms.se>
 <20130416093325.57cfc00e@skate>
Message-ID: <6119D107D82B0940B389FAED3F2DDE6615882406@Ansuz.hms.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

> Dear Lars Dunemark,
> 
> On Tue, 16 Apr 2013 07:24:51 +0000, Lars Dunemark wrote:
> 
> > Recently, we discovered that it has become something strange with our
> external toolchain builds.
> >
> > We discovered this when we wanted to start using Eclipse integration for
> buildroot and build applications outside buildroot.
> >
> > After some investigation we discovered that the ext-toolchain-wrapper had
> changed and received support for relative paths.
> > After adding some debug prints:
> > toolchain/toolchain-external/ext-toolchain-wrapper.c
> > 122         printf("path: %s, sysroot: %s\n", path, sysroot);
> >
> > I got the the following result:
> >
> > $ pwd
> > /media/build/source
> > $ arm-cortex_a8-linux-gnueabi-gcc
> > path:
> > /media/build/source/toolchain/bin/arm-cortex_a8-linux-gnueabi-gcc,
> > sysroot: /media/usr/arm-buildroot-linux-gnueabi/sysroot
> > arm-cortex_a8-linux-gnueabi-gcc: no input files
> >
> >
> > $ ./buildroot/output/host/usr/bin/arm-cortex_a8-linux-gnueabi-gcc
> > path:
> > /media/build/source/toolchain/bin/arm-cortex_a8-linux-gnueabi-gcc,
> > sysroot:
> > /media/build/source/buildroot/output/host/usr/arm-buildroot-linux-gnue
> > abi/sysroot
> > arm-cortex_a8-linux-gnueabi-gcc: no input files
> 
> What is /media/build/source/toolchain/ ? How did you install things in there ?

The toolchain I'm using is created with crosstool-ng outside of buildroot.

In buildroot menuconfig I have set 
# BR2_TOOLCHAIN_BUILDROOT is not set
BR2_TOOLCHAIN_EXTERNAL=y
# BR2_TOOLCHAIN_CTNG is not set
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
# BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD is not set
BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y
BR2_TOOLCHAIN_EXTERNAL_PATH="/media/build/source/toolchain/"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-cortex_a8-linux-gnueabi"
BR2_TOOLCHAIN_EXTERNAL_PREFIX="arm-cortex_a8-linux-gnueabi"
BR2_TOOLCHAIN_EXTERNAL_GLIBC=y
# BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC is not set
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS=""


The intention with this is to have one toolchain build as base so we don't need to rebuild it every time.

I attach our config file for ct-ng.

> 
> The toolchain that you must use with Buildroot is the one in
> output/host/usr/bin/. Using something else will most likely not work properly.
> 
> Can you give details about your /media/build/source/toolchain/ directory so that
> we can understand what is your configuration? It doesn't look a standard way of
> using Buildroot.
> 
> Thanks,
> 
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux development, consulting, training
> and support.
> http://free-electrons.com

Best regards
Lars Dunemark
-------------- next part --------------
A non-text attachment was scrubbed...
Name: toolchain.config
Type: application/octet-stream
Size: 10281 bytes
Desc: toolchain.config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130416/ed521a76/attachment.obj>
