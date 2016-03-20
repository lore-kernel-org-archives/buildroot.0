From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 22:09:03 +0100
Subject: [Buildroot] [PATCH v3] linux: Build and install kernel selftests
In-Reply-To: <1458098793-28532-1-git-send-email-cyrilbur@gmail.com>
References: <1458098793-28532-1-git-send-email-cyrilbur@gmail.com>
Message-ID: <20160320220903.60ba5372@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Mar 2016 14:26:33 +1100, Cyril Bur wrote:
> +config BR2_LINUX_KERNEL_TOOL_SELFTESTS
> +	bool"selftests"
> +	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
> +	depends on BR2_USE_MMU  # bash
> +	select BR2_PACKAGE_BASH
> +	select BR2_PACKAGE_POPT
> +	select BR2_PACKAGE_LIBCAP_NG
> +	help
> +	  Build and install (to /usr/lib/kselftests) kernel selftests.
> +
> +	  Use of this option implies you know the process using and compiling

There was a typo here, a missing word between "process" and "using".

> +	  the kernel selftests. The Makefile to build and install these is very
> +	  noisy and may appear to cause your build to fail for strange reasons.
> +
> +	  This is very much a use at your risk option and may not work for
> +	  every setup or every architecture.

Those lines were slightly too long.

> +
> +comment "selftests needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS"
> +	depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS

You should have replicated the BR2_USE_MMU dependency here.

> +SELFTESTS_DEPENDENCIES = bash libcap-ng popt

bash is not needed at build time, it's only a runtime dependency, so
I've removed it from this variable (but kept it as a select in
Config.in, and added a comment that indicates it's a runtime
dependency).

It's worth noting that with uClibc, a number of tests fail to build,
but I guess that's expected, and it doesn't abort the build.

I've applied with the fixes I mentioned above.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
