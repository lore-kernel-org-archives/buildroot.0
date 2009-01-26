From: Cyril HAENEL <chaenel@free.fr>
Date: Mon, 26 Jan 2009 09:48:18 +0100
Subject: [Buildroot] 2009.02-rc2 released
In-Reply-To: <87wscid33u.fsf@macbook.be.48ers.dk>
References: <3B941116898CDA489B91563DEF88F4B607F8DB@iwt-server.iwt.local>	<1232868757.5311.170.camel@elrond.atmel.com>	<87zlhffs9j.fsf@macbook.be.48ers.dk>	<1232918236.2298.9.camel@elrond.atmel.com>	<8763k3dqi3.fsf@macbook.be.48ers.dk>	<1232922252.2298.34.camel@elrond.atmel.com>	<497CFB4F.2010402@iwtech.com.au>
	<87wscid33u.fsf@macbook.be.48ers.dk>
Message-ID: <497D78D2.2040404@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Peter Korsgaard a ?crit :
>>>>>> "Paul" == Paul Jones <paul.jones@iwtech.com.au> writes:
>>>>>>             
>
>  Paul> Ulf Samuelsson wrote:
>  >> 
>  >> Now it works, regardless if you have X or not.
>  >> so we and the user do not have to choose.
>  >> 
>  >> If X is available you have a better experience.
>
>  Paul> I should just point out that my build system is a Gentoo64
>  Paul> server via SSH, my desktop is usually Windows. I'd much prefer
>  Paul> to use X myself but don't relay have a choice.
>
> Exactly. We've heard from other people using a similar setup.
>
> Menuconfig obviously works as we use it in buildroot, so that's the
> safe choice for kernel config as well.
>
>  Paul> As a newbie here I tend to need as much help as I can get! When
>  Paul> the build crashed and complained about QT missing I thought I'd
>  Paul> accidentally added some X package into buildroot, it was only
>  Paul> after a few hours of doing step by step builds that I figured
>  Paul> out it must have been running xconfig rather than
>  Paul> menuconfig. Once I disabled the kernel it compiled first go,
>  Paul> which is still a lot further than I got when I first tried
>  Paul> buildroot a few months ago!
>
>  Paul> Keep up the good work guys!
>
> Thanks.
>
>   
Is someone has a successfull compilation for ARM platform and at91sam9260 !?
On my side, I made a lot of tests, and I can't be able to successfully 
generate the rootfs.

For example :

tar jxvf buildroot-2009.02-rc2.tar.bz2.bz
cd buildroot-2009.02-rc2
make menuconfig +exit +save
make at91sam9260dfc_defconfig

I answer the default answer to all questions
I edit the .config the disable the BR2_ENABLE_LOCALE option (if I don't 
do that I have an error during uclibc compilation)

make

toolchain and uclibc compilation are OK, but after a while I have this 
error :

/usr/bin/gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" 
-DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" 
-DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\"  -I. -I.     -g -O2 
-Wunused -Wall -c `test -f 'modinfo.c' || echo './'`modinfo.c
modinfo.c: In function 'main':
modinfo.c:338: attention : 'infosize' may be used uninitialized in this 
function
/usr/bin/gcc  -g -O2 -Wunused -Wall   -o modinfo  modinfo.o zlibsupport.o 
/usr/bin/gcc  -g -O2 -Wunused -Wall   -o insmod.static -static insmod.o 
/usr/bin/ld: cannot find -lc
collect2: ld a retourn? 1 code d'?tat d'ex?cution
make[1]: *** [insmod.static] Erreur 1
make[1]: quittant le r?pertoire ? 
/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/toolchain_build_arm/module-init-tools-3.2.2 
?
make: *** 
[/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/toolchain_build_arm/module-init-tools-3.2.2/depmod] 
Erreur 2


My needs are relatively simple, I need a jffs2 rootfs for my board with 
Bash + Boa + PHP + Sqlite + wireless tools.

So I try another solution :

tar jxvf buildroot-2009.02-rc2.tar.bz2.bz
make menuconfig, change target to ARM, exit and save
make

It works !

make menuconfig, I add Sqlite, exit and save
make

It works !

make menuconfig, I add PHP, exit and save
make, there is an error php-5.2.8.tar.bz2 is not downloaded, I download 
it manually and put it in the dl directory
make

I have an error :

