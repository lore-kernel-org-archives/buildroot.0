From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 8 Oct 2018 21:26:44 +0200
Subject: [Buildroot] Build failure building image for Beaglebone Black
 with QT5 on Ubuntu 18 host
In-Reply-To: <a893afee-de9d-c469-b713-05b029ce16a5@rhtech.co.nz>
References: <a893afee-de9d-c469-b713-05b029ce16a5@rhtech.co.nz>
Message-ID: <7aeab332-7fd7-5e22-80d7-870452204377@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 8/10/18 21:03, Jeremy Cole-Baker wrote:
> Hello,
> 
> I am trying to build an image for a Beaglebone Black with QT5 support, but I
> have run into a build error.
> 
> Host system: Intel i5 PC / Ubuntu 18
> 
> Build process:
> 
> * Installed various build tools, e.g:
> sudo apt-get install minicom git ncurses-dev gedit flex bison python
> sudo apt-get install texinfo g++ gettext u-boot-tools autoconf make
> 
> * Cloned Buildroot (2018.08):
> git clone git://git.buildroot.net/buildroot
> cd buildroot
> git checkout 2018.08.x
> 
> * Default Beaglebone build (no QT5):
> 
> make beaglebone_defconfig
> make
> 
> Worked OK! (image generated in output/images)
> 
> * Beaglebone WITH QT5:
> 
> make clean
> make beaglebone_qt5_defconfig
> make

 This is a known issue. beaglebone_qt5_defconfig uses U-Boot 2016.09.1 which is
broken with recent dtc. beaglebone_defconfig uses U-Boot 2018.07 which has been
fixed. See https://git.buildroot.org/buildroot/tree/CHANGES?h=2018.08#n12

 Regards,
 Arnout

> 
> Result:
> 
> In file included from tools/../include/libfdt.h:54:0,
> ???????????????? from tools/fdt_host.h:11,
> ???????????????? from tools/imagetool.h:24,
> ???????????????? from tools/atmelimage.c:8:
> /home/jeremy/buildroot/output/host/include/libfdt_env.h:71:30: error:
> conflicting types for ?fdt64_t?
> ?typedef uint64_t FDT_BITWISE fdt64_t;
> ????????????????????????????? ^~~~~~~
> In file included from <command-line>:0:0:
> ././include/libfdt_env.h:19:16: note: previous declaration of ?fdt64_t? was here
> ?typedef __be64 fdt64_t;
> ??????????????? ^~~~~~~
> In file included from ././include/libfdt_env.h:12:0,
> ???????????????? from <command-line>:0:
> /home/jeremy/buildroot/output/host/include/libfdt_env.h:91:24: error: expected
> ?)? before ?x?
> ?static inline uint32_t fdt32_to_cpu(fdt32_t x)
> 
>>>> Omitted - many similar errors <<<
> 
> In file included from tools/fdt_host.h:11:0,
> ???????????????? from tools/imagetool.h:24,
> ???????????????? from tools/aisimage.c:8:
> tools/../include/libfdt.h:1602:19: note: previous definition of
> ?fdt_appendprop_u64? was here
> ?static inline int fdt_appendprop_u64(void *fdt, int nodeoffset,
> ?????????????????? ^~~~~~~~~~~~~~~~~~
> In file included from include/image.h:53:0,
> ???????????????? from tools/aisimage.c:10:
> /home/jeremy/buildroot/output/host/include/libfdt.h:1790:19: error: redefinition
> of ?fdt_appendprop_cell?
> ?static inline int fdt_appendprop_cell(void *fdt, int nodeoffset,
> ?????????????????? ^~~~~~~~~~~~~~~~~~~
> In file included from tools/fdt_host.h:11:0,
> ???????????????? from tools/imagetool.h:24,
> ???????????????? from tools/aisimage.c:8:
> tools/../include/libfdt.h:1614:19: note: previous definition of
> ?fdt_appendprop_cell? was here
> ?static inline int fdt_appendprop_cell(void *fdt, int nodeoffset,
> ?????????????????? ^~~~~~~~~~~~~~~~~~~
> scripts/Makefile.host:116: recipe for target 'tools/aisimage.o' failed
> make[3]: *** [tools/aisimage.o] Error 1
> Makefile:1221: recipe for target 'tools' failed
> make[2]: *** [tools] Error 2
> package/pkg-generic.mk:229: recipe for target
> '/home/jeremy/buildroot/output/build/uboot-2016.09.01/.stamp_built' failed
> make[1]: *** [/home/jeremy/buildroot/output/build/uboot-2016.09.01/.stamp_built]
> Error 2
> Makefile:79: recipe for target '_all' failed
> make: *** [_all] Error 2
> 
> I guess this is failing to build uboot? Maybe incorrect headers somewhere?
> 
> I also tried this with several different toolchain options on a Windows 10
> machine with Ubuntu 18 under the Windows Linux subsystem, and got the same build
> error with beaglebone_qt5_defconfig.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
