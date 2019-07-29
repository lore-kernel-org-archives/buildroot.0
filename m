From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 29 Jul 2019 08:08:02 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-07-27
References: <20190728060040.E179C88937@hemlock.osuosl.org>
Message-ID: <23f21gxfdm.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 28 Jul 2019 06:00:35 +0000 schrieb Thomas Petazzoni:

>        sparc |                    vlc-3.0.7.1 | NOK |
>        http://autobuild.buildroot.net/results/
c9be4ef68c9c5d018e4084c52215ce69f0c72538

Hi,

having no idea what the root cause of the qt5-related build error is I 
would just like to post the manual changes needed to fix the build error:

Only vlc version 3.0.7.1 is affected
http://autobuild.buildroot.net/?reason=vlc-3.0.7.1
although I fail to see any changes upstream which could cause them:

http://git.videolan.org/?p=vlc/vlc-3.0.git;a=shortlog;h=refs/tags/
3.0.7.1-1

Instead it seems some libQt*.la files are seriously broken causing the 
build error, analyzed http://autobuild.buildroot.net/results/f19/
f19d509167ea5d38cba54ae53016caaeb0a076d5/:

libtool:   error: cannot find the library '' or unhandled argument '/data/
buildroot/buildroot-test/instance-0/output/host/riscv64-buildroot-linux-
gnu/sysroot/usr/lib/libQt5Widgets.so'

In the following lines I will show the .la content after the qt5 packages 
were built and the manual changes needed to fix the vlc build error:

libQt5Svg.la
old:
dependency_libs='-latomic /home/bernd/buildroot/br6/output/host/riscv64-
buildroot-linux-gnu/sysroot/usr/lib/libQt5Widgets.so /home/bernd/
buildroot/br6/output/host/riscv64-buildroot-linux-gnu/sysroot/usr/lib/l
ibQt5Gui.so /home/bernd/buildroot/br6/output/host/riscv64-buildroot-linux-
gnu/sysroot/usr/lib/libQt5Core.so -lpthread -lrt -lpthread -ldl '

new:
dependency_libs='-latomic -lQt5Widgets -lQt5Gui -lQt5Core -lpthread -lrt -
lpthread -ldl '

Build error changes to

libtool:   error: cannot find the library '' or unhandled argument '/
libQt5Gui.so'

libQt5Widgets.la
old:
dependency_libs='-latomic /libQt5Gui.so /libQt5Core.so -lpthread -lrt -
lpthread -ldl '

new:
dependency_libs='-latomic -lQt5Gui -lQt5Core -lpthread -lrt -lpthread -
ldl '

Build error changes to
libtool:   error: cannot find the library '' or unhandled argument '/
libQt5Core.so'

libQt5Gui.la
old:
dependency_libs='-latomic /libQt5Core.so -lpthread -lrt -lpthread -ldl '

new:
dependency_libs='-latomic -lQt5Core -lpthread -lrt -lpthread -ldl '

Now the vlc builds succeeds.

Regards, Bernd
