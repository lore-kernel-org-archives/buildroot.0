From: Maik.Brenke at continental-corporation.com <Maik.Brenke@continental-corporation.com>
Date: Thu, 19 Apr 2018 09:59:47 +0200
Subject: [Buildroot] implement of linux-gpib package for version 4.1.0
Message-ID: <OFF17987C3.31AB9F37-ONC1258274.002690A6-C1258274.002BECEF@continental-corporation.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hello Ladys and Gentleman,

again the topic linux-gpib pops up. I so far checked the mailing list and see that there was quiet some work on version 4.0.3 (see [1]). Now I am trying to set up version 4.1.0.
I got all the information I can find from [1]. According to [1] I configured my packages like [2]. But when I try to build the package it ends up in [3].
Is there already a working implementation for linux-gpib? I noticed that "Yann E. MORIN-2" already worked on this topic (see [4]). But I was not able to contact him directly.

By the way I use a imx6sx. I also attached the hole log as file.


[1]:
http://buildroot-busybox.2317881.n4.nabble.com/help-please-td140488.html#a140606

[2]:
---------------
$ cat linux-gpib.mk 
################################################################################
#
# linux-gpib
#
################################################################################

LINUX_GPIB_VERSION = 4.1.0
LINUX_GPIB_SITE = http://downloads.sourceforge.net/project/linux-gpib/linux-gpib%20for%203.x.x%20and%202.6.x%20kernels/$(LINUX_GPIB_VERSION)
LINUX_GPIB_SOURCE = linux-gpib-$(LINUX_GPIB_VERSION).tar.gz
LINUX_GPIB_LICENSE = GPLv2
LINUX_GPIB_LICENSE_FILES = COPYING
LINUX_GPIB_INSTALL_STAGING = YES
LINUX_GPIB_AUTORECONF = YES
LINUX_GPIB_CONF_OPTS = --with-linux-srcdir=$(LINUX_DIR)/

$(eval $(autotools-package))

-----------
$ cat Config.in 
config BR2_PACKAGE_LINUX_GPIB
??? bool "linux-gpib"
??? depends on BR2_LINUX_KERNEL
??? help
??? ? The Linux GPIB Package is a support package for GPIB
??? ? (IEEE 488) hardware. The package contains kernel driver
??? ? modules, and a C user-space library with Guile, Perl, PHP,
??? ? Python and TCL bindings. The API of the C library is intended
??? ? to be compatible with National Instrument's GPIB library.
??? ? 
??? ? http://linux-gpib.sourceforge.net


--------
$ cat 0001-configure-scm_version.patch 
--- a/configure.ac??? 2018-04-18 16:49:31.499095044 +0200
+++ b/configure.ac??? 2018-04-18 16:49:26.414918285 +0200
@@ -30,9 +30,10 @@ AC_SUBST([GPIB_SO_VERSION])
?[ISODATE=`date +%Y-%m-%d`]
?AC_SUBST([ISODATE])
?
-AC_CHECK_FILE([util/.scm_version.tmp],
-? [SCM_VERSION=[$VERSION"\ [r"`cat util/.scm_version.tmp`"]"]],
-? [SCM_VERSION=$VERSION])
+#AC_CHECK_FILE([util/.scm_version.tmp],
+#? [SCM_VERSION=[$VERSION"\ [r"`cat util/.scm_version.tmp`"]"]],
+#? [SCM_VERSION=$VERSION])
+SCM_VERSION=4.1.0
?
?AC_SUBST(SCM_VERSION)


