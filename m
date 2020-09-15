From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Sep 2020 15:27:20 +0200
Subject: [Buildroot] Adding BR2_PACKAGE_PYTHON3 make U-Boot build fail
In-Reply-To: <d30bce23621c48874241cbd24e7c85a741067991.camel@brainlab.com>
References: <d30bce23621c48874241cbd24e7c85a741067991.camel@brainlab.com>
Message-ID: <20200915152720.355ef868@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Sep 2020 12:55:08 +0000
Jonatan Hatakeyama Zeidler <jonatan.zeidler@brainlab.com> wrote:

> my buildroot config (attached) works fine and produces a bootable
> build. Now I want to add Python 3 to the root fs. But adding
> BR2_PACKAGE_PYTHON3=y leads to a build error in u-boot:
> 
> ./arch/arm/mach-k3/make_fit.py am65xx_phycore_kit \
> arch/arm/dts/k3-am65xx-phycore-kit.dtb > u-boot.its
>   CAT     u-boot-dtb.bin
>   COPY    u-boot.dtb
>   MKIMAGE u-boot-dtb.img
>   COPY    u-boot.bin
> Traceback (most recent call last):
>   File "./arch/arm/mach-k3/make_fit.py", line 155, in <module>
>     main()
>   File "./arch/arm/mach-k3/make_fit.py", line 151, in main
>     generate_its(board, dtbs)
>   File "./arch/arm/mach-k3/make_fit.py", line 127, in generate_its
>     overlays=generate_fdts(get_overlays(board), dtbdir))
>   File "./arch/arm/mach-k3/make_fit.py", line 75, in get_overlays
>     m = r.match(l)
> TypeError: cannot use a string pattern on a bytes-like object
> 
> How is it possible that a target package affects the build tools? And
> how can I solve that?

When BR2_PACKAGE_PYTHON3=y, we create $(HOST_DIR)/bin/python as a
symlink to $(HOST_DIR)/bin/python3. This means that any script that
uses just "python" will be executed by the Python 3 interpreter built
by Buildroot. So if you have a Python 2.x script in the U-Boot build,
it won't work anymore.

While I can explain the situation, I don't immediately have a
good/simple solution to suggest. We have recently introduced
BR2_TARGET_UBOOT_NEEDS_PYTHON2 and BR2_TARGET_UBOOT_NEEDS_PYTHON3.
Perhaps these should ensure that the U-Boot build takes place with the
PATH that points to a folder where a "python" symlink is created,
pointing to the correct Python interpreter ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
