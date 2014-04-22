From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Apr 2014 16:27:11 +0200
Subject: [Buildroot] [PATCH 1/1 v2] qdecoder : new package
In-Reply-To: <1398155122-6872-1-git-send-email-sagaert.johan@skynet.be>
References: <1398155122-6872-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <20140422162711.7b4d0c17@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

Thanks for this contribution! Some comments below.

On Tue, 22 Apr 2014 10:25:22 +0200, Sagaert Johan wrote:

> diff --git a/package/qdecoder/Config.in b/package/qdecoder/Config.in
> new file mode 100644
> index 0000000..2bd2a2f
> --- /dev/null
> +++ b/package/qdecoder/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_QDECODER
> +	bool "qdecoder"

Really no toolchain dependency? From a quick look, qdecoder always
tries to build a shared library, so this is going to play nice with
BR2_PREFER_STATIC_LIB.

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

This looks strange, and normally not needed for autotools packages. Why
is it needed here? At least, if it's really needed, a comment above it
to explain why would be necessary (and I believe it's needed because
the package uses autoconf, but not automake: there is a Makefile.in
and not a Makefile.am).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
