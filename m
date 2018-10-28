From: Erico Nunes <nunes.erico@gmail.com>
Date: Sun, 28 Oct 2018 19:00:54 +0100
Subject: [Buildroot] merge_config.sh not working on out of tree builds since
 kconfig bump
Message-ID: <CAK4VdL0hEzyrMWJVXkokn+MrZpC=5pF-173OHVcGjT+O9W=OjQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

since commit "6eacea5ae0 support/kconfig: bump to kconfig from Linux
4.17-rc2", buildroot/support/kconfig/merge_config.sh no longer works
with out of tree Buildroot builds.
Here is a simple reproducer and the issue I see:

Before:

$ make -C buildroot O=$PWD/output defconfig
...
$ cd output
$ echo 'BR2_TARGET_GENERIC_HOSTNAME="test"' > test.frag
$ ../buildroot/support/kconfig/merge_config.sh .config test.frag
Using .config as base
Merging test.frag
umask 0022 && make -C /home/test/buildroot O=/home/test/output/. alldefconfig
  GEN     /home/test/output/Makefile
/tmp/.tmp.config.Mv8mtFExlv:3963:warning: override: reassigning to
symbol BR2_TARGET_GENERIC_HOSTNAME
#
# configuration written to /home/test/output/.config
#

After:

$ make -C buildroot O=$PWD/output defconfig
...
$ cd output
$ echo 'BR2_TARGET_GENERIC_HOSTNAME="test"' > test.frag
$ ../buildroot/support/kconfig/merge_config.sh .config test.frag
Using .config as base
Merging test.frag
umask 0022 && make -C /home/test/buildroot O=/home/test/output/. alldefconfig
  GEN     /home/test/output/Makefile
*** Can't read seed configuration "./.tmp.config.qIcpASpUyh"!
make[1]: *** [Makefile:925: alldefconfig] Error 1
make: *** [Makefile:16: _all] Error 2


I understand that kconfig is mostly ported from the kernel, but I
don't know if this may be caused by any Buildroot customizations.
I don't use merge_config.sh with the kernel but a simple attempt based
on the above with 4.19-rc6 seems to work.
The workaround seems to be to run merge_config.sh from the buildroot tree.
Any clue?

Thanks

Erico
