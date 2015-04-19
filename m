From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 19 Apr 2015 18:20:31 +0200
Subject: [Buildroot] [PATCH v4 1/1] Added linux drivers backports project
In-Reply-To: <20150419110326.31c34542@free-electrons.com>
References: <1429311670-7831-1-git-send-email-petr.vorel@gmail.com>
 <20150419110326.31c34542@free-electrons.com>
Message-ID: <5533D5CF.5000305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/04/15 11:03, Thomas Petazzoni wrote:
> Dear Petr Vorel,
> 
> On Sat, 18 Apr 2015 01:01:10 +0200, Petr Vorel wrote:
>> https://backports.wiki.kernel.org
>>
>> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> 
> I wanted to apply your patch, and did a couple of updates to it (see
> below). However, there's a more fundamental problem to this package: it
> expects the linux package to be extracted/configured *before* the
> configuration of linux-backports. Unfortunately, this is not the case:
> 'linux' is only in LINUX_BACKPORTS_DEPENDENCIES, so it's only
> guaranteed to be here when linux-backports gets configured, not before.


 Perhaps that's a problem in the kconfig infrastructure. The configure step
depends on the DEPENDENCIES, and I'd consider the *config targets conceptually
part of the configure step. Currently, *config only depends on the patch step
(through $(2)_KCONFIG_FILE), perhaps we should add the depends step to that.


 Regards,
 Arnout

> 
> So, when you run 'make linux-backports-menuconfig' from a clean
> Buildroot tree (i.e without doing a full 'make'), you get:
> 
> thomas at skate:~/projets/buildroot (master)$ make linux-backports-menuconfig
> yes "" |  /usr/bin/make -j5 -C /home/thomas/projets/buildroot/output/build/linux-backports-3.18.1-1 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm INSTALL_MOD_PATH=/home/thomas/projets/buildroot/output/target CROSS_COMPILE=" /home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-" DEPMOD=/home/thomas/projets/buildroot/output/host/sbin/depmod KLIB_BUILD=/home/thomas/projets/buildroot/output/build/linux-4.0 KLIB=/home/thomas/projets/buildroot/output/target oldconfig
> make[1]: Entering directory '/home/thomas/projets/buildroot/output/build/linux-backports-3.18.1-1'
> /--------------
> | Your kernel headers are incomplete/not installed.
> | Please install kernel headers, including a .config
> | file or use the KLIB/KLIB_BUILD make variables to
> | set the kernel to build against, e.g.
> |   make KLIB=/lib/modules/3.1.7/
> | to compile/install for the installed kernel 3.1.7
> | (that isn't currently running.)
> \--
> Makefile:40: recipe for target 'oldconfig' failed
> make[1]: *** [oldconfig] Error 1
> make[1]: Leaving directory '/home/thomas/projets/buildroot/output/build/linux-backports-3.18.1-1'
> package/linux-backports/linux-backports.mk:38: recipe for target '/home/thomas/projets/buildroot/output/build/linux-backports-3.18.1-1/.stamp_kconfig_fixup_done' failed
> make: *** [/home/thomas/projets/buildroot/output/build/linux-backports-3.18.1-1/.stamp_kconfig_fixup_done] Error 2
> 
> This is because output/build/linux-4.0 is currently empty, since the
> linux package has not been extracted yet.


[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
