From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 22 Apr 2014 17:07:01 +0200
Subject: [Buildroot] [PATCH 1/1 v2] qdecoder : new package
In-Reply-To: <20140422162711.7b4d0c17@skate>
References: <1398155122-6872-1-git-send-email-sagaert.johan@skynet.be>
 <20140422162711.7b4d0c17@skate>
Message-ID: <18590DF726304B8A9132C34717060A98@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Dear Thomas

Without these :
> +QDECODER_CONF_OPT = \
> +	--prefix=$(STAGING_DIR)/usr \
> +	--libdir=$(STAGING_DIR)/usr/lib

I found the qdecoder.h and the qdecoder.so.* in my hosts /usr/include and /usr/lib instead of
in the buildroot staging directories.

I did a quick check on :
http://autobuild.buildroot.org/toolchains/configs/free-electrons/br-arm-full-nothread.config

But this seem to fail on my build machine:
.....snip
make[2]: Leaving directory `/home/brcpy/support/kconfig'
BR2_DEFCONFIG='' KCONFIG_AUTOCONFIG=/home/brcpy/output/build/buildroot-config/auto.conf
KCONFIG_AUTOHEADER=/home/brcpy/output/build/buildroot-config/autoconf.h
KCONFIG_TRISTATE=/home/brcpy/output/build/buildroot-config/tristate.config BR2_CONFIG=/home/brcpy/.config
BR2_EXTERNAL=support/dummy-external /home/brcpy/output/build/buildroot-config/conf --silentoldconfig Config.in
make[1]: Leaving directory `/home/brcpy'
>>> toolchain-external undefined Extracting
mkdir -p /home/brcpy/output/host/opt/ext-toolchain
bzcat /home/johan/dl/br-arm11-full-nothread-2014.02-rc1.tar.bz2 | tar --strip-components=1 --exclude='usr/lib/locale/*' -C
/home/brcpy/output/host/opt/ext-toolchain  -xf -
>>> toolchain-external undefined Patching
>>> toolchain-external undefined Configuring
Cannot execute cross-compiler '/home/brcpy/output/host/opt/ext-toolchain/bin/arm-linux-gcc'

Is the x64 code ? I am on a 32 bit VM (debian 6).

Regards, Johan

-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Thomas Petazzoni
Verzonden: dinsdag 22 april 2014 16:27
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] [PATCH 1/1 v2] qdecoder : new package

Dear Sagaert Johan,

Thanks for this contribution! Some comments below.

On Tue, 22 Apr 2014 10:25:22 +0200, Sagaert Johan wrote:

> diff --git a/package/qdecoder/Config.in b/package/qdecoder/Config.in 
> new file mode 100644 index 0000000..2bd2a2f
> --- /dev/null
> +++ b/package/qdecoder/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_QDECODER
> +	bool "qdecoder"

Really no toolchain dependency? From a quick look, qdecoder always tries to build a shared library, so this is going to play nice
with BR2_PREFER_STATIC_LIB.

Can you try to build this library with the following toolchain
configurations:

 http://autobuild.buildroot.org/toolchains/configs/free-electrons/bfin-linux-uclibc.config
 http://autobuild.buildroot.org/toolchains/configs/free-electrons/bfin-uclinux.config
 http://autobuild.buildroot.org/toolchains/configs/free-electrons/br-arm-basic.config
 http://autobuild.buildroot.org/toolchains/configs/free-electrons/br-arm-full-nothread.config

It will exercise a bit the needed toolchain dependencies.

> +QDECODER_CONF_OPT = \
> +	--prefix=$(STAGING_DIR)/usr \
> +	--libdir=$(STAGING_DIR)/usr/lib

This looks strange, and normally not needed for autotools packages. Why is it needed here? At least, if it's really needed, a
comment above it to explain why would be necessary (and I believe it's needed because the package uses autoconf, but not automake:
there is a Makefile.in and not a Makefile.am).

Thanks,

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com _______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
