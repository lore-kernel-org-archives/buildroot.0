From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jul 2017 10:16:20 +0200
Subject: [Buildroot] [RFC] best way to fix a valgrind gcc 5 compile
 error on MIPS Octeon2
In-Reply-To: <88778A28-0DC4-4E6C-ADBC-D2D8E48392E2@exablox.com>
References: <CAAnoztGZF5pH9jfxt4TN9--HwdvzVus1L+5QNPcQ76H-cbfGqw@mail.gmail.com>
 <20170718100126.3315e58f@windsurf>
 <88778A28-0DC4-4E6C-ADBC-D2D8E48392E2@exablox.com>
Message-ID: <20170719101620.065670bb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Adding Vicente in Cc.

On Wed, 19 Jul 2017 00:04:39 +0000, Charles Hardin wrote:
> Looks like pilot error - we were using a gcc compiled toolchain and even though
> this sets the ?march? to octeon2 - the gcc results and wrappers don?t override the setup
> for march flags. This just means that in valgrind - our build results in the FLAG_MIPS64
> getting set to ?-march=mips64? and not in a using a default config with something like
> BR2_mips_64r2=y.

Sorry, but I don't really understand what you say here. So you added
additional MIPS architecture variants (octeon, octeon2, octeon3), and
you were using this new BR2_mips_octeon2=y option. So far so good,
octeon, octeon2 and octeon3 are valid MIPS architecture variants for
gcc (and perhaps it would be good to have them in Buildroot).

However, did you adjust the BR2_GCC_TARGET_ARCH definition in
arch/Config.in.mips to properly associate those MIPS cores to the right
-march option? Indeed you must add something like:

config BR2_GCC_TARGET_ARCH
	...
	default "octeon"	if BR2_mips_octeon
	default "octeon2"	if BR2_mips_octeon2
	default "octeon3"	if BR2_mips_octeon3

This will set --with-arch=octeon2 when building gcc.

Can you try with this? I believe it would be useful to have the Octeon
family supported in Buildroot, as they seem to be quite popular.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
