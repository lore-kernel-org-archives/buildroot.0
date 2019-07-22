From: Andreas Naumann <dev@andin.de>
Date: Mon, 22 Jul 2019 16:09:59 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-07-20
In-Reply-To: <20190721210110.0b3620b0@gmx.net>
References: <20190721060040.4E27586230@whitealder.osuosl.org>
 <20190721210110.0b3620b0@gmx.net>
Message-ID: <9f2cfe09-b9af-285f-b192-f7b2bc975d68@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter, all,


Am 21.07.19 um 21:01 schrieb Peter Seiderer:
> Hello *,
> 
> On Sun, 21 Jul 2019 06:00:34 -0000, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
>> Hello,
>>
>> Build statistics for 2019-07-20
> 
> [...]
> 
>>       sparc64 |                  libv4l-1.16.5 | NOK | http://autobuild.buildroot.net/results/79c1e1b7a1bc53c1e9b2ae0c9acb443e6d2e2994 |
> 
> make[4]: Entering directory '/home/buildroot/build/instance-1/output/build/libv4l-1.16.5/utils/qv4l2'
> 
> [...]
> 
>    CXXLD    qv4l2
> libtool: warning: library '/home/buildroot/build/instance-1/output/host/bin/../sparc64-buildroot-linux-gnu/sysroot/usr/lib/libQt5Widgets.la' was moved.
> libtool:   error: cannot find the library '' or unhandled argument '/libQt5Gui.so'
> Makefile:571: recipe for target 'qv4l2' failed
> 
> 
>>From host/sparc64-buildroot-linux-gnu/sysroot/usr/lib/libQt5Widgets.la:
> 
> 	# Libraries that this one depends upon.
> 	dependency_libs='-latomic /libQt5Gui.so /libQt5Core.so -lpthread -lrt -lpthread -ldl '


I have rebuilt the sparc config that led to this failure as well as an 
arm config (imx6-sabresd_qt5) and can confirm that both now (Qt 5.12.4) 
create lines like
   dependency_libs='-latomic <pkg-build-dir>/lib/libQt5Core.so -lpthread 
-lrt -lpthread -ldl '

instead of (Qt 5.11.3)
   dependency_libs='-L<pkd-build-dir>/lib -lQt5Core -lrt -ldl -latomic 
-lpthread '

Right now I dont have the time to find out why and what exactly has 
changed in Qt (or elsewhere) to cause that.

> 
> This can be fixed by reverting 'qt5: Remove *.la/*.prl fixup script' ([1]), and adding
> 
> 	-e "s:\/lib\([a-zA-Z0-9_-]*\)\.so:-l\1:g"
> 
> to the sed statement, resulting in the following dependency_libs line:
> 
> 	# Libraries that this one depends upon.
> 	dependency_libs='-latomic -lQt5Gui -lQt5Core -lpthread -lrt -lpthread -ldl '

Obviously the la fixup code in pkg-generic.mk is no longer able to 
handle the occurence of so-files with full path correctly. However, I 
wonder if pkg-generic would be an acceptable place to fix the issue.?


regards,
Andreas


> 
> Regards,
> Peter
> 
> [1] https://git.buildroot.net/buildroot/commit/?id=428e5276e4df0b4bbd75df38565298ad53ea4f8b
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