[3]:
>>> linux-gpib 4.1.0 Configuring
>>> linux-gpib 4.1.0 Autoreconfiguring
&#8230;
Unescaped left brace in regex is deprecated, passed through in regex; marked by <-- HERE in m/\${ <-- HERE ([^ \t=:+{}]+)}/@/home/brenkem/git/DD_TEST/output/host/usr/bin/automake line 3936.
&#8230;
checking Linux kernel compile flags... arm-linux-gcc: error: unrecognized command line option '-m64'
arm-linux-gcc: error: unrecognized command line option '-mno-red-zone'
arm-linux-gcc: error: unrecognized command line option '-mcmodel=kernel'
arm-linux-gcc: error: unrecognized command line option '-mno-sse'
arm-linux-gcc: error: unrecognized command line option '-mno-mmx'
arm-linux-gcc: error: unrecognized command line option '-mno-sse2'
arm-linux-gcc: error: unrecognized command line option '-mno-3dnow'
make[2]: *** [/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/util/linux_flags/fake.o] Error 1
make[1]: *** [_module_/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/util/linux_flags] Error 2
configure: WARNING: Failed to get compile flags from Linux kernel directory.
ok
&#8230;
configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --with-xmlto, --with-fop, --enable-ipv6
>>> linux-gpib 4.1.0 Building
&#8230;
? arm-linux-gcc -I/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0 -I/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/include -I/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/include -Wp,-MD,/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/cec/.init.o.d? -nostdinc -isystem /usr/local/arm/fs-toolchain-5.2.0-armv7ahf/lib/gcc/arm-fs-linux-gnueabihf/5.2.0/include -I./arch/x86/include -Iarch/x86/include/generated/uapi -Iarch/x86/include/generated? -Iinclude -I./arch/x86/include/uapi -Iarch/x86/include/generated/uapi -I./include/uapi -Iinclude/generated/uapi -include ./include/linux/kconfig.h -D__KERNEL__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -m64 -mno-red-zone -mcmodel=kernel -pipe -Wno-sign-compare -fno-asynchronous-unwind-tables -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -O2 -fomit-frame-pointer -DCC_HAVE_ASM_GOTO? -DMODULE? -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(init)"? -D"KBUILD_MODNAME=KBUILD_STR(cec_gpib)" -c -o /home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/cec/init.o /home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/cec/init.c
arm-linux-gcc: error: unrecognized command line option '-m64'
arm-linux-gcc: error: unrecognized command line option '-mno-red-zone'
arm-linux-gcc: error: unrecognized command line option '-mcmodel=kernel'
arm-linux-gcc: error: unrecognized command line option '-mno-sse'
arm-linux-gcc: error: unrecognized command line option '-mno-mmx'
arm-linux-gcc: error: unrecognized command line option '-mno-sse2'
arm-linux-gcc: error: unrecognized command line option '-mno-3dnow'
scripts/Makefile.build:258: die Regel f?r Ziel &#8222;/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/hp_82335/hp82335_init.o&#8220; scheiterte
make[6]: *** [/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/hp_82335/hp82335_init.o] Fehler 1
scripts/Makefile.build:403: die Regel f?r Ziel &#8222;/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/hp_82335&#8220; scheiterte
make[5]: *** [/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/hp_82335] Fehler 2
make[5]: *** Auf noch nicht beendete Prozesse wird gewartet &#8230;
arm-linux-gcc: error: unrecognized command line option '-m64'
arm-linux-gcc: error: unrecognized command line option '-mno-red-zone'
arm-linux-gcc: error: unrecognized command line option '-mcmodel=kernel'
arm-linux-gcc: error: unrecognized command line option '-mno-sse'
arm-linux-gcc: error: unrecognized command line option '-mno-mmx'
arm-linux-gcc: error: unrecognized command line option '-mno-sse2'
arm-linux-gcc: error: unrecognized command line option '-mno-3dnow'
scripts/Makefile.build:258: die Regel f?r Ziel &#8222;/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/cb7210/cb7210_init.o&#8220; scheiterte
make[6]: *** [/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/cb7210/cb7210_init.o] Fehler 1
make[6]: *** Auf noch nicht beendete Prozesse wird gewartet &#8230;
arm-linux-gcc: error: unrecognized command line option '-m64'
arm-linux-gcc: error: unrecognized command line option '-mno-red-zone'
arm-linux-gcc: error: unrecognized command line option '-mcmodel=kernel'
arm-linux-gcc: error: unrecognized command line option '-mno-sse'
arm-linux-gcc: error: unrecognized command line option '-mno-mmx'
arm-linux-gcc: error: unrecognized command line option '-m64'
arm-linux-gcc: error: unrecognized command line option '-mno-red-zone'
arm-linux-gcc: error: unrecognized command line option '-mcmodel=kernel'
arm-linux-gcc: error: unrecognized command line option '-mno-sse'
arm-linux-gcc: error: unrecognized command line option '-mno-mmx'
arm-linux-gcc: error: unrecognized command line option '-mno-sse2'
arm-linux-gcc: error: unrecognized command line option '-mno-3dnow'
arm-linux-gcc: error: unrecognized command line option '-mno-sse2'
arm-linux-gcc: error: unrecognized command line option '-mno-3dnow'
? arm-linux-gcc -I/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0 -I/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/include -I/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/include -Wp,-MD,/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/cb7210/.cb7210_cs.o.d? -nostdinc -isystem /usr/local/arm/fs-toolchain-5.2.0-armv7ahf/lib/gcc/arm-fs-linux-gnueabihf/5.2.0/include -I./arch/x86/include -Iarch/x86/include/generated/uapi -Iarch/x86/include/generated? -Iinclude -I./arch/x86/include/uapi -Iarch/x86/include/generated/uapi -I./include/uapi -Iinclude/generated/uapi -include ./include/linux/kconfig.h -D__KERNEL__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -m64 -mno-red-zone -mcmodel=kernel -pipe -Wno-sign-compare -fno-asynchronous-unwind-tables -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -O2 -fomit-frame-pointer -DCC_HAVE_ASM_GOTO? -DMODULE? -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(cb7210_cs)"? -D"KBUILD_MODNAME=KBUILD_STR(cb7210)" -c -o /home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/cb7210/cb7210_cs.o /home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/cb7210/cb7210_cs.c
scripts/Makefile.build:258: die Regel f?r Ziel &#8222;/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/agilent_82350b/agilent_82350b_init.o&#8220; scheiterte
make[6]: *** [/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/agilent_82350b/agilent_82350b_init.o] Fehler 1
scripts/Makefile.build:403: die Regel f?r Ziel &#8222;/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/agilent_82350b&#8220; scheiterte
make[5]: *** [/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/agilent_82350b] Fehler 2
(cat /dev/null;?? echo kernel//home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/cec/cec_gpib.ko;) > /home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/cec/modules.order
scripts/Makefile.build:264: die Regel f?r Ziel &#8222;/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/agilent_82357a/agilent_82357a.o&#8220; scheiterte
make[6]: *** [/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/agilent_82357a/agilent_82357a.o] Fehler 1
scripts/Makefile.build:403: die Regel f?r Ziel &#8222;/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/agilent_82357a&#8220; scheiterte
make[5]: *** [/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/agilent_82357a] Fehler 2
? arm-linux-gcc -I/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0 -I/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/include -I/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/include -Wp,-MD,/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/cec/.interrupt.o.d? -nostdinc -isystem /usr/local/arm/fs-toolchain-5.2.0-armv7ahf/lib/gcc/arm-fs-linux-gnueabihf/5.2.0/include -I./arch/x86/include -Iarch/x86/include/generated/uapi -Iarch/x86/include/generated? -Iinclude -I./arch/x86/include/uapi -Iarch/x86/include/generated/uapi -I./include/uapi -Iinclude/generated/uapi -include ./include/linux/kconfig.h -D__KERNEL__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -m64 -mno-red-zone -mcmodel=kernel -pipe -Wno-sign-compare -fno-asynchronous-unwind-tables -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -O2 -fomit-frame-pointer -DCC_HAVE_ASM_GOTO? -DMODULE? -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(interrupt)"? -D"KBUILD_MODNAME=KBUILD_STR(cec_gpib)" -c -o /home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/cec/interrupt.o /home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/cec/interrupt.c
arm-linux-gcc: error: unrecognized command line option '-m64'
arm-linux-gcc: error: unrecognized command line option '-mno-red-zone'
arm-linux-gcc: error: unrecognized command line option '-mcmodel=kernel'
arm-linux-gcc: error: unrecognized command line option '-mno-sse'
arm-linux-gcc: error: unrecognized command line option '-mno-mmx'
arm-linux-gcc: error: unrecognized command line option '-mno-sse2'
arm-linux-gcc: error: unrecognized command line option '-mno-3dnow'
scripts/Makefile.build:258: die Regel f?r Ziel &#8222;/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/cec/init.o&#8220; scheiterte
make[6]: *** [/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/cec/init.o] Fehler 1
make[6]: *** Auf noch nicht beendete Prozesse wird gewartet &#8230;
arm-linux-gcc: error: unrecognized command line option '-m64'
arm-linux-gcc: error: unrecognized command line option '-mno-red-zone'
arm-linux-gcc: error: unrecognized command line option '-mcmodel=kernel'
arm-linux-gcc: error: unrecognized command line option '-mno-sse'
arm-linux-gcc: error: unrecognized command line option '-mno-mmx'
arm-linux-gcc: error: unrecognized command line option '-mno-sse2'
arm-linux-gcc: error: unrecognized command line option '-mno-3dnow'
scripts/Makefile.build:258: die Regel f?r Ziel &#8222;/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/cec/interrupt.o&#8220; scheiterte
make[6]: *** [/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/cec/interrupt.o] Fehler 1
scripts/Makefile.build:403: die Regel f?r Ziel &#8222;/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/cec&#8220; scheiterte
make[5]: *** [/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/cec] Fehler 2
arm-linux-gcc: error: unrecognized command line option '-m64'
arm-linux-gcc: error: unrecognized command line option '-mno-red-zone'
arm-linux-gcc: error: unrecognized command line option '-mcmodel=kernel'
arm-linux-gcc: error: unrecognized command line option '-mno-sse'
arm-linux-gcc: error: unrecognized command line option '-mno-mmx'
arm-linux-gcc: error: unrecognized command line option '-mno-sse2'
arm-linux-gcc: error: unrecognized command line option '-mno-3dnow'
scripts/Makefile.build:258: die Regel f?r Ziel &#8222;/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/cb7210/cb7210_cs.o&#8220; scheiterte
make[6]: *** [/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/cb7210/cb7210_cs.o] Fehler 1
scripts/Makefile.build:403: die Regel f?r Ziel &#8222;/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/cb7210&#8220; scheiterte
make[5]: *** [/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib/cb7210] Fehler 2
Makefile:1384: die Regel f?r Ziel &#8222;_module_/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib&#8220; scheiterte
make[4]: *** [_module_/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib] Fehler 2
make[4]: Verzeichnis &#8222;/home/brenkem/git/DD_TEST/output/build/linux-custom&#8220; wird verlassen
Makefile:675: die Regel f?r Ziel &#8222;all-local&#8220; scheiterte
make[3]: [all-local] Fehler 2 (ignoriert)
make[4]: Verzeichnis &#8222;/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers&#8220; wird betreten
make[4]: F?r das Ziel &#8222;install-exec-am&#8220; ist nichts zu tun.
/usr/bin/make? install-data-hook
make[5]: Verzeichnis &#8222;/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers&#8220; wird betreten
/usr/bin/make -C /home/brenkem/git/DD_TEST/output/build/linux-custom/ V=1 modules_install\
??? CC="arm-linux-gcc -I/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0 -I/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/driver/include -I/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/include" \
??? SUBDIRS="/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers/gpib" INSTALL_MOD_DIR="gpib"
make[6]: Verzeichnis &#8222;/home/brenkem/git/DD_TEST/output/build/linux-custom&#8220; wird betreten
test -e include/generated/autoconf.h -a -e include/config/auto.conf || (??? ??? \
echo >&2;??? ??? ??? ??? ??? ??? ??? \
echo >&2 "? ERROR: Kernel configuration is invalid.";??? ??? \
echo >&2 "???????? include/generated/autoconf.h or include/config/auto.conf are missing.";\
echo >&2 "???????? Run 'make oldconfig && make prepare' on kernel src to fix it.";??? \
echo >&2 ;??? ??? ??? ??? ??? ??? ??? \
/bin/false)
mkdir -p /lib/modules/4.1.15-F+S/gpib
mkdir: das Verzeichnis ?/lib/modules/4.1.15-F+S&#8220; kann nicht angelegt werden: Keine Berechtigung
Makefile:1396: die Regel f?r Ziel &#8222;_emodinst_&#8220; scheiterte
make[6]: *** [_emodinst_] Fehler 1
make[6]: Verzeichnis &#8222;/home/brenkem/git/DD_TEST/output/build/linux-custom&#8220; wird verlassen
Makefile:686: die Regel f?r Ziel &#8222;install-data-hook&#8220; scheiterte
make[5]: *** [install-data-hook] Fehler 2
make[5]: Verzeichnis &#8222;/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers&#8220; wird verlassen
Makefile:604: die Regel f?r Ziel &#8222;install-data-am&#8220; scheiterte
make[4]: *** [install-data-am] Fehler 2
make[4]: Verzeichnis &#8222;/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers&#8220; wird verlassen
Makefile:559: die Regel f?r Ziel &#8222;install-am&#8220; scheiterte
make[3]: *** [install-am] Fehler 2
make[3]: Verzeichnis &#8222;/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers&#8220; wird verlassen
Makefile:398: die Regel f?r Ziel &#8222;install-recursive&#8220; scheiterte
make[2]: *** [install-recursive] Fehler 1
make[2]: Verzeichnis &#8222;/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/drivers&#8220; wird verlassen
Makefile:443: die Regel f?r Ziel &#8222;install-recursive&#8220; scheiterte
make[1]: *** [install-recursive] Fehler 1
make[1]: Verzeichnis &#8222;/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0&#8220; wird verlassen
package/pkg-generic.mk:234: die Regel f?r Ziel &#8222;/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/.stamp_staging_installed&#8220; scheiterte
make: *** [/home/brenkem/git/DD_TEST/output/build/linux-gpib-4.1.0/.stamp_staging_installed] Fehler 2


[4]:
http://buildroot-busybox.2317881.n4.nabble.com/PATCH-1-2-package-Makefile-in-should-grab-HOST-DIR-headers-using-isystem-instead-of-I-td141444.html#a141774

Mit freundlichen Gr??en / Best regards

Maik Brenke
Embedded Software Engineer
BU ADAS

Continental
Division Chassis & Safety
Ringlerstrasse 17, 85057 Ingolstadt
Germany

Phone: 	+49-841-881-12401
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180419/38cd55f4/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-gpib-build.log
Type: application/octet-stream
Size: 58352 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180419/38cd55f4/attachment.obj>
