From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 22:06:01 +0200
Subject: [Buildroot] [PATCH 1/1] ipmiutil: new package
In-Reply-To: <1411033115-6914-1-git-send-email-david.bachelart@bbright.com>
References: <1411033115-6914-1-git-send-email-david.bachelart@bbright.com>
Message-ID: <20140921220601.79d50cb8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear David Bachelart,

On Thu, 18 Sep 2014 11:38:35 +0200, David Bachelart wrote:

> diff --git a/package/ipmiutil/Config.in b/package/ipmiutil/Config.in
> new file mode 100644
> index 0000000..29d6e26
> --- /dev/null
> +++ b/package/ipmiutil/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_IPMIUTIL
> +	bool "ipmiutil"
> +	depends on BR2_TOOLCHAIN_HAS_SSP

Did you test if it works with an internal toolchain (i.e a toolchain
built by Buildroot) that has SSP enabled? Apparently, the package
forcefully links against -lssp. But I'm not sure if a libssp library is
built when SSP is enabled in the internal toolchain, because we use the
SSP support from the C library and not from the compiler. A
verification would be good, or even better, an improvement to ipmiutil
to make SSP support optional.

> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_ZLIB

This dependency on zlib seems unnecessary: I didn't see anything in
ipmiutil that references zlib directly. Did I miss it?

Also, the code contains call to fork(), so your package should depend
on BR2_USE_MMU. And the code uses threads, so it should depend on
thread support.

Try to make sure that your package builds fine with the following
toolchain configurations:

 - http://autobuild.buildroot.org/toolchains/configs/br-arm-basic.config
 - http://autobuild.buildroot.org/toolchains/configs/br-arm-full.config
 - http://autobuild.buildroot.org/toolchains/configs/bfin-linux-uclibc.config
 - http://autobuild.buildroot.org/toolchains/configs/bfin-uclinux.config

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
