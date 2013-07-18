From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 18 Jul 2013 11:46:23 +0200
Subject: [Buildroot] [RFC] BR2_DEFCONFIG not saved in defconfig,
	why? (or: can we change that?)
Message-ID: <CAAXf6LXJ6vkpMS2RxcakVPH8DvZeLi4Zejbnm-dLxWWeFmOXNQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Following commit:
http://git.buildroot.org/buildroot/commit/?id=1ed4996346c6504241c7a2c7541fefc914790219

added a configurable option to select the destination file of 'make
savedefconfig'.
The default is 'defconfig'. However, this new option BR2_DEFCONFIG is
not saved in the defconfig itself. This is intentional, says the
commit message:

"The BR2_DEFCONFIG value itself is not saved into the generated
defconfig, since Kconfig considers it at its default. This is
intentional, to avoid hard-coding an absolute path in the defconfig.
It will anyway be set again when the defconfig is used with the 'make
BR2_DEFCONFIG=... defconfig' command."

Due to this, I fail to see how I can benefit from BR2_DEFCONFIG.
My use case (before using BR2_DEFCONFIG) is as follows: I have
defconfigs for various projects stored inside the configs/
subdirectory. To build a given project, I run:
make <name_of_defconfig>
If I make changes to the configuration (through 'make menuconfig' or
manual changes in .config), I update the stored configuration as
follows:
make savedefconfig
mv defconfig configs/<name_of_defconfig>

I wanted to use BR2_DEFCONFIG to make these last steps simple. I had
expected to set BR2_DEFCONFIG in the configuration to
'configs/<name_of_defconfig>' or maybe
'$(CONFIG_DIR)/configs/<name_of_defconfig>' or
$(TOPDIR)/configs/name_of_defconfig), and then be able to run
make <name_of_defconfig>
to set a configuration, and
make savedefconfig
to store one.

However, in my current understanding of the feature, I am forced to use
make defconfig BR2_DEFCONFIG=configs/<name_of_defconfig>
to set a configuration, and then
make savedefconfig to store one.

To me, the command to set a configuration is overcomplicated.
Originally it was as simple as passing the name of the config file,
now you not only have to pass its actual path (configs/), but also you
have to give it in a variable BR2_DEFCONFIG, *and* use the defconfig
rule. So, I feel better off with the original behavior.

My question is: is it really needed that the value of BR2_DEFCONFIG is
kept out of the defconfig itself? It is perfectly possible to set a
relative path in it, or one based on a variable like TOPDIR or
CONFIG_DIR, like so many other options already do. If someone does
store an absolute path in it, I'd say this is the fault of the
developer.

What do you think?

Thanks,
Thomas