ext/pdo_sqlite/sqlite/src/os_unix.o: In function `sqlite3UnixDlclose':
/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/build_arm/php-5.2.8/ext/pdo_sqlite/sqlite/src/os_unix.c:2627: 
undefined reference to `dlclose'
ext/pdo_sqlite/sqlite/src/os_unix.o: In function `sqlite3UnixDlsym':
/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/build_arm/php-5.2.8/ext/pdo_sqlite/sqlite/src/os_unix.c:2624: 
undefined reference to `dlsym'
ext/pdo_sqlite/sqlite/src/os_unix.o: In function `sqlite3UnixDlopen':
/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/build_arm/php-5.2.8/ext/pdo_sqlite/sqlite/src/os_unix.c:2621: 
undefined reference to `dlopen'
collect2: ld returned 1 exit status
make[1]: *** [sapi/cgi/php-cgi] Erreur 1
make[1]: quittant le r?pertoire ? 
/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/build_arm/php-5.2.8 
?
make: *** 
[/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/build_arm/php-5.2.8/.built] 
Erreur 2


So I try another thing, from the beginning :

tar jxvf buildroot-2009.02-rc2.tar.bz2.bz
make menuconfig, change target to ARM, exit and save
make

It works !

make menuconfig, in target filesystem option, I add JFFS2 root 
filesystem, I change memory type to Nand flash 2kB page and 128KB block, 
exit and save
make

Compilation problem on the lzo package :

CC="/usr/bin/gcc" CROSS= 
CFLAGS=-I/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/toolchain_build_arm/linux/include 
\
        /usr/bin/make -j1 LINUXDIR= \
        
BUILDDIR=/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/toolchain_build_arm/mtd_orig 
\
        -C 
/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/toolchain_build_arm/mtd_orig 
mkfs.jffs2
make[1]: entrant dans le r?pertoire ? 
/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/toolchain_build_arm/mtd_orig 
?
mkdir -p 
/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/toolchain_build_arm/mtd_orig
gcc -I./include -O2 -Wall -g -c -o 
/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/toolchain_build_arm/mtd_orig/crc32.o 
crc32.c -g 
-Wp,-MD,/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/toolchain_build_arm/mtd_orig/.crc32.c.dep
mkdir -p 
/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/toolchain_build_arm/mtd_orig
gcc -I./include -O2 -Wall -g -c -o 
/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/toolchain_build_arm/mtd_orig/compr_rtime.o 
compr_rtime.c -g 
-Wp,-MD,/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/toolchain_build_arm/mtd_orig/.compr_rtime.c.dep
mkdir -p 
/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/toolchain_build_arm/mtd_orig
gcc -I./include -O2 -Wall -g -c -o 
/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/toolchain_build_arm/mtd_orig/mkfs.jffs2.o 
mkfs.jffs2.c -g 
-Wp,-MD,/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/toolchain_build_arm/mtd_orig/.mkfs.jffs2.c.dep
mkdir -p 
/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/toolchain_build_arm/mtd_orig
gcc -I./include -O2 -Wall -g -c -o 
/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/toolchain_build_arm/mtd_orig/compr_zlib.o 
compr_zlib.c -g 
-Wp,-MD,/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/toolchain_build_arm/mtd_orig/.compr_zlib.c.dep
mkdir -p 
/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/toolchain_build_arm/mtd_orig
gcc -I./include -O2 -Wall -g -c -o 
/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/toolchain_build_arm/mtd_orig/compr_lzo.o 
compr_lzo.c -g 
-Wp,-MD,/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/toolchain_build_arm/mtd_orig/.compr_lzo.c.dep
compr_lzo.c:29:23: erreur: lzo/lzo1x.h : Aucun fichier ou dossier de ce type
compr_lzo.c: In function 'jffs2_lzo_cmpr':
compr_lzo.c:54: attention : implicit declaration of function 
'lzo1x_999_compress'
compr_lzo.c:56: erreur: 'LZO_E_OK' undeclared (first use in this function)
compr_lzo.c:56: erreur: (Each undeclared identifier is reported only once
compr_lzo.c:56: erreur: for each function it appears in.)
compr_lzo.c: In function 'jffs2_lzo_decompress':
compr_lzo.c:74: attention : implicit declaration of function 
'lzo1x_decompress_safe'
compr_lzo.c:76: erreur: 'LZO_E_OK' undeclared (first use in this function)
compr_lzo.c: In function 'jffs2_lzo_init':
compr_lzo.c:95: erreur: 'LZO1X_999_MEM_COMPRESS' undeclared (first use 
in this function)
make[1]: *** 
[/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/toolchain_build_arm/mtd_orig/compr_lzo.o] 
Erreur 1
make[1]: quittant le r?pertoire ? 
/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/toolchain_build_arm/mtd_orig 
?
make: *** 
[/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/toolchain_build_arm/mtd_orig/mkfs.jffs2] 
Erreur 2


I don't know since how many day and hours I try to generate a working 
rootfs, but I begin to become completely crasy :)))))

Regards,
Cyril

-- 

Cyril Haenel
Registered Linux User #332632
