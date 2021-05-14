From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 May 2021 18:18:49 +0200
Subject: [Buildroot] BR2_PACKAGE_BUSYBOX_CONFIG ignored
In-Reply-To: <b68fa0a4d3734a67bef3497336d7620b@AcuMS.aculab.com> (David
 Laight's message of "Fri, 14 May 2021 15:29:15 +0000")
References: <1620983462705-0.post@n4.nabble.com>
 <87a6oxtl7d.fsf@dell.be.48ers.dk>
 <b68fa0a4d3734a67bef3497336d7620b@AcuMS.aculab.com>
Message-ID: <875yzlthjq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "David" == David Laight <David.Laight@ACULAB.COM> writes:

Hi,

 > I think it must go wrong after those checks.

 > I've a local copy of busybox.config referenced from my buildroot config file.
 > There is also the default busybox.config inside buildroot.
 > And finally a .config file inside the busybox tree.

 > When I run 'make busybox-menuconfig' it only reads and updates the latter.
 > Even if I copy the .config to my busybox.config to ensure it is valid.

Just to make sure I follow you, you are doing this from a clean tree,
right? The config file is only copied to output/build/busybox-*/.config
once (unless you run make busybox-clean-kconfig-for-reconfigure).

It works here:

make savedefconfig

cat defconfig
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
BR2_PACKAGE_BUSYBOX_CONFIG="/tmp/config"
# BR2_TARGET_ROOTFS_TAR is not set

cat /tmp/config
CONFIG_BRCTL=y
# CONFIG_HTTPD is not set

make busybox-dirclean && make busybox-menuconfig
..
[*] brctl (4.7 kb)
[ ] httpd (32 kb)

What Buildroot version are you using?

 > I think this used to work (about three years ago) because our own scripts
 > recover the updated file so it can be saved under source control.
 > (Not that I actually remember doing that.)

We already have 'make busybox-update-config' for that:

make busybox-update-config
cp -f /home/peko/source/buildroot/output-busybox/build/busybox-1.33.0/.config /tmp/config

-- 
Bye, Peter Korsgaard
