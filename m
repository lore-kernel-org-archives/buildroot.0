From: Garret Kelly <garret.kelly@gmail.com>
Date: Wed, 11 Nov 2020 21:53:48 -0500
Subject: [Buildroot] Proper Out-of-tree Devicetree Source
Message-ID: <CAE_FxYsuX33=WuESanaB01YkD_DU=z+Q1hYr=Tp0kiXgHGtt4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi buildroot!
I'm trying to figure out the right way to use an out-of-tree device
tree (for uboot, to begin with, but definitely also TF-A and Linux).
So far, I've found that setting BR2_TARGET_UBOOT_CUSTOM_DTS_PATH
results in the files named there being copied into the arch/arm/dts
directory in the uboot build directory. However, these files aren't
referenced by the arch/arm/dts/Makefile, and therefore the DTBs are
never built.

I found that I could add "dtb-y=whatever.dtb" to
BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS, which does result in the DTS getting
compiled, but seems a little hacky. Not that I mind.

I was thinking about adding the dtb-y inclusion trick to uboot.mk, but
I realized as I was doing this that "DTS source files" probably also
implies .dtsi files, and so those can't be added. I suppose I could
filter out non-.dts files from being turned into targets, that might
be the most ergonomic way.

Kind of as an aside: I then started wondering if there shouldn't be
something like BR2_TARGET_DTS_SOURCE which is used to automatically
configure uboot, TF-A, and Linux devicetree configurations so that you
can easily share a single set of devicetree source among the
packages...

Garret
