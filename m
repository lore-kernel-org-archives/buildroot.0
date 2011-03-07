From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Mar 2011 14:48:17 +0100
Subject: [Buildroot] Applying custom kernel patches
In-Reply-To: <AANLkTi=_dHFneTLXe3+P1-cOM2dsLsQW6f_fgbK7hSQy@mail.gmail.com>
References: <AANLkTi=_dHFneTLXe3+P1-cOM2dsLsQW6f_fgbK7hSQy@mail.gmail.com>
Message-ID: <20110307144817.216eeec3@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bruce,

On Fri, 4 Mar 2011 21:15:30 +0000
bruce bushby <bruce.bushby@gmail.com> wrote:

> .....however I'm having some problems applying my patches. Everything
> compiles 100% if I patch "/opt/buildroot/output/toolchain/linux-2.6.38-rc5",
> however I would
> like it to apply my patches after extracting the tar ball from
> "/opt/buildroot/dl/linux-2.6.38-rc5.tar.bz2" when I run "make"
> 
> I've tried placing my patches in:
> /opt/buildroot/linux/kernel-patches/0001-linux-2.6.38-rc5.patch
> 
> I also tried putting them in
> /opt/buildroot/package/linux/kernel-patches/0001-linux-2.6.38-rc5.patch
> 
> Using "make menuconfig" under specified custom patches I added:
> linux/kernel-patches/0001-linux-2.6.38-rc5.patch
> 
> ...but it won't apply the patch.
> 
> Any ideas?

Do the following :

	mkdir board/bruce_company/bruce_product/linux
	cp ALL_YOUR_PATCHES board/bruce_company/bruce_product/linux

All patches must have filenames that start with "linux-".

Then, run make menuconfig, and use the following options :

	Kernel
		-> Linux Kernel
			-> Kernel version (Custom version)
			-> (2.6.XX) Kernel version
			-> (board/bruce_company/bruce_product/linux) Custom kernel patches

Of course, make sure your patches match the selected kernel version.

Then, in order to save your configuration and make it a default :

	make savedefconfig
	mv defconfig configs/bruce_product_defconfig

Now, you can build Buildroot with:

	make bruce_product_defconfig
	make

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
