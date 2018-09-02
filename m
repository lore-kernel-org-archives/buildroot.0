From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 2 Sep 2018 15:47:34 +0200
Subject: [Buildroot] [[PATCH v2 2/2] package/mender-artifact: initial
 support
In-Reply-To: <20180827113728.20856-3-mirza.krak@northern.tech>
References: <20180827113728.20856-1-mirza.krak@northern.tech>
 <20180827113728.20856-3-mirza.krak@northern.tech>
Message-ID: <20180902154734.4f5a7f40@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mirza,

Overall it looks good, except for one aspect, which will require a bit
of discussion.

On Mon, 27 Aug 2018 13:37:28 +0200, Mirza Krak wrote:

> diff --git a/package/mender-artifact/Config.in.host b/package/mender-artifact/Config.in.host
> new file mode 100644
> index 0000000000..d2deabc783
> --- /dev/null
> +++ b/package/mender-artifact/Config.in.host
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_HOST_MENDER_ARTIFACT
> +	bool "host mender-artifact"
> +	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS

I am not happy about those dependencies, because they are dependencies
meant to be used for *target* packages, not for *host* packages.

BR2_TOOLCHAIN_HAS_THREADS is easy: it's not needed for host packages,
as we assume the build machine has thread support.

For the other dependencies, it's a bit more complicated, but I believe
somewhat similar to the situation we have with the Rust support.

Right now, BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS indicates if the
currently selected target architecture is supported by Go. This is fine
for target packages.

But apparently, host-go provides really two things:

 (1) A Go compiler capable of building code for the host machine.

 (2) A Go compiler capable of building code for the target machine.

For Go target packages, We are currently using (2), and for packages
that rely on (2), using BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS make sense.

However, with your support for host packages, what we rely on is (1).
And for that BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS doesn't make a lot of
sense.

For example, BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS says that Go is not
available on the ARC architecture. But for building a host package, we
really don't care about this: what matters is that Go is capable of
building code for the x86 or x86-64 build machine.

Therefore, we should probably use the same strategy as Rust, which is
proposed in patch http://patchwork.ozlabs.org/patch/961158/:

 - The BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS is changed to only indicate if
   Go supports the host/build system architecture. In our case, it
   should probably just be:

	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS

   All host Go packages should depend on this option.

 - A new BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS that indicates if Go
   supports the target system architecture. It should be:

	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
        depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
                || BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
                || BR2_mips64 || BR2_mips64el
        depends on !BR2_ARM_CPU_ARMV4
        # MIPS R6 support in Go has not yet been developed.
        depends on !BR2_MIPS_CPU_MIPS64R6

Of course we can only do this if host-go builds correctly regardless of
whether the target architecture is supported or not. What Rust does is:

 - If the target is architecture is supported by Rust, it installs
   support for building code for both the host and the target
   architectures.

 - If the target is architecture is not supported by Rust, it only
   installs support for building code for the host architecture.

Do you know how Go supports this ? I have no idea how Go is told to
support this or that architecture. Could you investigate this ?

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
